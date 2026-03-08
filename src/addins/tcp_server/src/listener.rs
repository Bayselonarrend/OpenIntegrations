use std::sync::Arc;
use std::time::Duration;
use tokio::net::{TcpListener, TcpStream};
use tokio::io::AsyncWriteExt;
use dashmap::DashMap;
use serde_json::json;
use uuid::Uuid;
use common_utils::utils::{json_error, json_success};

pub struct ConnectionInfo {
    pub stream: TcpStream,
    pub addr: String,
}

pub struct ServerState {
    pub connections: Arc<DashMap<String, ConnectionInfo>>,
    pub queue_size: usize,
}

impl ServerState {
    pub async fn start(port: u16, queue_size: usize) -> Result<Self, String> {
        let listener = TcpListener::bind(format!("0.0.0.0:{}", port))
            .await
            .map_err(|e| format!("Failed to bind to port {}: {}", port, e))?;

        let connections: Arc<DashMap<String, ConnectionInfo>> = Arc::new(DashMap::new());
        let connections_clone = connections.clone();

        tokio::spawn(async move {
            loop {
                match listener.accept().await {
                    Ok((stream, addr)) => {
                        let connection_id = Uuid::new_v4().to_string();

                        // Удаляем старое соединение если очередь переполнена
                        if connections_clone.len() >= queue_size {
                            if let Some(entry) = connections_clone.iter().next() {
                                let old_id = entry.key().clone();
                                drop(entry);
                                connections_clone.remove(&old_id);
                            }
                        }

                        connections_clone.insert(
                            connection_id,
                            ConnectionInfo {
                                stream,
                                addr: addr.to_string(),
                            },
                        );
                    }
                    Err(e) => {
                        eprintln!("Failed to accept connection: {}", e);
                    }
                }
            }
        });

        Ok(ServerState {
            connections,
            queue_size,
        })
    }

    pub async fn get_next_message(&mut self, timeout_ms: u64) -> String {
        let mut to_remove = Vec::new();

        for mut entry in self.connections.iter_mut() {
            let conn_id = entry.key().clone();
            let conn_info = entry.value_mut();

            let mut buffer = vec![0u8; 8192];
            match conn_info.stream.try_read(&mut buffer) {
                Ok(0) => {
                    to_remove.push(conn_id);
                }
                Ok(n) => {
                    let message = buffer[..n].to_vec();
                    let addr = conn_info.addr.clone();

                    let still_active = Self::check_connection_active(&mut conn_info.stream);

                    if !still_active {
                        to_remove.push(conn_id.clone());
                    }

                    for conn_id in to_remove {
                        self.connections.remove(&conn_id);
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
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {}
                Err(_) => {
                    to_remove.push(conn_id);
                }
            }
        }

        for conn_id in to_remove {
            self.connections.remove(&conn_id);
        }

        tokio::time::sleep(Duration::from_millis(timeout_ms.min(100))).await;

        json!({"result": false, "error": "Timeout"}).to_string()
    }

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        if let Some(mut conn) = self.connections.get_mut(connection_id) {
            match conn.stream.write_all(&message).await {
                Ok(_) => json_success(),
                Err(e) => {
                    // При ошибке удаляем соединение
                    drop(conn);
                    self.connections.remove(connection_id);
                    json_error(&format!("Failed to send message: {}", e))
                }
            }
        } else {
            json_error("Connection not found")
        }
    }

    pub async fn close_connection(&mut self, connection_id: &str) -> String {
        if let Some((_, mut conn)) = self.connections.remove(connection_id) {
            let _ = conn.stream.shutdown().await;
            json_success()
        } else {
            json_error("Connection not found")
        }
    }

    pub fn remove_connection(&mut self, connection_id: &str) -> String {
        if self.connections.remove(connection_id).is_some() {
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
            }else {
                connections_list.push(json!({
                    "connectionId": conn_id,
                    "address": conn_info.addr,
                    "active": active
                }));
            }
        }

        for conn_id in to_remove {
            self.connections.remove(&conn_id);
        }

        json!({
            "result": true,
            "connections": connections_list
        })
        .to_string()
    }

    fn check_connection_active(stream: &mut TcpStream) -> bool {
        match stream.try_read(&mut []) {
            Ok(0) => false,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => true, // Нет данных - активно
            _ => true,
        }
    }
}
