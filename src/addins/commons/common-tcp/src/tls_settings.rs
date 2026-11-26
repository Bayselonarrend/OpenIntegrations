use common_janx::{janx, FromJanx, JanxValue};
use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize, Clone, Default)]
pub struct TlsSettings {
    pub use_tls: bool,
    pub accept_invalid_certs: bool,
    pub ca_cert_path: String,
    /// PEM клиентского ключа. Пусто, если mTLS не используется.
    /// В `get_settings` не попадает: это секрет, его отдают только на соединение.
    #[serde(default)]
    pub client_key: Vec<u8>,
    /// PEM всей цепочки клиентского сертификата: лист, затем промежуточные.
    #[serde(default)]
    pub client_cert_chain: Vec<u8>,
    #[serde(default)]
    pub client_key_path: String,
    #[serde(default)]
    pub client_cert_path: String,
}

impl TlsSettings {
    pub fn new(use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> Self {
        TlsSettings {
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
            ..Self::default()
        }
    }

    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        let use_tls = value
            .get("use_tls")
            .and_then(bool::from_janx)
            .ok_or_else(|| "TLS field 'use_tls' is required".to_string())?;
        let accept_invalid_certs = value
            .get("accept_invalid_certs")
            .and_then(bool::from_janx)
            .unwrap_or(false);
        let ca_cert_path = value
            .get("ca_cert_path")
            .and_then(String::from_janx)
            .unwrap_or_default();
        let client_key = value
            .get("client_key")
            .and_then(Vec::<u8>::from_janx)
            .unwrap_or_default();
        let client_cert_chain = value
            .get("client_cert_chain")
            .and_then(Vec::<u8>::from_janx)
            .unwrap_or_default();
        let client_key_path = value
            .get("client_key_path")
            .and_then(String::from_janx)
            .unwrap_or_default();
        let client_cert_path = value
            .get("client_cert_path")
            .and_then(String::from_janx)
            .unwrap_or_default();

        Ok(Self {
            use_tls,
            accept_invalid_certs,
            ca_cert_path,
            client_key,
            client_cert_chain,
            client_key_path,
            client_cert_path,
        })
    }

    pub fn enabled(&self) -> bool {
        self.use_tls
    }

    pub fn get_settings(&self) -> JanxValue {
        janx!({
            "use_tls": self.use_tls,
            "ca_cert_path": self.ca_cert_path.clone(),
            "accept_invalid_certs": self.accept_invalid_certs,
            "client_key_path": self.client_key_path.clone(),
            "client_cert_path": self.client_cert_path.clone()
        })
    }
}
