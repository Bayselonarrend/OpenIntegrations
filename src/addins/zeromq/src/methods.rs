use common_binary::vault::BinaryInput;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::ExchangeScheme;
use crate::AddIn;

impl AddIn {
    pub fn connect_req(&mut self, endpoint: &str) -> String {
        let ep = endpoint.trim().to_owned();
        match self
            .lock_backend()
            .and_then(|g| g.connect(ExchangeScheme::ReqRep, &ep))
        {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn connect_sub(&mut self, endpoint: &str) -> String {
        let ep = endpoint.trim().to_owned();
        match self
            .lock_backend()
            .and_then(|g| g.connect(ExchangeScheme::PubSub, &ep))
        {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn bind_rep(&mut self, endpoint: &str) -> String {
        let ep = endpoint.trim().to_owned();
        match self.lock_backend().and_then(|g| g.bind(ExchangeScheme::ReqRep, &ep)) {
            Ok(bound_display) => json!({"result": true, "endpoint": bound_display}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn bind_pub(&mut self, endpoint: &str) -> String {
        let ep = endpoint.trim().to_owned();
        match self.lock_backend().and_then(|g| g.bind(ExchangeScheme::PubSub, &ep)) {
            Ok(bound_display) => json!({"result": true, "endpoint": bound_display}).to_string(),
            Err(e) => json_error(&e),
        }
    }

    pub fn subscribe(&mut self, prefix: &str) -> String {
        match self.lock_backend().and_then(|g| g.subscribe(prefix)) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn send(&mut self, data: Vec<u8>, _flags: i32) -> String {
        match self.lock_backend().and_then(|g| g.send_payload(data)) {
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
