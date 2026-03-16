mod connection;
mod helpers;
mod read;
mod write;

use std::sync::{Arc, Mutex};
use tokio::net::tcp::{OwnedReadHalf, OwnedWriteHalf};
use tokio::sync::broadcast;
use indexmap::IndexMap;
use uuid::Uuid;
use common_binary::vault::BinaryVault;

pub struct ConnectionInfo {
    pub read_half: Option<OwnedReadHalf>,
    pub write_half: Option<OwnedWriteHalf>,
    pub addr: String,
}

pub struct ServerState {
    pub(crate) connections: Arc<Mutex<IndexMap<String, ConnectionInfo>>>,
    #[allow(dead_code)]
    pub(crate) queue_size: usize,
    pub(crate) shutdown_tx: broadcast::Sender<()>,
    pub(crate) last_processed: Option<String>,
    pub(crate) vault: BinaryVault,
}

impl ServerState {
    fn lock_connections(&self) -> std::sync::MutexGuard<IndexMap<String, ConnectionInfo>> {
        self.connections.lock().unwrap_or_else(|poisoned| poisoned.into_inner())
    }

    pub async fn start(port: u16, queue_size: usize, vault: BinaryVault) -> Result<Self, String> {
        use tokio::net::TcpListener;
        
        let listener = TcpListener::bind(format!("0.0.0.0:{}", port))
            .await
            .map_err(|e| format!("Failed to bind to port {}: {}", port, e))?;

        let connections: Arc<Mutex<IndexMap<String, ConnectionInfo>>> = Arc::new(Mutex::new(IndexMap::new()));
        let connections_clone = connections.clone();
        
        let (shutdown_tx, mut shutdown_rx) = broadcast::channel(1);

        tokio::spawn(async move {
            loop {
                tokio::select! {
                    result = listener.accept() => {
                        match result {
                            Ok((stream, addr)) => {
                                let connection_id = Uuid::new_v4().to_string();

                                let mut conns = match connections_clone.lock() {
                                    Ok(guard) => guard,
                                    Err(poisoned) => poisoned.into_inner(),
                                };

                                if conns.len() >= queue_size {
                                    if let Some((old_id, _)) = conns.shift_remove_index(0) {
                                        drop(old_id);
                                    }
                                }

                                let (read_half, write_half) = stream.into_split();

                                conns.insert(
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
        {
            let mut conns = self.connections.lock()
                .unwrap_or_else(|poisoned| poisoned.into_inner());
            conns.clear();
        }
    }
}
