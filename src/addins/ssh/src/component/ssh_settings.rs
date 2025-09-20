use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum SshAuthTypes{
    #[serde(rename = "password")]
    Password,
    #[serde(rename = "private_key")]
    PrivateKey,
    #[serde(rename = "agent")]
    Agent
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SshSettings {
    pub host: String,
    pub port: u16,
    pub auth_type: SshAuthTypes,
    pub username: String,
    pub password: Option<String>,
    pub key_path: Option<String>,
    pub passphrase: Option<String>,

}

#[derive(Deserialize,Serialize,Clone)]
pub struct SshProxy {
    pub server: String,
    pub port: u16,
    pub proxy_type: String, // "http", "socks4", "socks5"
    pub login: Option<String>,
    pub password: Option<String>,
}

#[derive(Deserialize,Serialize,Clone)]
pub struct SshConf {
    pub set: Option<SshSettings>,
    pub proxy: Option<SshProxy>
}

impl SshConf {
    pub fn new() -> SshConf {
        SshConf {
            set: None,
            proxy: None,
        }
    }

    pub fn set_settings(&mut self, settings: String) -> Result<(), String> {
        match serde_json::from_str::<SshSettings>(&settings){
            Ok(settings) => Ok(self.set = Some(settings)),
            Err(e) => Err(e.to_string())
        }
    }

    pub fn set_proxy(&mut self, proxy: String) -> Result<(), String> {
        match serde_json::from_str::<SshProxy>(&proxy){
            Ok(proxy) => Ok(self.proxy = Some(proxy)),
            Err(e) => Err(e.to_string())
        }
    }

}