use serde::{Deserialize, Serialize};
use common_janx::{FromJanx, JanxValue};

#[derive(Deserialize, Serialize, Clone)]
pub struct ProxySettings {
    pub server: String,
    pub port: u16,
    pub proxy_type: String, // "http", "socks4", "socks5"
    pub login: Option<String>,
    pub password: Option<String>,
}

impl ProxySettings {
    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        let server = value
            .get("server")
            .and_then(String::from_janx)
            .ok_or_else(|| "Proxy field 'server' is required".to_string())?;
        let port = value
            .get("port")
            .and_then(i64::from_janx)
            .ok_or_else(|| "Proxy field 'port' is required".to_string())? as u16;
        let proxy_type = value
            .get("proxy_type")
            .and_then(String::from_janx)
            .ok_or_else(|| "Proxy field 'proxy_type' is required".to_string())?;

        let login = value.get("login").and_then(String::from_janx);
        let password = value.get("password").and_then(String::from_janx);

        Ok(Self {
            server,
            port,
            proxy_type,
            login,
            password,
        })
    }
}
