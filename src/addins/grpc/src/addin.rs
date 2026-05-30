use std::collections::HashMap;
use std::sync::Arc;

use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};
use serde_json::{json, Value};

use crate::backend::GrpcBackend;

pub struct StoredSettings {
    pub settings: HashMap<String, Value>,
    pub metadata: HashMap<String, String>,
}

impl Default for StoredSettings {
    fn default() -> Self {
        Self {
            settings: HashMap::new(),
            metadata: HashMap::new(),
        }
    }
}

pub struct AddIn {
    pub(crate) server_address: String,
    pub(crate) stored_settings: StoredSettings,
    pub(crate) tls: Option<TlsSettings>,
    pub(crate) client: GrpcBackend,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server_address: String::new(),
            stored_settings: StoredSettings::default(),
            tls: None,
            client: GrpcBackend::new(),
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> String {
        if logger_config.is_empty() {
            return json_error("Logger config is empty");
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => match self.client.set_logger(Arc::new(logger)) {
                Ok(()) => json_success(),
                Err(e) => json_error(&e),
            },
            Err(e) => json_error(&format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        match self.client.get_logs(count) {
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

    pub fn connect(&mut self) -> String {
        if self.server_address.is_empty() {
            return json_error("Empty server address!");
        }

        if self.client.is_connected() {
            return json_error("Connection already initialized!");
        }

        match self.client.connect(&self.server_address, &self.tls) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn disconnect(&mut self) -> String {
        match self.client.disconnect() {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn call(&mut self, request: &JanxValue) -> JanxValue {
        self.client
            .call(request)
            .unwrap_or_else(|e| common_utils::utils::janx_error(&e))
    }

    pub fn load_proto(&mut self, filename: &str, proto_content: &str) -> String {
        match self.client.load_proto(filename, proto_content) {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn compile_protos(&mut self) -> String {
        match self.client.compile_protos() {
            Ok(()) => json_success(),
            Err(e) => json_error(&e),
        }
    }

    pub fn set_metadata(&mut self, metadata_json: &str) -> String {
        let metadata: HashMap<String, String> = match serde_json::from_str(metadata_json) {
            Ok(map) => map,
            Err(e) => return json_error(&format!("Invalid metadata JSON: {}", e)),
        };

        match self.client.set_metadata(metadata.clone()) {
            Ok(()) => {
                self.stored_settings.metadata = metadata;
                json_success()
            }
            Err(e) => json_error(&e),
        }
    }

    pub fn get_settings(&self) -> String {
        let s = &self.stored_settings;
        if s.metadata.is_empty() {
            return serde_json::to_string(&s.settings).unwrap_or_else(|_| "{}".to_string());
        }

        let mut result = s.settings.clone();
        result.insert(
            "metadata".to_string(),
            serde_json::to_value(&s.metadata).unwrap_or(Value::Null),
        );
        serde_json::to_string(&result).unwrap_or_else(|_| "{}".to_string())
    }

    pub fn store_settings(&mut self, settings: String) -> String {
        match serde_json::from_str::<HashMap<String, Value>>(&settings) {
            Ok(value) => {
                self.stored_settings.settings = value;
                json_success()
            }
            Err(e) => json_error(&format!("Invalid settings JSON: {}", e)),
        }
    }

    pub fn set_tls(
        &mut self,
        use_tls: bool,
        accept_invalid_certs: bool,
        ca_cert_path: &str,
    ) -> String {
        if self.client.is_connected() {
            return json_error(
                "TLS settings can only be set before the connection is established",
            );
        }

        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        json_success()
    }

    pub fn list_services(&mut self) -> String {
        self.client
            .list_services()
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn list_methods(&mut self, service_name: &str) -> String {
        self.client
            .list_methods(service_name)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_method_info(&mut self, service_name: &str, method_name: &str) -> String {
        self.client
            .get_method_info(service_name, method_name)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn call_server_stream(&mut self, request: &JanxValue) -> String {
        self.client
            .call_server_stream(request)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn start_client_stream(&mut self, request: &JanxValue) -> String {
        self.client
            .start_client_stream(request)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn start_bidi_stream(&mut self, request: &JanxValue) -> String {
        self.client
            .start_bidi_stream(request)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn send_message(&mut self, stream_id: &str, message: &JanxValue) -> String {
        self.client
            .send_message(stream_id, message)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_next_message(&mut self, stream_id: &str) -> JanxValue {
        self.client
            .get_next_message(stream_id)
            .unwrap_or_else(|e| common_utils::utils::janx_error(&e))
    }

    pub fn finish_sending(&mut self, stream_id: &str) -> String {
        self.client
            .finish_sending(stream_id)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn close_stream(&mut self, stream_id: &str) -> String {
        self.client
            .close_stream(stream_id)
            .unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            0 => &self.server_address as &dyn common_core::getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if self.client.is_connected() {
            let _ = self.client.close_all_streams();
            let _ = self.client.disconnect();
        }
    }
}
