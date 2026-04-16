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
    message_rx: Option<mpsc::UnboundedReceiver<(String, Vec<u8>)>>,
    message_tx: mpsc::UnboundedSender<(String, Vec<u8>)>,
    connection_rx: Option<mpsc::UnboundedReceiver<String>>,
    connection_tx: mpsc::UnboundedSender<String>,
}

pub struct WebSocketConnection {
    tx: mpsc::UnboundedSender<Vec<u8>>,
    addr: String,
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
        let (message_tx, message_rx) = mpsc::unbounded_channel();
        let (connection_tx, connection_rx) = mpsc::unbounded_channel();

        let state = Arc::new(tokio::sync::Mutex::new(WebSocketServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            manager: manager.clone(),
            message_tx: message_tx.clone(),
            message_rx: Some(message_rx),
            connection_tx: connection_tx.clone(),
            connection_rx: Some(connection_rx),
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

        let mut locked_state = state.lock().await;
        let message_rx = locked_state.message_rx.take().unwrap();
        let connection_rx = locked_state.connection_rx.take().unwrap();
        drop(locked_state);

        Ok(WebSocketServerState {
            vault,
            logger: logger.clone(),
            manager,
            message_rx: Some(message_rx),
            message_tx,
            connection_rx: Some(connection_rx),
            connection_tx,
        })
    }

    pub async fn get_next_message(&mut self, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let message_handler = MessageHandler::new(self.vault.clone());
        
        let result = waiter.wait_for(|| {
            if let Some(ref mut conn_rx) = self.connection_rx {
                if let Ok(connection_id) = conn_rx.try_recv() {
                    return Some((connection_id, None));
                }
            }

            if let Some(ref mut msg_rx) = self.message_rx {
                if let Ok((conn_id, msg)) = msg_rx.try_recv() {
                    let exists = {
                        let mut manager = self.manager.lock().unwrap();
                        manager.get_mut(&conn_id, |_| ()).is_some()
                    };
                    if !exists {
                        return None;
                    }
                    return Some((conn_id, Some(msg)));
                }
            }
            
            None
        }).await;

        match result {
            Ok((connection_id, Some(message))) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));
                
                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "message": vault_key,
                            "isNewConnection": false
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Ok((connection_id, None)) => {
                self.log(&format!("New WebSocket connection: {}", connection_id));
                json!({
                    "result": true,
                    "connectionId": connection_id,
                    "isNewConnection": true
                }).to_string()
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn get_message(&mut self, connection_id: &str, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let conn_id = connection_id.to_string();
        
        let result = waiter.wait_for(|| {
            if let Some(ref mut rx) = self.message_rx {
                while let Ok((id, msg)) = rx.try_recv() {
                    if id == conn_id {
                        return Some(msg);
                    }
                }
            }
            None
        }).await;

        match result {
            Ok(message) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));
                
                let message_handler = MessageHandler::new(self.vault.clone());
                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "message": vault_key
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        self.log(&format!("Sending {} bytes to WebSocket {}", message.len(), connection_id));
        
        let mut manager = self.manager.lock().unwrap();
        if let Some(()) = manager.get_mut(connection_id, |conn| {
            let _ = conn.tx.send(message);
        }) {
            json!({
                "result": true,
                "message": "Message sent"
            }).to_string()
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }

    pub fn close_connection(&mut self, connection_id: &str) -> String {
        let mut manager = self.manager.lock().unwrap();
        if manager.remove(connection_id) {
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
                "address": conn_info.addr
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
    let (tx, mut rx) = mpsc::unbounded_channel();

    let (message_tx, connection_tx) = {
        let locked_state = state.lock().await;
        {
            let mut manager = locked_state.manager.lock().unwrap();
            manager.add(connection_id.clone(), WebSocketConnection {
                tx,
                addr: addr.to_string(),
            });
        }
        locked_state.log(&format!("WebSocket connected: {}", connection_id));
        (locked_state.message_tx.clone(), locked_state.connection_tx.clone())
    };

    let _ = connection_tx.send(connection_id.clone());

    let connection_id_clone = connection_id.clone();
    let state_clone = state.clone();

    let (mut ws_sender, mut ws_receiver) = socket.split();

    let send_task = tokio::spawn(async move {
        while let Some(msg) = rx.recv().await {
            if ws_sender.send(Message::Binary(msg.into())).await.is_err() {
                break;
            }
        }
    });

    let recv_task = tokio::spawn(async move {
        while let Some(Ok(msg)) = ws_receiver.next().await {
            if let Message::Binary(data) = msg {
                let _ = message_tx.send((connection_id_clone.clone(), data.to_vec()));
            } else if let Message::Text(text) = msg {
                let _ = message_tx.send((connection_id_clone.clone(), text.as_bytes().to_vec()));
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
        manager.remove(&connection_id);
    }
    locked_state.log(&format!("WebSocket disconnected: {}", connection_id));
}
