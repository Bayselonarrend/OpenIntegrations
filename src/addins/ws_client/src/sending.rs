use common_core::JanxValue;
use common_utils::utils::{janx_error, janx_success};
use tungstenite::Message;
use crate::client::WebSocketClient;

impl WebSocketClient {
    pub fn send_text(&mut self, text: &str) -> JanxValue {
        self.log(&format!("Sending text: {} bytes", text.len()));

        let socket = match self.socket.as_mut() {
            Some(s) => s,
            None => return janx_error("Not connected"),
        };
        match socket.send(Message::Text(text.to_string().into())) {
            Ok(_) => janx_success(None, None),
            Err(e) => {
                let err_msg = format!("Send failed: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        }
    }

    pub fn send_binary(&mut self, data: Vec<u8>) -> JanxValue {
        self.log(&format!("Sending binary: {} bytes", data.len()));

        let socket = match self.socket.as_mut() {
            Some(s) => s,
            None => return janx_error("Not connected"),
        };
        match socket.send(Message::Binary(data.into())) {
            Ok(_) => janx_success(None, None),
            Err(e) => {
                let err_msg = format!("Send failed: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        }
    }
    
    pub fn send_ping(&mut self) -> JanxValue {
        self.log("Sending ping");

        let socket = match self.socket.as_mut() {
            Some(s) => s,
            None => return janx_error("Not connected"),
        };
        match socket.send(Message::Ping(vec![].into())) {
            Ok(_) => janx_success(None, None),
            Err(e) => {
                let err_msg = format!("Ping failed: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        }
    }

    pub fn send_pong(&mut self) -> JanxValue {
        self.log("Sending pong");

        let socket = match self.socket.as_mut() {
            Some(s) => s,
            None => return janx_error("Not connected"),
        };
        match socket.send(Message::Pong(vec![].into())) {
            Ok(_) => janx_success(None, None),
            Err(e) => {
                let err_msg = format!("Pong failed: {}", e);
                self.log(&err_msg);
                janx_error(err_msg)
            }
        }
    }
}
