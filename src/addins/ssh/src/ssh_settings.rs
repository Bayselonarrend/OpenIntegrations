use std::cell::RefCell;
use serde::{Deserialize, Serialize};
use common_tcp::proxy_settings::ProxySettings;
use ssh2::KeyboardInteractivePrompt;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum SshAuthTypes{
    #[serde(rename = "password")]
    Password,
    #[serde(rename = "private_key")]
    PrivateKey,
    #[serde(rename = "agent")]
    Agent,
    #[serde(rename = "keyboard_interactive")]
    KeyboardInteractive
}

#[derive(Debug, Clone, Serialize, Deserialize)]
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

#[derive(Deserialize,Serialize,Clone)]
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

    pub fn set_settings(&mut self, settings: String) -> Result<(), String> {
        match serde_json::from_str::<SshSettings>(&settings){
            Ok(settings) => Ok(self.set = Some(settings)),
            Err(e) => Err(e.to_string())
        }
    }

    pub fn set_proxy(&mut self, proxy: String) -> Result<(), String> {
        match serde_json::from_str::<ProxySettings>(&proxy){
            Ok(proxy) => Ok(self.proxy = Some(proxy)),
            Err(e) => Err(e.to_string())
        }
    }
}

pub struct KeyboardInteractiveHandler {
    pub(crate) responses: Vec<String>,
    pub(crate) index: RefCell<usize>,
}

impl KeyboardInteractivePrompt for KeyboardInteractiveHandler {
    fn prompt<'a>(
        &mut self,
        _username: &str,
        _instructions: &str,
        prompts: &[ssh2::Prompt<'a>],
    ) -> Vec<String> {
        let mut answers = Vec::new();
        let mut idx = self.index.borrow_mut();
        for _prompt in prompts {
            if *idx < self.responses.len() {
                answers.push(self.responses[*idx].clone());
                *idx += 1;
            } else {
                answers.push(String::new());
            }
        }
        answers
    }
}