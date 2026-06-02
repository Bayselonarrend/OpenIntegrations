use std::sync::{Arc, Mutex};
use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_result_ok, janx_success};
use crate::backend::WebSocketServerBackend;

pub struct WebSocketServer {
    backend: Arc<Mutex<WebSocketServerBackend>>,
    started: bool,
}

impl WebSocketServer {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(WebSocketServerBackend::new())),
            started: false,
        }
    }

    pub fn set_logger(&self, logger: Arc<Logger>) {
        if let Ok(mut backend) = self.backend.lock() {
            backend.set_logger(logger);
        }
    }

    pub fn start(&mut self, port: u16, config: &JanxValue) -> JanxValue {
        if self.started {
            return janx_error("WebSocket server already started");
        }

        let result = match self.backend.lock() {
            Ok(backend) => backend.start(port, config),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        };

        if janx_result_ok(&result) {
            self.started = true;
        }

        result
    }

    pub fn stop(&mut self) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(mut backend) => {
                backend.shutdown();
                self.started = false;
                janx_success(None, None)
            }
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_next_message(&self, timeout_ms: u64) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_next_message(timeout_ms),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_message(&self, connection_id: &str, timeout_ms: u64) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_message(connection_id.to_string(), timeout_ms),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_message(connection_id.to_string(), message),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_text(&self, connection_id: &str, text: &str) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_text(connection_id.to_string(), text.to_string()),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_ping(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_ping(connection_id.to_string(), payload),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_pong(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_pong(connection_id.to_string(), payload),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_connection(&self, connection_id: &str, remove_from_list: bool) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_connection(connection_id.to_string(), remove_from_list),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_connections_list(&self) -> JanxValue {
        if !self.started {
            return janx_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_connections_list(),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn is_started(&self) -> bool {
        self.started
    }
}

impl Drop for WebSocketServer {
    fn drop(&mut self) {
        if self.started {
            let _ = self.stop();
        }
    }
}
