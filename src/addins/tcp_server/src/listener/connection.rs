use super::ServerState;
use tokio::io::AsyncWriteExt;
use serde_json::json;
use common_utils::utils::{json_error, json_success};

impl ServerState {

    pub async fn close_all_connections(&mut self) -> String {
        use tokio::io::AsyncWriteExt;
        
        for entry in self.connections.iter() {
            let conn_id = entry.key().clone();
            drop(entry);
            
            if let Some((_, mut conn)) = self.connections.remove(&conn_id) {
                let _ = conn.stream.shutdown().await;
            }
        }
        
        self.last_processed = None;
        json_success()
    }

    pub async fn close_connection(&mut self, connection_id: &str) -> String {
        if let Some((_, mut conn)) = self.connections.remove(connection_id) {
            if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                self.last_processed = None;
            }
            let _ = conn.stream.shutdown().await;
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_read(&mut self, connection_id: &str) -> String {
        if let Some(conn) = self.connections.get_mut(connection_id) {
            match conn.stream.try_read(&mut []) {
                Ok(_) | Err(_) => json_success(),
            }
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_write(&mut self, connection_id: &str) -> String {
        if let Some(conn) = self.connections.get_mut(connection_id) {
            match conn.stream.try_write(&[]) {
                Ok(_) | Err(_) => json_success(),
            }
        } else {
            json_error("Connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> String {
        let mut connections_list = Vec::new();
        let mut to_remove = Vec::new();

        for mut entry in self.connections.iter_mut() {
            let conn_id = entry.key().clone();
            let conn_info = entry.value_mut();

            let active = Self::check_connection_active(&mut conn_info.stream);

            if !active {
                to_remove.push(conn_id.clone());
            } else {
                connections_list.push(json!({
                    "connectionId": conn_id,
                    "address": conn_info.addr,
                    "active": active
                }));
            }
        }

        for conn_id in &to_remove {
            self.connections.remove(conn_id);
            if self.last_processed.as_ref() == Some(conn_id) {
                self.last_processed = None;
            }
        }

        json!({
            "result": true,
            "connections": connections_list
        })
        .to_string()
    }
}
