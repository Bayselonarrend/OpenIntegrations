use std::sync::Arc;
use std::net::TcpStream;
use tungstenite::WebSocket;
use tungstenite::stream::MaybeTlsStream;
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_tcp::tls_settings::TlsSettings;
use common_tcp::proxy_settings::ProxySettings;
use common_utils::utils::{json_error, json_success};

pub struct WebSocketClient {
    pub(crate) socket: Option<WebSocket<MaybeTlsStream<TcpStream>>>,
    pub(crate) vault: BinaryVault,
    pub(crate) logger: Option<Arc<Logger>>,
    pub(crate) tls_settings: Option<TlsSettings>,
    pub(crate) proxy_settings: Option<ProxySettings>,
    pub(crate) headers: Option<Vec<(String, String)>>,
}

impl WebSocketClient {

    pub fn new(vault: BinaryVault) -> Self {
        Self {
            socket: None,
            vault,
            logger: None,
            tls_settings: None,
            proxy_settings: None,
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

        match parse_headers_json(headers_json) {
            Ok(headers) => {
                self.headers = Some(headers);
                self.log("Headers configured");
                json_success()
            }
            Err(e) => json_error(&e),
        }
    }

    pub fn set_proxy(&mut self, proxy_json: &str) -> String {
        if self.socket.is_some() {
            return json_error("Cannot set proxy while connected");
        }

        match ProxySettings::from_json(proxy_json) {
            Ok(proxy) => {
                self.proxy_settings = Some(proxy);
                self.log("Proxy settings configured");
                json_success()
            }
            Err(e) => json_error(&format!("Invalid proxy JSON: {}", e)),
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

}

fn parse_headers_json(headers_json: &str) -> Result<Vec<(String, String)>, String> {
    let value: serde_json::Value =
        serde_json::from_str(headers_json).map_err(|e| format!("Invalid headers JSON: {}", e))?;

    match value {
        serde_json::Value::Object(map) => Ok(
            map.into_iter()
                .map(|(k, v)| {
                    let val = match v {
                        serde_json::Value::String(s) => s,
                        serde_json::Value::Null => String::new(),
                        other => other.to_string(),
                    };
                    (k, val)
                })
                .collect(),
        ),
        serde_json::Value::Array(_) => serde_json::from_value(value)
            .map_err(|e| format!("Invalid headers array (expected [[\"key\",\"value\"], ...]): {}", e)),
        _ => Err("Headers JSON must be an object or an array of [key, value] pairs".to_string()),
    }
}