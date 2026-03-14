use super::ServerState;
use std::time::Duration;
use serde_json::json;

impl ServerState {

    pub async fn get_next_message(&mut self, timeout_ms: u64, max_message_size: usize) -> String {
        let start = std::time::Instant::now();
        let timeout = Duration::from_millis(timeout_ms);
        let poll_interval = Duration::from_millis(10);

        loop {
            let start_id = self.last_processed.clone();

            let mut all_ids: Vec<String> = self.connections.iter().map(|e| e.key().clone()).collect();

            if let Some(ref last_id) = start_id {
                if let Some(pos) = all_ids.iter().position(|id| id == last_id) {
                    all_ids.rotate_left(pos + 1);
                }
            }

            for conn_id in all_ids {
                let mut buffer = vec![0u8; max_message_size];
                
                match self.try_read_from_connection(&conn_id, &mut buffer) {
                    Ok(Some((message, addr, still_active))) => {
                        if still_active {
                            self.last_processed = Some(conn_id.clone());
                        } else {
                            self.last_processed = None;
                        }

                        return json!({
                            "result": true,
                            "connectionId": conn_id,
                            "message": message,
                            "active": still_active,
                            "address": addr
                        })
                        .to_string();
                    }
                    Ok(None) => {}
                    Err(_) => {}
                }
            }

            if start.elapsed() >= timeout {
                return json!({"result": true, "timeout": true}).to_string();
            }

            tokio::time::sleep(poll_interval).await;
        }
    }

    pub async fn get_message_from_connection(&mut self, connection_id: &str, timeout_ms: u64, max_message_size: usize) -> String {
        let start = std::time::Instant::now();
        let timeout = Duration::from_millis(timeout_ms);
        let poll_interval = Duration::from_millis(10);

        loop {
            let mut buffer = vec![0u8; max_message_size];
            
            match self.try_read_from_connection(connection_id, &mut buffer) {
                Ok(Some((message, addr, still_active))) => {
                    return json!({
                        "result": true,
                        "connectionId": connection_id,
                        "message": message,
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
                return json!({"result": true, "timeout": true}).to_string();
            }

            tokio::time::sleep(poll_interval).await;
        }
    }
}
