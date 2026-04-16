use crate::server::{OutgoingMessage, WebSocketServerState};
use common_server::MessageHandler;
use serde_json::json;

impl WebSocketServerState {
    pub fn close_connection(&mut self, connection_id: &str) -> String {
        let mut manager = self.manager.lock().unwrap();
        if let Some(close_sent) = manager.get_mut(connection_id, |conn| {
            conn.is_closed = true;
            conn.outgoing_tx.send(OutgoingMessage::Close).is_ok()
        }) {
            self.log(&format!("WebSocket closed: {}", connection_id));
            if close_sent {
                json!({
                    "result": true,
                    "message": "WebSocket closed"
                }).to_string()
            } else {
                MessageHandler::error_response("Failed to send close frame")
            }
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> String {
        let mut manager = self.manager.lock().unwrap();
        let mut connections_list = Vec::new();

        manager.iter_mut(|conn_id, conn_info| {
            connections_list.push(json!({
                "connectionId": conn_id,
                "address": conn_info.addr,
                "isActive": !conn_info.is_closed
            }));
        });

        json!({
            "result": true,
            "connections": connections_list
        }).to_string()
    }
}
