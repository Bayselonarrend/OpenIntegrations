use super::ServerState;
use tokio::io::AsyncWriteExt;
use common_utils::utils::{json_error, json_success};

impl ServerState {
    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        let mut conns = self.lock_connections();
        
        if let Some(conn) = conns.get_mut(connection_id) {
            if let Some(ref mut write_half) = conn.write_half {
                self.log(&format!("Sending {} bytes to connection {}", message.len(), connection_id));
                
                match write_half.write_all(&message).await {
                    Ok(_) => {
                        match write_half.flush().await {
                            Ok(_) => {
                                self.log(&format!("Message sent successfully to {}", connection_id));
                                json_success()
                            },
                            Err(e) => {
                                self.log(&format!("Failed to flush message to {}: {}", connection_id, e));
                                drop(conns);
                                self.remove_connection(connection_id);
                                json_error(&format!("Failed to flush message: {}", e))
                            }
                        }
                    }
                    Err(e) => {
                        self.log(&format!("Failed to send message to {}: {}", connection_id, e));
                        drop(conns);
                        self.remove_connection(connection_id);
                        json_error(&format!("Failed to send message: {}", e))
                    }
                }
            } else {
                self.log(&format!("Attempt to write to closed write half: {}", connection_id));
                json_error("Write half is closed")
            }
        } else {
            self.log(&format!("Attempt to send message to non-existent connection: {}", connection_id));
            json_error("Connection not found")
        }
    }
}
