
pub struct AsyncWaiter {
    timeout: std::time::Duration,
    poll_interval: std::time::Duration,
}

impl AsyncWaiter {
    pub fn new(timeout_ms: u64) -> Self {
        Self {
            timeout: std::time::Duration::from_millis(timeout_ms),
            poll_interval: std::time::Duration::from_millis(10),
        }
    }

    pub fn with_poll_interval(mut self, interval_ms: u64) -> Self {
        self.poll_interval = std::time::Duration::from_millis(interval_ms);
        self
    }
    
    pub async fn wait_for<F, T>(&self, mut try_fn: F) -> Result<T, ()>
    where
        F: FnMut() -> Option<T>,
    {
        let start = std::time::Instant::now();

        loop {
            if let Some(result) = try_fn() {
                return Ok(result);
            }

            if start.elapsed() >= self.timeout {
                return Err(());
            }

            tokio::time::sleep(self.poll_interval).await;
        }
    }
}
