use std::collections::BTreeMap;
use std::collections::HashMap;
use std::sync::{Arc, Mutex};

use common_core::{FromJanx, JanxValue};
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::GrpcBackend;

pub struct StoredSettings {
    pub settings: BTreeMap<String, JanxValue>,
    pub metadata: HashMap<String, String>,
}

impl Default for StoredSettings {
    fn default() -> Self {
        Self {
            settings: BTreeMap::new(),
            metadata: HashMap::new(),
        }
    }
}

struct State {
    client: GrpcBackend,
    stored_settings: StoredSettings,
    tls: Option<TlsSettings>,
}

pub struct AddIn {
    pub(crate) server_address: String,
    state: Arc<Mutex<State>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server_address: String::new(),
            state: Arc::new(Mutex::new(State {
                client: GrpcBackend::new(),
                stored_settings: StoredSettings::default(),
                tls: None,
            })),
        }
    }

    fn lock_state(&self) -> std::sync::MutexGuard<'_, State> {
        lock_unpoisoned(&self.state)
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut state = self.lock_state();
                match state.client.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let state = self.lock_state();
        match state.client.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn connect(&mut self) -> JanxValue {
        if self.server_address.is_empty() {
            return janx_error("Empty server address!");
        }

        let mut state = self.lock_state();
        if state.client.is_connected() {
            return janx_error("Connection already initialized!");
        }

        let tls = state.tls.clone();
        match state.client.connect(&self.server_address, &tls) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn disconnect(&mut self) -> JanxValue {
        let mut state = self.lock_state();
        match state.client.disconnect() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn call(&mut self, request: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .call(request)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn load_proto(&mut self, filename: &str, proto_content: &str) -> JanxValue {
        let mut state = self.lock_state();
        match state.client.load_proto(filename, proto_content) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn compile_protos(&mut self) -> JanxValue {
        let mut state = self.lock_state();
        match state.client.compile_protos() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_metadata(&mut self, metadata_janx: &JanxValue) -> JanxValue {
        let metadata: HashMap<String, String> = match metadata_janx.as_object() {
            Some(map) => map
                .iter()
                .filter_map(|(k, v)| String::from_janx(v).map(|value| (k.clone(), value)))
                .collect(),
            None => return janx_error("Invalid metadata Janx object"),
        };

        let mut state = self.lock_state();
        match state.client.set_metadata(metadata.clone()) {
            Ok(()) => {
                state.stored_settings.metadata = metadata;
                janx_success(None, None)
            }
            Err(e) => janx_error(e),
        }
    }

    pub fn get_settings(&self) -> JanxValue {
        let state = self.lock_state();
        let s = &state.stored_settings;
        let mut map: BTreeMap<String, JanxValue> = s.settings.clone();

        if !s.metadata.is_empty() {
            let metadata = s
                .metadata
                .iter()
                .map(|(k, v)| (k.clone(), JanxValue::String(v.clone())))
                .collect();
            map.insert("metadata".to_string(), JanxValue::Object(metadata));
        }

        JanxValue::Object(map)
    }

    pub fn store_settings(&mut self, settings: &JanxValue) -> JanxValue {
        let Some(value) = settings.as_object() else {
            return janx_error("Invalid settings Janx object");
        };

        let mut state = self.lock_state();
        state.stored_settings.settings = value.clone();
        janx_success(None, None)
    }

    pub fn set_tls(
        &mut self,
        use_tls: bool,
        accept_invalid_certs: bool,
        ca_cert_path: &str,
    ) -> JanxValue {
        let mut state = self.lock_state();
        if state.client.is_connected() {
            return janx_error(
                "TLS settings can only be set before the connection is established",
            );
        }

        state.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        janx_success(None, None)
    }

    pub fn list_services(&mut self) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .list_services()
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn list_methods(&mut self, service_name: &str) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .list_methods(service_name)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_method_info(&mut self, service_name: &str, method_name: &str) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .get_method_info(service_name, method_name)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn call_server_stream(&mut self, request: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .call_server_stream(request)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn start_client_stream(&mut self, request: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .start_client_stream(request)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn start_bidi_stream(&mut self, request: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .start_bidi_stream(request)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn send_message(&mut self, stream_id: &str, message: &JanxValue) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .send_message(stream_id, message)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_next_message(&mut self, stream_id: &str) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .get_next_message(stream_id)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn finish_sending(&mut self, stream_id: &str) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .finish_sending(stream_id)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn close_stream(&mut self, stream_id: &str) -> JanxValue {
        let mut state = self.lock_state();
        state
            .client
            .close_stream(stream_id)
            .unwrap_or_else(|e| janx_error(e))
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
        let mut state = lock_unpoisoned(&self.state);
        if state.client.is_connected() {
            let _ = state.client.close_all_streams();
            let _ = state.client.disconnect();
        }
    }
}
