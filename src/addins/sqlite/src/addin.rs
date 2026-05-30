use std::sync::Arc;

use common_core::JanxValue;
use common_dataset::dataset::Datasets;
use common_logs::Logger;
use common_utils::utils::{janx_error, json_error, json_success};
use serde_json::json;

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

    pub fn initialize(&mut self) -> String {
        if self.client.is_connected() {
            return json_error("Client already initialized!");
        }

        match self.client.connect(self.database.clone()) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn close_connection(&mut self) -> String {
        self.client.close();
        json_success()
    }

    pub fn execute_query(&self, key: &str) -> String {
        if !self.client.is_connected() {
            return json_error("Not connected to SQLite");
        }

        let query = match self.datasets.get_query(key) {
            Some(q) => q,
            None => return json_error(format!("No query found by key: {}", key)),
        };

        match self
            .client
            .execute_query(query.text, query.params, query.force_result)
        {
            Ok(Some(data)) => {
                self.datasets.set_results(key, data);
                json!({"result": true, "data": true}).to_string()
            }
            Ok(None) => json!({"result": true, "data": false}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn load_extension(&self, path: String, point: String) -> String {
        match self.client.load_extension(path, point) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn get_result_as_janx(&self, key: &str) -> JanxValue {
        self.datasets
            .result_as_janx(key)
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
