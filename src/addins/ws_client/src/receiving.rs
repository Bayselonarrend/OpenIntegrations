use std::time::Duration;
use common_utils::utils::json_error;
use serde_json::json;
use tungstenite::Message;
use tungstenite::stream::MaybeTlsStream;
use crate::client::WebSocketClient;

impl WebSocketClient {
    pub fn receive_message(&mut self, timeout_ms: u64) -> String {
        if self.socket.is_none() {
            return json_error("Not connected");
        }

        let socket = self.socket.as_mut().unwrap();

        match socket.get_mut() {
            MaybeTlsStream::Plain(stream) => {
                let _ = stream.set_read_timeout(Some(Duration::from_millis(timeout_ms)));
            }
            MaybeTlsStream::Rustls(stream) => {
                let _ = stream.sock.set_read_timeout(Some(Duration::from_millis(timeout_ms)));
            }
            _ => {}
        }

        match socket.read() {
            Ok(message) => {
                match message {
                    Message::Text(text) => {
                        let text_str = text.to_string();
                        let len = text_str.len();
                        self.log(&format!("Received text: {} bytes", len));
                        json!({
                            "result": true,
                            "type": "text",
                            "data": text_str
                        }).to_string()
                    }
                    Message::Binary(data) => {
                        let data_vec = data.to_vec();
                        let len = data_vec.len();
                        match self.vault.store(common_binary::vault::BinaryInput::Bytes(data_vec)) {
                            Ok(vault_key) => {
                                self.log(&format!("Received binary: {} bytes", len));
                                json!({
                                    "result": true,
                                    "type": "binary",
                                    "data": vault_key
                                }).to_string()
                            }
                            Err(e) => json_error(&format!("Failed to store binary: {}", e)),
                        }
                    }
                    Message::Ping(data) => {
                        let _ = socket.send(Message::Pong(data));
                        self.log("Received ping");
                        json!({
                            "result": true,
                            "type": "ping"
                        }).to_string()
                    }
                    Message::Pong(_) => {
                        self.log("Received pong");
                        json!({
                            "result": true,
                            "type": "pong"
                        }).to_string()
                    }
                    Message::Close(frame) => {
                        let code = frame.as_ref().map(|f| f.code.into()).unwrap_or(1000);
                        let reason = frame.as_ref()
                            .map(|f| f.reason.to_string())
                            .unwrap_or_default();

                        let _ = socket.close(None);
                        self.socket = None;
                        self.log("Received close");

                        json!({
                            "result": true,
                            "type": "close",
                            "code": code,
                            "reason": reason
                        }).to_string()
                    }
                    Message::Frame(_) => {
                        json_error("Unexpected raw frame")
                    }
                }
            }
            Err(e) => {
                let err_msg = format!("Receive error: {}", e);
                self.log(&err_msg);
                json_error(&err_msg)
            }
        }
    }
}