use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};

/// Generic backend that manages async runtime in a separate thread
/// and processes commands via mpsc channel
pub struct Backend<C> {
    tx: Sender<C>,
    thread_handle: Option<JoinHandle<()>>,
}

impl<C: Send + 'static> Backend<C> {
    /// Create new backend with custom command handler
    /// 
    /// # Arguments
    /// * `thread_name` - Name for the backend thread
    /// * `handler` - Function that processes commands in the tokio runtime
    pub fn new<F>(thread_name: String, handler: F) -> Self
    where
        F: FnOnce(tokio::runtime::Runtime, mpsc::Receiver<C>) + Send + 'static,
    {
        let (tx, rx) = mpsc::channel::<C>();

        let thread_handle = thread::Builder::new()
            .name(thread_name)
            .spawn(move || {
                let rt = match tokio::runtime::Runtime::new() {
                    Ok(runtime) => runtime,
                    Err(e) => {
                        eprintln!("Failed to create tokio runtime: {}", e);
                        return;
                    }
                };

                handler(rt, rx);
            })
            .expect("Failed to spawn backend thread");

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }

    /// Send command to backend
    pub fn send(&self, cmd: C) -> Result<(), String> {
        self.tx.send(cmd)
            .map_err(|e| format!("Failed to send command: {}", e))
    }

    /// Get sender clone for command channel
    pub fn sender(&self) -> Sender<C> {
        self.tx.clone()
    }

    /// Shutdown backend and wait for thread to finish
    pub fn shutdown(&mut self) {
        drop(self.tx.clone()); // Close channel
        if let Some(handle) = self.thread_handle.take() {
            let _ = handle.join();
        }
    }
}
