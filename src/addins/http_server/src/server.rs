use std::sync::Arc;
use axum::{
    Router,
    routing::any,
    extract::State,
    response::Response,
};
use tokio::sync::Mutex as TokioMutex;
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
    
    #[serde(default = "default_max_pending")]
    pub max_pending_requests: usize,
}

fn default_timeout() -> u64 {
    30
}

fn default_routes() -> Vec<String> {
    vec!["/*path".to_string()]
}

fn default_max_pending() -> usize {
    100
}

impl Default for HttpServerConfig {
    fn default() -> Self {
        Self {
            response_timeout_secs: 30,
            routes: vec!["/*path".to_string()],
            max_pending_requests: 100,
        }
    }
}

pub struct HttpServerState {
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    manager: ConnectionManager<PendingRequest>,
    config: HttpServerConfig,
}

pub struct PendingRequest {
    pub method: String,
    pub path: String,
    pub query: String,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
    pub response_tx: tokio::sync::oneshot::Sender<(u16, Vec<u8>)>,
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

        let config = if config_json.is_empty() {
            HttpServerConfig::default()
        } else {
            serde_json::from_str::<HttpServerConfig>(config_json)
                .map_err(|e| format!("Invalid HTTP server config: {}", e))?
        };

        if let Some(ref log) = logger {
            log!(log, "Starting HTTP server on port {} with config: {:?}", port, config);
        }

        let manager = ConnectionManager::new(config.max_pending_requests, logger.clone());

        let state = Arc::new(TokioMutex::new(HttpServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            manager,
            config: config.clone(),
        }));

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

        Ok(HttpServerState {
            vault,
            logger: logger.clone(),
            manager: ConnectionManager::new(config.max_pending_requests, logger),
            config,
        })
    }

    pub async fn handle_request(&mut self, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let message_handler = MessageHandler::new(self.vault.clone());
        
        let result = waiter.wait_for(|| {
            // Get request IDs in round-robin order
            let ids = self.manager.get_ids_round_robin();
            
            for request_id in ids {
                // Check if this request still exists
                if self.manager.get_mut(&request_id, |_| {}).is_some() {
                    return Some(request_id);
                }
            }
            
            None
        }).await;

        match result {
            Ok(request_id) => {
                // Extract request data and remove from manager
                let request_data = self.manager.get_mut(&request_id, |req| {
                    (req.method.clone(), req.path.clone(), req.query.clone(), 
                     req.headers.clone(), req.body.clone())
                });

                if let Some((method, path, query, headers, body)) = request_data {
                    self.log(&format!("Received {} request to {}", method, path));
                    self.manager.set_last_processed(Some(request_id.clone()));
                    
                    match message_handler.store_message(body) {
                        Ok(vault_key) => {
                            json!({
                                "result": true,
                                "requestId": request_id,
                                "method": method,
                                "path": path,
                                "query": query,
                                "headers": headers,
                                "body": vault_key
                            }).to_string()
                        }
                        Err(e) => {
                            // Remove failed request
                            self.manager.remove(&request_id);
                            MessageHandler::error_response(&e)
                        }
                    }
                } else {
                    MessageHandler::error_response("Request not found")
                }
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn send_response(&mut self, request_id: &str, status_code: u16, body: Vec<u8>) -> String {
        self.log(&format!("Sending response for request {}: {}", request_id, status_code));
        
        // Take the request (removes it and gives us ownership)
        if let Some(request) = self.manager.take(request_id) {
            match request.response_tx.send((status_code, body)) {
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

    pub fn get_pending_requests(&mut self) -> String {
        let mut requests = Vec::new();
        
        self.manager.iter_mut(|id, req| {
            requests.push(json!({
                "requestId": id,
                "method": req.method,
                "path": req.path,
                "query": req.query,
            }));
        });
        
        json!({
            "result": true,
            "requests": requests,
            "count": requests.len()
        }).to_string()
    }

    pub async fn handle_request_by_id(&mut self, request_id: &str) -> String {
        let message_handler = MessageHandler::new(self.vault.clone());
        
        // Extract request data
        let request_data = self.manager.get_mut(request_id, |req| {
            (req.method.clone(), req.path.clone(), req.query.clone(), 
             req.headers.clone(), req.body.clone())
        });

        if let Some((method, path, query, headers, body)) = request_data {
            self.log(&format!("Handling specific {} request to {}", method, path));
            
            match message_handler.store_message(body) {
                Ok(vault_key) => {
                    json!({
                        "result": true,
                        "requestId": request_id,
                        "method": method,
                        "path": path,
                        "query": query,
                        "headers": headers,
                        "body": vault_key
                    }).to_string()
                }
                Err(e) => {
                    // Remove failed request
                    self.manager.remove(request_id);
                    MessageHandler::error_response(&e)
                }
            }
        } else {
            MessageHandler::error_response("Request not found")
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
    let query = req.uri().query().unwrap_or("").to_string();
    let headers: Vec<(String, String)> = req
        .headers()
        .iter()
        .map(|(k, v)| (k.to_string(), v.to_str().unwrap_or("").to_string()))
        .collect();

    let body = to_bytes(req.into_body(), usize::MAX)
        .await
        .unwrap_or_default()
        .to_vec();

    let request_id = ConnectionManager::<PendingRequest>::generate_id();
    let (response_tx, response_rx) = tokio::sync::oneshot::channel();

    let pending_request = PendingRequest {
        method,
        path,
        query,
        headers,
        body,
        response_tx,
    };

    // Add request to manager
    {
        let mut locked_state = state.lock().await;
        let removed = locked_state.manager.add(request_id.clone(), pending_request);
        
        if let Some(old_id) = removed {
            locked_state.log(&format!("Queue full, removed oldest request: {}", old_id));
        }
    }

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
            // Timeout or channel closed - remove the request
            let mut locked_state = state.lock().await;
            locked_state.manager.remove(&request_id);
            
            Response::builder()
                .status(504)
                .body("Gateway timeout".into())
                .unwrap()
        }
    }
}
