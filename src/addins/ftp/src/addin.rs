use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_logs, janx_success};

use crate::backend::FtpBackend;
use crate::configuration::FtpSettings;
use crate::worker::WorkerCommand;

pub struct AddIn {
    pub(crate) backend: FtpBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: FtpBackend::new(),
        }
    }

    pub fn initialize(&mut self) -> JanxValue {
        match self.backend.connect() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn close_connection(&mut self) -> JanxValue {
        match self.backend.close() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn update_settings(&mut self, json_data: &str) -> JanxValue {
        match serde_json::from_str::<FtpSettings>(json_data) {
            Ok(settings) => {
                self.backend.update_settings(settings);
                janx_success(None, None)
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    pub fn update_proxy(&mut self, json_data: &str) -> JanxValue {
        match serde_json::from_str::<ProxySettings>(json_data) {
            Ok(settings) => {
                self.backend.update_proxy(settings);
                janx_success(None, None)
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        match self.backend.set_tls(TlsSettings {
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
        }) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> JanxValue {
        if logger_config.is_empty() {
            return janx_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
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

    pub fn get_configurations(&self) -> JanxValue {
        self.backend.get_configurations()
    }

    pub fn is_tls(&self) -> bool {
        self.backend.is_tls()
    }

    pub fn get_welcome_msg(&self) -> JanxValue {
        self.backend
            .call_janx(|response| WorkerCommand::GetWelcomeMsg { response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn make_directory(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::MakeDirectory { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn remove_directory(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::RemoveDirectory { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn list_directory(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::ListDirectory { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn upload_data(&self, path: &str, data: Vec<u8>) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::UploadData {
                path,
                data,
                response,
            })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn upload_file(&self, path: &str, filepath: &str) -> JanxValue {
        let path = path.to_string();
        let filepath = filepath.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::UploadFile {
                path,
                filepath,
                response,
            })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn remove_file(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::RemoveFile { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn object_size(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::ObjectSize { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn rename_object(&self, path: &str, new_path: &str) -> JanxValue {
        let path = path.to_string();
        let new_path = new_path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::RenameObject {
                path,
                new_path,
                response,
            })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn download_to_file(&self, path: &str, filepath: &str) -> JanxValue {
        let path = path.to_string();
        let filepath = filepath.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::DownloadToFile {
                path,
                filepath,
                response,
            })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn download_to_buffer(&self, path: &str) -> Result<Vec<u8>, String> {
        self.backend.download_to_buffer(path.to_string())
    }

    pub fn ping(&self) -> bool {
        self.backend.ping()
    }

    pub fn execute_command(&self, command: &str) -> JanxValue {
        let command = command.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::ExecuteCommand { command, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_current_directory(&self) -> JanxValue {
        self.backend
            .call_janx(|response| WorkerCommand::GetCurrentDirectory { response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn change_current_directory(&self, path: &str) -> JanxValue {
        let path = path.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::ChangeCurrentDirectory { path, response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_features(&self) -> JanxValue {
        self.backend
            .call_janx(|response| WorkerCommand::GetFeatures { response })
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn execute_standard_command(&self, command: &str) -> JanxValue {
        let command = command.to_string();
        self.backend
            .call_janx(|response| WorkerCommand::ExecuteStandardCommand { command, response })
            .unwrap_or_else(|e| janx_error(e))
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
        let _ = self.backend.close();
    }
}
