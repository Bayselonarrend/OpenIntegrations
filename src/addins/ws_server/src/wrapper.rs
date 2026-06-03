use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_result_ok, janx_success, lock_unpoisoned};

use crate::backend::WebSocketServerBackend;

struct State {
    backend: WebSocketServerBackend,
    started: bool,
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
                started: false,
                logger: None,
            })),
        }
    }

    fn lock_state(&self) -> std::sync::MutexGuard<'_, State> {
        lock_unpoisoned(&self.state)
    }

    pub fn init_logger(&mut self, logger_config: &JanxValue) -> Result<(), String> {
        let mut state = self.lock_state();
        if state.logger.is_some() {
            return Ok(());
        }

        if logger_config.is_empty() {
            return Ok(());
        }

        let logger = Logger::from_janx(logger_config)
            .map_err(|e| format!("Failed to initialize logger: {}", e))?;

        let logger_arc = Arc::new(logger);
        state.logger = Some(logger_arc.clone());
        state.backend.set_logger(logger_arc);

        Ok(())
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

    pub fn start(&mut self, port: u16, config: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        if state.started {
            return janx_error("WebSocket server already started");
        }

        let result = state.backend.start(port, config);

        if janx_result_ok(&result) {
            state.started = true;
        }

        result
    }

    pub fn stop(&mut self) -> JanxValue {
        let mut state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state.backend.shutdown();
        state.started = false;
        janx_success(None, None)
    }

    pub fn get_next_message(&self, timeout_ms: u64) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state.backend.get_next_message(timeout_ms)
    }

    pub fn get_message(&self, connection_id: &str, timeout_ms: u64) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .get_message(connection_id.to_string(), timeout_ms)
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .send_message(connection_id.to_string(), message)
    }

    pub fn send_text(&self, connection_id: &str, text: &str) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .send_text(connection_id.to_string(), text.to_string())
    }

    pub fn send_ping(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .send_ping(connection_id.to_string(), payload)
    }

    pub fn send_pong(&self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .send_pong(connection_id.to_string(), payload)
    }

    pub fn close_connection(&self, connection_id: &str, remove_from_list: bool) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state
            .backend
            .close_connection(connection_id.to_string(), remove_from_list)
    }

    pub fn get_connections_list(&self) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("WebSocket server not started");
        }

        state.backend.get_connections_list()
    }

    pub fn is_started(&self) -> bool {
        self.lock_state().started
    }
}

impl Drop for WebSocketServer {
    fn drop(&mut self) {
        let mut state = lock_unpoisoned(&self.state);
        if state.started {
            state.backend.shutdown();
            state.started = false;
        }
    }
}
