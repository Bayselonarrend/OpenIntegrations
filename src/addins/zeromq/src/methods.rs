use common_binary::vault::BinaryInput;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::ExchangeScheme;
use crate::AddIn;

impl AddIn {
    pub(crate) fn connect(&mut self, scheme: ExchangeScheme, endpoint: &str) -> String {
        let ep = endpoint.trim().to_owned();
        match self.lock_backend().and_then(|g| g.connect(scheme, &ep)) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub(crate) fn bind(&mut self, scheme: ExchangeScheme, port: i32) -> String {
        let ep = format!("tcp://*:{}", port);
        match self.lock_backend().and_then(|g| g.bind(scheme, &ep)) {
            Ok(bound) => json!({"result": true, "endpoint": bound}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn subscribe(&mut self, prefix: &str) -> String {
        match self.lock_backend().and_then(|g| g.subscribe(prefix)) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> String {
        match self
            .lock_backend()
            .and_then(|g| g.send_payload(data, timeout_ms))
        {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn recv(&mut self, timeout_ms: i32) -> String {
        match self.lock_backend().and_then(|g| g.recv_payload(timeout_ms)) {
            Ok(buf) => {
                let len = buf.len();
                match self.vault.store(BinaryInput::Bytes(buf)) {
                    Ok(key) => json!({
                        "result": true,
                        "data": key,
                        "size": len
                    })
                    .to_string(),
                    Err(e) => json_error(format!("Failed to store message in vault: {}", e)),
                }
            }
            Err(e) => json_error(&e),
        }
    }

    pub fn close(&mut self) -> String {
        match self.lock_backend().and_then(|g| g.close_socket()) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }
}
