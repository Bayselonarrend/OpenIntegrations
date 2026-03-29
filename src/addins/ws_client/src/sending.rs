use common_utils::utils::{json_error, json_success};
use tungstenite::Message;
use crate::client::WebSocketClient;

impl WebSocketClient {
    pub fn send_text(&mut self, text: &str) -> String {
        if self.socket.is_none() {
            return json_error("Not connected");
        }

        self.log(&format!("Sending text: {} bytes", text.len()));

        let socket = self.socket.as_mut().unwrap();
        match socket.send(Message::Text(text.to_string().into())) {
            Ok(_) => json_success(),
            Err(e) => {
                let err_msg = format!("Send failed: {}", e);
                self.log(&err_msg);
                json_error(&err_msg)
            }
        }
    }

    pub fn send_binary(&mut self, data: Vec<u8>) -> String {
        if self.socket.is_none() {
            return json_error("Not connected");
        }

        self.log(&format!("Sending binary: {} bytes", data.len()));

        let socket = self.socket.as_mut().unwrap();
        match socket.send(Message::Binary(data.into())) {
            Ok(_) => json_success(),
            Err(e) => {
                let err_msg = format!("Send failed: {}", e);
                self.log(&err_msg);
                json_error(&err_msg)
            }
        }
    }
    
    pub fn ping(&mut self) -> String {
        if self.socket.is_none() {
            return json_error("Not connected");
        }

        self.log("Sending ping");

        let socket = self.socket.as_mut().unwrap();
        match socket.send(Message::Ping(vec![].into())) {
            Ok(_) => json_success(),
            Err(e) => {
                let err_msg = format!("Ping failed: {}", e);
                self.log(&err_msg);
                json_error(&err_msg)
            }
        }
    }
}