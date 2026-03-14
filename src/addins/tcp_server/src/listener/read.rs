use super::ServerState;
use std::time::Duration;
use serde_json::json;
use common_binary::vault::BinaryInput;

impl ServerState {

    async fn wait_for_message<F>(
        &mut self,
        timeout_ms: u64,
        max_message_size: usize,
        mut try_read: F,
    ) -> String
    where
        F: FnMut(&mut Self, &mut Vec<u8>) -> Result<Option<(Vec<u8>, String, String, bool)>, String>,
    {
        let start = std::time::Instant::now();
        let timeout = Duration::from_millis(timeout_ms);
        let poll_interval = Duration::from_millis(10);

        loop {
            let mut buffer = vec![0u8; max_message_size];
            
            match try_read(self, &mut buffer) {
                Ok(Some((message, conn_id, addr, still_active))) => {
                    // Сохраняем бинарные данные в vault
                    let vault_key = match self.vault.store(BinaryInput::Bytes(message)) {
                        Ok(key) => key,
                        Err(e) => return json!({
                            "result": false,
                            "error": format!("Failed to store message in vault: {}", e)
                        }).to_string(),
                    };

                    return json!({
                        "result": true,
                        "connectionId": conn_id,
                        "message": vault_key,
                        "active": still_active,
                        "address": addr
                    })
                    .to_string();
                }
                Ok(None) => {}
                Err(e) => {
                    return json!({
                        "result": false,
                        "error": e
                    })
                    .to_string();
                }
            }

            if start.elapsed() >= timeout {
                return json!({"result": false, "error": "timeout"}).to_string();
            }

            tokio::time::sleep(poll_interval).await;
        }
    }

    pub async fn get_next_message(&mut self, timeout_ms: u64, max_message_size: usize) -> String {
        self.wait_for_message(timeout_ms, max_message_size, |state, buffer| {
            let start_id = state.last_processed.clone();
            let mut all_ids: Vec<String> = state.connections.iter().map(|e| e.key().clone()).collect();

            if let Some(ref last_id) = start_id {
                if let Some(pos) = all_ids.iter().position(|id| id == last_id) {
                    all_ids.rotate_left(pos + 1);
                }
            }

            for conn_id in all_ids {
                match state.try_read_from_connection(&conn_id, buffer) {
                    Ok(Some((message, addr, still_active))) => {
                        if still_active {
                            state.last_processed = Some(conn_id.clone());
                        } else {
                            state.last_processed = None;
                        }
                        return Ok(Some((message, conn_id, addr, still_active)));
                    }
                    Ok(None) => {}
                    Err(_) => {}
                }
            }

            Ok(None)
        }).await
    }

    pub async fn get_message_from_connection(&mut self, connection_id: &str, timeout_ms: u64, max_message_size: usize) -> String {
        let conn_id = connection_id.to_string();
        
        self.wait_for_message(timeout_ms, max_message_size, |state, buffer| {
            match state.try_read_from_connection(&conn_id, buffer) {
                Ok(Some((message, addr, still_active))) => {
                    Ok(Some((message, conn_id.clone(), addr, still_active)))
                }
                Ok(None) => Ok(None),
                Err(e) => Err(e),
            }
        }).await
    }
}
