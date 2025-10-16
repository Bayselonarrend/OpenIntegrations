mod backend_core;
mod backend_methods;
mod bson;

use std::sync::{Arc, Mutex};
use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;


// МЕТОДЫ КОМПОНЕНТЫ
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.initialize()),
        _ => Box::new(false),
    }
}

// ПОЛЯ КОМПОНЕНТЫ
pub const PROPS: &[&[u16]] = &[
    name!("URI")
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

    pub fn initialize(&mut self) -> String {

        if self.connection_string.is_empty() {
            return format_json_error("Empty connection string!");
        }

        if self.initialized {
            return format_json_error("Client already initialized!");
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