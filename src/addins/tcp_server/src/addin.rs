use std::sync::{Arc, Mutex};

use common_core::{getset, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_result_ok, lock_unpoisoned};

use crate::backend::TcpServerBackend;

struct State {
    backend: TcpServerBackend,
    logger: Option<Arc<Logger>>,
}

pub struct AddIn {
    state: Arc<Mutex<State>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            state: Arc::new(Mutex::new(State {
                backend: TcpServerBackend::new(),
                logger: None,
            })),
        }
    }

    fn lock_state(&self) -> std::sync::MutexGuard<'_, State> {
        lock_unpoisoned(&self.state)
    }

    fn parse_logger(logger_config: &JanxValue) -> Result<Option<Arc<Logger>>, String> {
        if logger_config.is_empty() {
            return Ok(None);
        }

        Logger::from_janx(logger_config)
            .map(|logger| Some(Arc::new(logger)))
            .map_err(|e| format!("Failed to initialize logger: {}", e))
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let state = self.lock_state();
        if let Some(ref logger) = state.logger {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            janx_logs(logs, total)
        } else {
            janx_error("Logger not initialized")
        }
    }

    pub fn start_server(
        &mut self,
        port: u16,
        queue_size: usize,
        logger_config: &JanxValue,
    ) -> JanxValue {
        let mut state = self.lock_state();

        let logger = match Self::parse_logger(logger_config) {
            Ok(logger) => logger,
            Err(e) => return janx_error(e),
        };

        let result = state.backend.start(port, queue_size, logger.clone());

        if janx_result_ok(&result) {
            if let Some(logger) = logger {
                state.logger = Some(logger);
            }
        }

        result
    }

    pub fn stop_server(&mut self) -> JanxValue {
        self.lock_state().backend.stop()
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> JanxValue {
        self.lock_state()
            .backend
            .get_next_message(timeout_ms, max_message_size)
    }

    pub fn get_message_from_connection(
        &self,
        connection_id: &str,
        timeout_ms: u64,
        max_message_size: usize,
    ) -> JanxValue {
        self.lock_state().backend.get_message_from_connection(
            connection_id.to_string(),
            timeout_ms,
            max_message_size,
        )
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        self.lock_state()
            .backend
            .send_message(connection_id.to_string(), message)
    }

    pub fn close_connection(&self, connection_id: &str) -> JanxValue {
        self.lock_state()
            .backend
            .close_connection(connection_id.to_string())
    }

    pub fn shutdown_read(&self, connection_id: &str) -> JanxValue {
        self.lock_state()
            .backend
            .shutdown_read(connection_id.to_string())
    }

    pub fn shutdown_write(&self, connection_id: &str) -> JanxValue {
        self.lock_state()
            .backend
            .shutdown_write(connection_id.to_string())
    }

    pub fn get_connections_list(&self) -> JanxValue {
        self.lock_state().backend.get_connections_list()
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
