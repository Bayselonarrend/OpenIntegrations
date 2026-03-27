mod http;
mod websocket;

use std::sync::Arc;
use common_core::*;
use common_utils::utils::json_error;
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use crate::http::HttpServer;
use crate::websocket::WebSocketServer;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("StartHTTP"),                  // 0
    name!("StopHTTP"),                   // 1
    name!("HandleRequest"),              // 2
    name!("SendResponse"),               // 3
    name!("StartWebSocket"),             // 4
    name!("StopWebSocket"),              // 5
    name!("GetWebSocketMessage"),        // 6
    name!("SendWebSocketMessage"),       // 7
    name!("CloseWebSocket"),             // 8
    name!("GetWebSocketConnections"),    // 9
    name!("RetrieveBinaryFromVault"),    // 10
    name!("GetLogs"),                    // 11
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // StartHTTP(port, config_json, logger_config_json)
        1 => 0,  // StopHTTP()
        2 => 1,  // HandleRequest(timeout_ms)
        3 => 3,  // SendResponse(request_id, status_code, body)
        4 => 3,  // StartWebSocket(port, config_json, logger_config_json)
        5 => 0,  // StopWebSocket()
        6 => 2,  // GetWebSocketMessage(connection_id, timeout_ms)
        7 => 2,  // SendWebSocketMessage(connection_id, message)
        8 => 1,  // CloseWebSocket(connection_id)
        9 => 0,  // GetWebSocketConnections()
        10 => 1, // RetrieveBinaryFromVault(vault_key)
        11 => 1, // GetLogs(count)
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

            if let Err(e) = obj.init_logger_if_needed(&logger_config) {
                return Box::new(json_error(&e));
            };
            Box::new(obj.http_server.start(port, &config))
        },
        1 => Box::new(obj.http_server.stop()),
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.http_server.handle_request(timeout_ms))
        },
        3 => {
            let request_id = params[0].get_string().unwrap_or_default();
            let status_code = params[1].get_i32().unwrap_or(200) as u16;
            let body = params[2].get_blob().unwrap_or(&empty_array);
            Box::new(obj.http_server.send_response(&request_id, status_code, body.to_vec()))
        },
        4 => {
            let port = params[0].get_i32().unwrap_or(8080) as u16;
            let config = params[1].get_string().unwrap_or_default();
            let logger_config = params[2].get_string().unwrap_or_default();

            if let Err(e) = obj.init_logger_if_needed(&logger_config) {
                return Box::new(json_error(&e));
            };
            Box::new(obj.ws_server.start(port, &config))

        },
        5 => Box::new(obj.ws_server.stop()),
        6 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let timeout_ms = params[1].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.ws_server.get_message(&connection_id, timeout_ms))
        },
        7 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.ws_server.send_message(&connection_id, message.to_vec()))
        },
        8 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.ws_server.close_connection(&connection_id))
        },
        9 => Box::new(obj.ws_server.get_connections_list()),
        10 => {
            let vault_key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&vault_key))
        },
        11 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    http_server: HttpServer,
    ws_server: WebSocketServer,
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        let vault = BinaryVault::new();
        AddIn {
            http_server: HttpServer::new(vault.clone()),
            ws_server: WebSocketServer::new(vault.clone()),
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

        self.http_server.set_logger(logger_arc.clone());
        self.ws_server.set_logger(logger_arc);

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
        if self.http_server.is_started() {
            let _ = self.http_server.stop();
        }
        if self.ws_server.is_started() {
            let _ = self.ws_server.stop();
        }
    }
}
