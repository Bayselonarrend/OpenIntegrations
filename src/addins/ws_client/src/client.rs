use std::sync::Arc;
use std::net::TcpStream;
use tungstenite::WebSocket;
use tungstenite::stream::MaybeTlsStream;
use common_logs::{log, Logger};
use common_tcp::tls_settings::TlsSettings;
use common_tcp::proxy_settings::ProxySettings;
use common_core::{FromJanx, JanxValue};
use common_utils::utils::{janx_error, janx_success};

pub struct WebSocketClient {
    pub(crate) socket: Option<WebSocket<MaybeTlsStream<TcpStream>>>,
    pub(crate) logger: Option<Arc<Logger>>,
    pub(crate) tls_settings: Option<TlsSettings>,
    pub(crate) proxy_settings: Option<ProxySettings>,
    pub(crate) headers: Option<Vec<(String, String)>>,
}

#[allow(dead_code)]
impl WebSocketClient {

    pub fn new() -> Self {
        Self {
            socket: None,
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

    #[allow(dead_code)]
    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        if self.socket.is_some() {
            return janx_error("Cannot set TLS while connected");
        }

        self.tls_settings = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        self.log(&format!("TLS settings configured: use_tls={}, accept_invalid_certs={}", use_tls, accept_invalid_certs));
        janx_success(None, None)
    }

    pub fn set_headers(&mut self, headers_janx: &JanxValue) -> JanxValue {
        if self.socket.is_some() {
            return janx_error("Cannot set headers while connected");
        }

        match Self::parse_headers_janx(headers_janx) {
            Ok(headers) => {
                self.headers = Some(headers);
                self.log("Headers configured");
                janx_success(None, None)
            }
            Err(e) => janx_error(e),
        }
    }

    pub fn set_proxy(&mut self, proxy_janx: &JanxValue) -> JanxValue {
        if self.socket.is_some() {
            return janx_error("Cannot set proxy while connected");
        }

        match ProxySettings::from_janx(proxy_janx) {
            Ok(proxy) => {
                self.proxy_settings = Some(proxy);
                self.log("Proxy settings configured");
                janx_success(None, None)
            }
            Err(e) => janx_error(format!("Invalid proxy Janx payload: {}", e)),
        }
    }

    pub fn close(&mut self, code: u16, reason: &str) -> JanxValue {
        if self.socket.is_none() {
            return janx_error("Not connected");
        }

        self.log(&format!("Closing with code {} and reason: {}", code, reason));
        
        let socket = match self.socket.as_mut(){
            Some(s) => s,
            None => return janx_error("Not connected"),
        };
        
        let close_frame = tungstenite::protocol::CloseFrame {
            code: code.into(),
            reason: reason.into(),
        };
        
        match socket.close(Some(close_frame)) {
            Ok(_) => {
                let _ = socket.read();
                self.socket = None;
                janx_success(None, None)
            }
            Err(e) => {
                let err_msg = format!("Close failed: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        }
    }

}

impl WebSocketClient {
    pub fn parse_headers_janx(headers: &JanxValue) -> Result<Vec<(String, String)>, String> {
        parse_headers_janx(headers)
    }
}

fn parse_headers_janx(headers: &JanxValue) -> Result<Vec<(String, String)>, String> {
    if let Some(map) = headers.as_object() {
        return Ok(map
            .iter()
            .map(|(k, v)| (k.clone(), String::from_janx(v).unwrap_or_default()))
            .collect());
    }

    if let Some(arr) = headers.as_array() {
        let mut out = Vec::with_capacity(arr.len());
        for entry in arr {
            let Some(pair) = entry.as_array() else {
                return Err("Headers Janx array must contain [key, value] pairs".to_string());
            };
            if pair.len() != 2 {
                return Err("Each headers pair must have exactly two elements".to_string());
            }
            let key = String::from_janx(&pair[0])
                .ok_or_else(|| "Header key must be a string".to_string())?;
            let value = String::from_janx(&pair[1]).unwrap_or_default();
            out.push((key, value));
        }
        return Ok(out);
    }

    Err("Headers Janx payload must be an object or an array of [key, value] pairs".to_string())
}