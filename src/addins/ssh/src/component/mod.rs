mod methods;
mod ssh_conf;

use addin1c::{name, Variant};
use serde_json::json;
use crate::core::getset;
use ssh2::Session;
use std::net::TcpStream;
use crate::component::ssh_conf::{SshConf, SshAuthTypes};

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {
        0 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.initialize(json_string))
        },
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    inner: Option<Session>,
    credentials: Option<SshConf>
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            inner: None,
            credentials: None,
        }
    }

    pub fn initialize(&mut self, conf: String) -> String {

        let conf_data = match SshConf::from_sting(conf.as_str()){
            Ok(conf_data) => conf_data,
            Err(e) => return format_json_error(&e)
        };

        self.credentials = Some(conf_data.clone());

        let tcp = match TcpStream::connect(format!("{}:{}", conf_data.host, conf_data.port)){
            Ok(tcp) => tcp,
            Err(e) => return format_json_error(&e.to_string())
        };

        let mut sess = match Session::new(){
            Ok(sess) => sess,
            Err(e) => return format_json_error(&e.to_string())
        };

        sess.set_tcp_stream(tcp);

        if let Err(e) = sess.handshake() {
            return e.to_string();
        };

        let username= &conf_data.username;
        let password = &conf_data.password.unwrap_or("".to_string());
        let passphrase = conf_data.passphrase;
        let key_path = &conf_data.key_path;

        let auth_success = match conf_data.auth_type {

            SshAuthTypes::Password => sess.userauth_password(username,password),
            SshAuthTypes::Agent => sess.userauth_agent(username),
            SshAuthTypes::PrivateKey => {
                let path = match key_path{
                    Some(key_path) => key_path.as_ref(),
                    None => return format_json_error("No key path provided with PK auth type")
                };
                sess.userauth_pubkey_file(username, None, path, passphrase.as_deref())
            },

        };

        if let Err(e) = auth_success{
            return format_json_error(&e.to_string());
        };

        if !sess.authenticated(){
            return format_json_error("Authentication failed with no errors");
        }

        self.inner = Some(sess);

        json!({"result": true}).to_string()

    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------


pub fn format_json_error(error: &str) -> String {
    json!({"result": false, "error": error}).to_string()
}

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}