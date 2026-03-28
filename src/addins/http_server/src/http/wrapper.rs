use std::sync::{Arc, Mutex};
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use super::HttpServerBackend;

pub struct HttpServer {
    backend: Arc<Mutex<HttpServerBackend>>,
    started: bool,
}

impl HttpServer {
    pub fn new(vault: BinaryVault) -> Self {
        Self {
            backend: Arc::new(Mutex::new(HttpServerBackend::new(vault))),
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
            return json_error("HTTP server already started");
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
            return json_error("HTTP server not started");
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

    pub fn handle_request(&self, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("HTTP server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.handle_request(timeout_ms),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn handle_request_by_id(&self, request_id: &str) -> String {
        if !self.started {
            return json_error("HTTP server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.handle_request_by_id(request_id.to_string()),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_response(&self, request_id: &str, status_code: u16, body: Vec<u8>) -> String {
        if !self.started {
            return json_error("HTTP server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_response(request_id.to_string(), status_code, body),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_pending_requests(&self) -> String {
        if !self.started {
            return json_error("HTTP server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_pending_requests(),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn is_started(&self) -> bool {
        self.started
    }
}

impl Drop for HttpServer {
    fn drop(&mut self) {
        if self.started {
            let _ = self.stop();
        }
    }
}
