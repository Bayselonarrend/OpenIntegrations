use std::sync::Arc;

use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success};

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

    pub fn execute_string(&self, code: &str) -> JanxValue {
        self.backend.execute_string(code.to_string())
    }

    pub fn execute_file(&self, path: &str) -> JanxValue {
        self.backend.execute_file(path.to_string())
    }

    pub fn execute_bytecode(&self, bytecode: Vec<u8>) -> JanxValue {
        self.backend.execute_bytecode(bytecode)
    }

    pub fn execute_bytecode_file(&self, path: &str) -> JanxValue {
        self.backend.execute_bytecode_file(path.to_string())
    }

    pub fn compile_to_bytecode(&self, code: &str) -> Result<Vec<u8>, String> {
        self.backend.compile_to_bytecode(code.to_string())
    }

    pub fn compile_file_to_bytecode(&self, path: &str) -> Result<Vec<u8>, String> {
        self.backend.compile_file_to_bytecode(path.to_string())
    }

    pub fn call_function(&self, function_name: &str, args_janx: Vec<u8>) -> JanxValue {
        self.backend
            .call_function(function_name.to_string(), args_janx)
    }

    pub fn set_global(&self, variable_name: &str, value_janx: Vec<u8>) -> JanxValue {
        self.backend
            .set_global(variable_name.to_string(), value_janx)
    }

    pub fn get_global(&self, variable_name: &str) -> JanxValue {
        self.backend.get_global(variable_name.to_string())
    }

    pub fn add_package(&self, package_name: String, code: String) -> JanxValue {
        self.backend.add_package(package_name, code)
    }

    pub fn load_package_from_file(&self, package_name: String, file_path: String) -> JanxValue {
        self.backend
            .load_package_from_file(package_name, file_path)
    }

    pub fn get_packages(&self) -> JanxValue {
        self.backend.get_packages()
    }

    pub fn reset(&self) -> JanxValue {
        self.backend.reset()
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => match self.backend.set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(e) => janx_error(e),
            },
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.backend.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
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
