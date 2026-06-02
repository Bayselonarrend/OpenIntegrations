use common_janx::{FromJanx, JanxValue};
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
    pub advanced_resolve: bool
}

impl FromJanx for FtpSettings {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        Some(Self {
            domain: value.get("domain").and_then(String::from_janx)?,
            port: value.get("port").and_then(i64::from_janx)? as u16,
            passive: value
                .get("passive")
                .and_then(bool::from_janx)
                .unwrap_or(true),
            read_timeout: value
                .get("read_timeout")
                .and_then(i64::from_janx)
                .unwrap_or(30000) as u64,
            write_timeout: value
                .get("write_timeout")
                .and_then(i64::from_janx)
                .unwrap_or(30000) as u64,
            login: value.get("login").and_then(String::from_janx),
            password: value.get("password").and_then(String::from_janx),
            advanced_resolve: value
                .get("advanced_resolve")
                .and_then(bool::from_janx)
                .unwrap_or(false),
        })
    }
}
