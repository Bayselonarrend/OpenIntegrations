use super::ServerState;
use serde_json::json;
use common_utils::utils::{json_error, json_success};

impl ServerState {

    pub async fn close_all_connections(&mut self) -> String {
        {
            let mut conns = self.lock_connections();
            conns.clear();
        }
        self.last_processed = None;
        json_success()
    }

    pub async fn close_connection(&mut self, connection_id: &str) -> String {
        let removed = {
            let mut conns = self.lock_connections();
            conns.shift_remove(connection_id).is_some()
        };
        
        if removed {
            if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                self.last_processed = None;
            }
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_read(&mut self, connection_id: &str) -> String {
        let mut conns = self.lock_connections();
        if let Some(conn) = conns.get_mut(connection_id) {
            conn.read_half = None;
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn shutdown_write(&mut self, connection_id: &str) -> String {
        let mut conns = self.lock_connections();
        if let Some(conn) = conns.get_mut(connection_id) {
            conn.write_half = None;
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> String {
        let mut conns = self.lock_connections();
        let mut connections_list = Vec::new();
        let mut to_remove = Vec::new();

        for (conn_id, conn_info) in conns.iter_mut() {

            let keep = if let Some(ref mut read_half) = conn_info.read_half {
                Self::check_connection_active(read_half)
            } else {
                false
            };

            if !keep {
                to_remove.push(conn_id.clone());
            } else {
                connections_list.push(json!({
                    "connectionId": conn_id,
                    "address": conn_info.addr,
                    "canRead": conn_info.read_half.is_some(),
                    "canWrite": conn_info.write_half.is_some()
                }));
            }
        }

        for conn_id in &to_remove {
            conns.shift_remove(conn_id);
        }
        drop(conns);

        for conn_id in &to_remove {
            if self.last_processed.as_ref() == Some(conn_id) {
                self.last_processed = None;
                break;
            }
        }

        json!({
            "result": true,
            "connections": connections_list
        })
            .to_string()
    }
}