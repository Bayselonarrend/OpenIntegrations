use std::net::SocketAddr;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish::resolve_to_socket_addr;
use common_tcp::tls_settings::TlsSettings;

use crate::worker::{self, WorkerCommand};

pub struct TcpClientBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    address: Option<SocketAddr>,
    address_str: String,
    tls: Option<TlsSettings>,
    proxy: Option<ProxySettings>,
    logger: Option<Arc<Logger>>,
    /// Ошибки до появления worker-потока и кэш после `GetLastError`.
    last_error: String,
}

impl TcpClientBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            address: None,
            address_str: String::new(),
            tls: None,
            proxy: None,
            logger: None,
            last_error: String::new(),
        }
    }

    pub fn address_str(&self) -> &str {
        &self.address_str
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

    pub fn set_address(&mut self, address: &str) -> Result<(), String> {
        if self.is_connected() {
            return Err("Address can only be set before the connection is established".to_string());
        }
        let resolved = resolve_to_socket_addr(address)?;
        self.address = Some(resolved);
        self.address_str = resolved.to_string();
        Ok(())
    }

    pub fn set_tls(
        &mut self,
        use_tls: bool,
        accept_invalid_certs: bool,
        ca_cert_path: &str,
    ) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "TLS settings can only be set before the connection is established".to_string(),
            );
        }
        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        Ok(())
    }

    pub fn set_proxy(&mut self, data: &JanxValue) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "Proxy settings can only be set before the connection is established".to_string(),
            );
        }
        self.proxy = Some(ProxySettings::from_janx(data)?);
        Ok(())
    }

    pub fn connect(&mut self) -> bool {
        if self.is_connected() {
            self.stash_error("Connection already initialized");
            return false;
        }

        let address = match self.address {
            Some(a) => a,
            None => {
                self.stash_error("No address found!");
                return false;
            }
        };

        if let Err(e) = self.ensure_thread() {
            self.stash_error(e);
            return false;
        }

        let thread = match self.thread.as_ref() {
            Some(t) => t,
            None => {
                self.stash_error("Backend thread is not available");
                return false;
            }
        };

        let tls = self.tls.clone();
        let proxy = self.proxy.clone();

        let ok = thread
            .call(|response| WorkerCommand::Connect {
                address,
                tls,
                proxy,
                response,
            })
            .unwrap_or(false);

        if !ok {
            self.pull_last_error();
        }

        ok
    }

    pub fn disconnect(&mut self) -> bool {
        if !self.is_connected() {
            return true;
        }

        let Some(thread) = self.thread.as_ref() else {
            return true;
        };

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .unwrap_or(true)
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        let thread = match self.require_connected() {
            Ok(t) => t,
            Err(_) => return false,
        };

        let ok = thread
            .call(|response| WorkerCommand::Send {
                data,
                timeout_ms,
                response,
            })
            .unwrap_or(false);

        if !ok {
            self.pull_last_error();
        }

        ok
    }

    pub fn receive(&mut self, max_data_size: i32, end_marker: Vec<u8>, timeout_ms: i32) -> Vec<u8> {
        let thread = match self.require_connected() {
            Ok(t) => t,
            Err(_) => return vec![],
        };

        let data = thread
            .call(|response| WorkerCommand::Read {
                max_data_size,
                end_marker,
                timeout_ms,
                response,
            })
            .unwrap_or_default();

        self.pull_last_error();
        data
    }

    pub fn close_output(&mut self) -> bool {
        let thread = match self.require_connected() {
            Ok(t) => t,
            Err(_) => return false,
        };

        let ok = thread
            .call(|response| WorkerCommand::CloseOutput { response })
            .unwrap_or(false);

        if !ok {
            self.pull_last_error();
        }

        ok
    }

    pub fn last_error(&mut self) -> String {
        self.pull_last_error();
        self.last_error.clone()
    }

    pub fn close_backend(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn stash_error(&mut self, message: impl Into<String>) {
        self.last_error = message.into();
    }

    fn pull_last_error(&mut self) {
        if let Some(ref thread) = self.thread {
            if let Ok(error) = thread.call(|response| WorkerCommand::GetLastError { response }) {
                if !error.is_empty() {
                    self.last_error = error;
                }
            }
        }
    }

    fn require_connected(&mut self) -> Result<&SyncBackendThread<WorkerCommand>, String> {
        if !self.is_connected() {
            self.stash_error("No connection found!");
            return Err(self.last_error.clone());
        }

        if self.thread.is_none() {
            self.stash_error("Backend thread is not available");
            return Err(self.last_error.clone());
        }

        Ok(self.thread.as_ref().expect("thread checked above"))
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

impl Drop for TcpClientBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
