use std::sync::Arc;

use common_logs::Logger;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::LynaBackend;

pub struct AddIn {
    pub(crate) backend: LynaBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: LynaBackend::new(),
        }
    }

    pub fn execute_string(&self, code: &str) -> String {
        self.backend.execute_string(code.to_string())
    }

    pub fn execute_file(&self, path: &str) -> String {
        self.backend.execute_file(path.to_string())
    }

    pub fn execute_bytecode(&self, bytecode: Vec<u8>) -> String {
        self.backend.execute_bytecode(bytecode)
    }

    pub fn execute_bytecode_file(&self, path: &str) -> String {
        self.backend.execute_bytecode_file(path.to_string())
    }

    pub fn compile_to_bytecode(&self, code: &str) -> Result<Vec<u8>, String> {
        self.backend.compile_to_bytecode(code.to_string())
    }

    pub fn compile_file_to_bytecode(&self, path: &str) -> Result<Vec<u8>, String> {
        self.backend.compile_file_to_bytecode(path.to_string())
    }

    pub fn call_function(&self, function_name: &str, args_json: &str) -> String {
        self.backend
            .call_function(function_name.to_string(), args_json.to_string())
    }

    pub fn set_global(&self, variable_name: &str, value_json: &str) -> String {
        self.backend
            .set_global(variable_name.to_string(), value_json.to_string())
    }

    pub fn get_global(&self, variable_name: &str) -> String {
        self.backend.get_global(variable_name.to_string())
    }

    pub fn add_package(&self, package_name: String, code: String) -> String {
        self.backend.add_package(package_name, code)
    }

    pub fn load_package_from_file(&self, package_name: String, file_path: String) -> String {
        self.backend.load_package_from_file(package_name, file_path)
    }

    pub fn get_packages(&self) -> String {
        self.backend.get_packages()
    }

    pub fn reset(&self) -> String {
        match self.backend.reset() {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> String {
        if logger_config.is_empty() {
            return json_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.backend.set_logger(Arc::new(logger)) {
                Ok(()) => json_success(),
                Err(e) => json_error(&e),
            },
            Err(e) => json_error(&format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        match self.backend.get_logs(count) {
            Some((logs, total)) => json!({
                "result": true,
                "logs": logs,
                "total": total,
                "returned": logs.len()
            })
            .to_string(),
            None => json_error("Logger not initialized"),
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}
