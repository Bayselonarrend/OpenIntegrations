use std::sync::Arc;

use common_core::{janx, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

use crate::backend::{ExchangeScheme, ZeroMqBackend};

pub struct AddIn {
    pub(crate) backend: ZeroMqBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: ZeroMqBackend::new(),
        }
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
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

    pub(crate) fn connect(&mut self, scheme: ExchangeScheme, endpoint: &str) -> JanxValue {
        let ep = endpoint.trim().to_owned();
        match self.backend.connect(scheme, &ep) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn bind(&mut self, scheme: ExchangeScheme, port: i32) -> JanxValue {
        let ep = format!("tcp://0.0.0.0:{}", port);
        match self.backend.bind(scheme, &ep) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn subscribe(&mut self, prefix: &str) -> JanxValue {
        match self.backend.subscribe(prefix) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> JanxValue {
        match self.backend.send_payload(data, timeout_ms) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn recv(&mut self, timeout_ms: i32) -> JanxValue {
        match self.backend.recv_payload(timeout_ms) {
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
        match self.backend.close_socket() {
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
