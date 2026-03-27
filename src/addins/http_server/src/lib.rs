mod backend;
mod server;

use std::sync::{Arc, Mutex};
use common_core::*;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use crate::backend::HttpServerBackend;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                      // 0
    name!("Stop"),                       // 1
    name!("HandleRequest"),              // 2
    name!("SendResponse"),               // 3
    name!("GetWebSocketMessage"),        // 4
    name!("SendWebSocketMessage"),       // 5
    name!("CloseWebSocket"),             // 6
    name!("GetConnectionsList"),         // 7
    name!("RetrieveBinaryFromVault"),    // 8
    name!("GetLogs"),                    // 9
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, config_json, logger_config_json)
        1 => 0,  // Stop()
        2 => 1,  // HandleRequest(timeout_ms)
        3 => 3,  // SendResponse(request_id, status_code, body)
        4 => 2,  // GetWebSocketMessage(connection_id, timeout_ms)
        5 => 2,  // SendWebSocketMessage(connection_id, message)
        6 => 1,  // CloseWebSocket(connection_id)
        7 => 0,  // GetConnectionsList()
        8 => 1,  // RetrieveBinaryFromVault(vault_key)
        9 => 1,  // GetLogs(count)
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let port = params[0].get_i32().unwrap_or(8080) as u16;
            let config = params[1].get_string().unwrap_or_default();
            let logger_config = params[2].get_string().unwrap_or_default();
            Box::new(obj.start_server(port, &config, &logger_config))
        },
        1 => {
            Box::new(obj.stop_server())
        },
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.handle_request(timeout_ms))
        },
        3 => {
            let request_id = params[0].get_string().unwrap_or_default();
            let status_code = params[1].get_i32().unwrap_or(200) as u16;
            let body = params[2].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_response(&request_id, status_code, body.to_vec()))
        },
        4 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let timeout_ms = params[1].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.get_websocket_message(&connection_id, timeout_ms))
        },
        5 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_websocket_message(&connection_id, message.to_vec()))
        },
        6 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.close_websocket(&connection_id))
        },
        7 => {
            Box::new(obj.get_connections_list())
        },
        8 => {
            let vault_key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&vault_key))
        },
        9 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    backend: Arc<Mutex<HttpServerBackend>>,
    vault: BinaryVault,
    started: bool,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        let vault = BinaryVault::new();
        AddIn {
            backend: Arc::new(Mutex::new(HttpServerBackend::new(vault.clone()))),
            vault,
            started: false,
            logger: None,
        }
    }

    pub fn get_logs(&self, count: usize) -> String {
        if let Some(ref logger) = self.logger {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            
            serde_json::json!({
                "result": true,
                "logs": logs,
                "total": total,
                "returned": logs.len()
            }).to_string()
        } else {
            json_error("Logger not initialized")
        }
    }

    pub fn start_server(&mut self, port: u16, config: &str, logger_config: &str) -> String {
        if self.started {
            return json_error("Server already started");
        }

        if !logger_config.is_empty() {
            match Logger::from_json(logger_config) {
                Ok(logger) => {
                    let logger_arc = Arc::new(logger);
                    self.logger = Some(logger_arc.clone());

                    if let Ok(mut backend) = self.backend.lock() {
                        backend.set_logger(logger_arc);
                    }
                }
                Err(e) => {
                    return json_error(&format!("Failed to initialize logger: {}", e));
                }
            }
        }

        let result = match self.backend.lock() {
            Ok(backend) => backend.start(port, config),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        };

        if result.contains("\"result\":true") {
            self.started = true;
        }

        result
    }

    pub fn stop_server(&mut self) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(mut backend) => {
                backend.shutdown();
                self.started = false;
                json_success()
            }
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn handle_request(&self, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.handle_request(timeout_ms),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_response(&self, request_id: &str, status_code: u16, body: Vec<u8>) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_response(request_id.to_string(), status_code, body),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_websocket_message(&self, connection_id: &str, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_websocket_message(connection_id.to_string(), timeout_ms),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_websocket_message(&self, connection_id: &str, message: Vec<u8>) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_websocket_message(connection_id.to_string(), message),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_websocket(&self, connection_id: &str) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_websocket(connection_id.to_string()),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_connections_list(&self) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_connections_list(),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn retrieve_binary_from_vault(&self, vault_key: &str) -> Vec<u8> {
        self.vault.retrieve(&vault_key.to_string()).unwrap_or_else(|_| Vec::new())
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if self.started {
            let _ = self.stop_server();
        }
    }
}
