use std::sync::Arc;
use std::time::Duration;
use tokio::net::{TcpListener, TcpStream};
use tokio::io::AsyncWriteExt;
use tokio::sync::broadcast;
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
    shutdown_tx: broadcast::Sender<()>,
    last_processed: Option<String>,
}

impl ServerState {
    pub async fn start(port: u16, queue_size: usize) -> Result<Self, String> {
        let listener = TcpListener::bind(format!("0.0.0.0:{}", port))
            .await
            .map_err(|e| format!("Failed to bind to port {}: {}", port, e))?;

        let connections: Arc<DashMap<String, ConnectionInfo>> = Arc::new(DashMap::new());
        let connections_clone = connections.clone();
        
        let (shutdown_tx, mut shutdown_rx) = broadcast::channel(1);

        tokio::spawn(async move {
            loop {
                tokio::select! {
                    result = listener.accept() => {
                        match result {
                            Ok((stream, addr)) => {
                                let connection_id = Uuid::new_v4().to_string();

                                if connections_clone.len() >= queue_size {
                                    if let Some(entry) = connections_clone.iter().next() {
                                        let old_id = entry.key().clone();
                                        drop(entry);

                                        if let Some((_, mut old_conn)) = connections_clone.remove(&old_id) {
                                            let _ = old_conn.stream.shutdown().await;
                                        }
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
                    _ = shutdown_rx.recv() => {
                        break;
                    }
                }
            }
        });

        Ok(ServerState {
            connections,
            queue_size,
            shutdown_tx,
            last_processed: None,
        })
    }

    pub async fn get_next_message(&mut self, timeout_ms: u64) -> String {
        let start = std::time::Instant::now();
        let timeout = Duration::from_millis(timeout_ms);
        let poll_interval = Duration::from_millis(10);

        loop {
            let mut to_remove = Vec::new();
            let start_id = self.last_processed.clone();

            let mut all_ids: Vec<String> = self.connections.iter().map(|e| e.key().clone()).collect();

            if let Some(ref last_id) = start_id {
                if let Some(pos) = all_ids.iter().position(|id| id == last_id) {
                    all_ids.rotate_left(pos + 1);
                }
            }

            for conn_id in all_ids {
                if let Some(mut entry) = self.connections.get_mut(&conn_id) {
                    let mut buffer = vec![0u8; 8192];
                    match entry.stream.try_read(&mut buffer) {

                        Ok(0) => {
                            to_remove.push(conn_id.clone());
                        }
                        Ok(n) => {
                            let message = buffer[..n].to_vec();
                            let addr = entry.addr.clone();

                            let still_active = Self::check_connection_active(&mut entry.stream);

                            if !still_active {
                                to_remove.push(conn_id.clone());
                                self.last_processed = None;
                            } else {
                                self.last_processed = Some(conn_id.clone());
                            }

                            for id in to_remove {
                                self.connections.remove(&id);
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
                        Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                        }
                        Err(_) => {
                            to_remove.push(conn_id.clone());
                        }
                    }
                }
            }

            for conn_id in &to_remove {
                self.connections.remove(conn_id);
                if self.last_processed.as_ref() == Some(conn_id) {
                    self.last_processed = None;
                }
            }

            if start.elapsed() >= timeout {
                return json!({"result": true, "timeout": true}).to_string();
            }

            tokio::time::sleep(poll_interval).await;
        }
    }

    pub async fn send_message(&mut self, connection_id: &str, message: Vec<u8>) -> String {
        if let Some(mut conn) = self.connections.get_mut(connection_id) {
            match conn.stream.write_all(&message).await {
                Ok(_) => json_success(),
                Err(e) => {
                    drop(conn);
                    self.connections.remove(connection_id);

                    if self.last_processed.as_ref() == Some(&connection_id.to_string()) {
                        self.last_processed = None;
                    }
                    json_error(&format!("Failed to send message: {}", e))
                }
            }
        } else {
            json_error("Connection not found")
        }
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

    pub async fn close_all_connections(&mut self) -> String {
        let conn_ids: Vec<String> = self.connections.iter().map(|e| e.key().clone()).collect();
        
        for conn_id in conn_ids {
            if let Some((_, mut conn)) = self.connections.remove(&conn_id) {
                let _ = conn.stream.shutdown().await;
            }
        }
        
        json_success()
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

        for conn_id in &to_remove {
            self.connections.remove(conn_id);
            // Сбрасываем last_processed если удаляем это соединение
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

    fn check_connection_active(stream: &mut TcpStream) -> bool {
        match stream.try_read(&mut []) {
            Ok(0) => false,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => true, // Нет данных - активно
            _ => true,
        }
    }
}

impl Drop for ServerState {
    fn drop(&mut self) {

        let _ = self.shutdown_tx.send(());

        let conn_ids: Vec<String> = self.connections.iter().map(|e| e.key().clone()).collect();
        
        for conn_id in conn_ids {
            if let Some((_, conn)) = self.connections.remove(&conn_id) {
                drop(conn);
            }
        }
    }
}
