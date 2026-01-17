use serde::{Serialize, Deserialize};

#[derive(Deserialize,Serialize,Clone)]
pub struct ProxySettings {
    pub server: String,
    pub port: u16,
    pub proxy_type: String, // "http", "socks4", "socks5"
    pub login: Option<String>,
    pub password: Option<String>,
}

impl ProxySettings {
    pub fn from_json(json_str: &str) -> Result<Self, String> {
        serde_json::from_str(json_str)
            .map_err(|e| format!("Failed to parse proxy setting: {}", e))
    }

}