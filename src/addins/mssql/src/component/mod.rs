mod backend;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use std::sync::{Arc, Mutex};

// МЕТОДЫ КОМПОНЕНТЫ
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS")
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 3,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let query = params[0].get_string().unwrap_or_default();
            let params_json = params[1].get_string().unwrap_or_default();
            let force_result = params[2].get_bool().unwrap_or(false);
            Box::new(obj.execute_query(query, params_json, force_result))
        },
        3 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        _ => Box::new(false),
    }
}

// ПОЛЯ КОМПОНЕНТЫ
pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

pub struct AddIn {
    connection_string: String,
    backend: Arc<Mutex<backend::MSSQLBackend>>,
    initialized: bool,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            backend: Arc::new(Mutex::new(backend::MSSQLBackend::new())),
            initialized: false,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
        }
    }

    pub fn initialize(&mut self) -> String {
        if self.connection_string.is_empty() {
            return Self::error("Empty connection string!");
        }

        if self.initialized {
            return Self::error("Client already initialized!");
        }

        let result = self.backend.lock().unwrap().connect(
            self.connection_string.clone(),
            self.use_tls,
            self.accept_invalid_certs,
            self.ca_cert_path.clone(),
        );

        if result.contains("\"result\":true") {
            self.initialized = true;
        }

        result
    }

    pub fn close_connection(&mut self) -> String {
        self.initialized = false;
        json!({"result": true}).to_string()
    }

    pub fn execute_query(&self, query: String, params_json: String, force_result: bool) -> String {
        self.backend.lock().unwrap().execute_query(query, params_json, force_result)
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        if self.initialized {
            return Self::error("TLS settings can only be set before the connection is established");
        }

        self.use_tls = use_tls;
        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();

        json!({"result": true}).to_string()
    }

    fn error(message: &str) -> String {
        json!({
            "result": false,
            "error": message
        }).to_string()
    }

    // SERVICE METHODS
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