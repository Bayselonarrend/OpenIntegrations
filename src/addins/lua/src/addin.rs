use std::sync::{Arc, Mutex};

use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::LynaBackend;

pub struct AddIn {
    backend: Arc<Mutex<LynaBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(LynaBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, LynaBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn execute_string(&self, code: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.execute_string(code.to_string())
    }

    pub fn execute_file(&self, path: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.execute_file(path.to_string())
    }

    pub fn execute_bytecode(&self, bytecode: Vec<u8>) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.execute_bytecode(bytecode)
    }

    pub fn execute_bytecode_file(&self, path: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.execute_bytecode_file(path.to_string())
    }

    pub fn compile_to_bytecode(&self, code: &str) -> Result<Vec<u8>, String> {
        let mut backend = self.lock_backend();
        backend.compile_to_bytecode(code.to_string())
    }

    pub fn compile_file_to_bytecode(&self, path: &str) -> Result<Vec<u8>, String> {
        let mut backend = self.lock_backend();
        backend.compile_file_to_bytecode(path.to_string())
    }

    pub fn call_function(&self, function_name: &str, args_janx: Vec<u8>) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.call_function(function_name.to_string(), args_janx)
    }

    pub fn set_global(&self, variable_name: &str, value_janx: Vec<u8>) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.set_global(variable_name.to_string(), value_janx)
    }

    pub fn get_global(&self, variable_name: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_global(variable_name.to_string())
    }

    pub fn add_package(&self, package_name: String, code: String) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.add_package(package_name, code)
    }

    pub fn load_package_from_file(&self, package_name: String, file_path: String) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.load_package_from_file(package_name, file_path)
    }

    pub fn get_packages(&self) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_packages()
    }

    pub fn reset(&self) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.reset()
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut backend = self.lock_backend();
                match backend.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let backend = self.lock_backend();
        match backend.get_logs(count) {
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

impl Drop for AddIn {
    fn drop(&mut self) {
        let mut backend = self.lock_backend();
        backend.close_backend();
    }
}
