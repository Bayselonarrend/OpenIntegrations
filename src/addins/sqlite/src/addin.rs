use std::sync::{Arc, Mutex};

use common_core::{janx, JanxValue};
use common_dataset::dataset::Datasets;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success, lock_unpoisoned};

use crate::backend::SQLiteBackend;

struct State {
    client: SQLiteBackend,
    datasets: Datasets,
}

pub struct AddIn {
    pub(crate) database: String,
    state: Arc<Mutex<State>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            database: String::new(),
            state: Arc::new(Mutex::new(State {
                client: SQLiteBackend::new(),
                datasets: Datasets::new(),
            })),
        }
    }

    fn lock_state(&self) -> std::sync::MutexGuard<'_, State> {
        lock_unpoisoned(&self.state)
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut state = self.lock_state();
                match state.client.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(&e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let state = self.lock_state();
        match state.client.get_logs(count) {
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
        let mut state = self.lock_state();
        if state.client.is_connected() {
            return janx_error("Client already initialized!");
        }

        match state.client.connect(self.database.clone()) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(&e),
        }
    }

    pub fn close_connection(&mut self) -> JanxValue {
        let mut state = self.lock_state();
        state.client.close();
        janx_success(None, None)
    }

    pub fn execute_query(&self, key: &str) -> JanxValue {
        let mut state = self.lock_state();
        if !state.client.is_connected() {
            return janx_error("Not connected to SQLite");
        }

        let query = match state.datasets.get_query(key) {
            Some(q) => q,
            None => return janx_error(format!("No query found by key: {}", key)),
        };

        match state
            .client
            .execute_query(query.text, query.params, query.force_result)
        {
            Ok(Some(data)) => {
                state.datasets.set_results(key, data);
                janx!({"result": true, "data": true})
            }
            Ok(None) => janx!({"result": true, "data": false}),
            Err(e) => janx_error(&e),
        }
    }

    pub fn load_extension(&self, path: String, point: String) -> JanxValue {
        let mut state = self.lock_state();
        match state.client.load_extension(path, point) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(&e),
        }
    }

    pub fn get_result(&self, key: &str) -> JanxValue {
        let state = self.lock_state();
        state
            .datasets
            .result(key)
            .unwrap_or_else(|e| janx_error(&e))
    }

    pub(crate) fn datasets_init_query(
        &mut self,
        text: &str,
        force_result: bool,
        from_file: bool,
    ) -> Result<String, String> {
        self.lock_state()
            .datasets
            .init_query(text, force_result, from_file)
    }

    pub(crate) fn datasets_result_as_file(
        &mut self,
        key: &str,
        filepath: &str,
    ) -> Result<(), String> {
        self.lock_state().datasets.result_as_file(key, filepath)
    }

    pub(crate) fn datasets_params_from_file(
        &mut self,
        key: &str,
        filepath: &str,
    ) -> Result<(), String> {
        self.lock_state().datasets.params_from_file(key, filepath)
    }

    pub(crate) fn datasets_set_params(
        &mut self,
        key: &str,
        value: JanxValue,
    ) -> Result<(), String> {
        self.lock_state().datasets.set_params(key, value)
    }

    pub(crate) fn datasets_remove(&mut self, key: &str) {
        self.lock_state().datasets.remove(key);
    }

    pub(crate) fn datasets_batch_query_init(
        &mut self,
        input_file: &str,
        output_file: &str,
    ) -> Result<(), String> {
        self.lock_state()
            .datasets
            .batch_query_init(input_file, output_file)
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
