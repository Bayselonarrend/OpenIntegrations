mod client;
mod connection;
mod sending;
mod receiving;

use std::sync::{Arc, Mutex};
use common_core::*;
use common_utils::utils::json_error;
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use client::WebSocketClient;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),                    // 0
    name!("Disconnect"),                 // 1
    name!("SendText"),                   // 2
    name!("SendBinary"),                 // 3
    name!("ReceiveMessage"),             // 4
    name!("Ping"),                       // 5
    name!("Close"),                      // 6
    name!("IsConnected"),                // 7
    name!("SetHeaders"),                 // 8
    name!("RetrieveBinaryFromVault"),    // 9
    name!("GetLogs"),                    // 10
    name!("SetTLS"),                     // 11
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 2,  // Connect(url, logger_config_json)
        1 => 0,  // Disconnect()
        2 => 1,  // SendText(text)
        3 => 1,  // SendBinary(data)
        4 => 1,  // ReceiveMessage(timeout_ms)
        5 => 0,  // Ping()
        6 => 2,  // Close(code, reason)
        7 => 0,  // IsConnected()
        8 => 1,  // SetHeaders(headers_json)
        9 => 1,  // RetrieveBinaryFromVault(vault_key)
        10 => 1, // GetLogs(count)
        11 => 3, // SetTLS(use_tls, accept_invalid_certs, ca_cert_path)
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let url = params[0].get_string().unwrap_or_default();
            let logger_config = params[1].get_string().unwrap_or_default();

            if let Err(e) = obj.init_logger_if_needed(&logger_config) {
                return Box::new(json_error(&e));
            };
            
            let mut client = obj.client.lock().unwrap();
            Box::new(client.connect(&url))
        },
        1 => {
            let mut client = obj.client.lock().unwrap();
            Box::new(client.disconnect())
        },
        2 => {
            let text = params[0].get_string().unwrap_or_default();
            let mut client = obj.client.lock().unwrap();
            Box::new(client.send_text(&text))
        },
        3 => {
            let data = params[0].get_blob().unwrap_or(&empty_array);
            let mut client = obj.client.lock().unwrap();
            Box::new(client.send_binary(data.to_vec()))
        },
        4 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            let mut client = obj.client.lock().unwrap();
            Box::new(client.receive_message(timeout_ms))
        },
        5 => {
            let mut client = obj.client.lock().unwrap();
            Box::new(client.ping())
        },
        6 => {
            let code = params[0].get_i32().unwrap_or(1000) as u16;
            let reason = params[1].get_string().unwrap_or_default();
            let mut client = obj.client.lock().unwrap();
            Box::new(client.close(code, &reason))
        },
        7 => {
            let client = obj.client.lock().unwrap();
            Box::new(client.is_connected())
        },
        8 => {
            let headers_json = params[0].get_string().unwrap_or_default();
            let mut client = obj.client.lock().unwrap();
            Box::new(client.set_headers(&headers_json))
        },
        9 => {
            let vault_key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&vault_key))
        },
        10 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        },
        11 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            let mut client = obj.client.lock().unwrap();
            Box::new(client.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    client: Arc<Mutex<WebSocketClient>>,
    vault: BinaryVault,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        let vault = BinaryVault::new();
        AddIn {
            client: Arc::new(Mutex::new(WebSocketClient::new(vault.clone()))),
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
        
        let mut client = self.client.lock().unwrap();
        client.set_logger(logger_arc);

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
        let mut client = self.client.lock().unwrap();
        let _ = client.disconnect();
    }
}
