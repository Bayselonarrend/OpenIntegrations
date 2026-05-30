use common_janx::{janx, JanxValue};
use common_server::AsyncWaiter;
use common_utils::utils::janx_error;
use common_utils::utils::lock_unpoisoned;

use super::WebSocketServerState;

impl WebSocketServerState {
    pub async fn get_next_message(&mut self, timeout_ms: u64) -> JanxValue {
        let waiter = AsyncWaiter::new(timeout_ms);

        let result = waiter
            .wait_for(|| {
                let mut manager = lock_unpoisoned(&self.manager);

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
            })
            .await;

        match result {
            Ok((connection_id, Some(message), address, is_active)) => {
                self.log(&format!(
                    "Received {} bytes from WebSocket {}",
                    message.len(),
                    connection_id
                ));
                janx!({
                    "result": true,
                    "connectionId": connection_id,
                    "message": message,
                    "isActive": is_active,
                    "address": address,
                })
            }
            Ok((_, None, _, _)) => janx_error("timeout"),
            Err(()) => janx_error("timeout"),
        }
    }

    pub async fn get_message(&mut self, connection_id: &str, timeout_ms: u64) -> JanxValue {
        let waiter = AsyncWaiter::new(timeout_ms);
        let conn_id = connection_id.to_string();

        let result = waiter
            .wait_for(|| {
                let mut manager = lock_unpoisoned(&self.manager);

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
            })
            .await;

        match result {
            Ok((Some(message), address, is_active)) => {
                self.log(&format!(
                    "Received {} bytes from WebSocket {}",
                    message.len(),
                    connection_id
                ));
                janx!({
                    "result": true,
                    "connectionId": connection_id,
                    "message": message,
                    "isActive": is_active,
                    "address": address,
                })
            }
            Ok((None, address, _)) => janx!({
                "result": true,
                "connectionId": connection_id,
                "address": address,
                "isActive": false,
            }),
            Err(()) => janx_error("timeout"),
        }
    }

    fn poll_connection_message(
        conn: &mut super::WebSocketConnection,
    ) -> (Option<Vec<u8>>, String, bool) {
        let is_active = !conn.is_closed;
        let address = conn.addr.clone();
        match conn.incoming_rx.try_recv() {
            Ok(msg) => (Some(msg), address, is_active),
            Err(tokio::sync::mpsc::error::TryRecvError::Empty) => (None, address, is_active),
            Err(tokio::sync::mpsc::error::TryRecvError::Disconnected) => {
                (None, address, false)
            }
        }
    }
}
