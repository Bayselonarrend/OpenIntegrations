use serde::{Deserialize, Serialize};

#[derive(Deserialize,Serialize,Clone)]
pub struct FtpSettings {
    pub domain: String,
    pub port: u16,
    pub passive: bool,
    pub read_timeout: u64,
    pub write_timeout: u64,
    pub login: Option<String>,
    pub password: Option<String>,
}

#[derive(Deserialize,Serialize,Clone)]
pub struct FtpProxySettings {
    pub server: String,
    pub port: u16,
    pub proxy_type: String, // "http", "socks4", "socks5"
    pub login: Option<String>,
    pub password: Option<String>,
}

#[derive(Deserialize,Serialize,Clone)]
pub struct FtpTlsSettings {
    pub use_tls: bool,
    pub accept_invalid_certs: bool,
    pub ca_cert_path: Option<String>,
}
