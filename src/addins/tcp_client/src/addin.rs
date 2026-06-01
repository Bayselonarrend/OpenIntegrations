use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

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

    pub fn set_address(&mut self, address: &str) -> JanxValue {
        match self.backend.set_address(address) {
            Ok(()) => {
                self.address_str = self.backend.address_str().to_string();
                janx_success(None, None)
            }
            Err(e) => janx_error(e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        match self.backend.set_tls(use_tls, accept_invalid_certs, ca_cert_path) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_proxy(&mut self, data: &str) -> JanxValue {
        match self.backend.set_proxy(data) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
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
