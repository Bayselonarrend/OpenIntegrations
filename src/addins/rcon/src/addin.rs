use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::RconBackend;

pub struct AddIn {
    client: Arc<Mutex<RconBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            client: Arc::new(Mutex::new(RconBackend::new())),
        }
    }

    fn lock_client(&self) -> std::sync::MutexGuard<'_, RconBackend> {
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

    pub fn connect(
        &mut self,
        url: &str,
        password: &str,
        read_timeout: i32,
        write_timeout: i32,
    ) -> JanxValue {
        let mut client = self.lock_client();
        match client.connect(url, password, read_timeout, write_timeout) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn execute_command(&mut self, command: &str) -> JanxValue {
        let mut client = self.lock_client();
        client
            .execute_command(command)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_settings(&self) -> JanxValue {
        let client = self.lock_client();
        client
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
