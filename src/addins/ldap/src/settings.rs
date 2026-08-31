use common_core::JanxValue;
use common_janx::janx;

#[derive(Clone)]
pub struct ConnectionSettings {
    pub url: String,
    pub bind_dn: String,
    pub password: String,
    pub timeout: i32,
}

impl ConnectionSettings {
    pub fn new(url: &str, bind_dn: &str, password: &str, timeout: i32) -> Self {
        Self {
            url: url.to_string(),
            bind_dn: bind_dn.to_string(),
            password: password.to_string(),
            timeout,
        }
    }

    pub fn to_janx(&self) -> JanxValue {
        janx!({
            "url": self.url.clone(),
            "bind_dn": self.bind_dn.clone(),
            "password": self.password.clone(),
            "timeout": self.timeout as i64,
        })
    }
}
