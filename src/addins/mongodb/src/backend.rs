use std::sync::Arc;

use common_backend::BackendThread;
use common_janx::JanxValue;
use common_logs::Logger;

use crate::worker::{self, parse_execute_params, WorkerCommand};

pub struct MongoDBBackend {
    thread: Option<BackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl MongoDBBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
        }
    }

    pub fn is_connected(&self) -> bool {
        let Some(thread) = &self.thread else {
            return false;
        };
        thread
            .call(|response| WorkerCommand::IsConnected { response })
            .unwrap_or(false)
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "Logger can only be set before the connection is established".to_string(),
            );
        }
        if self.logger.is_some() {
            return Ok(());
        }
        self.logger = Some(logger.clone());
        if let Some(ref thread) = self.thread {
            thread
                .call(|response| WorkerCommand::SetLogger { logger, response })
                .and_then(|result| result)?;
        }
        Ok(())
    }

    pub fn get_logs(&self, count: usize) -> Option<(Vec<String>, usize)> {
        self.logger.as_ref().map(|logger| {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            (logs, total)
        })
    }

    pub fn connect(&mut self, connection_string: String) -> Result<(), String> {
        if self.is_connected() {
            return Err("Connection already initialized".to_string());
        }

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Connect {
                connection_string,
                response,
            })??;

        Ok(())
    }

    pub fn disconnect(&mut self) -> Result<(), String> {
        if !self.is_connected() {
            return Err("Connection already closed".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .and_then(|result| result)
    }

    pub fn execute(&self, params: JanxValue) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("Connection already closed".to_string());
        }

        let execute_params = parse_execute_params(params)?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Execute {
            params: execute_params,
            response,
        })
    }

    pub fn close(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn ensure_thread(&mut self) -> Result<(), String> {
        if self.thread.is_some() {
            return Ok(());
        }

        let thread = worker::spawn_thread(self.logger.clone())?;
        self.thread = Some(thread);
        Ok(())
    }
}

impl Drop for MongoDBBackend {
    fn drop(&mut self) {
        self.close();
    }
}
