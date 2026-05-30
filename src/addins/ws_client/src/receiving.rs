use std::time::Duration;

use common_janx::{janx, JanxValue};
use common_utils::utils::janx_error;
use tungstenite::stream::MaybeTlsStream;
use tungstenite::Message;

use crate::client::WebSocketClient;

impl WebSocketClient {
    pub fn receive_message(&mut self, timeout_ms: u64) -> JanxValue {
        let socket = match self.socket.as_mut() {
            Some(s) => s,
            None => return janx_error("Not connected"),
        };

        match socket.get_mut() {
            MaybeTlsStream::Plain(stream) => {
                let _ = stream.set_read_timeout(Some(Duration::from_millis(timeout_ms)));
            }
            MaybeTlsStream::Rustls(stream) => {
                let _ = stream
                    .sock
                    .set_read_timeout(Some(Duration::from_millis(timeout_ms)));
            }
            _ => {}
        }

        let mut disconnect = false;

        let result = match socket.read() {
            Ok(message) => match message {
                Message::Text(text) => {
                    let text_str = text.to_string();
                    let len = text_str.len();
                    self.log(&format!("Received text: {} bytes", len));
                    janx!({
                        "result": true,
                        "type": "text",
                        "data": text_str,
                    })
                }
                Message::Binary(data) => {
                    let len = data.len();
                    self.log(&format!("Received binary: {} bytes", len));
                    janx!({
                        "result": true,
                        "type": "binary",
                        "data": data.to_vec(),
                        "size": len as i64,
                    })
                }
                Message::Ping(data) => {
                    let _ = socket.send(Message::Pong(data));
                    self.log("Received ping");
                    janx!({
                        "result": true,
                        "type": "ping",
                    })
                }
                Message::Pong(_) => {
                    self.log("Received pong");
                    janx!({
                        "result": true,
                        "type": "pong",
                    })
                }
                Message::Close(frame) => {
                    let code = frame.as_ref().map(|f| f.code.into()).unwrap_or(1000);
                    let reason = frame
                        .as_ref()
                        .map(|f| f.reason.to_string())
                        .unwrap_or_default();

                    let _ = socket.close(None);
                    disconnect = true;
                    self.log("Received close");

                    janx!({
                        "result": true,
                        "type": "close",
                        "code": code as i64,
                        "reason": reason,
                    })
                }
                Message::Frame(_) => janx_error("Unexpected raw frame"),
            },
            Err(e) => {
                let err_msg = format!("Receive error: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        };

        if disconnect {
            self.socket = None;
        }

        result
    }
}
