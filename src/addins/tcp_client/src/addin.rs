use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::TcpClientBackend;

pub struct AddIn {
    pub(crate) address_str: String,
    backend: Arc<Mutex<TcpClientBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            address_str: String::new(),
            backend: Arc::new(Mutex::new(TcpClientBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, TcpClientBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut backend = self.lock_backend();
                match backend.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let backend = self.lock_backend();
        match backend.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn set_address(&mut self, address: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        match backend.set_address(address) {
            Ok(()) => {
                let resolved = backend.address_str().to_string();
                drop(backend);
                self.address_str = resolved;
                janx_success(None, None)
            }
            Err(e) => janx_error(e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        match backend.set_tls(use_tls, accept_invalid_certs, ca_cert_path) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_proxy(&mut self, data: &JanxValue) -> JanxValue {
        let mut backend = self.lock_backend();
        match backend.set_proxy(data) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn connect(&mut self) -> bool {
        self.lock_backend().connect()
    }

    pub fn disconnect(&mut self) -> bool {
        self.lock_backend().disconnect()
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        self.lock_backend().send(data, timeout_ms)
    }

    pub fn receive(&mut self, max_data_size: i32, end_marker: Vec<u8>, timeout_ms: i32) -> Vec<u8> {
        self.lock_backend()
            .receive(max_data_size, end_marker, timeout_ms)
    }

    pub fn close_output(&mut self) -> bool {
        self.lock_backend().close_output()
    }

    pub fn last_error(&mut self) -> String {
        self.lock_backend().last_error()
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
        self.lock_backend().close_backend();
    }
}
