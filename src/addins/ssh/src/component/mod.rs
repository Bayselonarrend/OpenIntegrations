mod methods;
mod ssh_settings;
mod sftp;

use std::io::Read;
use std::path::Path;
use addin1c::{name, Variant};
use serde_json::json;
use crate::core::getset;
use ssh2::{MethodType, Session, Sftp};
use crate::component::ssh_settings::{SshAuthTypes, SshConf};
use common_tcp::tcp_establish::create_tcp_connection;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("SetSettings"),
    name!("SetProxy"),
    name!("Connect"),
    name!("Execute"),
    name!("Disconnect"),
    name!("GetConfiguration"),
    name!("ToSFTP"),
    name!("MakeDirectory"),
    name!("RemoveDirectory"),
    name!("ListDirectory"),
    name!("UploadFile"),
    name!("UploadData"),
    name!("RemoveFile"),
    name!("IsSFTP")
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 1,
        2 => 0,
        3 => 1,
        4 => 0,
        5 => 0,
        6 => 0,
        7 => 2,
        8 => 1,
        9 => 1,
        10 => 2,
        11 => 2,
        12 => 1,
        13 => 0,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {
        0 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_settings(json_string))
        },
        1 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_proxy(json_string))
        },
        2 => {
            Box::new(obj.initialize())
        }
        3 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute(&command))
        },
        4 => {
            Box::new(obj.disconnect())
        },
        5 => {
            Box::new(obj.get_configuration())
        },
        6 => {
            Box::new(obj.make_sftp())
        },
        7 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let mode = params[1].get_i32().unwrap_or(0);

            Box::new(obj.make_directory(&path, mode))
        },
        8 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.remove_directory(&path))
        },
        9 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.list_directory(&path))
        },
        10 => {
            let file = params[0].get_string().unwrap_or("".to_string());
            let path = params[1].get_string().unwrap_or("".to_string());

            Box::new(obj.upload_file(&file, &path))
        },
        11 => {

            let data = match params[0].get_blob(){
                Ok(b) => b,
                Err(e) => return Box::new(
                    format_json_error(format!("Blob error: {}", e.to_string()).as_str()))
            };

            let path = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.upload_data(data, &path))
        },
        12 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.delete_file(&path))
        },
        13 => {
            Box::new(obj.sftp.is_some())
        }
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    inner: Option<Session>,
    conf: Option<SshConf>,
    sftp: Option<Sftp>
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            inner: None,
            conf: None,
            sftp: None,
        }
    }

    pub fn set_settings(&mut self, settings: String) -> String{

        let mut conf = self.conf.take().unwrap_or_else(|| SshConf::new());

        match conf.set_settings(settings) {
            Ok(_) => {
                self.conf = Some(conf);
                json!({"result": true}).to_string()
            },
            Err(e) => format_json_error(&e),
        }

    }

    pub fn set_proxy(&mut self, proxy: String) -> String{

        let mut conf = self.conf.take().unwrap_or_else(|| SshConf::new());

        match conf.set_proxy(proxy) {
            Ok(_) => {
                self.conf = Some(conf);
                json!({"result": true}).to_string()
            },
            Err(e) => format_json_error(&e),
        }

    }

    pub fn initialize(&mut self) -> String {

        let conf_data = match &self.conf{
            Some(conf_data) => conf_data,
            None => return format_json_error("No configuration found")
        };

        let settings = match &conf_data.set {
            Some(settings) => settings,
            None => return format_json_error("No settings found")
        };

        let username= &settings.username;
        let password = settings.password.as_deref().unwrap_or("");
        let passphrase = &settings.passphrase;
        let key_path = &settings.key_path;
        let pub_path = &settings.pub_path;
        let proxy = &conf_data.proxy;

        let tcp = match create_tcp_connection(&settings.host, settings.port, proxy){
            Ok(tcp) => tcp,
            Err(e) => return format_json_error(format!("TCP error: {}", e.to_string()).as_str())
        };

        ssh2::init();

        let mut identities = vec![];
        let methods;
        let banner;
        let kex;

        let mut sess = match Session::new(){
            Ok(sess) => {
                methods = sess.auth_methods(username).unwrap_or("").to_string();
                banner = sess.banner().unwrap_or("").to_string();
                kex = sess.methods(MethodType::Kex).unwrap_or("").to_string();

                sess
            },
            Err(e) => return format_json_error(format!("Session error: {}", e.to_string()).as_str())
        };

        match sess.agent(){
            Ok(agent) => {
                match agent.identities(){
                    Ok(idents) => {
                        for ident in idents{
                            identities.push(ident.comment().to_string());
                        }
                    }
                    Err(e) => identities.push(e.to_string())
                }
            }
            Err(e) => identities.push(e.to_string())
        };

        sess.set_tcp_stream(tcp);

        if let Err(e) = sess.handshake() {
            return json!({
                "result": false,
                "error": format!("Handshake error: {}", e.to_string()),
                "identities": identities,
                "methods": methods,
                "banner": banner,
                "kex_methods": kex
            }).to_string();
        };

        let auth_success = match settings.auth_type {

            SshAuthTypes::Password => sess.userauth_password(username, password),
            SshAuthTypes::Agent => sess.userauth_agent(username),
            SshAuthTypes::PrivateKey => {

                let path = match key_path{
                    Some(key_path) => key_path.as_ref(),
                    None => return format_json_error("No key path provided with PK auth type")
                };

                let pub_path = match pub_path{
                    Some(pub_path) => Some(Path::new(pub_path)),
                    None => None
                };

                sess.userauth_pubkey_file(username, pub_path, path, passphrase.as_deref())
            },

        };

        if let Err(e) = auth_success{
            return format_json_error(format!("Auth error: {}", e.to_string()).as_str());
        };

        if !sess.authenticated(){
            return format_json_error("Authentication failed with no errors");
        }

        self.inner = Some(sess);

        json!({"result": true}).to_string()

    }

    pub fn execute(&self, command: &str) -> String {

        let session = match &self.inner{
            Some(sess) => sess,
            None => return format_json_error("No session"),
        };

        let mut channel = match session.channel_session(){
            Ok(channel) => channel,
            Err(e) => return format_json_error(&e.to_string())
        };

        if let Err(e) = channel.exec(command){
            return format_json_error(&e.to_string());
        };

        let mut stdout = String::new();
        if let Err(e) = channel.read_to_string(&mut stdout).map_err(|e| e.to_string()){
            stdout = e.to_string();
        };

        let mut stderr = String::new();
        if let Err(e) = channel.stderr().read_to_string(&mut stderr).map_err(|e| e.to_string()){
            stderr = e.to_string();
        };

        let exit_code = match channel.wait_close(){
            Ok(_) => channel.exit_status().map_err(|e| e.to_string()),
            Err(e) => Err(e.to_string())
        };

        let code = match exit_code{
            Ok(code) => code.to_string(),
            Err(e) => e.to_string()
        };

        json!({"result": true, "exit_code": code, "stdout": stdout, "stderr": stderr}).to_string()

    }

    pub fn get_configuration(&mut self) -> String{

        let conf = match &self.conf{
            Some(conf) => conf,
            None => return format_json_error("No configuration found")
        };

        json!({"result": true, "conf": conf}).to_string()
    }

    // SFTP

    pub fn make_sftp(&mut self) -> String {
        match &self.inner{
            Some(sess) => {
                self.sftp = match sftp::make_sftp(sess){
                    Ok(sftp) => Some(sftp),
                    Err(e) => return e.to_string()
                };
                json!({"result": true}).to_string()
            },
            None => json!({"result": false, "error": "Init SSH connection first"}).to_string()
        }
    }

    pub fn make_directory(&mut self, path: &str, mode: i32) -> String {
       match &self.sftp{
           Some(s) => {
               match sftp::make_directory(s, path, mode){
                   Ok(_) => json!({"result": true}).to_string(),
                   Err(e) => format_json_error(&e.to_string())
               }
           },
           None => json!({"result": false, "error": "Init SFTP first"}).to_string()
       }
    }

    pub fn remove_directory(&mut self, path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match sftp::remove_directory(s, path){
                    Ok(_) => json!({"result": true}).to_string(),
                    Err(e) => format_json_error(&e.to_string())
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn list_directory(&mut self, path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match sftp::list_directory(s, path){
                    Ok(d) => json!({"result": true, "data": d}).to_string(),
                    Err(e) => format_json_error(&e.to_string())
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn upload_file(&mut self, file: &str, path: &str) -> String {

        match &self.sftp{
            Some(s) => {
                match sftp::upload_file(s, file, path){
                    Ok(d) => json!({"result": true, "bytes": d}).to_string(),
                    Err(e) => format_json_error(&e.to_string())
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn upload_data(&mut self, data: &[u8], path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match sftp::upload_data(s, data, path){
                    Ok(d) => json!({"result": true, "bytes": d}).to_string(),
                    Err(e) => format_json_error(&e.to_string())
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn delete_file(&mut self, path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match sftp::remove_file(s, path){
                    Ok(_) => json!({"result": true}).to_string(),
                    Err(e) => format_json_error(&e.to_string())
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn disconnect(&mut self) -> String{
        if let Some(_conn) = self.inner.take() {
            json!({"result": true}).to_string()
        } else {
            json!({"result": false, "error": "No session"}).to_string()
        }
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