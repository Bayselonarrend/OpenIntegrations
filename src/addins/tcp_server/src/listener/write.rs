use super::ServerState;
use tokio::io::AsyncWriteExt;
use common_utils::utils::{json_error, json_success};

impl ServerState {
    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        let mut conns = self.connections.lock().unwrap();
        
        if let Some(conn) = conns.get_mut(connection_id) {
            if let Some(ref mut write_half) = conn.write_half {
                match write_half.write_all(&message).await {
                    Ok(_) => {
                        // Добавляем flush для немедленной отправки
                        match write_half.flush().await {
                            Ok(_) => json_success(),
                            Err(e) => {
                                drop(conns);
                                let mut conns = self.connections.lock().unwrap();
                                conns.shift_remove(connection_id);
                                if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                                    self.last_processed = None;
                                }
                                json_error(&format!("Failed to flush message: {}", e))
                            }
                        }
                    }
                    Err(e) => {
                        drop(conns);
                        let mut conns = self.connections.lock().unwrap();
                        conns.shift_remove(connection_id);
                        if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                            self.last_processed = None;
                        }
                        json_error(&format!("Failed to send message: {}", e))
                    }
                }
            } else {
                json_error("Write half is closed")
            }
        } else {
            json_error("Connection not found")
        }
    }
}
