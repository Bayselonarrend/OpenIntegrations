use std::sync::{Arc, Mutex};

use common_core::{getset, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_result_ok, janx_success};

use crate::backend::TcpServerBackend;

pub struct AddIn {
    backend: Arc<Mutex<TcpServerBackend>>,
    started: bool,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(TcpServerBackend::new())),
            started: false,
            logger: None,
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        if let Some(ref logger) = self.logger {
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
        if self.started {
            return janx_error("Server already started");
        }

        if !logger_config.is_empty() {
            match Logger::from_janx(logger_config) {
                Ok(logger) => {
                    let logger_arc = Arc::new(logger);
                    self.logger = Some(logger_arc.clone());

                    if let Ok(mut backend) = self.backend.lock() {
                        backend.set_logger(logger_arc);
                    }
                }
                Err(e) => {
                    return janx_error(format!("Failed to initialize logger: {}", e));
                }
            }
        }

        let result = match self.backend.lock() {
            Ok(backend) => backend.start(port, queue_size),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        };

        if janx_result_ok(&result) {
            self.started = true;
        }

        result
    }

    pub fn stop_server(&mut self) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        let _ = self.close_all_connections();

        match self.backend.lock() {
            Ok(mut backend) => {
                backend.shutdown();
                self.started = false;
                janx_success(None, None)
            }
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_all_connections(&self) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_all_connections(),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_next_message(timeout_ms, max_message_size),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_message_from_connection(
        &self,
        connection_id: &str,
        timeout_ms: u64,
        max_message_size: usize,
    ) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_message_from_connection(
                connection_id.to_string(),
                timeout_ms,
                max_message_size,
            ),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_message(connection_id.to_string(), message),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_connection(&self, connection_id: &str) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_connection(connection_id.to_string()),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn shutdown_read(&self, connection_id: &str) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.shutdown_read(connection_id.to_string()),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn shutdown_write(&self, connection_id: &str) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.shutdown_write(connection_id.to_string()),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_connections_list(&self) -> JanxValue {
        if !self.started {
            return janx_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_connections_list(),
            Err(e) => janx_error(format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if self.started {
            let _ = self.stop_server();
        }
    }
}
