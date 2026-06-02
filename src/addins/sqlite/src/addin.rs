use std::sync::Arc;

use common_core::{janx, JanxValue};
use common_dataset::dataset::Datasets;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};

use crate::backend::SQLiteBackend;

pub struct AddIn {
    pub(crate) database: String,
    pub(crate) client: SQLiteBackend,
    pub(crate) datasets: Datasets,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            database: String::new(),
            client: SQLiteBackend::new(),
            datasets: Datasets::new(),
        }
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => match self.client.set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(e) => janx_error(&e),
            },
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.client.get_logs(count) {
            Some((logs, total)) => {
                let returned = logs.len();
                janx!({
                    "result": true,
                    "logs": logs,
                    "total": total,
                    "returned": returned,
                })
            }
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn initialize(&mut self) -> JanxValue {
        if self.client.is_connected() {
            return janx_error("Client already initialized!");
        }

        match self.client.connect(self.database.clone()) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(&e),
        }
    }

    pub fn close_connection(&mut self) -> JanxValue {
        self.client.close();
        janx_success(None, None)
    }

    pub fn execute_query(&self, key: &str) -> JanxValue {
        if !self.client.is_connected() {
            return janx_error("Not connected to SQLite");
        }

        let query = match self.datasets.get_query(key) {
            Some(q) => q,
            None => return janx_error(format!("No query found by key: {}", key)),
        };

        match self
            .client
            .execute_query(query.text, query.params, query.force_result)
        {
            Ok(Some(data)) => {
                self.datasets.set_results(key, data);
                janx!({"result": true, "data": true})
            }
            Ok(None) => janx!({"result": true, "data": false}),
            Err(e) => janx_error(&e),
        }
    }

    pub fn load_extension(&self, path: String, point: String) -> JanxValue {
        match self.client.load_extension(path, point) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(&e),
        }
    }

    pub fn get_result(&self, key: &str) -> JanxValue {
        self.datasets
            .result(key)
            .unwrap_or_else(|e| janx_error(&e))
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            0 => &self.database as &dyn common_core::getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
