use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_result_ok, lock_unpoisoned};

use crate::backend::WebSocketServerBackend;

struct State {
    backend: WebSocketServerBackend,
    logger: Option<Arc<Logger>>,
}

pub struct WebSocketServer {
    state: Arc<Mutex<State>>,
}

impl WebSocketServer {
    pub fn new() -> Self {
        Self {
            state: Arc::new(Mutex::new(State {
                backend: WebSocketServerBackend::new(),
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

    pub fn start(&mut self, port: u16, config: &JanxValue, logger_config: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();

        let logger = match Self::parse_logger(logger_config) {
            Ok(logger) => logger,
            Err(e) => return janx_error(e),
        };

        let result = state.backend.start(port, config, logger.clone());

        if janx_result_ok(&result) {
            if let Some(logger) = logger {
                state.logger = Some(logger);
            }
        }

        result
    }

    pub fn stop(&mut self) -> JanxValue {
        self.lock_state().backend.stop()
    }

    pub fn get_next_message(&self, timeout_ms: u64) -> JanxValue {
        self.lock_state().backend.get_next_message(timeout_ms)
    }

    pub fn get_message(&self, connection_id: &str, timeout_ms: u64) -> JanxValue {
        self.lock_state()
            .backend
            .get_message(connection_id.to_string(), timeout_ms)
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        self.lock_state()
            .backend
            .send_message(connection_id.to_string(), message)
    }

    pub fn send_text(&self, connection_id: &str, text: &str) -> JanxValue {
        self.lock_state()
            .backend
            .send_text(connection_id.to_string(), text.to_string())
    }

    pub fn send_ping(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        self.lock_state()
            .backend
            .send_ping(connection_id.to_string(), payload)
    }

    pub fn send_pong(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        self.lock_state()
            .backend
            .send_pong(connection_id.to_string(), payload)
    }

    pub fn close_connection(&self, connection_id: &str, remove_from_list: bool) -> JanxValue {
        self.lock_state()
            .backend
            .close_connection(connection_id.to_string(), remove_from_list)
    }

    pub fn get_connections_list(&self) -> JanxValue {
        self.lock_state().backend.get_connections_list()
    }
}
