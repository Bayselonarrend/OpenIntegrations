use std::sync::Arc;

use common_logs::Logger;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

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

    pub fn set_logger(&mut self, logger_config: &str) -> String {
        if logger_config.is_empty() {
            return json_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.client.set_logger(Arc::new(logger)) {
                Ok(()) => json_success(),
                Err(e) => json_error(&e),
            },
            Err(e) => json_error(&format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        match self.client.get_logs(count) {
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

    pub fn connect(
        &mut self,
        url: &str,
        password: &str,
        read_timeout: i32,
        write_timeout: i32,
    ) -> String {
        match self.client.connect(url, password, read_timeout, write_timeout) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn execute_command(&mut self, command: &str) -> String {
        self.client.execute_command(command).unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_settings(&self) -> String {
        self.client.get_settings().unwrap_or_else(|e| json_error(&e))
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
