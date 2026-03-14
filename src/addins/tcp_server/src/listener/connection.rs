use super::ServerState;
use serde_json::json;
use common_utils::utils::{json_error, json_success};

impl ServerState {

    pub async fn close_all_connections(&mut self) -> String {
        let conn_ids: Vec<String> = self.connections.iter().map(|e| e.key().clone()).collect();
        
        for conn_id in conn_ids {
            self.connections.remove(&conn_id);
        }
        
        self.last_processed = None;
        json_success()
    }

    pub async fn close_connection(&mut self, connection_id: &str) -> String {
        if self.connections.remove(connection_id).is_some() {
            if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                self.last_processed = None;
            }
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_read(&mut self, connection_id: &str) -> String {
        if let Some(mut conn) = self.connections.get_mut(connection_id) {
            conn.read_half = None; // Дропаем read half - отправляет FIN
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_write(&mut self, connection_id: &str) -> String {
        if let Some(mut conn) = self.connections.get_mut(connection_id) {
            conn.write_half = None; // Дропаем write half - отправляет FIN
            json_success()
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

            // Проверяем активность только если read_half существует
            let active = if let Some(ref mut read_half) = conn_info.read_half {
                Self::check_connection_active(read_half)
            } else {
                false
            };

            if !active {
                to_remove.push(conn_id.clone());
            } else {
                connections_list.push(json!({
                    "connectionId": conn_id,
                    "address": conn_info.addr,
                    "active": active,
                    "canRead": conn_info.read_half.is_some(),
                    "canWrite": conn_info.write_half.is_some()
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
