use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

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

    pub fn connect(&mut self) -> JanxValue {
        if self.connection_string.is_empty() {
            return janx_error("Empty connection string!");
        }

        if self.client.is_connected() {
            return janx_error("Connection already initialized!");
        }

        match self.client.connect(self.connection_string.clone()) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn disconnect(&mut self) -> JanxValue {
        match self.client.disconnect() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn execute(&mut self, params: JanxValue) -> JanxValue {
        match self.client.execute(params) {
            Ok(result) => result,
            Err(e) => janx_error(e),
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
