use super::{OutgoingMessage, WebSocketServerState};
use common_server::MessageHandler;
use serde_json::json;

impl WebSocketServerState {

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        let length = message.len();
        self.send_frame(
            connection_id,
            OutgoingMessage::Binary(message),
            &format!("Sending {} bytes to WebSocket {}", length, connection_id),
        )
    }

    pub async fn send_text(&mut self, connection_id: &str, text: String) -> String {
        self.send_frame(
            connection_id,
            OutgoingMessage::Text(text),
            &format!("Sending text to WebSocket {}", connection_id),
        )
    }

    pub async fn send_ping(&mut self, connection_id: &str, payload: Vec<u8>) -> String {
        self.send_frame(
            connection_id,
            OutgoingMessage::Ping(payload),
            &format!("Sending ping to WebSocket {}", connection_id),
        )
    }

    pub async fn send_pong(&mut self, connection_id: &str, payload: Vec<u8>) -> String {
        self.send_frame(
            connection_id,
            OutgoingMessage::Pong(payload),
            &format!("Sending pong to WebSocket {}", connection_id),
        )
    }

    fn send_frame(&self, connection_id: &str, frame: OutgoingMessage, log_message: &str) -> String {
        self.log(log_message);

        let mut manager = match self.manager.lock() {
            Ok(guard) => guard,
            Err(poisoned) => poisoned.into_inner(),
        };
        if let Some(send_result) = manager.get_mut(connection_id, |conn| {
            if conn.is_closed {
                return false;
            }
            conn.outgoing_tx.send(frame).is_ok()
        }) {
            if send_result {
                json!({
                    "result": true,
                    "message": "Message sent"
                }).to_string()
            } else {
                MessageHandler::error_response("WebSocket connection is closed")
            }
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }
}
