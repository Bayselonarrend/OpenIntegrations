use std::sync::{Arc, Mutex};
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use super::WebSocketServerBackend;

pub struct WebSocketServer {
    backend: Arc<Mutex<WebSocketServerBackend>>,
    started: bool,
}

impl WebSocketServer {
    pub fn new(vault: BinaryVault) -> Self {
        Self {
            backend: Arc::new(Mutex::new(WebSocketServerBackend::new(vault))),
            started: false,
        }
    }

    pub fn set_logger(&self, logger: Arc<Logger>) {
        if let Ok(mut backend) = self.backend.lock() {
            backend.set_logger(logger);
        }
    }

    pub fn start(&mut self, port: u16, config: &str) -> String {
        if self.started {
            return json_error("WebSocket server already started");
        }

        let result = match self.backend.lock() {
            Ok(backend) => backend.start(port, config),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        };

        if result.contains("\"result\":true") {
            self.started = true;
        }

        result
    }

    pub fn stop(&mut self) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(mut backend) => {
                backend.shutdown();
                self.started = false;
                json_success()
            }
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_next_message(&self, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_next_message(timeout_ms),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_message(&self, connection_id: &str, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_message(connection_id.to_string(), timeout_ms),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_message(connection_id.to_string(), message),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_connection(&self, connection_id: &str) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_connection(connection_id.to_string()),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_connections_list(&self) -> String {
        if !self.started {
            return json_error("WebSocket server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_connections_list(),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
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
