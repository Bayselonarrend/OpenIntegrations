use common_backend::BackendThread;

/// Generic backend that manages async runtime in a separate thread
/// and processes commands via mpsc channel.
pub struct Backend<C: Send + 'static> {
    thread: BackendThread<C>,
}

impl<C: Send + 'static> Backend<C> {
    /// Create new backend with custom command handler.
    pub fn new<F>(thread_name: impl AsRef<str>, handler: F) -> Self
    where
        F: FnOnce(tokio::runtime::Runtime, std::sync::mpsc::Receiver<C>) + Send + 'static,
    {
        let thread = BackendThread::spawn(thread_name, handler)
            .expect("failed to start backend thread");
        Self { thread }
    }

    /// Send command to backend.
    pub fn send(&self, cmd: C) -> Result<(), String> {
        self.thread.send(cmd)
    }

    /// Shutdown backend and wait for thread to finish.
    pub fn shutdown(&mut self) {
        let _ = self.thread.shutdown(None);
    }
}

impl<C: Send + 'static> Drop for Backend<C> {
    fn drop(&mut self) {
        self.shutdown();
    }
}
