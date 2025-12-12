use serde_json::{json, Value};
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use std::collections::HashMap;
use serde::{Deserialize, Serialize};
use common_utils::utils::json_error;
use common_tcp::tls_settings::TlsSettings;
use tonic::transport::{Channel, ClientTlsConfig};
use tonic::Request;

pub struct GrpcBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

#[derive(Serialize, Deserialize)]
pub struct CallParams {
    pub service: String,
    pub method: String,
    pub request: Option<Value>,
    pub timeout_ms: Option<u64>,
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
                            let result = rt.block_on(handle_connect(&mut client_state, &address, &tls_settings));
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
                            let result = rt.block_on(handle_call(&client_state, &params));
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "data": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::LoadProto { content, response } => {
                            let result = handle_load_proto(&mut client_state, &content);
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
                            let result = handle_list_services(&client_state);
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "services": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::ListMethods { service_name, response } => {
                            let result = handle_list_methods(&client_state, &service_name);
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "methods": data}).to_string(),
                                Err(e) => json_error(&e),
                            };
                            let _ = response.send(response_msg);
                        }
                        BackendCommand::GetMethodInfo { service_name, method_name, response } => {
                            let result = handle_get_method_info(&client_state, &service_name, &method_name);
                            let response_msg = match result {
                                Ok(data) => json!({"result": true, "info": data}).to_string(),
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

struct ClientState {
    connected: bool,
    address: String,
    tls_settings: Option<TlsSettings>,
    metadata: HashMap<String, String>,
    proto_descriptors: Vec<u8>, // Для хранения скомпилированных proto файлов
    services: Vec<String>, // Список доступных сервисов
}

impl ClientState {
    fn new() -> Self {
        Self {
            connected: false,
            address: String::new(),
            tls_settings: None,
            metadata: HashMap::new(),
            proto_descriptors: Vec::new(),
            services: Vec::new(),
        }
    }

    fn disconnect(&mut self) {
        self.connected = false;
        self.address.clear();
        self.metadata.clear();
    }

    fn set_metadata(&mut self, metadata: HashMap<String, String>) {
        self.metadata = metadata;
    }
}

async fn handle_connect(
    client_state: &mut ClientState,
    address: &str,
    tls_settings: &Option<TlsSettings>,
) -> Result<(), String> {
    // Здесь будет логика подключения к gRPC серверу
    // Пока что просто симулируем успешное подключение
    client_state.connected = true;
    client_state.address = address.to_string();
    client_state.tls_settings = tls_settings.clone();
    
    // TODO: Реализовать реальное подключение через tonic
    // let use_tls = tls_settings.as_ref().map_or(false, |tls| tls.enabled());
    // let channel = if use_tls {
    //     Channel::from_shared(address.to_string())
    //         .map_err(|e| format!("Invalid address: {}", e))?
    //         .tls_config(ClientTlsConfig::new())
    //         .map_err(|e| format!("TLS config error: {}", e))?
    //         .connect()
    //         .await
    //         .map_err(|e| format!("Connection failed: {}", e))?
    // } else {
    //     Channel::from_shared(address.to_string())
    //         .map_err(|e| format!("Invalid address: {}", e))?
    //         .connect()
    //         .await
    //         .map_err(|e| format!("Connection failed: {}", e))?
    // };

    Ok(())
}

async fn handle_call(
    _client_state: &ClientState,
    params: &CallParams,
) -> Result<Value, String> {
    if !_client_state.connected {
        return Err("Not connected to gRPC server".to_string());
    }

    // TODO: Реализовать реальный вызов gRPC метода
    // Пока что возвращаем заглушку
    Ok(json!({
        "service": params.service,
        "method": params.method,
        "response": "Mock response - gRPC call not implemented yet"
    }))
}

fn handle_load_proto(
    _client_state: &mut ClientState,
    _content: &str,
) -> Result<(), String> {
    // TODO: Реализовать загрузку и компиляцию proto файлов
    // Пока что просто возвращаем успех
    Ok(())
}

fn handle_list_services(
    client_state: &ClientState,
) -> Result<Vec<String>, String> {
    if !client_state.connected {
        return Err("Not connected to gRPC server".to_string());
    }
    
    // TODO: Реализовать получение списка сервисов из загруженных proto файлов
    // Пока что возвращаем заглушку
    Ok(vec!["ExampleService".to_string(), "HealthService".to_string()])
}

fn handle_list_methods(
    client_state: &ClientState,
    service_name: &str,
) -> Result<Vec<String>, String> {
    if !client_state.connected {
        return Err("Not connected to gRPC server".to_string());
    }
    
    // TODO: Реализовать получение списка методов для конкретного сервиса
    // Пока что возвращаем заглушку
    match service_name {
        "ExampleService" => Ok(vec!["SayHello".to_string(), "ListFeatures".to_string()]),
        "HealthService" => Ok(vec!["Check".to_string(), "Watch".to_string()]),
        _ => Err(format!("Service '{}' not found", service_name))
    }
}

fn handle_get_method_info(
    client_state: &ClientState,
    service_name: &str,
    method_name: &str,
) -> Result<Value, String> {
    if !client_state.connected {
        return Err("Not connected to gRPC server".to_string());
    }
    
    // TODO: Реализовать получение информации о методе (схема запроса/ответа)
    // Пока что возвращаем заглушку
    match (service_name, method_name) {
        ("ExampleService", "SayHello") => Ok(json!({
            "request_type": "HelloRequest",
            "response_type": "HelloResponse",
            "request_schema": {
                "name": "string"
            },
            "response_schema": {
                "message": "string"
            }
        })),
        _ => Err(format!("Method '{}.{}' not found", service_name, method_name))
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