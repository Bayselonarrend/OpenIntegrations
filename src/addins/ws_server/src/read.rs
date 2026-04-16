use crate::server::{WebSocketConnection, WebSocketServerState};
use common_server::{AsyncWaiter, MessageHandler};
use serde_json::json;

impl WebSocketServerState {

    pub async fn get_next_message(&mut self, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let message_handler = MessageHandler::new(self.vault.clone());

        let result = waiter.wait_for(|| {
            let mut manager = self.manager.lock().unwrap();
            let all_ids = manager.get_ids_round_robin();
            let mut to_remove = Vec::new();
            let mut found_message = None;
            for conn_id in all_ids {
                if let Some((message, address, is_active)) =
                    manager.get_mut(&conn_id, Self::poll_connection_message)
                {
                    if let Some(msg) = message {
                        manager.set_last_processed(Some(conn_id.clone()));
                        found_message = Some((conn_id, Some(msg), address, is_active));
                        break;
                    }
                    if !is_active {
                        to_remove.push(conn_id.clone());
                    }
                }
            }

            for conn_id in to_remove {
                manager.remove(&conn_id);
            }

            if found_message.is_some() {
                return found_message;
            }

            None
        }).await;

        match result {
            Ok((connection_id, Some(message), address, is_active)) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));

                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "address": address,
                            "message": vault_key,
                            "isActive": is_active,
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Ok((_, None, _, _)) => MessageHandler::timeout_response(),
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    pub async fn get_message(&mut self, connection_id: &str, timeout_ms: u64) -> String {
        let waiter = AsyncWaiter::new(timeout_ms);
        let conn_id = connection_id.to_string();

        let result = waiter.wait_for(|| {
            let mut manager = self.manager.lock().unwrap();
            if let Some((message, address, is_active)) =
                manager.get_mut(&conn_id, Self::poll_connection_message)
            {
                if !is_active && message.is_none() {
                    manager.remove(&conn_id);
                }
                if let Some(msg) = message {
                    return Some((Some(msg), address, is_active));
                }
                if !is_active {
                    return Some((None, address, false));
                }
            }
            None
        }).await;

        match result {
            Ok((Some(message), address, is_active)) => {
                self.log(&format!("Received {} bytes from WebSocket {}", message.len(), connection_id));

                let message_handler = MessageHandler::new(self.vault.clone());
                match message_handler.store_message(message) {
                    Ok(vault_key) => {
                        json!({
                            "result": true,
                            "connectionId": connection_id,
                            "address": address,
                            "isActive": is_active,
                            "message": vault_key
                        }).to_string()
                    }
                    Err(e) => MessageHandler::error_response(&e),
                }
            }
            Ok((None, address, _)) => {
                json!({
                    "result": true,
                    "connectionId": connection_id,
                    "address": address,
                    "isActive": false
                }).to_string()
            }
            Err(()) => MessageHandler::timeout_response(),
        }
    }

    fn poll_connection_message(conn: &mut WebSocketConnection) -> (Option<Vec<u8>>, String, bool) {
        let is_active = !conn.is_closed;
        let address = conn.addr.clone();
        match conn.incoming_rx.try_recv() {
            Ok(msg) => (Some(msg), address, is_active),
            Err(tokio::sync::mpsc::error::TryRecvError::Empty) => (None, address, is_active),
            Err(tokio::sync::mpsc::error::TryRecvError::Disconnected) => (None, address, false),
        }
    }
}
