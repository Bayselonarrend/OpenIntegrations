use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::janx_success;

use crate::settings::ConnectionSettings;
use crate::worker::{self, WorkerCommand};

pub struct LdapBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    settings: Option<ConnectionSettings>,
    tls_settings: Option<TlsSettings>,
    logger: Option<Arc<Logger>>,
}

impl LdapBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            settings: None,
            tls_settings: None,
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

    pub fn connect(
        &mut self,
        url: &str,
        bind_dn: &str,
        password: &str,
        timeout: i32,
    ) -> Result<(), String> {
        if self.is_connected() {
            return Err("Connection already initialized".to_string());
        }

        let settings = ConnectionSettings::new(url, bind_dn, password, timeout);
        self.settings = Some(settings.clone());

        self.ensure_thread()?;

        let thread = self.require_thread()?;

        thread
            .call(|response| WorkerCommand::Connect {
                settings,
                tls_settings: self.tls_settings.clone(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn disconnect(&mut self) -> Result<(), String> {
        if !self.is_connected() {
            return Err("No session".to_string());
        }

        let thread = self.require_thread()?;

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .and_then(|result| result)
    }

    pub fn search(&self, params: &JanxValue) -> Result<JanxValue, String> {
        self.call_connected(|response| WorkerCommand::Search {
            params: params.clone(),
            response,
        })
    }

    pub fn add(&self, params: &JanxValue) -> Result<JanxValue, String> {
        self.call_connected(|response| WorkerCommand::Add {
            params: params.clone(),
            response,
        })
    }

    pub fn modify(&self, params: &JanxValue) -> Result<JanxValue, String> {
        self.call_connected(|response| WorkerCommand::Modify {
            params: params.clone(),
            response,
        })
    }

    pub fn delete(&self, dn: &str) -> Result<JanxValue, String> {
        self.call_connected(|response| WorkerCommand::Delete {
            dn: dn.to_string(),
            response,
        })
    }

    pub fn compare(&self, params: &JanxValue) -> Result<JanxValue, String> {
        self.call_connected(|response| WorkerCommand::Compare {
            params: params.clone(),
            response,
        })
    }

    pub fn get_configuration(&self) -> Result<JanxValue, String> {
        let settings = self
            .settings
            .as_ref()
            .ok_or_else(|| "No connection settings found".to_string())?;

        let tls = self.tls_settings.as_ref().map(|s| {
            common_core::janx!({
                "use_tls": s.use_tls,
                "accept_invalid_certs": s.accept_invalid_certs,
                "ca_cert_path": s.ca_cert_path.clone(),
            })
        });

        Ok(janx_success(
            Some(common_core::janx!({
                "settings": settings.to_janx(),
                "tls": tls,
            })),
            Some("data"),
        ))
    }

    pub fn close_backend(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn call_connected<F>(&self, build: F) -> Result<JanxValue, String>
    where
        F: FnOnce(std::sync::mpsc::Sender<JanxValue>) -> WorkerCommand,
    {
        let thread = self.require_connected()?;
        thread.call(build)
    }

    fn require_connected(&self) -> Result<&SyncBackendThread<WorkerCommand>, String> {
        if !self.is_connected() {
            return Err("Not connected to LDAP server".to_string());
        }
        self.require_thread()
    }

    fn require_thread(&self) -> Result<&SyncBackendThread<WorkerCommand>, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())
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

impl Drop for LdapBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
