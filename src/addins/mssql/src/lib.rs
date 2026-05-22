mod backend;

use serde_json::json;
use std::sync::{Arc, Mutex};
use common_binary::vault::BinaryInput;
use common_dataset::dataset::Datasets;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success, version};
use common_core::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

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
    name!("BatchQuery"),
    name!("LoadBinaryToVault"),
    name!("LoadFileToVault"),
    name!("LoadBase64ToVault"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
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
        11 => 1,
        12 => 1,
        13 => 1,
        14 => 1,
        15 => 1,
        16 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

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
        11 => {
            let binary = params[0].get_blob().unwrap_or(&empty_array);

            let result = match obj.backend.lock() {
                Ok(lock) => {
                    match lock.binary_vault.store(BinaryInput::Bytes(Vec::from(binary))){
                        Ok(key) => json!({"result": true, "key": key}).to_string(),
                        Err(e) => json_error(&e)
                    }
                },
                Err(e) => json_error(&e)
            };

            Box::new(result)
        },
        12 => {
            let file = params[0].get_string().unwrap_or("".to_string());

            let result = match obj.backend.lock() {
                Ok(lock) => {
                    match lock.binary_vault.store(BinaryInput::FilePath(file)){
                        Ok(key) => json!({"result": true, "key": key}).to_string(),
                        Err(e) => json_error(&e)
                    }
                },
                Err(e) => json_error(&e)
            };

            Box::new(result)
        },
        13 => {
            let base64 = params[0].get_string().unwrap_or("".to_string());

            let result = match obj.backend.lock() {
                Ok(lock) => {
                    match lock.binary_vault.store(BinaryInput::Base64(base64)){
                        Ok(key) => json!({"result": true, "key": key}).to_string(),
                        Err(e) => json_error(&e)
                    }
                },
                Err(e) => json_error(&e)
            };

            Box::new(result)
        },
        14 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        },
        15 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        16 => Box::new(version()),
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
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            backend: Arc::new(Mutex::new(backend::MSSQLBackend::new())),
            initialized: false,
            tls: None,
            datasets: Datasets::new(),
            logger: None,
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> String {
        if logger_config.is_empty() {
            return json_error("Logger config is empty");
        }

        if self.initialized {
            return json_error("Logger can only be set before the connection is established");
        }

        if self.logger.is_some() {
            return json_success();
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => {
                let logger_arc = Arc::new(logger);
                match self.backend.lock() {
                    Ok(backend) => match backend.set_logger(logger_arc.clone()) {
                        Ok(()) => {
                            self.logger = Some(logger_arc);
                            json_success()
                        }
                        Err(e) => json_error(&e),
                    },
                    Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
                }
            }
            Err(e) => json_error(&format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        if let Some(ref logger) = self.logger {
            let logs = logger.get_last_logs(count);
            let total = logger.len();

            json!({
                "result": true,
                "logs": logs,
                "total": total,
                "returned": logs.len()
            })
            .to_string()
        } else {
            json_error("Logger not initialized")
        }
    }

    fn apply_logger_to_backend(&self) {
        if let (Some(ref logger), Ok(backend)) = (&self.logger, self.backend.lock()) {
            let _ = backend.set_logger(logger.clone());
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
        self.apply_logger_to_backend();
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

