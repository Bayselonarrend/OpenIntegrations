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
            self.last_error = "Connection already initialized".to_string();
            return false;
        }

        let address = match self.address {
            Some(a) => a,
            None => {
                self.last_error = "No address found!".to_string();
                return false;
            }
        };

        self.ensure_thread();

        let Some(thread) = &self.thread else {
            self.last_error = "Backend thread is not available".to_string();
            return false;
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
            self.sync_last_error();
        }

        ok
    }

    pub fn disconnect(&mut self) -> bool {
        if !self.is_connected() {
            return true;
        }

        let Some(thread) = &self.thread else {
            return true;
        };

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .unwrap_or(true)
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        let Some(thread) = &self.thread else {
            self.last_error = "No connection found!".to_string();
            return false;
        };

        let ok = thread
            .call(|response| WorkerCommand::Send {
                data,
                timeout_ms,
                response,
            })
            .unwrap_or(false);

        if !ok {
            self.sync_last_error();
        }

        ok
    }

    pub fn receive(&mut self, max_data_size: i32, end_marker: Vec<u8>, timeout_ms: i32) -> Vec<u8> {
        let Some(thread) = &self.thread else {
            self.last_error = "No connection found!".to_string();
            return vec![];
        };

        let data = thread
            .call(|response| WorkerCommand::Read {
                max_data_size,
                end_marker,
                timeout_ms,
                response,
            })
            .unwrap_or_default();

        self.sync_last_error();
        data
    }

    pub fn close_output(&mut self) -> bool {
        let Some(thread) = &self.thread else {
            self.last_error = "No connection found!".to_string();
            return false;
        };

        let ok = thread
            .call(|response| WorkerCommand::CloseOutput { response })
            .unwrap_or(false);

        if !ok {
            self.sync_last_error();
        }

        ok
    }

    pub fn last_error(&mut self) -> String {
        self.sync_last_error();
        self.last_error.clone()
    }

    pub fn close(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn sync_last_error(&mut self) {
        if let Some(ref thread) = self.thread {
            if let Ok(error) = thread.call(|response| WorkerCommand::GetLastError { response }) {
                if !error.is_empty() {
                    self.last_error = error;
                }
            }
        }
    }

    fn ensure_thread(&mut self) {
        if self.thread.is_some() {
            return;
        }

        if let Ok(thread) = worker::spawn_thread(self.logger.clone()) {
            self.thread = Some(thread);
        }
    }
}

impl Drop for TcpClientBackend {
    fn drop(&mut self) {
        self.close();
    }
}
