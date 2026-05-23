use std::sync::Arc;

use common_binary::vault::BinaryInput;
use common_logs::Logger;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::MongoDBBackend;

pub struct AddIn {
    pub(crate) connection_string: String,
    pub(crate) client: MongoDBBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            client: MongoDBBackend::new(),
        }
    }

    pub fn load_binary_to_vault(&mut self, data: Vec<u8>) -> String {
        match self.client.store_binary(BinaryInput::Bytes(data)) {
            Ok(key) => json!({"result": true, "key": key}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn load_file_to_vault(&mut self, path: String) -> String {
        match self.client.store_binary(BinaryInput::FilePath(path)) {
            Ok(key) => json!({"result": true, "key": key}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn load_base64_to_vault(&mut self, base64: String) -> String {
        match self.client.store_binary(BinaryInput::Base64(base64)) {
            Ok(key) => json!({"result": true, "key": key}).to_string(),
            Err(e) => json_error(&e),
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

    pub fn connect(&mut self) -> String {
        if self.connection_string.is_empty() {
            return json_error("Empty connection string!");
        }

        if self.client.is_connected() {
            return json_error("Connection already initialized!");
        }

        match self.client.connect(self.connection_string.clone()) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn disconnect(&mut self) -> String {
        match self.client.disconnect() {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn execute(&mut self, json_string: &str) -> String {
        match self.client.execute(json_string) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn common_core::getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
