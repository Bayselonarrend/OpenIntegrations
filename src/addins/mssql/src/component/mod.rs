mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use tiberius::{Client, Config, EncryptionLevel};
use tokio::net::TcpStream;
use tokio_util::compat::{Compat, TokioAsyncWriteCompatExt};
use std::sync::{Arc, Mutex};
use tokio::runtime::Runtime;


// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS")
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 3,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let query = params[0].get_string().unwrap_or("".to_string());
            let params_json = params[1].get_string().unwrap_or("".to_string());
            let force_result = params[2].get_bool().unwrap_or(false);

            Box::new(methods::execute_query(obj, query, params_json, force_result))

        },
        3 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        _ => Box::new(false),
    }
}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

pub struct AddIn {
    connection_string: String,
    connection: Option<Arc<Mutex<Client<Compat<TcpStream>>>>>,
    runtime: Option<Runtime>,
    initialized: bool,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connection: None,
            runtime: None,
            initialized: false,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
        }
    }

    pub fn initialize(&mut self) -> String {

        if self.connection_string.is_empty() {
            return Self::process_error("Empty connection string!");
        }

        if self.initialized {
            return Self::process_error("Client already initialized!");
        }

        let mut config = match Config::from_ado_string(&self.connection_string) {
            Ok(config) => config,
            Err(e) => return Self::process_error(&e.to_string()),
        };

        match self.use_tls {
            true => {
                config.encryption(EncryptionLevel::Required);

                if self.accept_invalid_certs {
                    config.trust_cert();
                }else if self.ca_cert_path.is_empty() == false {
                    config.trust_cert_ca(&self.ca_cert_path);
                }
            }
            false => {
                config.trust_cert();
                config.encryption(EncryptionLevel::Off)
            }
        }

        let rt = match self.get_runtime() {
            Ok(rt) => rt,
            Err(e) => {
                self.shutdown();
                return Self::process_error(&e)
            },
        };

        let client = rt.block_on(async {
            let tcp = TcpStream::connect(config.get_addr()).await?;
            tcp.set_nodelay(true)?;
            Client::connect(config, tcp.compat_write()).await
        });

        match client {
            Ok(cl) => {
                self.connection = Some(Arc::new(Mutex::new(cl)));
                self.initialized = true;
                json!({"result": true}).to_string()
            },
            Err(e) => {
                self.shutdown();
                Self::process_error(&e.to_string())
            }
        }
    }

    pub fn close_connection(&mut self) -> String {
        self.shutdown();
        json!({"result": true}).to_string()
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.connection.is_some() {
            return Self::process_error("TLS settings can only be set before the connection is established");
        }

        self.use_tls = use_tls;
        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();

        json!({"result": true}).to_string()
    }

    // TOKIO

    pub fn get_runtime(&mut self) -> Result<&Runtime, String> {
        if self.runtime.is_none() {
            self.runtime = Some(
                Runtime::new()
                    .map_err(|e| Self::process_error(&e.to_string()))?
            );
        }
        Ok(self.runtime.as_ref().unwrap())
    }

    pub fn shutdown(&mut self) {
        if let Some(rt) = self.runtime.take() {
            rt.shutdown_background();  // Неблокирующая остановка
        }
        self.connection.take();
    }

    // OTHER
    fn process_error(e: &str) -> String {
        json!({
            "result": false,
            "error": e
        }).to_string()
    }

    // SERVICE
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

// -------------------------------------------------------------------------------------------------

pub fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.shutdown();
    }
}