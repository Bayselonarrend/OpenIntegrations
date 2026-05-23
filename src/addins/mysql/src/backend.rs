use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_binary::vault::{BinaryInput, BinaryVault};
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use serde_json::Value;

use crate::worker::{self, WorkerCommand};

pub struct MySQLBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    binary_vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    tls: Option<TlsSettings>,
}

impl MySQLBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            binary_vault: BinaryVault::new(),
            logger: None,
            tls: None,
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

    pub fn set_tls(&mut self, settings: TlsSettings) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "TLS settings can only be set before the connection is established".to_string(),
            );
        }
        self.tls = Some(settings);
        Ok(())
    }

    pub fn get_tls_settings(&self) -> String {
        self.tls
            .as_ref()
            .map(|tls| tls.get_settings())
            .unwrap_or_default()
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

    pub fn store_binary(&mut self, input: BinaryInput) -> Result<String, String> {
        self.binary_vault
            .store(input)
            .map_err(|e| e.to_string())
    }

    pub fn connect(&mut self, conn_str: String) -> Result<(), String> {
        if self.is_connected() {
            return Err("Client already connected".to_string());
        }

        self.ensure_thread()?;

        let tls = self.tls.clone();
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Connect {
                conn_str,
                tls,
                response,
            })??;

        Ok(())
    }

    pub fn execute_query(
        &self,
        query: String,
        params_json: Vec<Value>,
        force_result: bool,
    ) -> Result<Option<Vec<Value>>, String> {
        if !self.is_connected() {
            return Err("Not connected to MySQL".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Execute {
                query,
                params_json,
                force_result,
                response,
            })
            .and_then(|result| result)
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

        let thread = worker::spawn_thread(self.binary_vault.clone(), self.logger.clone())?;
        self.thread = Some(thread);
        Ok(())
    }
}

impl Drop for MySQLBackend {
    fn drop(&mut self) {
        self.close();
    }
}
