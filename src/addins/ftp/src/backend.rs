use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tls_settings::TlsSettings;
use common_core::JanxValue;
use common_utils::utils::janx_success;

use crate::configuration::FtpSettings;
use crate::worker::{self, WorkerCommand};

pub struct FtpBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    ftp_settings: Option<FtpSettings>,
    tls_settings: Option<TlsSettings>,
    proxy_settings: Option<ProxySettings>,
    logger: Option<Arc<Logger>>,
}

impl FtpBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            ftp_settings: None,
            tls_settings: None,
            proxy_settings: None,
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

    pub fn update_settings(&mut self, settings: FtpSettings) {
        self.ftp_settings = Some(settings);
    }

    pub fn update_proxy(&mut self, settings: ProxySettings) {
        self.proxy_settings = Some(settings);
    }

    pub fn set_tls(&mut self, settings: TlsSettings) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "TLS settings can only be set before the connection is established".to_string(),
            );
        }
        self.tls_settings = Some(settings);
        Ok(())
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

    pub fn is_tls(&self) -> bool {
        self.tls_settings
            .as_ref()
            .is_some_and(|s| s.use_tls)
    }

    pub fn get_configurations(&self) -> JanxValue {
        janx_success(
            Some(common_core::janx!({
                "ftp_settings": self.ftp_settings.as_ref().map(|s| common_core::janx!({
                    "domain": s.domain.clone(),
                    "port": s.port as i64,
                    "passive": s.passive,
                    "read_timeout": s.read_timeout as i64,
                    "write_timeout": s.write_timeout as i64,
                    "login": s.login.clone(),
                    "password": s.password.clone(),
                    "advanced_resolve": s.advanced_resolve,
                })),
                "tls_settings": self.tls_settings.as_ref().map(|s| common_core::janx!({
                    "use_tls": s.use_tls,
                    "accept_invalid_certs": s.accept_invalid_certs,
                    "ca_cert_path": s.ca_cert_path.clone(),
                })),
                "proxy_settings": self.proxy_settings.as_ref().map(|s| common_core::janx!({
                    "server": s.server.clone(),
                    "port": s.port as i64,
                    "proxy_type": s.proxy_type.clone(),
                    "login": s.login.clone(),
                    "password": s.password.clone(),
                })),
            })),
            Some("data"),
        )
    }

    pub fn connect(&mut self) -> Result<(), String> {
        if self.is_connected() {
            return Err("Client already initialized".to_string());
        }

        let ftp_settings = self
            .ftp_settings
            .clone()
            .ok_or_else(|| "Address must be initialized".to_string())?;

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Connect {
                ftp_settings,
                tls_settings: self.tls_settings.clone(),
                proxy_settings: self.proxy_settings.clone(),
                response,
            })??;

        Ok(())
    }

    pub fn close(&mut self) -> Result<(), String> {
        if !self.is_connected() {
            return Ok(());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Close { response })
            .and_then(|result| result)?;

        Ok(())
    }

    pub fn call<F>(&self, build: F) -> Result<JanxValue, String>
    where
        F: FnOnce(std::sync::mpsc::Sender<JanxValue>) -> WorkerCommand,
    {
        if !self.is_connected() {
            return Err("FTP client is not initialized".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(build)
    }

    pub fn download_to_buffer(&self, path: String) -> Result<Vec<u8>, String> {
        if !self.is_connected() {
            return Err("FTP client is not initialized".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::DownloadToBuffer { path, response })
            .and_then(|result| result)
    }

    pub fn ping(&self) -> bool {
        if !self.is_connected() {
            return false;
        }

        let thread = match self.thread.as_ref() {
            Some(t) => t,
            None => return false,
        };

        thread
            .call(|response| WorkerCommand::Ping { response })
            .unwrap_or(false)
    }

    pub fn shutdown(&mut self) {
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

impl Drop for FtpBackend {
    fn drop(&mut self) {
        self.shutdown();
    }
}
