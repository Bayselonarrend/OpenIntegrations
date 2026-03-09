mod backend;
mod listener;

use std::sync::{Arc, Mutex};
use common_core::*;
use common_utils::utils::{json_error, json_success};
use crate::backend::TcpServerBackend;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                 // 0
    name!("Stop"),                  // 1
    name!("GetNextMessage"),        // 2
    name!("SendMessage"),           // 3
    name!("CloseConnection"),       // 4
    name!("ShutdownRead"),          // 5
    name!("ShutdownWrite"),         // 6
    name!("GetConnectionsList"),    // 7
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 2,  // Start(port, queue_size)
        1 => 0,  // Stop()
        2 => 1,  // GetNextMessage(timeout_ms)
        3 => 2,  // SendMessage(connection_id, message)
        4 => 1,  // CloseConnection(connection_id)
        5 => 1,  // ShutdownRead(connection_id)
        6 => 1,  // ShutdownWrite(connection_id)
        7 => 0,  // GetConnectionsList()
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let port = params[0].get_i32().unwrap_or(0) as u16;
            let queue_size = params[1].get_i32().unwrap_or(10) as usize;
            Box::new(obj.start_server(port, queue_size))
        },
        1 => {
            Box::new(obj.stop_server())
        },
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.get_next_message(timeout_ms))
        },
        3 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_message(&connection_id, message.to_vec()))
        },
        4 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.close_connection(&connection_id))
        },
        5 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_read(&connection_id))
        },
        6 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_write(&connection_id))
        },
        7 => {
            Box::new(obj.get_connections_list())
        },
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    backend: Arc<Mutex<TcpServerBackend>>,
    started: bool,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            backend: Arc::new(Mutex::new(TcpServerBackend::new())),
            started: false,
        }
    }

    pub fn start_server(&mut self, port: u16, queue_size: usize) -> String {
        if self.started {
            return json_error("Server already started");
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

        // Сначала закрываем все соединения gracefully
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

    pub fn get_next_message(&self, timeout_ms: u64) -> String {
        if !self.started {
            return json_error("Server not started");
        }

        match self.backend.lock() {
            Ok(backend) => backend.get_next_message(timeout_ms),
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