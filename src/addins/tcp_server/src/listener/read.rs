use common_janx::{janx, JanxValue};
use common_server::AsyncWaiter;
use common_utils::utils::janx_error;

use super::ServerState;

impl ServerState {
    pub async fn get_next_message(
        &mut self,
        timeout_ms: u64,
        max_message_size: usize,
    ) -> JanxValue {
        let waiter = AsyncWaiter::new(timeout_ms);

        let result = waiter
            .wait_for(|| {
                let all_ids = self.manager.get_ids_round_robin();

                for conn_id in all_ids {
                    let mut buffer = vec![0u8; max_message_size];

                    match self.try_read_from_connection(&conn_id, &mut buffer) {
                        Ok(Some((message, addr, still_active))) => {
                            self.log(&format!(
                                "Message received from {}: {} bytes, active: {}",
                                conn_id,
                                message.len(),
                                still_active
                            ));

                            if still_active {
                                self.manager.set_last_processed(Some(conn_id.clone()));
                            } else {
                                self.manager.set_last_processed(None);
                                self.log(&format!(
                                    "Connection {} became inactive after read",
                                    conn_id
                                ));
                            }

                            return Some((message, conn_id, addr, still_active));
                        }
                        Ok(None) => {}
                        Err(_) => {}
                    }
                }

                None
            })
            .await;

        match result {
            Ok((message, conn_id, addr, still_active)) => janx!({
                "result": true,
                "connectionId": conn_id,
                "message": message,
                "active": still_active,
                "address": addr,
            }),
            Err(()) => janx_error("timeout"),
        }
    }

    pub async fn get_message_from_connection(
        &mut self,
        connection_id: &str,
        timeout_ms: u64,
        max_message_size: usize,
    ) -> JanxValue {
        let waiter = AsyncWaiter::new(timeout_ms);
        let conn_id = connection_id.to_string();

        let result = waiter
            .wait_for(|| {
                let mut buffer = vec![0u8; max_message_size];

                match self.try_read_from_connection(&conn_id, &mut buffer) {
                    Ok(Some((message, addr, still_active))) => Some((message, addr, still_active)),
                    Ok(None) => None,
                    Err(_e) => Some((Vec::new(), String::new(), false)),
                }
            })
            .await;

        match result {
            Ok((message, addr, still_active)) if !message.is_empty() => {
                self.log(&format!(
                    "Message received from {}: {} bytes, active: {}",
                    conn_id,
                    message.len(),
                    still_active
                ));
                janx!({
                    "result": true,
                    "connectionId": conn_id,
                    "message": message,
                    "active": still_active,
                    "address": addr,
                })
            }
            Ok(_) => janx_error("Failed to read from connection"),
            Err(()) => janx_error("timeout"),
        }
    }
}
