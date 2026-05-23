use std::sync::{mpsc, Arc, Mutex};
use std::thread::{self, JoinHandle};

use crate::panic::catch_panic;

pub struct SyncBackendThread<C: Send + 'static> {
    tx: Option<mpsc::Sender<C>>,
    join: Option<JoinHandle<()>>,
    health: Arc<Mutex<Option<String>>>,
    thread_name: String,
}

impl<C: Send + 'static> SyncBackendThread<C> {
    pub fn spawn<F>(thread_name: impl AsRef<str>, handler: F) -> Result<Self, String>
    where
        F: FnOnce(mpsc::Receiver<C>) + Send + 'static,
    {
        let thread_name = thread_name.as_ref().to_string();
        let (cmd_tx, cmd_rx) = mpsc::channel();
        let health = Arc::new(Mutex::new(None));
        let health_worker = health.clone();

        let join = thread::Builder::new()
            .name(thread_name.clone())
            .spawn(move || {
                if let Err(message) = catch_panic(|| handler(cmd_rx)) {
                    if let Ok(mut guard) = health_worker.lock() {
                        *guard = Some(message);
                    }
                }
            })
            .map_err(|e| format!("Failed to spawn backend thread {}: {}", thread_name, e))?;

        Ok(Self {
            tx: Some(cmd_tx),
            join: Some(join),
            health,
            thread_name,
        })
    }

    fn fatal_error(&self) -> Option<String> {
        self.health.lock().ok().and_then(|g| g.clone())
    }

    fn ensure_alive(&self) -> Result<(), String> {
        if self.tx.is_none() {
            return Err("Backend is shut down".to_string());
        }
        if let Some(message) = self.fatal_error() {
            return Err(format!("Backend thread is not available: {}", message));
        }
        Ok(())
    }

    pub fn send(&self, cmd: C) -> Result<(), String> {
        self.ensure_alive()?;
        let tx = self
            .tx
            .as_ref()
            .ok_or_else(|| "Backend is shut down".to_string())?;
        tx.send(cmd).map_err(|e| {
            if let Some(message) = self.fatal_error() {
                format!("Failed to send command: {} ({})", e, message)
            } else {
                format!("Failed to send command: {}", e)
            }
        })
    }

    pub fn call<R, F>(&self, build: F) -> Result<R, String>
    where
        R: Send,
        F: FnOnce(mpsc::Sender<R>) -> C,
    {
        self.ensure_alive()?;
        let (response_tx, response_rx) = mpsc::channel();
        self.send(build(response_tx))?;
        response_rx.recv().map_err(|e| {
            if let Some(message) = self.fatal_error() {
                format!("Backend did not respond: {} ({})", e, message)
            } else {
                format!("Backend did not respond: {}", e)
            }
        })
    }

    pub fn shutdown(&mut self, shutdown_cmd: Option<C>) -> Result<(), String> {
        if let Some(cmd) = shutdown_cmd {
            if self.tx.is_some() {
                let _ = self.send(cmd);
            }
        }

        self.tx = None;

        if let Some(join) = self.join.take() {
            match join.join() {
                Ok(()) => {
                    if let Some(message) = self.fatal_error() {
                        Err(format!(
                            "Backend thread {} ended with error: {}",
                            self.thread_name, message
                        ))
                    } else {
                        Ok(())
                    }
                }
                Err(payload) => Err(format!(
                    "Backend thread {} panicked: {}",
                    self.thread_name,
                    crate::panic::extract_panic_message(&payload)
                )),
            }
        } else {
            Err(format!(
                "Backend thread {} was not started",
                self.thread_name
            ))
        }
    }
}

impl<C: Send + 'static> Drop for SyncBackendThread<C> {
    fn drop(&mut self) {
        let _ = self.shutdown(None);
    }
}
