mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use tiberius::{Client, Config};
use tokio::net::TcpStream;
use tokio_util::compat::{Compat, TokioAsyncWriteCompatExt};
use std::sync::{Arc, Mutex};

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

            match obj.get_connection() {
                Ok(conn) => {
                    Box::new(methods::execute_query(conn, query, params_json, force_result))
                },
                Err(e) => Box::new(e),
            }
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
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connection: None,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
        }
    }

    pub fn initialize(&mut self) -> String {
        if self.connection_string.is_empty() {
            return Self::process_error("Empty connection string!");
        }

        let mut config = match Config::from_ado_string(&self.connection_string) {
            Ok(config) => config,
            Err(e) => return Self::process_error(&e.to_string()),
        };

        if self.use_tls {
            config.trust_cert();
        }

        match tokio::runtime::Runtime::new().unwrap().block_on(async {
            let tcp = TcpStream::connect(config.get_addr()).await?;
            tcp.set_nodelay(true)?;
            let compat = tcp.compat_write();
            Client::connect(config, compat).await
        }) {
            Ok(client) => {
                self.connection = Some(Arc::new(Mutex::new(client)));
                json!({"result": true}).to_string()
            },
            Err(e) => Self::process_error(&e.to_string()),
        }
    }

    pub fn close_connection(&mut self) -> String {
        if self.connection.take().is_some() {
            json!({"result": true}).to_string()
        } else {
            Self::process_error("Connection is already closed")
        }
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

    fn get_connection(&mut self) -> Result<Arc<Mutex<Client<Compat<TcpStream>>>>, String> {
        self.connection.clone().ok_or_else(|| "No active connection".to_string())
    }

    fn process_error(e: &str) -> String {
        json!({
            "result": false,
            "error": e
        }).to_string()
    }

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