use super::ServerState;
use tokio::io::AsyncWriteExt;
use common_utils::utils::{json_error, json_success};

impl ServerState {
    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        let mut conns = self.lock_connections();
        
        if let Some(conn) = conns.get_mut(connection_id) {
            if let Some(ref mut write_half) = conn.write_half {
                match write_half.write_all(&message).await {
                    Ok(_) => {

                        match write_half.flush().await {
                            Ok(_) => json_success(),
                            Err(e) => {
                                drop(conns);
                                self.remove_connection(connection_id);
                                json_error(&format!("Failed to flush message: {}", e))
                            }
                        }
                    }
                    Err(e) => {
                        drop(conns);
                        self.remove_connection(connection_id);
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
