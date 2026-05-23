use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;

use crate::settings::ConnectionSettings;
use crate::worker::{self, WorkerCommand};

pub struct RconBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    settings: Option<ConnectionSettings>,
    logger: Option<Arc<Logger>>,
}

impl RconBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            settings: None,
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

    pub fn connect(
        &mut self,
        url: &str,
        password: &str,
        read_timeout: i32,
        write_timeout: i32,
    ) -> Result<(), String> {
        if self.is_connected() {
            return Err("Connection already initialized".to_string());
        }

        let settings =
            ConnectionSettings::new(url, password, read_timeout, write_timeout);
        self.settings = Some(settings.clone());

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Connect {
                settings,
                response,
            })
            .and_then(|result| result)
    }

    pub fn execute_command(&self, command: &str) -> Result<String, String> {
        if !self.is_connected() {
            return Err("No client found. Initialize connection first".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Execute {
            command: command.to_string(),
            response,
        })
    }

    pub fn get_settings(&self) -> Result<String, String> {
        self.settings
            .as_ref()
            .map(|settings| settings.get_settings())
            .ok_or_else(|| "No connection settings found".to_string())
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

impl Drop for RconBackend {
    fn drop(&mut self) {
        self.close();
    }
}
