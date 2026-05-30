use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, json_error, json_success};
use serde_json::json;

use crate::backend::WsClientBackend;

pub struct AddIn {
    pub(crate) backend: WsClientBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: WsClientBackend::new(),
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> String {
        if logger_config.is_empty() {
            return json_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.backend.set_logger(Arc::new(logger)) {
                Ok(()) => json_success(),
                Err(e) => json_error(&e),
            },
            Err(e) => json_error(&format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        match self.backend.get_logs(count) {
            Some((logs, total)) => json!({
                "result": true,
                "logs": logs,
                "total": total,
                "returned": logs.len()
            })
            .to_string(),
            None => json_error("Logger not initialized"),
        }
    }

    pub fn connect(&mut self, url: &str) -> String {
        match self.backend.connect(url) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn send_text(&self, text: &str) -> String {
        self.backend
            .send_text(text)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn send_binary(&self, data: Vec<u8>) -> String {
        self.backend
            .send_binary(data)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn receive_message(&self, timeout_ms: u64) -> JanxValue {
        self.backend
            .receive_message(timeout_ms)
            .unwrap_or_else(|e| janx_error(&e))
    }

    pub fn send_ping(&self) -> String {
        self.backend.send_ping().unwrap_or_else(|e| json_error(&e))
    }

    pub fn send_pong(&self) -> String {
        self.backend.send_pong().unwrap_or_else(|e| json_error(&e))
    }

    pub fn close(&self, code: u16, reason: &str) -> String {
        self.backend
            .close(code, reason)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn set_headers(&mut self, headers_json: &str) -> String {
        match self.backend.set_headers(headers_json) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        match self.backend.set_tls(use_tls, accept_invalid_certs, ca_cert_path) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_proxy(&mut self, proxy_json: &str) -> String {
        match self.backend.set_proxy(proxy_json) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn common_core::getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.backend.close_backend();
    }
}
