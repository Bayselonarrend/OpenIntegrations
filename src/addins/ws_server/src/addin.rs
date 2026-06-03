use std::sync::Arc;

use common_core::{getset, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs};

use crate::wrapper::WebSocketServer;

pub struct AddIn {
    pub(crate) server: WebSocketServer,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server: WebSocketServer::new(),
            logger: None,
        }
    }

    pub(crate) fn init_logger_if_needed(&mut self, logger_config: &JanxValue) -> Result<(), String> {
        if self.logger.is_some() {
            return Ok(());
        }

        if logger_config.is_empty() {
            return Ok(());
        }

        let logger = Logger::from_janx(logger_config)
            .map_err(|e| format!("Failed to initialize logger: {}", e))?;

        let logger_arc = Arc::new(logger);
        self.logger = Some(logger_arc.clone());
        self.server.set_logger(logger_arc);

        Ok(())
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

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if self.server.is_started() {
            let _ = self.server.stop();
        }
    }
}
