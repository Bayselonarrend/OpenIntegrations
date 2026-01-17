use serde::{Deserialize, Serialize};
use serde_json::json;

#[derive(Deserialize,Serialize,Clone)]
pub struct TlsSettings{
    pub use_tls: bool,
    pub accept_invalid_certs: bool,
    pub ca_cert_path: String,
}

impl TlsSettings {
    pub fn new(use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> Self {
        TlsSettings{
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
        }
    }

    pub fn from_json(json_str: &str) -> Result<Self, String> {
        serde_json::from_str(json_str)
            .map_err(|e| format!("Failed to parse TLS setting: {}", e))
    }

    pub fn enabled(&self) -> bool {
        self.use_tls
    }

    pub fn get_settings(&self) -> String{
        json!({"use_tls": self.use_tls, "ca_cert_path": self.ca_cert_path, "accept_invalid_certs": self.accept_invalid_certs}).to_string()
    }

}