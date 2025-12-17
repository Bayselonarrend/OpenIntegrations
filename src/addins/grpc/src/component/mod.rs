mod backend_core;
mod connection;
mod proto_loader;
mod message_converter;
mod grpc_caller;
mod introspection;
mod client_state;
mod stream_manager;
mod streaming_caller;

use addin1c::{name, Variant};
use common_core::getset;
use common_utils::utils::{json_error, json_success};
use common_tcp::tls_settings::TlsSettings;
use std::sync::{Arc, Mutex};
use common_core::impl_raw_addin;

impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),              // 0
    name!("Disconnect"),           // 1
    name!("Call"),                 // 2
    name!("LoadProto"),            // 3
    name!("SetMetadata"),          // 4
    name!("SetTLS"),               // 5
    name!("ListServices"),         // 6
    name!("ListMethods"),          // 7
    name!("GetMethodInfo"),        // 8
    name!("CallServerStream"),     // 9
    name!("StartClientStream"),    // 10
    name!("StartBidiStream"),      // 11
    name!("SendMessage"),          // 12
    name!("GetNextMessage"),       // 13
    name!("FinishSending"),        // 14
    name!("FinishClientStream"),   // 15
    name!("GetStreamStatus"),      // 16
    name!("CloseStream"),          // 17
    name!("CompileProtos"),        // 18
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,  // Connect
        1 => 0,  // Disconnect
        2 => 1,  // Call
        3 => 2,  // LoadProto
        4 => 1,  // SetMetadata
        5 => 3,  // SetTLS
        6 => 0,  // ListServices
        7 => 1,  // ListMethods
        8 => 2,  // GetMethodInfo
        9 => 1,  // StartServerStream
        10 => 1, // StartClientStream
        11 => 1, // StartBidiStream
        12 => 2, // SendMessage
        13 => 1, // GetNextMessage
        14 => 1, // FinishSending
        15 => 1, // FinishClientStream
        16 => 1, // GetStreamStatus
        17 => 1, // CloseStream
        18 => 0, // CompileProtos
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let request_json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.call(&request_json))
        },
        3 => {
            let filename = params[0].get_string().unwrap_or("main.proto".to_string());
            let proto_content = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.load_proto(&filename, &proto_content))
        },
        4 => {
            let metadata_json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_metadata(&metadata_json))
        },
        5 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        },
        6 => Box::new(obj.list_services()),
        7 => {
            let service_name = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.list_methods(&service_name))
        },
        8 => {
            let service_name = params[0].get_string().unwrap_or("".to_string());
            let method_name = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.get_method_info(&service_name, &method_name))
        },
        9 => {
            let request_json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.call_server_stream(&request_json))
        },
        10 => {
            let request_json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.start_client_stream(&request_json))
        },
        11 => {
            let request_json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.start_bidi_stream(&request_json))
        },
        12 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            let message_json = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.send_message(&stream_id, &message_json))
        },
        13 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.get_next_message(&stream_id))
        },
        14 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.finish_sending(&stream_id))
        },
        15 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.finish_client_stream(&stream_id))
        },
        16 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.get_stream_status(&stream_id))
        },
        17 => {
            let stream_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.close_stream(&stream_id))
        },
        18 => Box::new(obj.compile_protos()),
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[
    name!("ServerAddress"),
];

pub struct AddIn {
    server_address: String,
    tls: Option<TlsSettings>,
    backend: Arc<Mutex<backend_core::GrpcBackend>>,
    initialized: bool,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server_address: String::new(),
            tls: None,
            backend: Arc::new(Mutex::new(backend_core::GrpcBackend::new())),
            initialized: false,
        }
    }

    pub fn connect(&mut self) -> String {
        if self.server_address.is_empty() {
            return json_error("Empty server address!");
        }

        if self.initialized {
            return json_error("Connection already initialized!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        match guard.connect(&self.server_address, &self.tls) {
            Ok(_) => {
                self.initialized = true;
                json_success()
            },
            Err(e) => json_error(&e)
        }
    }

    pub fn disconnect(&mut self) -> String {
        if !self.initialized {
            return json_error("Connection already closed!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        match guard.disconnect() {
            Ok(_) => {
                self.initialized = false;
                json_success()
            },
            Err(e) => json_error(&e)
        }
    }

    pub fn call(&mut self, request_json: &str) -> String {
        if !self.initialized {
            return json_error("Connection not initialized!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.call(request_json).unwrap_or_else(|e| json_error(&e))
    }

    pub fn load_proto(&mut self, filename: &str, proto_content: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        match guard.load_proto(filename, proto_content) {
            Ok(_) => json_success(),
            Err(e) => json_error(&e)
        }
    }

    pub fn compile_protos(&mut self) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        match guard.compile_protos() {
            Ok(_) => json_success(),
            Err(e) => json_error(&e)
        }
    }

    pub fn set_metadata(&mut self, metadata_json: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        match guard.set_metadata(metadata_json) {
            Ok(_) => json_success(),
            Err(e) => json_error(&e)
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        if self.initialized {
            return json_error("TLS settings can only be set before the connection is established");
        }
        
        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        json_success()
    }

    pub fn list_services(&mut self) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.list_services().unwrap_or_else(|e| json_error(&e))
    }

    pub fn list_methods(&mut self, service_name: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.list_methods(service_name).unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_method_info(&mut self, service_name: &str, method_name: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.get_method_info(service_name, method_name).unwrap_or_else(|e| json_error(&e))
    }

    pub fn call_server_stream(&mut self, request_json: &str) -> String {
        if !self.initialized {
            return json_error("Connection not initialized!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.call_server_stream(request_json).unwrap_or_else(|e| json_error(&e))
    }

    pub fn start_client_stream(&mut self, request_json: &str) -> String {
        if !self.initialized {
            return json_error("Connection not initialized!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.start_client_stream(request_json).unwrap_or_else(|e| json_error(&e))
    }

    pub fn start_bidi_stream(&mut self, request_json: &str) -> String {
        if !self.initialized {
            return json_error("Connection not initialized!");
        }

        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.start_bidi_stream(request_json).unwrap_or_else(|e| json_error(&e))
    }

    pub fn send_message(&mut self, stream_id: &str, message_json: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.send_message(stream_id, message_json).unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_next_message(&mut self, stream_id: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.get_next_message(stream_id).unwrap_or_else(|e| json_error(&e))
    }

    pub fn finish_sending(&mut self, stream_id: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.finish_sending(stream_id).unwrap_or_else(|e| json_error(&e))
    }

    pub fn finish_client_stream(&mut self, stream_id: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.finish_client_stream(stream_id).unwrap_or_else(|e| json_error(&e))
    }

    pub fn get_stream_status(&mut self, stream_id: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.get_stream_status(stream_id).unwrap_or_else(|e| json_error(&e))
    }

    pub fn close_stream(&mut self, stream_id: &str) -> String {
        let guard = match self.backend.lock() {
            Ok(lock) => lock,
            Err(e) => return json_error(&e.to_string())
        };

        guard.close_stream(stream_id).unwrap_or_else(|e| json_error(&e))
    }



    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.server_address as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {}
}