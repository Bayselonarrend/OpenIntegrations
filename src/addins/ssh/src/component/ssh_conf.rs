use std::path::PathBuf;
use serde_json::{json, Value};
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
pub struct SshConf{
    pub host: String,
    pub port: i64,
    pub auth_type: SshAuthTypes,
    pub username: String,
    pub password: Option<String>,
    pub key_path: Option<String>,
    pub passphrase: Option<String>,

}

impl SshConf {
    pub fn from_sting(conf: &str) -> Result<SshConf, String> {
        serde_json::from_str(conf).unwrap_or_else(|e| Err(e.to_string()))
    }

    pub fn to_string(&self) -> String {
        json!({"result": true, "data": &self}).to_string()
    }
}