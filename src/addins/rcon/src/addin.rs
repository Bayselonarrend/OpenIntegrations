use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

use crate::backend::RconBackend;

pub struct AddIn {
    pub(crate) client: RconBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            client: RconBackend::new(),
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> JanxValue {
        if logger_config.is_empty() {
            return janx_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.client.set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(e) => janx_error(e),
            },
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.client.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn connect(
        &mut self,
        url: &str,
        password: &str,
        read_timeout: i32,
        write_timeout: i32,
    ) -> JanxValue {
        match self.client.connect(url, password, read_timeout, write_timeout) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn execute_command(&mut self, command: &str) -> JanxValue {
        self.client
            .execute_command(command)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_settings(&self) -> JanxValue {
        self.client
            .get_settings()
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
