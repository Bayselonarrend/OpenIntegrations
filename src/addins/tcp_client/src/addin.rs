use std::sync::Arc;

use common_logs::Logger;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::TcpClientBackend;

pub struct AddIn {
    pub(crate) address_str: String,
    pub(crate) backend: TcpClientBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            address_str: String::new(),
            backend: TcpClientBackend::new(),
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

    pub fn set_address(&mut self, address: &str) -> String {
        match self.backend.set_address(address) {
            Ok(()) => {
                self.address_str = self.backend.address_str().to_string();
                json_success()
            }
            Err(e) => json_error(&e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        match self.backend.set_tls(use_tls, accept_invalid_certs, ca_cert_path) {
            Ok(()) => json!({"result": true}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_proxy(&mut self, data: &str) -> String {
        match self.backend.set_proxy(data) {
            Ok(()) => json!({"result": true}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn connect(&mut self) -> bool {
        self.backend.connect()
    }

    pub fn disconnect(&mut self) -> bool {
        self.backend.disconnect()
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        self.backend.send(data, timeout_ms)
    }

    pub fn receive(&mut self, max_data_size: i32, end_marker: Vec<u8>, timeout_ms: i32) -> Vec<u8> {
        self.backend.receive(max_data_size, end_marker, timeout_ms)
    }

    pub fn close_output(&mut self) -> bool {
        self.backend.close_output()
    }

    pub fn last_error(&mut self) -> String {
        self.backend.last_error()
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            0 => &self.address_str as &dyn common_core::getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.backend.disconnect();
    }
}
