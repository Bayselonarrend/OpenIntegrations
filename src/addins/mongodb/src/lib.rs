mod backend_core;
mod backend_methods;
mod bson;

use std::sync::{Arc, Mutex};
use common_binary::vault::BinaryInput;
use serde_json::{json};
use common_core::*;
use common_utils::utils::json_error;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Disconnect"),
    name!("Execute"),
    name!("LoadBinaryToVault"),
    name!("LoadFileToVault"),
    name!("LoadBase64ToVault"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute(&json_string))
        },
        3 => {
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
        4 => {
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
        5 => {
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
        }
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

pub struct AddIn {
    connection_string: String,
    backend: Arc<Mutex<backend_core::MongoBackend>>,
    initialized: bool,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            connection_string: String::new(),
            backend: Arc::new(Mutex::new(backend_core::MongoBackend::new())),
            initialized: false,
        }
    }

    pub fn connect(&mut self) -> String {

        if self.connection_string.is_empty() {
            return format_json_error("Empty connection string!");
        }

        if self.initialized {
            return format_json_error("Connection already initialized!");
        }

        let guard = match self.backend.lock(){
            Ok(lock) => lock,
            Err(e) => return format_json_error(&e.to_string())
        };

        match guard.connect(self.connection_string.as_str()){
            Ok(_) => {
                self.initialized = true;
                json!({"result": true}).to_string()
            },
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn disconnect(&mut self) -> String {

        if !self.initialized {
            return format_json_error("Connection already closed!");
        }

        let guard = match self.backend.lock(){
            Ok(lock) => lock,
            Err(e) => return format_json_error(&e.to_string())
        };

        match guard.disconnect(){
            Ok(_) => {
                self.initialized = false;
                json!({"result": true}).to_string()
            },
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn execute(&mut self, json_string: &str) -> String {

        if !self.initialized {
            return format_json_error("Connection already closed!");
        }

        let guard = match self.backend.lock(){
            Ok(lock) => lock,
            Err(e) => return format_json_error(&e.to_string())
        };

        guard.execute(json_string).unwrap_or_else(|e| format_json_error(&e.to_string()))
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

pub fn format_json_error(error: &str) -> String {
    json!({"result": false, "error": error}).to_string()
}