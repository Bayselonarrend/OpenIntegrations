use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tls_settings::TlsSettings;

use crate::client::WebSocketClient;
use crate::worker::{self, WorkerCommand};

pub struct WsClientBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
    tls: Option<TlsSettings>,
    proxy: Option<ProxySettings>,
    headers: Option<Vec<(String, String)>>,
}

impl WsClientBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
            tls: None,
            proxy: None,
            headers: None,
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

    pub fn set_tls(
        &mut self,
        use_tls: bool,
        accept_invalid_certs: bool,
        ca_cert_path: &str,
    ) -> Result<(), String> {
        if self.is_connected() {
            return Err("Cannot set TLS while connected".to_string());
        }
        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        Ok(())
    }

    pub fn set_proxy(&mut self, proxy_json: &str) -> Result<(), String> {
        if self.is_connected() {
            return Err("Cannot set proxy while connected".to_string());
        }
        self.proxy = Some(ProxySettings::from_json(proxy_json)?);
        Ok(())
    }

    pub fn set_headers(&mut self, headers_json: &str) -> Result<(), String> {
        if self.is_connected() {
            return Err("Cannot set headers while connected".to_string());
        }
        self.headers = Some(WebSocketClient::parse_headers_json(headers_json)?);
        Ok(())
    }

    pub fn connect(&mut self, url: &str) -> Result<JanxValue, String> {
        if self.is_connected() {
            return Err("Already connected".to_string());
        }

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Connect {
            url: url.to_string(),
            tls: self.tls.clone(),
            proxy: self.proxy.clone(),
            headers: self.headers.clone(),
            response,
        })
    }

    pub fn send_text(&self, text: &str) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::SendText {
            text: text.to_string(),
            response,
        })
    }

    pub fn send_binary(&self, data: Vec<u8>) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::SendBinary { data, response })
    }

    pub fn receive_message(&self, timeout_ms: u64) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::ReceiveMessage {
            timeout_ms,
            response,
        })
    }

    pub fn send_ping(&self) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::SendPing { response })
    }

    pub fn send_pong(&self) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::SendPong { response })
    }

    pub fn close(&self, code: u16, reason: &str) -> Result<JanxValue, String> {
        self.require_thread()?.call(|response| WorkerCommand::Close {
            code,
            reason: reason.to_string(),
            response,
        })
    }

    pub fn close_backend(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn require_thread(&self) -> Result<&SyncBackendThread<WorkerCommand>, String> {
        if !self.is_connected() {
            return Err("Not connected".to_string());
        }
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

impl Drop for WsClientBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
