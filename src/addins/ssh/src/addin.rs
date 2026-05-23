use std::sync::Arc;

use common_logs::Logger;
use common_utils::utils::{json_error, json_success};
use serde_json::json;

use crate::backend::SshBackend;

pub struct AddIn {
    pub(crate) backend: SshBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: SshBackend::new(),
        }
    }

    pub fn set_settings(&mut self, settings: String) -> String {
        match self.backend.set_settings(settings) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_proxy(&mut self, proxy: String) -> String {
        match self.backend.set_proxy(proxy) {
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

    pub fn initialize(&mut self) -> String {
        match self.backend.connect() {
            Ok(response) => response,
            Err(e) => json_error(&e),
        }
    }

    pub fn execute(&self, command: &str) -> String {
        match self.backend.execute(command) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn disconnect(&mut self) -> String {
        match self.backend.disconnect() {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn get_configuration(&self) -> String {
        match self.backend.get_configuration() {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn make_sftp(&mut self) -> String {
        match self.backend.make_sftp() {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn make_directory(&mut self, path: &str, mode: i32) -> String {
        match self.backend.make_directory(path, mode) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn remove_directory(&mut self, path: &str) -> String {
        match self.backend.remove_directory(path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn list_directory(&mut self, path: &str) -> String {
        match self.backend.list_directory(path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn upload_file(&mut self, file: &str, path: &str) -> String {
        match self.backend.upload_file(file, path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn upload_data(&mut self, data: Vec<u8>, path: &str) -> String {
        match self.backend.upload_data(data, path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn delete_file(&mut self, path: &str) -> String {
        match self.backend.delete_file(path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn is_sftp(&self) -> bool {
        self.backend.is_sftp().unwrap_or(false)
    }

    pub fn download_to_file(&mut self, path: &str, filepath: &str) -> String {
        match self.backend.download_to_file(path, filepath) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn download_to_vec(&mut self, path: &str) -> Result<Vec<u8>, String> {
        self.backend.download_to_vec(path)
    }

    pub fn rename_object(&mut self, path: &str, new_path: &str, overwrite: bool) -> String {
        match self.backend.rename_object(path, new_path, overwrite) {
            Ok(result) => result,
            Err(e) => json_error(&e),
        }
    }

    pub fn get_file_info(&mut self, path: &str) -> String {
        match self.backend.get_file_info(path) {
            Ok(result) => result,
            Err(e) => json_error(&e),
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
