use std::time::Duration;
use common_binary::vault::{BinaryVault, BinaryInput};
use serde_json::json;

/// Helper for message handling with timeout and vault storage
pub struct MessageHandler {
    vault: BinaryVault,
}

impl MessageHandler {
    pub fn new(vault: BinaryVault) -> Self {
        Self { vault }
    }

    /// Store message in vault and return key
    pub fn store_message(&self, message: Vec<u8>) -> Result<String, String> {
        self.vault.store(BinaryInput::Bytes(message))
            .map_err(|e| format!("Failed to store message in vault: {}", e))
    }

    /// Retrieve message from vault
    pub fn retrieve_message(&self, key: &str) -> Result<Vec<u8>, String> {
        self.vault.retrieve(&key.to_string())
            .map_err(|e| format!("Failed to retrieve message from vault: {}", e))
    }

    /// Create success response with message stored in vault
    pub fn success_response(
        &self,
        connection_id: String,
        message: Vec<u8>,
        address: String,
        active: bool,
    ) -> String {
        match self.store_message(message) {
            Ok(vault_key) => json!({
                "result": true,
                "connectionId": connection_id,
                "message": vault_key,
                "active": active,
                "address": address
            }).to_string(),
            Err(e) => json!({
                "result": false,
                "error": e
            }).to_string(),
        }
    }

    /// Create timeout response
    pub fn timeout_response() -> String {
        json!({
            "result": false,
            "error": "timeout"
        }).to_string()
    }

    /// Create error response
    pub fn error_response(error: &str) -> String {
        json!({
            "result": false,
            "error": error
        }).to_string()
    }

    /// Get vault reference
    pub fn vault(&self) -> &BinaryVault {
        &self.vault
    }
}

/// Async wait helper with polling
pub struct AsyncWaiter {
    timeout: Duration,
    poll_interval: Duration,
}

impl AsyncWaiter {
    pub fn new(timeout_ms: u64) -> Self {
        Self {
            timeout: Duration::from_millis(timeout_ms),
            poll_interval: Duration::from_millis(10),
        }
    }

    pub fn with_poll_interval(mut self, interval_ms: u64) -> Self {
        self.poll_interval = Duration::from_millis(interval_ms);
        self
    }

    /// Wait for result with timeout and polling
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
