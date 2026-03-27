use std::sync::Arc;
use axum::{
    Router,
    routing::{any, get},
    extract::{State, WebSocketUpgrade, ws::{WebSocket, Message}},
    response::Response,
};
use tokio::sync::mpsc;
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_server::{ConnectionManager, MessageHandler, AsyncWaiter};
use serde_json::json;

pub struct ServerState {
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    ws_manager: ConnectionManager<WebSocketConnection>,
    request_tx: mpsc::UnboundedSender<PendingRequest>,
    request_rx: Option<mpsc::UnboundedReceiver<PendingRequest>>,
}

pub struct WebSocketConnection {
    tx: mpsc::UnboundedSender<Vec<u8>>,
}

pub struct PendingRequest {
    pub id: String,
    pub method: String,
    pub path: String,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
    pub _response_tx: tokio::sync::oneshot::Sender<(u16, Vec<u8>)>,
}

impl ServerState {
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
            log!(log, "Starting HTTP/WebSocket server on port {}...", port);
        }

        let (request_tx, request_rx) = mpsc::unbounded_channel();
        let ws_manager = ConnectionManager::new(100, logger.clone());

        let state = Arc::new(tokio::sync::Mutex::new(ServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            ws_manager,
            request_tx: request_tx.clone(),
            request_rx: Some(request_rx),
        }));

        let app = Router::new()
            .route("/ws", get(ws_handler))
            .route("/*path", any(http_handler))
            .with_state(state.clone());

        let addr = format!("0.0.0.0:{}", port);
        let listener = tokio::net::TcpListener::bind(&addr)
            .await
            .map_err(|e| format!("Failed to bind to {}: {}", addr, e))?;

        if let Some(ref log) = logger {
            log!(log, "Server listening on {}", addr);
        }

        tokio::spawn(async move {
            if let Err(e) = axum::serve(listener, app).await {
                eprintln!("Server error: {}", e);
            }
        });

        let mut locked_state = state.lock().await;
        let request_rx = locked_state.request_rx.take().unwrap();
        drop(locked_state);

        Ok(ServerState {
            vault,
            logger,
            ws_manager: ConnectionManager::new(100, None),
            request_tx,
            request_rx: Some(request_rx),
        })
    }

    pub async fn handle_request(&mut self, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        
        let result = waiter.wait_for(|| {
            if let Some(ref mut rx) = self.request_rx {
                rx.try_recv().ok()
            } else {
                None
            }
        }).await;

        match result {
            Ok(req) => {
                self.log(&format!("Received {} request to {}", req.method, req.path));
                
                let message_handler = MessageHandler::new(self.vault.clone());
                match message_handler.store_message(req.body) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "requestId": req.id,
                            "method": req.method,
                            "path": req.path,
                            "headers": req.headers,
                            "body": vault_key
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub fn send_response(&mut self, _request_id: &str, status_code: u16, _body: Vec<u8>) -> String {
        // Response handling would need to be implemented with a response channel map
        // For now, return success
        self.log(&format!("Sending response for request {}: {}", _request_id, status_code));
        json!({
            "result": true,
            "message": "Response sent"
        }).to_string()
    }

    pub async fn get_websocket_message(&mut self, connection_id: &str, _timeout_ms: u64) -> String {
        self.log(&format!("Getting WebSocket message from {}", connection_id));
        MessageHandler::timeout_response()
    }

    pub async fn send_websocket_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        self.log(&format!("Sending {} bytes to WebSocket {}", message.len(), connection_id));
        
        if let Some(()) = self.ws_manager.get_mut(connection_id, |conn| {
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

    pub fn close_websocket(&mut self, connection_id: &str) -> String {
        if self.ws_manager.remove(connection_id) {
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
        let ids = self.ws_manager.get_ids();
        
        json!({
            "result": true,
            "connections": ids,
            "count": ids.len()
        }).to_string()
    }
}

async fn http_handler(
    State(state): State<Arc<tokio::sync::Mutex<ServerState>>>,
    req: axum::http::Request<axum::body::Body>,
) -> Response {
    use axum::body::to_bytes;
    
    let method = req.method().to_string();
    let path = req.uri().path().to_string();
    let headers: Vec<(String, String)> = req
        .headers()
        .iter()
        .map(|(k, v)| (k.to_string(), v.to_str().unwrap_or("").to_string()))
        .collect();

    let body = to_bytes(req.into_body(), usize::MAX)
        .await
        .unwrap_or_default()
        .to_vec();

    let request_id = ConnectionManager::<WebSocketConnection>::generate_id();
    let (response_tx, response_rx) = tokio::sync::oneshot::channel();

    let pending_request = PendingRequest {
        id: request_id,
        method,
        path,
        headers,
        body,
        _response_tx: response_tx,
    };

    let locked_state = state.lock().await;
    if locked_state.request_tx.send(pending_request).is_err() {
        drop(locked_state);
        return Response::builder()
            .status(500)
            .body("Internal server error".into())
            .unwrap();
    }
    drop(locked_state);

    // Wait for response with timeout
    match tokio::time::timeout(std::time::Duration::from_secs(30), response_rx).await {
        Ok(Ok((status, body))) => {
            Response::builder()
                .status(status)
                .body(body.into())
                .unwrap()
        }
        _ => Response::builder()
            .status(504)
            .body("Gateway timeout".into())
            .unwrap(),
    }
}

async fn ws_handler(
    ws: WebSocketUpgrade,
    State(state): State<Arc<tokio::sync::Mutex<ServerState>>>,
) -> Response {
    ws.on_upgrade(|socket| handle_websocket(socket, state))
}

async fn handle_websocket(mut socket: WebSocket, state: Arc<tokio::sync::Mutex<ServerState>>) {
    let connection_id = ConnectionManager::<WebSocketConnection>::generate_id();
    let (tx, mut rx) = mpsc::unbounded_channel();

    {
        let mut locked_state = state.lock().await;
        locked_state.ws_manager.add(connection_id.clone(), WebSocketConnection { tx });
        locked_state.log(&format!("WebSocket connected: {}", connection_id));
    }

    let connection_id_clone = connection_id.clone();
    
    // Spawn task to send messages
    let send_task = tokio::spawn(async move {
        while let Some(msg) = rx.recv().await {
            if socket.send(Message::Binary(msg)).await.is_err() {
                break;
            }
        }
    });

    // Receive messages (simplified for now)
    // In full implementation, we'd handle incoming messages
    
    send_task.await.ok();

    let mut locked_state = state.lock().await;
    locked_state.ws_manager.remove(&connection_id_clone);
    locked_state.log(&format!("WebSocket disconnected: {}", connection_id_clone));
}
