mod backend;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use std::sync::{Arc, Mutex};
use common_dataset::dataset::Datasets;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS"),
    name!("InitQuery"),
    name!("GetResultAsFile"),
    name!("GetResultAsString"),
    name!("SetParamsFromFile"),
    name!("SetParamsFromString"),
    name!("RemoveQueryDataset"),
    name!("BatchQuery")
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 3,
        4 => 3,
        5 => 2,
        6 => 1,
        7 => 2,
        8 => 2,
        9 => 1,
        10 => 2,
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

            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);
            let from_file = params[2].get_bool().unwrap_or(false);

            let result = match obj.datasets.init_query(&text, force, from_file){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.result_as_file(&key, &filepath){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };

            Box::new(result)
        },
        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let result = obj.datasets.result_as_string(&key)
                .unwrap_or_else(|e| json_error(&e));

            Box::new(result)

        },
        7 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.params_from_file(&key, &filepath){
                Ok(_) => json!({"result": true}).to_string(),
                Err(e) => json_error(&e)
            };

            Box::new(result)
        },
        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let json = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.params_from_string(&key, &json){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        9 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(json_success())
        },
        10 => {
            let input = params[0].get_string().unwrap_or("".to_string());
            let output = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.batch_query_init(&input, &output){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

pub struct AddIn {
    connection_string: String,
    backend: Arc<Mutex<backend::MSSQLBackend>>,
    initialized: bool,
    tls: Option<TlsSettings>,
    datasets: Datasets,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            backend: Arc::new(Mutex::new(backend::MSSQLBackend::new())),
            initialized: false,
            tls: None,
            datasets: Datasets::new(),
        }
    }

    pub fn initialize(&mut self) -> String {
        if self.connection_string.is_empty() {
            return json_error("Empty connection string!");
        }

        if self.initialized {
            return json_error("Client already initialized!");
        }

        let result = match self.backend.lock(){
            Ok(b) => {
                b.connect(
                self.connection_string.clone(),
                self.tls.clone(),
            )},
            Err(e) => json_error(&e.to_string())
        };

        if result.contains("\"result\":true") {
            self.initialized = true;
        }
        result
    }

    pub fn close_connection(&mut self) -> String {
        match self.backend.lock() {
            Ok(mut guard) => {
                guard.shutdown();
            }
            Err(e) => {
                return json_error(format!("Failed to acquire backend lock during close: {}", e));
            }
        }

        self.backend = Arc::new(Mutex::new(backend::MSSQLBackend::new()));
        self.initialized = false;
        json_success()
    }

    pub fn execute_query(&self, key: &str) -> String {
        match self.backend.lock(){
            Ok(backend) => {
                let query = match self.datasets.get_query(key){
                    Some(q) => q,
                    None => return json_error(format!("No query found by key: {}", key)),
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
                    Err(e) => json_error(&e),
                }
            },
            Err(e) => json_error(&e),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        if self.initialized {
            return json_error("TLS settings can only be set before the connection is established");
        }
        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        json_success()
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

