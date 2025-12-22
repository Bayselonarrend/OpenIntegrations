use serde_json::json;
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use std::collections::HashMap;
use common_utils::utils::json_error;
use common_tcp::tls_settings::TlsSettings;
use common_binary::vault::BinaryVault;
use crate::client_state::ClientState;
use super::connection;
use super::proto_loader;
use super::grpc_caller::{self, CallParams};
use super::introspection;

pub struct GrpcBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
    pub(crate) binary_vault: BinaryVault,
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
        filename: String,
        content: String,
        response: Sender<String>,
    },
    CompileProtos {
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
    CallServerStream {
        params_json: String,
        response: Sender<String>,
    },
    StartClientStream {
        params_json: String,
        response: Sender<String>,
    },
    StartBidiStream {
        params_json: String,
        response: Sender<String>,
    },
    SendMessage {
        stream_id: String,
        message_json: String,
        response: Sender<String>,
    },
    GetNextMessage {
        stream_id: String,
        response: Sender<String>,
    },
    FinishSending {
        stream_id: String,
        response: Sender<String>,
    },
    CloseStream {
        stream_id: String,
        response: Sender<String>,
    },
    CloseAllStreams {
        response: Sender<String>,
    },
    Shutdown,
}

impl GrpcBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();
        
        let binary_vault = BinaryVault::new();
        let vault_clone = binary_vault.clone();

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
                            let _ = rt.block_on(client_state.stream_manager.close_all_streams());
                            client_state.disconnect();
                            let _ = response.send("".to_string());
                        }
                        BackendCommand::Call { params, response } => {
                            let panic_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {

                                if !client_state.connected {
                                    Err("Not connected to gRPC server".to_string())
                                } else if let (Some(channel), Some(descriptor_pool)) = (&mut client_state.channel, &client_state.descriptor_pool) {
                                    rt.block_on(grpc_caller::execute_grpc_call(&vault_clone, channel, descriptor_pool, &client_state.metadata, &params))
                                } else {
                                    Err("No active connection or proto files loaded".to_string())
                                }
                            }));
                            
                            let result = panic_result.unwrap_or_else(|panic_info| {
                                let panic_msg = common_core::extract_panic_message(&panic_info);
                                Err(format!("Backend panic in Call: {}", panic_msg))
                            });
                            
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::LoadProto { filename, content, response } => {

                            client_state.proto_files.insert(filename, content);
                            let _ = response.send("".to_string());
                        }
                        BackendCommand::CompileProtos { response } => {

                            let result = if client_state.proto_files.is_empty() {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            } else {
                                match proto_loader::load_proto_files(client_state.proto_files.clone()) {
                                    Ok(descriptor_pool) => {
                                        client_state.descriptor_pool = Some(descriptor_pool);
                                        Ok(())
                                    },
                                    Err(e) => Err(e)
                                }
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
                        BackendCommand::CallServerStream { params_json, response } => {
                            use crate::streaming_caller;
                            
                            let panic_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
                                if !client_state.connected {
                                    Err("Not connected to gRPC server".to_string())
                                } else if let (Some(channel), Some(descriptor_pool)) = (&client_state.channel, &client_state.descriptor_pool) {
                                    let params: streaming_caller::StreamCallParams = match serde_json::from_str(&params_json) {
                                        Ok(p) => p,
                                        Err(e) => {
                                            return Err(format!("Invalid params: {}", e));
                                        }
                                    };
                                    rt.block_on(streaming_caller::start_server_stream(
                                        &vault_clone,
                                        channel,
                                        descriptor_pool,
                                        &client_state.metadata,
                                        &client_state.stream_manager,
                                        &params
                                    ))
                                } else {
                                    Err("No active connection or proto files loaded".to_string())
                                }
                            }));
                            
                            let result = panic_result.unwrap_or_else(|panic_info| {
                                let panic_msg = common_core::extract_panic_message(&panic_info);
                                Err(format!("Backend panic in CallServerStream: {}", panic_msg))
                            });
                            
                            let response_msg = match result {
                                Ok(stream_id) => json!({"result": true, "streamId": stream_id}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::StartClientStream { params_json, response } => {
                            use crate::streaming_caller;
                            
                            let panic_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
                                if !client_state.connected {
                                    Err("Not connected to gRPC server".to_string())
                                } else if let (Some(channel), Some(descriptor_pool)) = (&client_state.channel, &client_state.descriptor_pool) {
                                    let params: streaming_caller::StreamCallParams = match serde_json::from_str(&params_json) {
                                        Ok(p) => p,
                                        Err(e) => {
                                            return Err(format!("Invalid params: {}", e));
                                        }
                                    };
                                    rt.block_on(streaming_caller::start_client_stream(
                                        &vault_clone,
                                        channel,
                                        descriptor_pool,
                                        &client_state.metadata,
                                        &client_state.stream_manager,
                                        &params
                                    ))
                                } else {
                                    Err("No active connection or proto files loaded".to_string())
                                }
                            }));
                            
                            let result = panic_result.unwrap_or_else(|panic_info| {
                                let panic_msg = common_core::extract_panic_message(&panic_info);
                                Err(format!("Backend panic in StartClientStream: {}", panic_msg))
                            });
                            
                            let response_msg = match result {
                                Ok(stream_id) => json!({"result": true, "streamId": stream_id}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::StartBidiStream { params_json, response } => {
                            use crate::streaming_caller;
                            
                            let panic_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
                                if !client_state.connected {
                                    Err("Not connected to gRPC server".to_string())
                                } else if let (Some(channel), Some(descriptor_pool)) = (&client_state.channel, &client_state.descriptor_pool) {
                                    let params: streaming_caller::StreamCallParams = match serde_json::from_str(&params_json) {
                                        Ok(p) => p,
                                        Err(e) => {
                                            return Err(format!("Invalid params: {}", e));
                                        }
                                    };
                                    rt.block_on(streaming_caller::start_bidi_stream(
                                        &vault_clone,
                                        channel,
                                        descriptor_pool,
                                        &client_state.metadata,
                                        &client_state.stream_manager,
                                        &params
                                    ))
                                } else {
                                    Err("No active connection or proto files loaded".to_string())
                                }
                            }));
                            
                            let result = panic_result.unwrap_or_else(|panic_info| {
                                let panic_msg = common_core::extract_panic_message(&panic_info);
                                Err(format!("Backend panic in StartBidiStream: {}", panic_msg))
                            });
                            
                            let response_msg = match result {
                                Ok(stream_id) => json!({"result": true, "streamId": stream_id}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::SendMessage { stream_id, message_json, response } => {
                            use crate::streaming_caller;

                            let result = rt.block_on(async {
                                let message_value: serde_json::Value = serde_json::from_str(&message_json)
                                    .map_err(|e| format!("Invalid message JSON: {}", e))?;
                                
                                streaming_caller::send_stream_message(
                                    &vault_clone,
                                    &client_state.stream_manager,
                                    &stream_id,
                                    &message_value
                                ).await
                            });
                            
                            let response_msg = match result {
                                Ok(_) => json!({"result": true}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::GetNextMessage { stream_id, response } => {
                            use crate::streaming_caller;
                            
                            let result = rt.block_on(streaming_caller::get_next_message(
                                &vault_clone,
                                &client_state.stream_manager,
                                &stream_id
                            ));
                            
                            let response_msg = match result {
                                Ok(data) => data.to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::FinishSending { stream_id, response } => {
                            let result = rt.block_on(client_state.stream_manager.finish_sending(&stream_id));
                            
                            let response_msg = match result {
                                Ok(_) => json!({"result": true}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::CloseStream { stream_id, response } => {
                            let result = rt.block_on(client_state.stream_manager.close_stream(&stream_id));
                            
                            let response_msg = match result {
                                Ok(_) => json!({"result": true}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::CloseAllStreams { response } => {
                            let result = rt.block_on(client_state.stream_manager.close_all_streams());
                            
                            let response_msg = match result {
                                Ok(_) => "".to_string(),
                                Err(e) => e,
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
            binary_vault,
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

    pub fn load_proto(&self, filename: &str, content: &str) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::LoadProto {
            filename: filename.to_string(),
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

    pub fn compile_protos(&self) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::CompileProtos {
            response: response_tx,
        }).map_err(|e| format!("Failed to send compile_protos command: {}", e))?;

        let response = response_rx.recv()
            .map_err(|e| format!("Failed to receive compile_protos response: {}", e))?;

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

    pub fn call_server_stream(&self, params_json: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::CallServerStream {
            params_json: params_json.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send call_server_stream command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive call_server_stream response: {}", e))
    }

    pub fn start_client_stream(&self, params_json: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::StartClientStream {
            params_json: params_json.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send start_client_stream command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive start_client_stream response: {}", e))
    }

    pub fn start_bidi_stream(&self, params_json: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::StartBidiStream {
            params_json: params_json.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send start_bidi_stream command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive start_bidi_stream response: {}", e))
    }

    pub fn send_message(&self, stream_id: &str, message_json: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::SendMessage {
            stream_id: stream_id.to_string(),
            message_json: message_json.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send send_message command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive send_message response: {}", e))
    }

    pub fn get_next_message(&self, stream_id: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::GetNextMessage {
            stream_id: stream_id.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send get_next_message command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive get_next_message response: {}", e))
    }

    pub fn finish_sending(&self, stream_id: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::FinishSending {
            stream_id: stream_id.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send finish_sending command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive finish_sending response: {}", e))
    }

    pub fn close_stream(&self, stream_id: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::CloseStream {
            stream_id: stream_id.to_string(),
            response: response_tx,
        }).map_err(|e| format!("Failed to send close_stream command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive close_stream response: {}", e))
    }

    pub fn close_all_streams(&self) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        
        self.tx.send(BackendCommand::CloseAllStreams {
            response: response_tx,
        }).map_err(|e| format!("Failed to send close_all_streams command: {}", e))?;

        response_rx.recv()
            .map_err(|e| format!("Failed to receive close_all_streams response: {}", e))?;

        Ok(())
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