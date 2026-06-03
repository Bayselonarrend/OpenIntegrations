use std::sync::{Arc, Mutex};

use common_core::{janx, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::{ExchangeScheme, ZeroMqBackend};

pub struct AddIn {
    backend: Arc<Mutex<ZeroMqBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(ZeroMqBackend::new())),
        }
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut backend = lock_unpoisoned(&self.backend);
                match backend.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let backend = lock_unpoisoned(&self.backend);
        match backend.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub(crate) fn connect(&mut self, scheme: ExchangeScheme, endpoint: &str) -> JanxValue {
        let ep = endpoint.trim().to_owned();
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.connect(scheme, &ep) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn bind(&mut self, scheme: ExchangeScheme, port: i32) -> JanxValue {
        let ep = format!("tcp://0.0.0.0:{}", port);
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.bind(scheme, &ep) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn subscribe(&mut self, prefix: &str) -> JanxValue {
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.subscribe(prefix) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> JanxValue {
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.send_payload(data, timeout_ms) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn recv(&mut self, timeout_ms: i32) -> JanxValue {
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.recv_payload(timeout_ms) {
            Ok(buf) => {
                let len = buf.len();
                janx!({
                    "result": true,
                    "data": buf,
                    "size": len as i64,
                })
            }
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn close(&mut self) -> JanxValue {
        let mut backend = lock_unpoisoned(&self.backend);
        match backend.close_socket() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn common_core::getset::ValueType {
        panic!("This add-in exposes no exported properties.");
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
