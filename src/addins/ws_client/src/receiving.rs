use std::collections::BTreeMap;
use std::time::Duration;

use common_janx::JanxValue;
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
                    Self::janx_ok_message("text", JanxValue::String(text_str))
                }
                Message::Binary(data) => {
                    let len = data.len();
                    self.log(&format!("Received binary: {} bytes", len));
                    let mut fields = BTreeMap::new();
                    fields.insert("type".to_string(), JanxValue::String("binary".into()));
                    fields.insert("data".to_string(), JanxValue::binary(data));
                    fields.insert("size".to_string(), JanxValue::Number((len as i64).into()));
                    Self::janx_ok_fields(fields)
                }
                Message::Ping(data) => {
                    let _ = socket.send(Message::Pong(data));
                    self.log("Received ping");
                    Self::janx_ok_message("ping", JanxValue::Null)
                }
                Message::Pong(_) => {
                    self.log("Received pong");
                    Self::janx_ok_message("pong", JanxValue::Null)
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

                    let mut fields = BTreeMap::new();
                    fields.insert("type".to_string(), JanxValue::String("close".into()));
                    fields.insert("code".to_string(), JanxValue::Number((code as i64).into()));
                    fields.insert("reason".to_string(), JanxValue::String(reason));
                    Self::janx_ok_fields(fields)
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

    fn janx_ok_message(type_name: &str, data: JanxValue) -> JanxValue {
        let mut fields = BTreeMap::new();
        fields.insert("type".to_string(), JanxValue::String(type_name.into()));
        if !matches!(data, JanxValue::Null) {
            fields.insert("data".to_string(), data);
        }
        Self::janx_ok_fields(fields)
    }

    fn janx_ok_fields(mut fields: BTreeMap<String, JanxValue>) -> JanxValue {
        fields.insert("result".to_string(), JanxValue::Bool(true));
        JanxValue::Object(fields)
    }
}
