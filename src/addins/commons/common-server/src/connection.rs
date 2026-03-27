use std::sync::{Arc, Mutex};
use indexmap::IndexMap;
use uuid::Uuid;
use tokio::sync::broadcast;
use common_logs::{Logger, log};

pub type ConnectionId = String;

/// Generic connection manager with round-robin message processing
pub struct ConnectionManager<T> {
    connections: Arc<Mutex<IndexMap<ConnectionId, T>>>,
    last_processed: Option<ConnectionId>,
    queue_size: usize,
    shutdown_tx: broadcast::Sender<()>,
    logger: Option<Arc<Logger>>,
}

impl<T> ConnectionManager<T> {
    pub fn new(queue_size: usize, logger: Option<Arc<Logger>>) -> Self {
        let (shutdown_tx, _) = broadcast::channel(1);
        
        Self {
            connections: Arc::new(Mutex::new(IndexMap::new())),
            last_processed: None,
            queue_size,
            shutdown_tx,
            logger,
        }
    }

    /// Generate new unique connection ID
    pub fn generate_id() -> ConnectionId {
        Uuid::new_v4().to_string()
    }

    /// Add new connection, removing oldest if queue is full
    pub fn add(&mut self, id: ConnectionId, connection: T) -> Option<ConnectionId> {
        let mut conns = self.lock_connections();
        
        let removed = if conns.len() >= self.queue_size {
            conns.shift_remove_index(0).map(|(old_id, _)| {
                self.log(&format!("Queue full, removed oldest connection: {}", old_id));
                old_id
            })
        } else {
            None
        };

        conns.insert(id.clone(), connection);
        self.log(&format!("Connection added: {}", id));
        
        removed
    }

    /// Remove connection by ID
    pub fn remove(&mut self, id: &str) -> bool {
        let mut conns = self.lock_connections();
        let removed = conns.shift_remove(id).is_some();
        drop(conns);
        
        if removed {
            self.log(&format!("Connection removed: {}", id));
            if self.last_processed.as_ref() == Some(&id.to_string()) {
                self.last_processed = None;
            }
        }
        
        removed
    }

    /// Get mutable reference to connection
    pub fn get_mut<F, R>(&mut self, id: &str, f: F) -> Option<R>
    where
        F: FnOnce(&mut T) -> R,
    {
        let mut conns = self.lock_connections();
        conns.get_mut(id).map(f)
    }

    /// Get all connection IDs
    pub fn get_ids(&self) -> Vec<ConnectionId> {
        let conns = self.lock_connections();
        conns.keys().cloned().collect()
    }

    /// Get connection IDs in round-robin order starting from last processed
    pub fn get_ids_round_robin(&self) -> Vec<ConnectionId> {
        let conns = self.lock_connections();
        let mut all_ids: Vec<ConnectionId> = conns.keys().cloned().collect();
        
        if let Some(ref last_id) = self.last_processed {
            if let Some(pos) = all_ids.iter().position(|id| id == last_id) {
                all_ids.rotate_left(pos + 1);
            }
        }
        
        all_ids
    }

    /// Update last processed connection
    pub fn set_last_processed(&mut self, id: Option<ConnectionId>) {
        self.last_processed = id;
    }

    /// Get connection count
    pub fn len(&self) -> usize {
        let conns = self.lock_connections();
        conns.len()
    }

    /// Check if empty
    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }

    /// Clear all connections
    pub fn clear(&mut self) {
        let mut conns = self.lock_connections();
        let count = conns.len();
        conns.clear();
        drop(conns);
        
        self.last_processed = None;
        self.log(&format!("Cleared all connections ({})", count));
    }

    /// Iterate over connections with mutable access
    pub fn iter_mut<F>(&mut self, mut f: F)
    where
        F: FnMut(&ConnectionId, &mut T),
    {
        let mut conns = self.lock_connections();
        for (id, conn) in conns.iter_mut() {
            f(id, conn);
        }
    }

    /// Filter and remove connections based on predicate
    pub fn retain<F>(&mut self, mut predicate: F) -> Vec<ConnectionId>
    where
        F: FnMut(&ConnectionId, &mut T) -> bool,
    {
        let mut conns = self.lock_connections();
        let mut removed = Vec::new();
        
        conns.retain(|id, conn| {
            if predicate(id, conn) {
                true
            } else {
                removed.push(id.clone());
                false
            }
        });
        
        drop(conns);
        
        if !removed.is_empty() {
            self.log(&format!("Removed {} connections", removed.len()));
            
            for id in &removed {
                if self.last_processed.as_ref() == Some(id) {
                    self.last_processed = None;
                    break;
                }
            }
        }
        
        removed
    }

    /// Get shutdown receiver for graceful shutdown
    pub fn subscribe_shutdown(&self) -> broadcast::Receiver<()> {
        self.shutdown_tx.subscribe()
    }

    /// Send shutdown signal
    pub fn shutdown(&self) {
        let _ = self.shutdown_tx.send(());
    }

    /// Get connections Arc for sharing
    pub fn connections_arc(&self) -> Arc<Mutex<IndexMap<ConnectionId, T>>> {
        self.connections.clone()
    }

    fn lock_connections(&self) -> std::sync::MutexGuard<'_, IndexMap<ConnectionId, T>> {
        self.connections.lock().unwrap_or_else(|poisoned| poisoned.into_inner())
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }
}

/// Generic connection info that can be extended
pub trait ConnectionInfo {
    fn address(&self) -> &str;
    fn is_active(&self) -> bool;
}
