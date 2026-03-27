use std::sync::Arc;
use axum::{
    Router,
    routing::get,
    extract::{State, WebSocketUpgrade, ws::{WebSocket, Message}},
    response::Response,
};
use tokio::sync::mpsc;
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_server::{ConnectionManager, MessageHandler, AsyncWaiter};
use serde_json::json;

pub struct WebSocketServerState {
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    manager: ConnectionManager<WebSocketConnection>,
    message_rx: Option<mpsc::UnboundedReceiver<(String, Vec<u8>)>>,
    message_tx: mpsc::UnboundedSender<(String, Vec<u8>)>,
}

pub struct WebSocketConnection {
    tx: mpsc::UnboundedSender<Vec<u8>>,
}

impl WebSocketServerState {
    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    pub async fn start(
        port: u16,
        _config: &str,
        vault: BinaryVault,
        logger: Option<Arc<Logger>>,
    ) -> Result<Self, String> {
        if let Some(ref log) = logger {
            log!(log, "Starting WebSocket server on port {}...", port);
        }

        let manager = ConnectionManager::new(100, logger.clone());
        let (message_tx, message_rx) = mpsc::unbounded_channel();

        let state = Arc::new(tokio::sync::Mutex::new(WebSocketServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            manager,
            message_tx: message_tx.clone(),
            message_rx: Some(message_rx),
        }));

        let app = Router::new()
            .route("/", get(ws_handler))
            .with_state(state.clone());

        let addr = format!("0.0.0.0:{}", port);
        let listener = tokio::net::TcpListener::bind(&addr)
            .await
            .map_err(|e| format!("Failed to bind to {}: {}", addr, e))?;

        if let Some(ref log) = logger {
            log!(log, "WebSocket server listening on {}", addr);
        }

        tokio::spawn(async move {
            if let Err(e) = axum::serve(listener, app).await {
                eprintln!("WebSocket server error: {}", e);
            }
        });

        let mut locked_state = state.lock().await;
        let message_rx = locked_state.message_rx.take().unwrap();
        drop(locked_state);

        Ok(WebSocketServerState {
            vault,
            logger,
            manager: ConnectionManager::new(100, None),
            message_rx: Some(message_rx),
            message_tx,
        })
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
        
        if let Some(()) = self.manager.get_mut(connection_id, |conn| {
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
        if self.manager.remove(connection_id) {
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
        let ids = self.manager.get_ids();
        
        json!({
            "result": true,
            "connections": ids,
            "count": ids.len()
        }).to_string()
    }
}

async fn ws_handler(
    ws: WebSocketUpgrade,
    State(state): State<Arc<tokio::sync::Mutex<WebSocketServerState>>>,
) -> Response {
    ws.on_upgrade(|socket| handle_websocket(socket, state))
}

async fn handle_websocket(mut socket: WebSocket, state: Arc<tokio::sync::Mutex<WebSocketServerState>>) {
    let connection_id = ConnectionManager::<WebSocketConnection>::generate_id();
    let (tx, mut rx) = mpsc::unbounded_channel();

    let _message_tx = {
        let mut locked_state = state.lock().await;
        locked_state.manager.add(connection_id.clone(), WebSocketConnection { tx });
        locked_state.log(&format!("WebSocket connected: {}", connection_id));
        locked_state.message_tx.clone()
    };

    let connection_id_clone = connection_id.clone();

    let send_task = tokio::spawn(async move {
        while let Some(msg) = rx.recv().await {
            if socket.send(Message::Binary(msg.into())).await.is_err() {
                break;
            }
        }
    });

    send_task.await.ok();

    let mut locked_state = state.lock().await;
    locked_state.manager.remove(&connection_id_clone);
    locked_state.log(&format!("WebSocket disconnected: {}", connection_id_clone));
}
