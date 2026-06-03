mod commands;
mod scheme;
mod socket;
mod state;
mod thread;

use std::sync::Arc;
use common_backend::BackendThread;

use common_logs::Logger;
use crate::backend::commands::BackendCommand;
pub use crate::backend::scheme::ExchangeScheme;
use crate::backend::thread::spawn_thread;

pub struct ZeroMqBackend {
    thread: Option<BackendThread<BackendCommand>>,
    logger: Option<Arc<Logger>>,
}

impl ZeroMqBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
        }
    }

    pub fn is_busy(&self) -> bool {
        let Some(thread) = &self.thread else {
            return false;
        };
        thread
            .call(|response| BackendCommand::IsBusy { response })
            .unwrap_or(false)
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) -> Result<(), String> {
        if self.is_busy() {
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
                .call(|response| BackendCommand::SetLogger { logger, response })
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

    pub fn connect(&mut self, scheme: ExchangeScheme, endpoint: &str) -> Result<(), String> {
        self.ensure_thread()?;
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| BackendCommand::Connect {
                scheme,
                endpoint: endpoint.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn bind(&mut self, scheme: ExchangeScheme, endpoint: &str) -> Result<String, String> {
        self.ensure_thread()?;
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| BackendCommand::Bind {
                scheme,
                endpoint: endpoint.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn subscribe(&mut self, prefix: &str) -> Result<(), String> {
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Socket is not connected or bound.".to_string())?;

        thread
            .call(|response| BackendCommand::Subscribe {
                prefix: prefix.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn send_payload(&mut self, payload: Vec<u8>, timeout_ms: i32) -> Result<(), String> {
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Socket is not connected or bound.".to_string())?;

        thread
            .call(|response| BackendCommand::Send {
                payload,
                timeout_ms,
                response,
            })
            .and_then(|result| result)
    }

    pub fn recv_payload(&mut self, timeout_ms: i32) -> Result<Vec<u8>, String> {
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Socket is not connected or bound.".to_string())?;

        thread
            .call(|response| BackendCommand::Recv {
                timeout_ms,
                response,
            })
            .and_then(|result| result)
    }

    pub fn close_socket(&mut self) -> Result<(), String> {
        let Some(thread) = self.thread.as_ref() else {
            return Ok(());
        };
        thread
            .call(|response| BackendCommand::Close { response })
            .and_then(|result| result)
    }

    fn ensure_thread(&mut self) -> Result<(), String> {
        if self.thread.is_some() {
            return Ok(());
        }

        let thread = spawn_thread(self.logger.clone())?;
        self.thread = Some(thread);
        Ok(())
    }

    fn shutdown(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(BackendCommand::Shutdown));
        }
    }
}

impl Drop for ZeroMqBackend {
    fn drop(&mut self) {
        self.shutdown();
    }
}
