mod ftp_client;
mod tls_establish;
mod configuration;
mod passive_establish;

use addin1c::{name, Variant};
use serde_json::json;
use serde::{Deserialize, Serialize};
use std::sync::{Arc, Mutex, MutexGuard};
use std::thread::sleep;
use std::time::Duration;
use crate::core::getset;
use crate::component::ftp_client::FtpClient;
use crate::component::configuration::FtpSettings;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("UpdateSettings"),
    name!("UpdateProxy"),
    name!("SetTLS"),
    name!("GetWelcomeMsg"),
    name!("MakeDirectory"),
    name!("RemoveDirectory"),
    name!("ListDirectory"),
    name!("UploadData"),
    name!("UploadFile"),
    name!("RemoveFile"),
    name!("GetConfiguration"),
    name!("IsTls"),
    name!("GetObjectSize"),
    name!("RenameObject"),
    name!("DownloadToFile"),
    name!("DownloadToBuffer"),
    name!("Ping"),
    name!("ExecuteCommand"),
    name!("GetCurrentDirectory"),
    name!("ChangeCurrentDirectory"),
    name!("GetFeatures"),
    name!("ExecuteStandardCommand"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 3,
        5 => 0,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 2,
        10 => 2,
        11 => 1,
        12 => 0,
        13 => 0,
        14 => 1,
        15 => 2,
        16 => 2,
        17 => 1,
        18 => 0,
        19 => 1,
        20 => 0,
        21 => 1,
        22 => 0,
        23 => 1,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let result: Box<dyn getset::ValueType> = match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.update_settings(&json_string))
        },
        3 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.update_proxy(&json_string))
        },
        4 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        },
        5 => {
            Box::new(match obj.get_client(){
                Ok(c) => c.get_welcome_msg(),
                Err(e) => e.to_string()
            })
        }
        6 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.make_directory(&path),
                Err(e) => e.to_string()
            })
        },
        7 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.remove_directory(&path),
                Err(e) => e.to_string()
            })
        },
        8 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.list_directory(&path),
                Err(e) => e.to_string()
            })
        },
        9 => {
            let data = match params[0].get_blob(){
                Ok(b) => b,
                Err(e) => return Box::new(json_error(format!("Blob error: {}", e.to_string()).as_str()))
            };
            let path = params[1].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.upload_data(&path, data),
                Err(e) => e.to_string()
            })
        },

        10 => {
            let filepath = params[0].get_string().unwrap_or("".to_string());
            let path = params[1].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.upload_file(&path, &filepath),
                Err(e) => e.to_string()
            })
        },
        11 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.remove_file(&path),
                Err(e) => e.to_string()
            })
        },
        12 => Box::new(obj.get_configurations()),
        13 => Box::new(obj.is_tls()),
        14 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.object_size(&path),
                Err(e) => e.to_string()
            })
        },
        15 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let new_path = params[1].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.rename_object(&path, &new_path),
                Err(e) => e.to_string()
            })
        },
        16 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.download_to_file(&path, &filepath),
                Err(e) => e.to_string()
            })
        },
        17 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            match &mut obj.get_client(){
                Ok(c) => {
                    match c.download_to_vec(&path){
                        Ok(v) => Box::new(v),
                        Err(e) => Box::new(e)
                    }
                },
                Err(e) => Box::new(e.to_string())
            }
        },
        18 => {
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.ping(),
                Err(_) => false
            })
        },
        19 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.execute_command(&command),
                Err(e) => e.to_string()
            })
        },
        20 => {
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.get_current_directory(),
                Err(e) => e.to_string()
            })
        },
        21 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.change_current_directory(&path),
                Err(e) => e.to_string()
            })
        },
        22 => {
            Box::new(match &mut obj.get_client(){
                Ok(c) => c.get_features(),
                Err(e) => e.to_string()
            })
        },
        23 => {
            let command = params[0].get_string().unwrap_or("".to_string());

            Box::new(match &mut obj.get_client(){
                Ok(c) => c.execute_standard_command(&command),
                Err(e) => e.to_string()
            })
        },
        _ => Box::new(false),
    };

    sleep(Duration::from_millis(150));
    result
}

pub const PROPS: &[&[u16]] = &[];

#[derive(Clone,Deserialize,Serialize)]
pub struct AddIn {
    #[serde(skip)]
    client: Option<Arc<Mutex<FtpClient>>>,
    ftp_settings: Option<FtpSettings>,
    tls_settings: Option<TlsSettings>,
    proxy_settings: Option<ProxySettings>,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            client: None,
            ftp_settings: None,
            tls_settings: None,
            proxy_settings: None,
        }
    }

    pub fn initialize(&mut self) -> String {

        if self.client.is_some(){
            return json_error("Client already initialized");
        }

        let ftp_settings = match &self.ftp_settings{
            Some(s) => s.clone(),
            None => return json_error("Address must be initialized")
        };

        let proxy_settings = &self.proxy_settings;
        let tls_settings = &self.tls_settings;
        let host = &ftp_settings.domain;
        let port = ftp_settings.port;

        let tcp_stream = match tcp_establish::create_tcp_connection(host, port, proxy_settings) {
            Ok(stream) => stream,
            Err(e) => return json_error(&e),
        };

        let w_timeout = Some(Duration::from_secs(ftp_settings.write_timeout));
        let r_timeout = Some(Duration::from_secs(ftp_settings.read_timeout));

        match tcp_stream.set_write_timeout(w_timeout){
            Ok(_) => (),
            Err(e) => return json_error(&e),
        }

        match tcp_stream.set_read_timeout(r_timeout) {
            Ok(_) => (),
            Err(e) => return json_error(&e),
        }

        let client = match ftp_client::configure_ftp_client(&ftp_settings, Option::from(tls_settings), Option::from(proxy_settings), tcp_stream) {
            Ok(client) => client,
            Err(e) => return e,
        };

        let login: Option<&str> = ftp_settings.login.as_deref();
        let password: Option<&str> = ftp_settings.password.as_deref();

        self.client = match client.login(login, password) {
            Ok(auth) => Some(Arc::new(Mutex::new(auth))),
            Err(e) => return e,
        };

        json_success()
    }

    pub fn close_connection(&mut self) -> String {
        if let Some(client) = self.client.take() {
            match client.lock() {
                Ok(mut locked_client) => {
                    match &mut *locked_client {
                        FtpClient::Secure(stream) => _ = stream.quit(),
                        FtpClient::Insecure(stream) => _ = stream.quit(),
                    }
                }
                Err(e) => return json_error(&format!("Failed to lock client: {}", e)),
            }
        }
        json_success()
    }

    pub fn update_settings(&mut self, json_data: &str) -> String {
        let json_struct: FtpSettings = match serde_json::from_str(json_data){
            Ok(s) => s,
            Err(e) => return json_error(&e),
        };
        self.ftp_settings = Some(json_struct.clone());

        json_success()
    }

    pub fn update_proxy(&mut self, json_data: &str) -> String {
        let json_struct: ProxySettings = match serde_json::from_str(json_data){
            Ok(s) => s,
            Err(e) => return json_error(&e),
        };

        self.proxy_settings = Some(json_struct.clone());
        json_success()
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.client.is_some(){
            return json_error("TLS settings can only be set before the connection is established");
        };

        self.tls_settings = Some(TlsSettings{
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string()
        });

        json_success()
    }

    pub fn get_configurations(&self) -> String {
        json!({"result": true, "data": &self}).to_string()
    }

    pub fn is_tls(&self) -> bool {
        match &self.tls_settings {
            Some(s) => s.use_tls,
            None => false
        }
    }

    fn get_client(&self) -> Result<MutexGuard<'_, FtpClient>, String> {
        self.client
            .as_ref()
            .ok_or_else(|| json_error("FTP client is not initialized"))
            .and_then(|arc| arc.lock().map_err(|_|  json_error("Failed to lock FTP client mutex")))
    }


    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.close_connection();
    }
}

