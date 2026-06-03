use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_result_ok, janx_success, lock_unpoisoned};

use crate::backend::HttpServerBackend;

struct State {
    backend: HttpServerBackend,
    started: bool,
    logger: Option<Arc<Logger>>,
}

pub struct HttpServer {
    state: Arc<Mutex<State>>,
}

impl HttpServer {
    pub fn new() -> Self {
        Self {
            state: Arc::new(Mutex::new(State {
                backend: HttpServerBackend::new(),
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
            return janx_error("HTTP server already started");
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
            return janx_error("HTTP server not started");
        }

        state.backend.shutdown();
        state.started = false;
        janx_success(None, None)
    }

    pub fn handle_request(&self, timeout_ms: u64) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("HTTP server not started");
        }

        state.backend.handle_request(timeout_ms)
    }

    pub fn handle_request_by_id(&self, request_id: &str) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("HTTP server not started");
        }

        state
            .backend
            .handle_request_by_id(request_id.to_string())
    }

    pub fn send_response(&self, request_id: &str, status_code: u16, body: Vec<u8>) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("HTTP server not started");
        }

        state
            .backend
            .send_response(request_id.to_string(), status_code, body)
    }

    pub fn get_pending_requests(&self) -> JanxValue {
        let state = self.lock_state();
        if !state.started {
            return janx_error("HTTP server not started");
        }

        state.backend.get_pending_requests()
    }

    pub fn is_started(&self) -> bool {
        self.lock_state().started
    }
}

impl Drop for HttpServer {
    fn drop(&mut self) {
        let mut state = lock_unpoisoned(&self.state);
        if state.started {
            state.backend.shutdown();
            state.started = false;
        }
    }
}
