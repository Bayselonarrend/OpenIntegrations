use std::sync::Arc;
use indexmap::IndexMap;
use axum::{
    Router,
    routing::any,
    extract::State,
    response::Response,
};
use tokio::sync::{mpsc, Mutex as TokioMutex};
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_server::{MessageHandler, AsyncWaiter, ConnectionManager};
use serde::{Deserialize, Serialize};
use serde_json::json;

#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct HttpServerConfig {
    #[serde(default = "default_timeout")]
    pub response_timeout_secs: u64,
    
    #[serde(default = "default_routes")]
    pub routes: Vec<String>,
}

fn default_timeout() -> u64 {
    30
}

fn default_routes() -> Vec<String> {
    vec!["/*path".to_string()]
}

impl Default for HttpServerConfig {
    fn default() -> Self {
        Self {
            response_timeout_secs: 30,
            routes: vec!["/*path".to_string()],
        }
    }
}

pub struct HttpServerState {
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    request_tx: mpsc::UnboundedSender<PendingRequest>,
    request_rx: Option<mpsc::UnboundedReceiver<PendingRequest>>,
    pending_responses: Arc<TokioMutex<IndexMap<String, tokio::sync::oneshot::Sender<(u16, Vec<u8>)>>>>,
    config: HttpServerConfig,
}

pub struct PendingRequest {
    pub id: String,
    pub method: String,
    pub path: String,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
}

impl HttpServerState {
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
            HttpServerConfig::default()
        } else {
            serde_json::from_str::<HttpServerConfig>(config_json)
                .map_err(|e| format!("Invalid HTTP server config: {}", e))?
        };

        if let Some(ref log) = logger {
            log!(log, "Starting HTTP server on port {} with config: {:?}", port, config);
        }

        let (request_tx, request_rx) = mpsc::unbounded_channel();
        let pending_responses = Arc::new(TokioMutex::new(IndexMap::new()));

        let state = Arc::new(TokioMutex::new(HttpServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            request_tx: request_tx.clone(),
            request_rx: Some(request_rx),
            pending_responses: pending_responses.clone(),
            config: config.clone(),
        }));

        // Create router with configured routes
        let mut app = Router::new();
        for route in &config.routes {
            if let Some(ref log) = logger {
                log!(log, "Adding HTTP route: {}", route);
            }
            app = app.route(route, any(http_handler));
        }
        let app = app.with_state(state.clone());

        let addr = format!("0.0.0.0:{}", port);
        let listener = tokio::net::TcpListener::bind(&addr)
            .await
            .map_err(|e| format!("Failed to bind to {}: {}", addr, e))?;

        if let Some(ref log) = logger {
            log!(log, "HTTP server listening on {}", addr);
        }

        tokio::spawn(async move {
            if let Err(e) = axum::serve(listener, app).await {
                eprintln!("HTTP server error: {}", e);
            }
        });

        let mut locked_state = state.lock().await;
        let request_rx = locked_state.request_rx.take().unwrap();
        let pending_responses_clone = locked_state.pending_responses.clone();
        drop(locked_state);

        Ok(HttpServerState {
            vault,
            logger,
            request_tx,
            request_rx: Some(request_rx),
            pending_responses: pending_responses_clone,
            config,
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

    pub async fn send_response(&mut self, request_id: &str, status_code: u16, body: Vec<u8>) -> String {
        self.log(&format!("Sending response for request {}: {}", request_id, status_code));
        
        let mut responses = self.pending_responses.lock().await;

        if let Some(tx) = responses.shift_remove(request_id) {
            match tx.send((status_code, body)) {
                Ok(_) => {
                    json!({
                        "result": true,
                        "message": "Response sent"
                    }).to_string()
                }
                Err(_) => {
                    MessageHandler::error_response("Failed to send response: channel closed")
                }
            }
        } else {
            MessageHandler::error_response("Request not found or already responded")
        }
    }
}

async fn http_handler(
    State(state): State<Arc<TokioMutex<HttpServerState>>>,
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

    let request_id = ConnectionManager::<()>::generate_id();
    let (response_tx, response_rx) = tokio::sync::oneshot::channel();

    {
        let locked_state = state.lock().await;
        let mut responses = locked_state.pending_responses.lock().await;
        responses.insert(request_id.clone(), response_tx);
    }

    let pending_request = PendingRequest {
        id: request_id.clone(),
        method,
        path,
        headers,
        body,
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

    // Wait for response with configured timeout
    let timeout_duration = {
        let locked_state = state.lock().await;
        std::time::Duration::from_secs(locked_state.config.response_timeout_secs)
    };
    
    match tokio::time::timeout(timeout_duration, response_rx).await {
        Ok(Ok((status, body))) => {
            Response::builder()
                .status(status)
                .body(body.into())
                .unwrap()
        }
        _ => {
            let locked_state = state.lock().await;
            let mut responses = locked_state.pending_responses.lock().await;
            responses.shift_remove(&request_id);
            
            Response::builder()
                .status(504)
                .body("Gateway timeout".into())
                .unwrap()
        }
    }
}
