use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

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

    pub fn set_logger(&mut self, logger_config: &str) -> JanxValue {
        if logger_config.is_empty() {
            return janx_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.backend.set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(e) => janx_error(e),
            },
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.backend.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn connect(&mut self, url: &str) -> JanxValue {
        match self.backend.connect(url) {
            Ok(result) => result,
            Err(e) => janx_error(e),
        }
    }

    pub fn send_text(&self, text: &str) -> JanxValue {
        self.backend
            .send_text(text)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn send_binary(&self, data: Vec<u8>) -> JanxValue {
        self.backend
            .send_binary(data)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn receive_message(&self, timeout_ms: u64) -> JanxValue {
        self.backend
            .receive_message(timeout_ms)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn send_ping(&self) -> JanxValue {
        self.backend.send_ping().unwrap_or_else(|e| janx_error(e))
    }

    pub fn send_pong(&self) -> JanxValue {
        self.backend.send_pong().unwrap_or_else(|e| janx_error(e))
    }

    pub fn close(&self, code: u16, reason: &str) -> JanxValue {
        self.backend
            .close(code, reason)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn set_headers(&mut self, headers_json: &str) -> JanxValue {
        match self.backend.set_headers(headers_json) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        match self.backend.set_tls(use_tls, accept_invalid_certs, ca_cert_path) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_proxy(&mut self, proxy_json: &str) -> JanxValue {
        match self.backend.set_proxy(proxy_json) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
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
