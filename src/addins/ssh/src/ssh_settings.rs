use common_core::{FromJanx, JanxValue};
use common_tcp::proxy_settings::ProxySettings;

#[derive(Debug, Clone)]
pub enum SshAuthTypes{
    Password,
    PrivateKey,
    Agent,
    KeyboardInteractive
}

#[derive(Debug, Clone)]
pub struct SshSettings {
    pub host: String,
    pub port: u16,
    pub auth_type: SshAuthTypes,
    pub username: String,
    pub password: Option<String>,
    pub key_path: Option<String>,
    pub pub_path: Option<String>,
    pub passphrase: Option<String>,
    pub keyboard_responses: Option<Vec<String>>,
}

#[derive(Clone)]
pub struct SshConf {
    pub set: Option<SshSettings>,
    pub proxy: Option<ProxySettings>
}

impl SshConf {
    pub fn new() -> SshConf {
        SshConf {
            set: None,
            proxy: None,
        }
    }

    pub fn set_settings(&mut self, settings: &JanxValue) -> Result<(), String> {
        match SshSettings::from_janx(settings){
            Some(settings) => Ok(self.set = Some(settings)),
            None => Err("Invalid SSH settings Janx payload".to_string()),
        }
    }

    pub fn set_proxy(&mut self, proxy: &JanxValue) -> Result<(), String> {
        match ProxySettings::from_janx(proxy){
            Ok(proxy) => Ok(self.proxy = Some(proxy)),
            Err(e) => Err(e)
        }
    }
}

impl FromJanx for SshAuthTypes {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        match String::from_janx(value)?.to_lowercase().as_str() {
            "password" => Some(Self::Password),
            "private_key" => Some(Self::PrivateKey),
            "agent" => Some(Self::Agent),
            "keyboard_interactive" => Some(Self::KeyboardInteractive),
            _ => None,
        }
    }
}

impl FromJanx for SshSettings {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        let keyboard_responses = value
            .get("keyboard_responses")
            .and_then(|v| v.as_array())
            .map(|arr| arr.iter().filter_map(String::from_janx).collect::<Vec<String>>());

        Some(Self {
            host: value.get("host").and_then(String::from_janx)?,
            port: value.get("port").and_then(i64::from_janx)? as u16,
            auth_type: value.get("auth_type").and_then(SshAuthTypes::from_janx)?,
            username: value.get("username").and_then(String::from_janx)?,
            password: value.get("password").and_then(String::from_janx),
            key_path: value.get("key_path").and_then(String::from_janx),
            pub_path: value.get("pub_path").and_then(String::from_janx),
            passphrase: value.get("passphrase").and_then(String::from_janx),
            keyboard_responses,
        })
    }
}
