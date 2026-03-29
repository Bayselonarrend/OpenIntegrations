use std::sync::Arc;
use std::net::TcpStream;
use tungstenite::WebSocket;
use tungstenite::stream::MaybeTlsStream;
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

pub struct WebSocketClient {
    pub(crate) socket: Option<WebSocket<MaybeTlsStream<TcpStream>>>,
    pub(crate) vault: BinaryVault,
    pub(crate) logger: Option<Arc<Logger>>,
    pub(crate) tls_settings: Option<TlsSettings>,
    pub(crate) headers: Option<Vec<(String, String)>>,
}

impl WebSocketClient {

    pub fn new(vault: BinaryVault) -> Self {
        Self {
            socket: None,
            vault,
            logger: None,
            tls_settings: None,
            headers: None,
        }
    }

    pub(crate) fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) {
        self.logger = Some(logger);
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        if self.socket.is_some() {
            return json_error("Cannot set TLS while connected");
        }

        self.tls_settings = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        self.log(&format!("TLS settings configured: use_tls={}, accept_invalid_certs={}", use_tls, accept_invalid_certs));
        json_success()
    }

    pub fn set_headers(&mut self, headers_json: &str) -> String {
        if self.socket.is_some() {
            return json_error("Cannot set headers while connected");
        }

        match serde_json::from_str::<Vec<(String, String)>>(headers_json) {
            Ok(headers) => {
                self.headers = Some(headers);
                self.log("Headers configured");
                json_success()
            }
            Err(e) => json_error(&format!("Invalid headers JSON: {}", e)),
        }
    }

    pub fn close(&mut self, code: u16, reason: &str) -> String {
        if self.socket.is_none() {
            return json_error("Not connected");
        }

        self.log(&format!("Closing with code {} and reason: {}", code, reason));
        
        let socket = match self.socket.as_mut(){
            Some(s) => s,
            None => return json_error("Not connected"),
        };
        
        let close_frame = tungstenite::protocol::CloseFrame {
            code: code.into(),
            reason: reason.into(),
        };
        
        match socket.close(Some(close_frame)) {
            Ok(_) => {
                let _ = socket.read();
                self.socket = None;
                json_success()
            }
            Err(e) => {
                let err_msg = format!("Close failed: {}", e);
                self.log(&err_msg);
                json_error(&err_msg)
            }
        }
    }

    pub fn is_connected(&self) -> String {
        json!({
            "result": true,
            "connected": self.socket.is_some()
        }).to_string()
    }
}
