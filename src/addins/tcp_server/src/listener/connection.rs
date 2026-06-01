use super::ServerState;
use common_janx::{janx, JanxValue};
use common_utils::utils::{janx_error, janx_success};

impl ServerState {

    pub async fn close_all_connections(&mut self) -> JanxValue {
        let count = self.manager.len();
        self.manager.clear();
        self.log(&format!("Closed all connections ({})", count));
        janx_success(None, None)
    }

    pub async fn close_connection(&mut self, connection_id: &str) -> JanxValue {
        let removed = self.manager.remove(connection_id);

        if removed {
            self.log(&format!("Connection closed: {}", connection_id));
            janx_success(None, None)
        } else {
            self.log(&format!("Attempt to close non-existent connection: {}", connection_id));
            janx_error("Connection not found")
        }
    }

    pub fn shutdown_read(&mut self, connection_id: &str) -> JanxValue {
        if let Some(()) = self.manager.get_mut(connection_id, |conn| {
            conn.read_half = None;
        }) {
            self.log(&format!("Read half shutdown for connection: {}", connection_id));
            janx_success(None, None)
        } else {
            janx_error("Connection not found")
        }
    }

    pub fn shutdown_write(&mut self, connection_id: &str) -> JanxValue {
        if let Some(()) = self.manager.get_mut(connection_id, |conn| {
            conn.write_half = None;
        }) {
            self.log(&format!("Write half shutdown for connection: {}", connection_id));
            janx_success(None, None)
        } else {
            janx_error("Connection not found")
        }
    }

    pub fn get_connections_list(&mut self) -> JanxValue {
        let mut connections_list = Vec::new();

        let removed = self.manager.retain(|conn_id, conn_info| {
            let keep = if let Some(ref mut read_half) = conn_info.read_half {
                Self::check_connection_active(read_half)
            } else {
                false
            };

            if keep {
                connections_list.push(janx!({
                    "connectionId": conn_id,
                    "address": conn_info.addr.clone(),
                    "canRead": conn_info.read_half.is_some(),
                    "canWrite": conn_info.write_half.is_some(),
                }));
            }

            keep
        });

        if !removed.is_empty() {
            self.log(&format!("Removed {} inactive connections", removed.len()));
        }

        janx!({
            "result": true,
            "connections": connections_list,
        })
    }
}
