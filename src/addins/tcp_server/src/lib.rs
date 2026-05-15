mod backend;
mod listener;

use std::sync::{Arc, Mutex};
use common_core::*;
use common_utils::utils::{json_error, json_success, version};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use crate::backend::TcpServerBackend;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                      // 0
    name!("Stop"),                       // 1
    name!("GetNextMessage"),             // 2
    name!("GetMessage"),                 // 3
    name!("SendMessage"),                // 4
    name!("CloseConnection"),            // 5
    name!("ShutdownRead"),               // 6
    name!("ShutdownWrite"),              // 7
    name!("ListConnections"),            // 8
    name!("RetrieveBinaryFromVault"),    // 9
    name!("GetLogs"),                    // 10
    name!("Version"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, queue_size, logger_config_json)
        1 => 0,  // Stop()
        2 => 2,  // GetNextMessage(timeout_ms, max_message_size)
        3 => 3,  // GetMessage(connection_id, timeout_ms, max_message_size)
        4 => 2,  // SendMessage(connection_id, message)
        5 => 1,  // CloseConnection(connection_id)
        6 => 1,  // ShutdownRead(connection_id)
        7 => 1,  // ShutdownWrite(connection_id)
        8 => 0,  // GetConnectionsList()
        9 => 1,  // RetrieveBinaryFromVault()
        10 => 1, // GetLogs(count)
        11 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let port = params[0].get_i32().unwrap_or(0) as u16;
            let queue_size = params[1].get_i32().unwrap_or(10) as usize;
            let logger_config = params[2].get_string().unwrap_or_default();
            Box::new(obj.start_server(port, queue_size, &logger_config))
        },
        1 => {
            Box::new(obj.stop_server())
        },
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            let max_message_size = params[1].get_i32().unwrap_or(8192) as usize;
            Box::new(obj.get_next_message(timeout_ms, max_message_size))
        },
        3 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let timeout_ms = params[1].get_i32().unwrap_or(1000) as u64;
            let max_message_size = params[2].get_i32().unwrap_or(8192) as usize;
            Box::new(obj.get_message_from_connection(&connection_id, timeout_ms, max_message_size))
        },
        4 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_message(&connection_id, message.to_vec()))
        },
        5 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.close_connection(&connection_id))
        },
        6 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_read(&connection_id))
        },
        7 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_write(&connection_id))
        },
        8 => {
            Box::new(obj.get_connections_list())
        },
        9 => {
            let vault_key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&vault_key))
        },
        10 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        11 => Box::new(version()),
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    backend: Arc<Mutex<TcpServerBackend>>,
    vault: BinaryVault,
    started: bool,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        let vault = BinaryVault::new();
        AddIn {
            backend: Arc::new(Mutex::new(TcpServerBackend::new(vault.clone()))),
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

    pub fn start_server(&mut self, port: u16, queue_size: usize, logger_config: &str) -> String {
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
            Ok(backend) => backend.start(port, queue_size),
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

        let _ = self.close_all_connections();

        match self.backend.lock() {
            Ok(mut backend) => {
                backend.shutdown();
                self.started = false;
                json_success()
            }
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_all_connections(&self) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_all_connections(),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_next_message(timeout_ms, max_message_size),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn get_message_from_connection(&self, connection_id: &str, timeout_ms: u64, max_message_size: usize) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_message_from_connection(connection_id.to_string(), timeout_ms, max_message_size),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn send_message(&self, connection_id: &str, message: Vec<u8>) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.send_message(connection_id.to_string(), message),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn close_connection(&self, connection_id: &str) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.close_connection(connection_id.to_string()),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn shutdown_read(&self, connection_id: &str) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.shutdown_read(connection_id.to_string()),
            Err(e) => json_error(&format!("Failed to lock backend: {}", e)),
        }
    }

    pub fn shutdown_write(&self, connection_id: &str) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.shutdown_write(connection_id.to_string()),
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