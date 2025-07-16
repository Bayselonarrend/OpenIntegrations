mod ftp_client;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use suppaftp::{FtpStream, NativeTlsConnector, NativeTlsFtpStream};
use suppaftp::native_tls::TlsConnector;
use suppaftp::types::Mode;
use serde::Deserialize;
use crate::component::ftp_client::FtpClient;
use std::net::TcpStream;
use std::sync::{Arc, Mutex};
use socks::{Socks4Stream, Socks5Stream};

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("UpdateSettings"),
    name!("UpdateProxy"),
    name!("SetTLS")
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 1,
        2 => 1,
        3 => 3,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(obj.initialize()),
        1 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.update_settings(&json_string))
        },
        2 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.update_proxy(&json_string))
        },
        3 => {

            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))

        }
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];

#[derive(Deserialize, Debug)]
struct FtpProxySettings {
    server: String,
    port: u16,
    login: Option<String>,
    password: Option<String>,
    proxy_type: Option<String>, // "http", "socks4", "socks5"
}

#[derive(Deserialize, Debug)]
struct FtpSettings {
    domain: Option<String>,
    port: Option<u16>,
    login: Option<String>,
    password: Option<String>,
    passive: Option<bool>,
    timeout: Option<u64>,
}

pub struct AddIn {
    domain: String,
    port: u16,
    login: Option<String>,
    password: Option<String>,
    passive: bool,
    timeout: u64,
    // TLS
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
    client: Option<Arc<Mutex<FtpClient>>>,
    // Proxy
    proxy_server: Option<String>,
    proxy_port: Option<u16>,
    proxy_login: Option<String>,
    proxy_password: Option<String>,
    proxy_type: Option<String>,
}

impl AddIn {

    pub fn new() -> Self {
        AddIn {
            client: None,
            domain: String::new(),
            port: 21,
            login: None,
            password: None,
            passive: true,
            timeout: 120,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
            // Инициализация полей прокси
            proxy_server: None,
            proxy_port: None,
            proxy_login: None,
            proxy_password: None,
            proxy_type: None,
        }
    }

    pub fn update_settings(&mut self, json_data: &str) -> String {

        let json_struct: FtpSettings = match serde_json::from_str(json_data){
            Ok(s) => s,
            Err(e) => return Self::process_error(&e.to_string()),
        };

        if let Some(domain) = json_struct.domain {
            self.domain = domain;
        }

        if let Some(port) = json_struct.port {
            self.port = port;
        }

        if let Some(passive) = json_struct.passive {
            self.passive = passive;
        }

        if let Some(timeout) = json_struct.timeout {
            self.timeout = timeout;
        }

        self.login = json_struct.login.or(self.login.clone());
        self.password = json_struct.password.or(self.password.clone());

        json!({"result": true}).to_string()

    }

    pub fn update_proxy(&mut self, json_data: &str) -> String {

        let json_struct: FtpProxySettings = match serde_json::from_str(json_data){
            Ok(s) => s,
            Err(e) => return Self::process_error(&e.to_string()),
        };

        self.proxy_server = Some(json_struct.server);
        self.proxy_port = Some(json_struct.port);
        self.proxy_login = json_struct.login;
        self.proxy_password = json_struct.password;
        self.proxy_type = json_struct.proxy_type;

        json!({"result": true}).to_string()

    }

    pub fn initialize(&mut self) -> String {

        if self.domain.is_empty() {
            return Self::process_error("Address must be initialized");
        }

        let tcp_stream = match self.create_tcp_connection() {
            Ok(stream) => stream,
            Err(e) => return e,
        };

        let client = match self.configure_ftp_client(tcp_stream) {
            Ok(client) => client,
            Err(e) => return e,
        };

        let login: Option<&str> = self.login.as_deref();
        let password: Option<&str> = self.password.as_deref();

        self.client = match client.login(login, password) {
            Ok(auth) => Some(Arc::new(Mutex::new(auth))),
            Err(e) => return Self::process_error(&e.to_string()),
        };

        json!({"result": true}).to_string()
    }

    fn configure_ftp_client(
        &mut self,
        tcp_stream: TcpStream,
    ) -> Result<FtpClient, String> {

        let mode = if self.passive { Mode::Passive } else { Mode::Active };

        if self.use_tls {

            let tls_connector = self.get_tls_connector()?;

            let ftp_stream = NativeTlsFtpStream::connect_with_stream(tcp_stream)
                .map_err(|e| Self::process_error(&e.to_string()))?;

            let mut secure_stream = ftp_stream
                .into_secure(NativeTlsConnector::from(tls_connector), &self.domain)
                .map_err(|e| Self::process_error(&e.to_string()))?;

            secure_stream.set_mode(mode);
            secure_stream.set_passive_nat_workaround(true);
            Ok(FtpClient::Secure(secure_stream))

        } else {

            let mut ftp_stream = FtpStream::connect_with_stream(tcp_stream)
                .map_err(|e| Self::process_error(&e.to_string()))?;

            ftp_stream.set_mode(mode);
            ftp_stream.set_passive_nat_workaround(true);
            Ok(FtpClient::Insecure(ftp_stream))
        }
    }

    fn create_tcp_connection(&self) -> Result<TcpStream, String> {

        if let (Some(proxy_server), Some(proxy_port), Some(proxy_type)) =
            (&self.proxy_server, &self.proxy_port, &self.proxy_type)
        {

            let target_addr = (self.domain.as_str(), self.port);
            let proxy_addr = format!("{}:{}", proxy_server, proxy_port);

            match proxy_type.to_lowercase().as_str() {
                "socks5" => self.connect_via_socks5(&proxy_addr, target_addr),
                "socks4" => self.connect_via_socks4(&proxy_addr, target_addr),
                _ => Err(Self::process_error("Unsupported proxy type")),
            }
        } else {
            self.connect_direct()
        }
    }

    fn connect_via_socks5(&self, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

        let stream = if let (Some(user), Some(pass)) = (&self.proxy_login, &self.proxy_password) {
            Socks5Stream::connect_with_password(proxy_addr, target_addr, user, pass)
        } else {
            Socks5Stream::connect(proxy_addr, target_addr)
        };

        stream.map(|s| s.into_inner())
            .map_err(|e| Self::process_error(&format!("SOCKS5 error: {}", e)))
    }

    fn connect_via_socks4(&self, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

        let stream = if let Some(user) = &self.proxy_login {
            Socks4Stream::connect(proxy_addr, target_addr, user)
        } else {
            Socks4Stream::connect(proxy_addr, target_addr, "")
        };

        stream.map(|s| s.into_inner())
            .map_err(|e| Self::process_error(&format!("SOCKS4 error: {}", e)))
    }

    fn connect_direct(&self) -> Result<TcpStream, String> {
        let addr = format!("{}:{}", &self.domain, &self.port);
        TcpStream::connect(&addr).map_err(|e| Self::process_error(&format!("Direct connection error: {}", e)))
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
                Err(e) => return Self::process_error(&format!("Failed to lock client: {}", e)),
            }
        }
        json!({"result": true}).to_string()
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.client.is_some(){
            return Self::process_error("TLS settings can only be set before the connection is established");
        };

        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();
        self.use_tls = use_tls;

        json!({"result": true}).to_string()
    }

    fn get_tls_connector(&mut self) -> Result<TlsConnector, String> {

        let mut tls_builder = TlsConnector::builder();

        tls_builder.danger_accept_invalid_certs(self.accept_invalid_certs);

        if !self.ca_cert_path.is_empty() {

            let cert_data = std::fs::read(&self.ca_cert_path)
                .map_err(|e| Self::process_error(&e.to_string()))?;

            let cert = native_tls::Certificate::from_pem(&cert_data)
                .map_err(|e| Self::process_error(&e.to_string()))?;

            tls_builder.add_root_certificate(cert);
        }

        match tls_builder.build(){
            Ok(connector) => Ok(connector),
            Err(e) => Err(Self::process_error(&e.to_string())),
        }
    }

    fn process_error(e: &str) -> String{
        json!({
            "result": false,
            "error": e
        }).to_string()
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}


// -------------------------------------------------------------------------------------------------

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}

