use std::sync::{mpsc, Arc, Mutex};
use std::thread::{self, JoinHandle};
use std::time::Duration;

use crate::panic::catch_panic;

const STARTUP_TIMEOUT: Duration = Duration::from_secs(30);

/// Worker thread with tokio runtime and command channel.
pub struct BackendThread<C: Send + 'static> {
    tx: Option<mpsc::Sender<C>>,
    join: Option<JoinHandle<()>>,
    health: Arc<Mutex<Option<String>>>,
    thread_name: String,
}

impl<C: Send + 'static> BackendThread<C> {
    /// Starts a named thread, creates a tokio runtime, waits until the runtime is ready.
    pub fn spawn<F>(thread_name: impl AsRef<str>, handler: F) -> Result<Self, String>
    where
        F: FnOnce(tokio::runtime::Runtime, mpsc::Receiver<C>) + Send + 'static,
    {
        let thread_name = thread_name.as_ref().to_string();
        let (cmd_tx, cmd_rx) = mpsc::channel();
        let (ready_tx, ready_rx) = mpsc::sync_channel(1);
        let health = Arc::new(Mutex::new(None));
        let health_worker = health.clone();

        let join = thread::Builder::new()
            .name(thread_name.clone())
            .spawn(move || {
                let rt = match tokio::runtime::Runtime::new() {
                    Ok(rt) => rt,
                    Err(e) => {
                        let message =
                            format!("Failed to create tokio runtime: {}", e);
                        let _ = ready_tx.send(Err(message.clone()));
                        if let Ok(mut guard) = health_worker.lock() {
                            *guard = Some(message);
                        }
                        return;
                    }
                };

                let _ = ready_tx.send(Ok(()));

                if let Err(message) = catch_panic(|| handler(rt, cmd_rx)) {
                    if let Ok(mut guard) = health_worker.lock() {
                        *guard = Some(message);
                    }
                }
            })
            .map_err(|e| format!("Failed to spawn backend thread {}: {}", thread_name, e))?;

        match ready_rx.recv_timeout(STARTUP_TIMEOUT) {
            Ok(Ok(())) => Ok(Self {
                tx: Some(cmd_tx),
                join: Some(join),
                health,
                thread_name,
            }),
            Ok(Err(message)) => Err(message),
            Err(mpsc::RecvTimeoutError::Timeout) => Err(format!(
                "Backend thread {} startup timed out",
                thread_name
            )),
            Err(mpsc::RecvTimeoutError::Disconnected) => Err(format!(
                "Backend thread {} exited during startup",
                thread_name
            )),
        }
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

    /// Sends a command with a per-request response channel and waits for the result.
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

    /// Sends an optional shutdown command, drops the command sender, and joins the worker.
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

impl<C: Send + 'static> Drop for BackendThread<C> {
    fn drop(&mut self) {
        let _ = self.shutdown(None);
    }
}
