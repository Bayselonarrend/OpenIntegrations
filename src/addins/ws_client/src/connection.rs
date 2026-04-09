use std::net::TcpStream;
use std::sync::Arc;
use common_tcp::tls_settings::TlsSettings;
use common_tcp::tcp_establish::create_tcp_connection;
use common_tcp::proxy_settings::ProxySettings;
use common_utils::utils::{json_error, json_success};
use rustls::pki_types::ServerName;
use tungstenite::{client, WebSocket};
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

        let custom = self.tls_settings.is_some() || self.proxy_settings.is_some();

        let conn =  if custom {
            Self::connect_with_custom_settings(&url, &self.tls_settings, &self.proxy_settings, &self.headers)
        }else{
            Self::connect_with_headers(&url, &self.headers)
        };

        match conn {
            Ok(socket) => {
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

    fn connect_with_headers(url: &Url, headers: &Option<Vec<(String, String)>>) -> Result<WebSocket<MaybeTlsStream<TcpStream>>, String> {

        let request = Self::build_request_with_headers(url, headers)?;

        let host = url.host_str().ok_or("No host")?;
        let port = url.port().unwrap_or(80);

        let stream = TcpStream::connect((host, port))
            .map_err(|e| format!("TCP connection failed: {}", e))?;

        let mb_stream = MaybeTlsStream::Plain(stream);

        let (socket, _) = client(request, mb_stream)
            .map_err(|e| format!("Connection failed: {}", e))?;

        Ok(socket)
    }

    fn connect_with_custom_settings(
        url: &Url, 
        tls_settings: &Option<TlsSettings>, 
        proxy_settings: &Option<ProxySettings>,
        headers: &Option<Vec<(String, String)>>
    ) -> Result<WebSocket<MaybeTlsStream<TcpStream>>, String> {

        let host = url.host_str().ok_or("No host in URL")?;
        let port = url.port().unwrap_or_else(|| {
            if url.scheme() == "wss" { 443 } else { 80 }
        });

        let tcp_stream = create_tcp_connection(host, port, proxy_settings)?;

        let maybe_tls_stream = if let Some(tls) = tls_settings {
            if tls.use_tls {

                let tls_config = tls.get_rustls_config()?;
                let server_name = ServerName::try_from(host.to_string())
                    .map_err(|e| format!("Invalid server name: {}", e))?;

                let connector = rustls::ClientConnection::new(Arc::new(tls_config), server_name)
                    .map_err(|e| format!("TLS connection setup failed: {}", e))?;

                let tls_stream = rustls::StreamOwned::new(connector, tcp_stream);
                MaybeTlsStream::Rustls(tls_stream)

            } else {
                MaybeTlsStream::Plain(tcp_stream)
            }
        } else {
            MaybeTlsStream::Plain(tcp_stream)
        };

        let request = Self::build_request_with_headers(url, headers)?;

        let (socket, _) = client(request, maybe_tls_stream)
            .map_err(|e| format!("WebSocket handshake failed: {}", e))?;

        Ok(socket)
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