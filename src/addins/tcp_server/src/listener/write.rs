use super::ServerState;
use common_janx::JanxValue;
use common_utils::utils::{janx_error, janx_success, lock_unpoisoned};
use tokio::io::AsyncWriteExt;

impl ServerState {
    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> JanxValue {
        self.log(&format!("Sending {} bytes to connection {}", message.len(), connection_id));

        let write_result = {
            let connections_arc = self.manager.connections_arc();
            let mut conns = lock_unpoisoned(&connections_arc);

            if let Some(conn) = conns.get_mut(connection_id) {
                if let Some(ref mut write_half) = conn.write_half {
                    match write_half.write_all(&message).await {
                        Ok(_) => {
                            match write_half.flush().await {
                                Ok(_) => Ok(()),
                                Err(e) => Err(format!("Failed to flush message: {}", e)),
                            }
                        }
                        Err(e) => Err(format!("Failed to send message: {}", e)),
                    }
                } else {
                    Err("Write half is closed".to_string())
                }
            } else {
                Err("Connection not found".to_string())
            }
        };

        match write_result {
            Ok(_) => {
                self.log(&format!("Message sent successfully to {}", connection_id));
                janx_success(None, None)
            }
            Err(e) => {
                self.log(&format!("Failed to send message to {}: {}", connection_id, e));
                self.manager.remove(connection_id);
                janx_error(&e)
            }
        }
    }
}
