use super::{OutgoingMessage, WebSocketServerState};
use common_server::MessageHandler;
use common_utils::utils::lock_unpoisoned;
use serde_json::json;

impl WebSocketServerState {
    pub(crate) fn close_all_connections_internal(&mut self) {
        
        let mut manager = lock_unpoisoned(&self.manager);

        manager.iter_mut(|_, conn| {
            conn.is_closed = true;
            let _ = conn.outgoing_tx.send(OutgoingMessage::Close);
        });
        manager.clear();
    }

    pub fn close_connection(&mut self, connection_id: &str, remove_from_list: bool) -> String {
        let mut manager = lock_unpoisoned(&self.manager);

        if let Some(close_sent) = manager.get_mut(connection_id, |conn| {
            conn.is_closed = true;
            conn.outgoing_tx.send(OutgoingMessage::Close).is_ok()
        }) {
            if remove_from_list {
                let _ = manager.remove(connection_id);
            }

            self.log(&format!(
                "WebSocket closed: {} (remove_from_list={}, close_sent={})",
                connection_id, remove_from_list, close_sent
            ));

            json!({
                "result": true,
                "message": "WebSocket closed"
            })
            .to_string()
        } else {
            MessageHandler::error_response("WebSocket connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> String {

        let mut connections_list = Vec::new();
        let mut manager = lock_unpoisoned(&self.manager);

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
