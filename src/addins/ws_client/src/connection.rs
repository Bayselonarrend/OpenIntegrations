use std::net::TcpStream;
use std::sync::Arc;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};
use rustls::pki_types::ServerName;
use tungstenite::{client, connect, WebSocket};
use tungstenite::handshake::client::Request;
use tungstenite::http::HeaderValue;
use tungstenite::stream::MaybeTlsStream;
use url::Url;
use crate::client::WebSocketClient;

impl WebSocketClient {

    pub fn connect(&mut self, url_str: &str) -> String {

        if self.socket.is_some() {
            return json_error("Already connected");
        }

        self.log(&format!("Connecting to {}", url_str));

        let url = match Url::parse(url_str) {
            Ok(u) => u,
            Err(e) => return json_error(&format!("Invalid URL: {}", e)),
        };

        if self.tls_settings.is_some() {
            let tls_settings = self.tls_settings.as_ref().unwrap();

            if tls_settings.use_tls {
                return match Self::connect_with_custom_tls(&url, tls_settings, &self.headers) {
                    Ok(socket) => {
                        self.socket = Some(socket);
                        self.log("Connected successfully with custom TLS");
                        json_success()
                    }
                    Err(e) => {
                        self.log(&format!("Connection failed: {}", e));
                        json_error(&format!("Connection failed: {}", e))
                    }
                }
            }
        }

        if self.headers.is_some() {
            match Self::connect_with_headers(&url, &self.headers) {
                Ok(socket) => {
                    self.socket = Some(socket);
                    self.log("Connected successfully with custom headers");
                    json_success()
                }
                Err(e) => {
                    self.log(&format!("Connection failed: {}", e));
                    json_error(&format!("Connection failed: {}", e))
                }
            }
        } else {
            match connect(url.as_str()) {
                Ok((socket, _response)) => {
                    self.socket = Some(socket);
                    self.log("Connected successfully");
                    json_success()
                }
                Err(e) => {
                    self.log(&format!("Connection failed: {}", e));
                    json_error(&format!("Connection failed: {}", e))
                }
            }
        }
    }

    fn connect_with_headers(url: &Url, headers: &Option<Vec<(String, String)>>) -> Result<WebSocket<MaybeTlsStream<TcpStream>>, String> {
        let request = Self::build_request_with_headers(url, headers)?;

        let (socket, _) = client(request, MaybeTlsStream::Plain(
            TcpStream::connect((url.host_str().ok_or("No host")?, url.port().unwrap_or(80)))
                .map_err(|e| format!("TCP connection failed: {}", e))?
        )).map_err(|e| format!("Connection failed: {}", e))?;

        Ok(socket)
    }

    fn connect_with_custom_tls(url: &Url, tls_settings: &TlsSettings, headers: &Option<Vec<(String, String)>>) -> Result<WebSocket<MaybeTlsStream<TcpStream>>, String> {
        let host = url.host_str().ok_or("No host in URL")?;
        let port = url.port().unwrap_or(443);

        let tcp_stream = TcpStream::connect((host, port))
            .map_err(|e| format!("TCP connection failed: {}", e))?;

        let tls_config = tls_settings.get_rustls_config()?;

        let server_name = ServerName::try_from(host.to_string())
            .map_err(|e| format!("Invalid server name: {}", e))?;

        let connector = rustls::ClientConnection::new(Arc::new(tls_config), server_name)
            .map_err(|e| format!("TLS connection setup failed: {}", e))?;

        let tls_stream = rustls::StreamOwned::new(connector, tcp_stream);
        let maybe_tls_stream = MaybeTlsStream::Rustls(tls_stream);

        let request = Self::build_request_with_headers(url, headers)?;

        let (socket, _) = client(request, maybe_tls_stream)
            .map_err(|e| format!("WebSocket handshake failed: {}", e))?;

        Ok(socket)
    }

    pub fn disconnect(&mut self) -> String {
        if let Some(mut socket) = self.socket.take() {
            self.log("Disconnecting");
            let _ = socket.close(None);
            json_success()
        } else {
            json_error("Not connected")
        }
    }

    fn build_request_with_headers(url: &Url, headers: &Option<Vec<(String, String)>>) -> Result<Request, String> {
        let mut request = Request::builder()
            .uri(url.as_str())
            .body(())
            .map_err(|e| format!("Failed to build request: {}", e))?;

        if let Some(headers_vec) = headers {
            let req_headers = request.headers_mut();
            for (key, value) in headers_vec {
                let header_value = HeaderValue::from_str(value)
                    .map_err(|e| format!("Invalid header value for '{}': {}", key, e))?;
                let header_name = key.parse::<tungstenite::http::HeaderName>()
                    .map_err(|e| format!("Invalid header name '{}': {}", key, e))?;
                req_headers.insert(header_name, header_value);
            }
        }

        Ok(request)
    }
}