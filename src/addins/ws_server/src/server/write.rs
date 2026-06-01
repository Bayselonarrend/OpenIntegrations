use super::{OutgoingMessage, WebSocketServerState};
use common_janx::{janx, JanxValue};
use common_utils::utils::{janx_error, lock_unpoisoned};

impl WebSocketServerState {

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        let length = message.len();
        self.send_frame(
            connection_id,
            OutgoingMessage::Binary(message),
            &format!("Sending {} bytes to WebSocket {}", length, connection_id),
        )
    }

    pub async fn send_text(&mut self, connection_id: &str, text: String) -> JanxValue {
        self.send_frame(
            connection_id,
            OutgoingMessage::Text(text),
            &format!("Sending text to WebSocket {}", connection_id),
        )
    }

    pub async fn send_ping(&mut self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        self.send_frame(
            connection_id,
            OutgoingMessage::Ping(payload),
            &format!("Sending ping to WebSocket {}", connection_id),
        )
    }

    pub async fn send_pong(&mut self, connection_id: &str, payload: Vec<u8>) -> JanxValue {
        self.send_frame(
            connection_id,
            OutgoingMessage::Pong(payload),
            &format!("Sending pong to WebSocket {}", connection_id),
        )
    }

    fn send_frame(&self, connection_id: &str, frame: OutgoingMessage, log_message: &str) -> JanxValue {
        self.log(log_message);

        let mut manager = lock_unpoisoned(&self.manager);

        if let Some(send_result) = manager.get_mut(connection_id, |conn| {
            if conn.is_closed {
                return false;
            }
            conn.outgoing_tx.send(frame).is_ok()
        }) {
            if send_result {
                janx!({ "result": true })
            } else {
                janx_error("WebSocket connection is closed")
            }
        } else {
            janx_error("WebSocket connection not found")
        }
    }
}
