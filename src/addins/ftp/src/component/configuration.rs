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
