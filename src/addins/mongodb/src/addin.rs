use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::MongoDBBackend;

pub struct AddIn {
    pub(crate) connection_string: String,
    client: Arc<Mutex<MongoDBBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            client: Arc::new(Mutex::new(MongoDBBackend::new())),
        }
    }

    fn lock_client(&self) -> std::sync::MutexGuard<'_, MongoDBBackend> {
        lock_unpoisoned(&self.client)
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut client = self.lock_client();
                match client.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let client = self.lock_client();
        match client.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn connect(&mut self) -> JanxValue {
        if self.connection_string.is_empty() {
            return janx_error("Empty connection string!");
        }

        let mut client = self.lock_client();
        if client.is_connected() {
            return janx_error("Connection already initialized!");
        }

        match client.connect(self.connection_string.clone()) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn disconnect(&mut self) -> JanxValue {
        let mut client = self.lock_client();
        match client.disconnect() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn execute(&self, params: JanxValue) -> JanxValue {
        let client = self.lock_client();
        match client.execute(params) {
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

impl Drop for AddIn {
    fn drop(&mut self) {
        self.lock_client().close_backend();
    }
}
