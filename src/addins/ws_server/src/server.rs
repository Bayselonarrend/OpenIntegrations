use std::sync::Arc;
use std::sync::Mutex;
use std::net::SocketAddr;
use axum::{
    Router,
    routing::get,
    extract::{ConnectInfo, State, WebSocketUpgrade, ws::{WebSocket, Message}},
    response::Response,
};
use tokio::sync::mpsc;
use futures_util::{StreamExt, SinkExt};
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_server::{ConnectionManager, MessageHandler, AsyncWaiter};
use serde::{Deserialize, Serialize};
use serde_json::json;

#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct WebSocketServerConfig {
    #[serde(default = "default_max_connections")]
    pub max_connections: usize,
    
    #[serde(default = "default_ws_routes")]
    pub routes: Vec<String>,
}

fn default_max_connections() -> usize {
    100
}

fn default_ws_routes() -> Vec<String> {
    vec!["/".to_string()]
}

impl Default for WebSocketServerConfig {
    fn default() -> Self {
        Self {
            max_connections: 100,
            routes: vec!["/".to_string()],
        }
    }
}

pub struct WebSocketServerState {
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    manager: Arc<Mutex<ConnectionManager<WebSocketConnection>>>,
}

pub struct WebSocketConnection {
    addr: String,
    outgoing_tx: mpsc::UnboundedSender<Vec<u8>>,
    incoming_rx: mpsc::UnboundedReceiver<Vec<u8>>,
    is_closed: bool,
}

impl WebSocketServerState {
    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    pub async fn start(
        port: u16,
        config_json: &str,
        vault: BinaryVault,
        logger: Option<Arc<Logger>>,
    ) -> Result<Self, String> {
        // Parse configuration
        let config = if config_json.is_empty() {
            WebSocketServerConfig::default()
        } else {
            serde_json::from_str::<WebSocketServerConfig>(config_json)
                .map_err(|e| format!("Invalid WebSocket server config: {}", e))?
        };

        if let Some(ref log) = logger {
            log!(log, "Starting WebSocket server on port {} with config: {:?}", port, config);
        }

        let manager = Arc::new(Mutex::new(ConnectionManager::new(config.max_connections, logger.clone())));
        let state = Arc::new(tokio::sync::Mutex::new(WebSocketServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            manager: manager.clone(),
        }));

        // Create router with configured routes
        let mut app = Router::new();
        for route in &config.routes {
            if let Some(ref log) = logger {
                log!(log, "Adding WebSocket route: {}", route);
            }
            app = app.route(route, get(ws_handler));
        }
        let app = app.with_state(state.clone());

        let addr = format!("0.0.0.0:{}", port);
        let listener = tokio::net::TcpListener::bind(&addr)
            .await
            .map_err(|e| format!("Failed to bind to {}: {}", addr, e))?;

        if let Some(ref log) = logger {
            log!(log, "WebSocket server listening on {}", addr);
        }

        tokio::spawn(async move {
            if let Err(e) = axum::serve(listener, app.into_make_service_with_connect_info::<SocketAddr>()).await {
                eprintln!("WebSocket server error: {}", e);
            }
        });

        Ok(WebSocketServerState {
            vault,
            logger: logger.clone(),
            manager,
        })
    }

    pub async fn get_next_message(&mut self, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let message_handler = MessageHandler::new(self.vault.clone());
        
        let result = waiter.wait_for(|| {
            let mut manager = self.manager.lock().unwrap();
            let all_ids = manager.get_ids_round_robin();
            let mut to_remove = Vec::new();
            let mut found_message = None;
            for conn_id in all_ids {
                if let Some(next_state) = manager.get_mut(&conn_id, |conn| {
                    let is_active = !conn.is_closed;
                    let address = conn.addr.clone();
                    match conn.incoming_rx.try_recv() {
                        Ok(msg) => Some((Some(msg), address, is_active)),
                        Err(tokio::sync::mpsc::error::TryRecvError::Empty) => Some((None, address, is_active)),
                        Err(tokio::sync::mpsc::error::TryRecvError::Disconnected) => Some((None, address, false)),
                    }
                }) {
                    if let Some((message, address, is_active)) = next_state {
                        if let Some(msg) = message {
                            manager.set_last_processed(Some(conn_id.clone()));
                            found_message = Some((conn_id, Some(msg), address, is_active));
                            break;
                        }
                        if !is_active {
                            to_remove.push(conn_id.clone());
                        }
                    }
                }
            }

            for conn_id in to_remove {
                manager.remove(&conn_id);
            }

            if found_message.is_some() {
                return found_message;
            }

            None
        }).await;

        match result {
            Ok((connection_id, Some(message), address, is_active)) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));
                
                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "address": address,
                            "message": vault_key,
                            "isActive": is_active,
                            "isNewConnection": false
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Ok((_, None, _, _)) => MessageHandler::timeout_response(),
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn get_message(&mut self, connection_id: &str, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let conn_id = connection_id.to_string();
        
        let result = waiter.wait_for(|| {
            let mut manager = self.manager.lock().unwrap();
            if let Some(next_state) = manager.get_mut(&conn_id, |conn| {
                let is_active = !conn.is_closed;
                let address = conn.addr.clone();
                match conn.incoming_rx.try_recv() {
                    Ok(msg) => Some((Some(msg), address, is_active)),
                    Err(tokio::sync::mpsc::error::TryRecvError::Empty) => Some((None, address, is_active)),
                    Err(tokio::sync::mpsc::error::TryRecvError::Disconnected) => Some((None, address, false)),
                }
            }) {
                if let Some((message, address, is_active)) = next_state {
                    if !is_active && message.is_none() {
                        manager.remove(&conn_id);
                    }
                    if let Some(msg) = message {
                        return Some((Some(msg), address, is_active));
                    }
                    if !is_active {
                        return Some((None, address, false));
                    }
                }
            }
            None
        }).await;

        match result {
            Ok((Some(message), address, is_active)) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));

                let message_handler = MessageHandler::new(self.vault.clone());
                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "address": address,
                            "isActive": is_active,
                            "message": vault_key
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Ok((None, address, _)) => {
                json!({
                    "result": true,
                    "connectionId": connection_id,
                    "address": address,
                    "isActive": false
                }).to_string()
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        self.log(&format!("Sending {} bytes to WebSocket {}", message.len(), connection_id));
        
        let mut manager = self.manager.lock().unwrap();
        if let Some(send_result) = manager.get_mut(connection_id, |conn| {
            if conn.is_closed {
                return false;
            }
            conn.outgoing_tx.send(message).is_ok()
        }) {
            if send_result {
                json!({
                    "result": true,
                    "message": "Message sent"
                }).to_string()
            } else {
                MessageHandler::error_response("WebSocket connection is closed")
            }
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }

    pub fn close_connection(&mut self, connection_id: &str) -> String {
        let mut manager = self.manager.lock().unwrap();
        if let Some(()) = manager.get_mut(connection_id, |conn| {
            conn.is_closed = true;
        }) {
            self.log(&format!("WebSocket closed: {}", connection_id));
            json!({
                "result": true,
                "message": "WebSocket closed"
            }).to_string()
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> String {
        let mut manager = self.manager.lock().unwrap();
        let mut connections_list = Vec::new();

        manager.iter_mut(|conn_id, conn_info| {
            connections_list.push(json!({
                "connectionId": conn_id,
                "address": conn_info.addr,
                "isActive": !conn_info.is_closed
            }));
        });
        
        json!({
            "result": true,
            "connections": connections_list
        }).to_string()
    }
    
}

async fn ws_handler(
    ws: WebSocketUpgrade,
    ConnectInfo(addr): ConnectInfo<SocketAddr>,
    State(state): State<Arc<tokio::sync::Mutex<WebSocketServerState>>>,
) -> Response {
    ws.on_upgrade(move |socket| handle_websocket(socket, state, addr))
}

async fn handle_websocket(
    socket: WebSocket,
    state: Arc<tokio::sync::Mutex<WebSocketServerState>>,
    addr: SocketAddr,
) {
    let connection_id = ConnectionManager::<WebSocketConnection>::generate_id();
    let (outgoing_tx, mut outgoing_rx) = mpsc::unbounded_channel();
    let (incoming_tx, incoming_rx) = mpsc::unbounded_channel();

    {
        let locked_state = state.lock().await;
        {
            let mut manager = locked_state.manager.lock().unwrap();
            manager.add(connection_id.clone(), WebSocketConnection {
                addr: addr.to_string(),
                outgoing_tx,
                incoming_rx,
                is_closed: false,
            });
        }
        locked_state.log(&format!("WebSocket connected: {}", connection_id));
    }

    let state_clone = state.clone();

    let (mut ws_sender, mut ws_receiver) = socket.split();

    let send_task = tokio::spawn(async move {
        while let Some(msg) = outgoing_rx.recv().await {
            if ws_sender.send(Message::Binary(msg.into())).await.is_err() {
                break;
            }
        }
    });

    let recv_task = tokio::spawn(async move {
        while let Some(Ok(msg)) = ws_receiver.next().await {
            if let Message::Binary(data) = msg {
                let _ = incoming_tx.send(data.to_vec());
            } else if let Message::Text(text) = msg {
                let _ = incoming_tx.send(text.as_bytes().to_vec());
            }
        }
    });

    tokio::select! {
        _ = send_task => {},
        _ = recv_task => {},
    }

    let locked_state = state_clone.lock().await;
    {
        let mut manager = locked_state.manager.lock().unwrap();
        let _ = manager.get_mut(&connection_id, |conn| {
            conn.is_closed = true;
        });
    }
    locked_state.log(&format!("WebSocket disconnected: {}", connection_id));
}
