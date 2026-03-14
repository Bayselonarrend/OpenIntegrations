mod connection;
mod helpers;
mod read;
mod write;

use std::sync::Arc;
use tokio::net::tcp::{OwnedReadHalf, OwnedWriteHalf};
use tokio::sync::broadcast;
use dashmap::DashMap;
use uuid::Uuid;
use common_binary::vault::BinaryVault;

pub struct ConnectionInfo {
    pub read_half: Option<OwnedReadHalf>,
    pub write_half: Option<OwnedWriteHalf>,
    pub addr: String,
}

pub struct ServerState {
    pub(crate) connections: Arc<DashMap<String, ConnectionInfo>>,
    #[allow(dead_code)]
    pub(crate) queue_size: usize,
    pub(crate) shutdown_tx: broadcast::Sender<()>,
    pub(crate) last_processed: Option<String>,
    pub(crate) vault: BinaryVault,
}

impl ServerState {
    pub async fn start(port: u16, queue_size: usize, vault: BinaryVault) -> Result<Self, String> {
        use tokio::net::TcpListener;
        
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

                                        connections_clone.remove(&old_id);
                                    }
                                }

                                let (read_half, write_half) = stream.into_split();

                                connections_clone.insert(
                                    connection_id,
                                    ConnectionInfo {
                                        read_half: Some(read_half),
                                        write_half: Some(write_half),
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
            vault,
        })
    }
}

impl Drop for ServerState {
    fn drop(&mut self) {
        let _ = self.shutdown_tx.send(());
        self.connections.clear();
    }
}
