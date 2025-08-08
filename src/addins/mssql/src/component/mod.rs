mod backend;
mod dataset;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::{json, Value};
use std::sync::{Arc, Mutex};
use crate::component::dataset::Datasets;

// МЕТОДЫ КОМПОНЕНТЫ
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS"),
    name!("GetQueryResultRow"),
    name!("GetQueryResultLength"),
    name!("RemoveQuery"),
    name!("InitQuery"),
    name!("AddQueryParam"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 3,
        4 => 2,
        5 => 1,
        6 => 1,
        7 => 2,
        8 => 2,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let key = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_query(&key))
        },
        3 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        },
        4 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let index = params[1].get_i32().unwrap_or(0);

            Box::new(obj.datasets.get_row(&key, index as usize).unwrap_or_else(|| "".to_string()))
        },
        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());

            match obj.datasets.len(&key){
                Some(len) => Box::new(len as i32),
                None => Box::new(json!(
                    {"result": false, "error": format!("Dataset {} not found", key)}
                ).to_string()),
            }
        },
        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(json!({"result": true}).to_string())
        },
        7 => {

            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);

            Box::new(obj.init_query(&text, force))
        },
        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let param = params[1].get_string().unwrap_or("".to_string());

            Box::new(obj.add_query_param(&key, param))

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
    datasets: Datasets,
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
            datasets: Datasets::new(),
        }
    }

    pub fn initialize(&mut self) -> String {
        if self.connection_string.is_empty() {
            return Self::error("Empty connection string!");
        }

        if self.initialized {
            return Self::error("Client already initialized!");
        }

        let result = match self.backend.lock(){
            Ok(b) => {
                b.connect(
                self.connection_string.clone(),
                self.use_tls,
                self.accept_invalid_certs,
                self.ca_cert_path.clone(),
            )},
            Err(e) => Self::error(&e.to_string())
        };

        if result.contains("\"result\":true") {
            self.initialized = true;
        }

        result
    }

    pub fn init_query(&mut self, text: &str, force_result: bool) -> String {

        let key = self.datasets.init_query();
        self.datasets.set_text(&key, text);
        self.datasets.set_force_result(&key, force_result);

        key
    }

    pub fn add_query_param(&mut self, key: &str, param: String) -> String {

        let value: Value = match serde_json::from_str(&param) {
            Ok(param) => param,
            Err(e) => return Self::error(&e.to_string()),
        };

        self.datasets.add_param(key, value);
        json!({"result": true}).to_string()

    }

    pub fn close_connection(&mut self) -> String {
        self.initialized = false;
        json!({"result": true}).to_string()
    }

    pub fn execute_query(&self, key: &str) -> String {
        match self.backend.lock(){
            Ok(backend) => {

                let query = match self.datasets.get_query(key){
                    Some(q) => q,
                    None => return Self::error(format!("No query found by key: {}", key).as_str()),
                };

                let params = query.params;
                let text = query.text;
                let force_result = query.force_result;

                let backend_result = backend.execute_query(text, params, force_result);

                match backend_result {
                    Ok(result) => {
                        match result {
                            Some(data) => {

                                self.datasets.set_results(&key, data);
                                json!({"result": true, "data": true}).to_string()

                            },
                            None => json!({"result": true, "data": false}).to_string()
                        }
                    },
                    Err(e) => Self::error(&e.to_string()),
                }
            },
            Err(e) => Self::error(&e.to_string()),
        }
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