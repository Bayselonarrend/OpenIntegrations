use serde_json::json;
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use std::collections::HashMap;
use common_utils::utils::json_error;
use common_tcp::tls_settings::TlsSettings;
use crate::component::client_state::ClientState;
use super::connection;
use super::proto_loader;
use super::grpc_caller::{self, CallParams};
use super::introspection;

pub struct GrpcBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

pub enum BackendCommand {
    Connect {
        address: String,
        tls_settings: Option<TlsSettings>,
        response: Sender<String>,
    },
    Disconnect {
        response: Sender<String>,
    },
    Call {
        params: CallParams,
        response: Sender<String>,
    },
    LoadProto {
        content: String,
        response: Sender<String>,
    },
    SetMetadata {
        metadata: HashMap<String, String>,
        response: Sender<String>,
    },
    ListServices {
        response: Sender<String>,
    },
    ListMethods {
        service_name: String,
        response: Sender<String>,
    },
    GetMethodInfo {
        service_name: String,
        method_name: String,
        response: Sender<String>,
    },
    Shutdown,
}

impl GrpcBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let thread_handle = thread::Builder::new()
            .name("opi_grpc_backend".to_string())
            .spawn(move || {
                let rt = tokio::runtime::Runtime::new().unwrap();
                let mut client_state = ClientState::new();

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Connect { address, tls_settings, response } => {
                            let result = rt.block_on(async {

                                match connection::establish_connection(&address, &tls_settings).await {
                                    Ok(channel) => {
                                        client_state.connected = true;
                                        client_state.address = address;
                                        client_state.tls_settings = tls_settings;
                                        client_state.channel = Some(channel);
                                        Ok(())
                                    },
                                    Err(e) => Err(e)
                                }
                            });
                            let response_msg = match result {
                                Ok(_) => "".to_string(),
                                Err(e) => e,
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::Disconnect { response } => {
                            client_state.disconnect();
                            let _ = response.send("".to_string());
                        }
                        BackendCommand::Call { params, response } => {
                            let result = if !client_state.connected {
                                Err("Not connected to gRPC server".to_string())
                            } else if let (Some(channel), Some(descriptor_pool)) = (&client_state.channel, &client_state.descriptor_pool) {
                                rt.block_on(grpc_caller::execute_grpc_call(channel, descriptor_pool, &client_state.metadata, &params))
                            } else {
                                Err("No active connection or proto files loaded".to_string())
                            };
                            
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::LoadProto { content, response } => {
                            let result = match proto_loader::load_proto_content(&content) {
                                Ok(descriptor_pool) => {
                                    client_state.descriptor_pool = Some(descriptor_pool);
                                    Ok(())
                                },
                                Err(e) => Err(e)
                            };
                            let response_msg = match result {
                                Ok(_) => "".to_string(),
                                Err(e) => e,
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::SetMetadata { metadata, response } => {
                            client_state.set_metadata(metadata);
                            let _ = response.send("".to_string());
                        }
                        BackendCommand::ListServices { response } => {
                            let result = if let Some(descriptor_pool) = &client_state.descriptor_pool {
                                introspection::list_services(descriptor_pool)
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::ListMethods { service_name, response } => {
                            let result = if let Some(descriptor_pool) = &client_state.descriptor_pool {
                                introspection::list_methods(descriptor_pool, &service_name)
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::GetMethodInfo { service_name, method_name, response } => {
                            let result = if let Some(descriptor_pool) = &client_state.descriptor_pool {
                                introspection::get_method_info(descriptor_pool, &service_name, &method_name)
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::Shutdown => break,
                    }
                }
            })
            .unwrap();

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }

    pub fn connect(&self, address: &str, tls_settings: &Option<TlsSettings>) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::Connect {
            address: address.to_string(),
            tls_settings: tls_settings.clone(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send connect command: {}", e))?;

        let response = response_rx.recv()
            .map_err(|e| format!("Failed to receive connect response: {}", e))?;

        if response.is_empty() {
            Ok(())
        } else {
            Err(response)
        }
    }

    pub fn disconnect(&self) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::Disconnect {
            response: response_tx,
        }).map_err(|e| format!("Failed to send disconnect command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive disconnect response: {}", e))?;

        Ok(())
    }

    pub fn call(&self, request_json: &str) -> Result<String, String> {
        let params: CallParams = serde_json::from_str(request_json)
            .map_err(|e| format!("Invalid request JSON: {}", e))?;

        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::Call {
            params,
            response: response_tx,
        }).map_err(|e| format!("Failed to send call command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive call response: {}", e))
    }

    pub fn load_proto(&self, content: &str) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::LoadProto {
            content: content.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send load_proto command: {}", e))?;

        let response = response_rx.recv()
            .map_err(|e| format!("Failed to receive load_proto response: {}", e))?;

        if response.is_empty() {
            Ok(())
        } else {
            Err(response)
        }
    }

    pub fn set_metadata(&self, metadata_json: &str) -> Result<(), String> {
        let metadata: HashMap<String, String> = serde_json::from_str(metadata_json)
            .map_err(|e| format!("Invalid metadata JSON: {}", e))?;

        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::SetMetadata {
            metadata,
            response: response_tx,
        }).map_err(|e| format!("Failed to send set_metadata command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive set_metadata response: {}", e))?;

        Ok(())
    }

    pub fn list_services(&self) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::ListServices {
            response: response_tx,
        }).map_err(|e| format!("Failed to send list_services command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive list_services response: {}", e))
    }

    pub fn list_methods(&self, service_name: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::ListMethods {
            service_name: service_name.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send list_methods command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive list_methods response: {}", e))
    }

    pub fn get_method_info(&self, service_name: &str, method_name: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::GetMethodInfo {
            service_name: service_name.to_string(),
            method_name: method_name.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send get_method_info command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive get_method_info response: {}", e))
    }
}

impl Drop for GrpcBackend {
    fn drop(&mut self) {
        let _ = self.tx.send(BackendCommand::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            if let Err(e) = handle.join() {
                eprintln!("gRPC backend thread panicked: {:?}", e);
            }
        }
    }
}