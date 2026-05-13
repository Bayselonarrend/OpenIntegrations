mod backend;
mod server;
mod wrapper;

use std::sync::Arc;
use common_core::*;
use common_utils::utils::json_error;
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use wrapper::HttpServer;

impl_addin_exports!(AddIn, "HTTPServer");
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func, "HTTPServer");

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                      // 0
    name!("Stop"),                       // 1
    name!("GetNextMessage"),             // 2
    name!("GetMessage"),                 // 3
    name!("SendMessage"),                // 4
    name!("ListConnections"),            // 5
    name!("RetrieveBinaryFromVault"),    // 6
    name!("GetLogs"),                    // 7
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, config_json, logger_config_json)
        1 => 0,  // Stop()
        2 => 1,  // GetNextMessage(timeout_ms)
        3 => 1,  // GetMessage(request_id)
        4 => 3,  // SendMessage(request_id, status_code, body)
        5 => 0,  // ListConnections()
        6 => 1,  // RetrieveBinaryFromVault(vault_key)
        7 => 1,  // GetLogs(count)
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            // Start(port, config_json, logger_config_json)
            let port = params[0].get_i32().unwrap_or(8080) as u16;
            let config = params[1].get_string().unwrap_or_default();
            let logger_config = params[2].get_string().unwrap_or_default();

            if let Err(e) = obj.init_logger_if_needed(&logger_config) {
                return Box::new(json_error(&e));
            };
            Box::new(obj.server.start(port, &config))
        },
        1 => {
            // Stop()
            Box::new(obj.server.stop())
        },
        2 => {
            // GetNextMessage(timeout_ms)
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.server.handle_request(timeout_ms))
        },
        3 => {
            // GetMessage(request_id)
            let request_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.server.handle_request_by_id(&request_id))
        },
        4 => {
            // SendMessage(request_id, status_code, body)
            let request_id = params[0].get_string().unwrap_or_default();
            let status_code = params[1].get_i32().unwrap_or(200) as u16;
            let body = params[2].get_blob().unwrap_or(&empty_array);
            Box::new(obj.server.send_response(&request_id, status_code, body.to_vec()))
        },
        5 => {
            // ListConnections()
            Box::new(obj.server.get_pending_requests())
        },
        6 => {
            // RetrieveBinaryFromVault(vault_key)
            let vault_key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&vault_key))
        },
        7 => {
            // GetLogs(count)
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    server: HttpServer,
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        let vault = BinaryVault::new();
        AddIn {
            server: HttpServer::new(vault.clone()),
            vault,
            logger: None,
        }
    }

    fn init_logger_if_needed(&mut self, logger_config: &str) -> Result<(), String> {
        if logger_config.is_empty() || self.logger.is_some() {
            return Ok(());
        }

        let logger = Logger::from_json(logger_config)
            .map_err(|e| format!("Failed to initialize logger: {}", e))?;
        
        let logger_arc = Arc::new(logger);
        self.logger = Some(logger_arc.clone());
        self.server.set_logger(logger_arc);

        Ok(())
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
        if self.server.is_started() {
            let _ = self.server.stop();
        }
    }
}
