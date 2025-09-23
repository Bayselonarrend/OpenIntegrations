use serde::{Serialize, Deserialize};

#[derive(Deserialize,Serialize,Clone)]
pub struct ProxySettings {
    pub server: String,
    pub port: u16,
    pub proxy_type: String, // "http", "socks4", "socks5"
    pub login: Option<String>,
    pub password: Option<String>,
}