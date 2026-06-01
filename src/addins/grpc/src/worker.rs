use std::collections::HashMap;
use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::BackendThread;
use common_janx::{janx, IntoJanx, JanxValue};
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_success, json_value_to_janx};

use crate::client_state::ClientState;
use crate::connection;
use crate::grpc_caller::{self, CallParams};
use crate::introspection;
use crate::proto_loader;

pub enum WorkerCommand {
    Connect {
        address: String,
        tls_settings: Option<TlsSettings>,
        response: Sender<Result<(), String>>,
    },
    Disconnect {
        response: Sender<Result<(), String>>,
    },
    Call {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    LoadProto {
        filename: String,
        content: String,
        response: Sender<JanxValue>,
    },
    CompileProtos {
        response: Sender<JanxValue>,
    },
    SetMetadata {
        metadata: HashMap<String, String>,
        response: Sender<JanxValue>,
    },
    ListServices {
        response: Sender<JanxValue>,
    },
    ListMethods {
        service_name: String,
        response: Sender<JanxValue>,
    },
    GetMethodInfo {
        service_name: String,
        method_name: String,
        response: Sender<JanxValue>,
    },
    CallServerStream {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    StartClientStream {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    StartBidiStream {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    SendMessage {
        stream_id: String,
        message: JanxValue,
        response: Sender<JanxValue>,
    },
    GetNextMessage {
        stream_id: String,
        response: Sender<JanxValue>,
    },
    FinishSending {
        stream_id: String,
        response: Sender<JanxValue>,
    },
    CloseStream {
        stream_id: String,
        response: Sender<JanxValue>,
    },
    CloseAllStreams {
        response: Sender<Result<(), String>>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    IsConnected {
        response: Sender<bool>,
    },
    Shutdown,
}

struct Session {
    state: ClientState,
    logger: Option<Arc<Logger>>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            state: ClientState::new(),
            logger,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }
}

pub fn spawn_thread(
    logger: Option<Arc<Logger>>,
) -> Result<BackendThread<WorkerCommand>, String> {
    BackendThread::spawn("opi_grpc_backend", move |rt, rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
                    match cmd {
                        WorkerCommand::Connect { address, tls_settings, response } => {
                            session.log(&format!("Connecting to gRPC server {}", address));
                            let result = rt.block_on(async {
                                match connection::establish_connection(&address, &tls_settings).await {
                                    Ok(channel) => {
                                        session.state.connected = true;
                                        session.state.address = address;
                                        session.state.tls_settings = tls_settings;
                                        session.state.channel = Some(channel);
                                        Ok(())
                                    }
                                    Err(e) => Err(e),
                                }
                            });
                            if result.is_ok() {
                                session.log("Connected to gRPC server");
                            } else if let Err(ref e) = result {
                                session.log(&format!("Connect failed: {}", e));
                            }
                            let _ = response.send(result);
                        }
                        WorkerCommand::Disconnect { response } => {
                            session.log("Disconnecting from gRPC server");
                            let _ = rt.block_on(session.state.stream_manager.close_all_streams());
                            session.state.disconnect();
                            let _ = response.send(Ok(()));
                        }
                        WorkerCommand::Call { params, response } => {
                            let params = match CallParams::from_value(&params) {
                                Ok(p) => p,
                                Err(e) => {
                                    let _ = response.send(janx_error(e));
                                    continue;
                                }
                            };
                            session.log(&format!("Call {}/{}", params.service, params.method));
                            let result = if !session.state.connected {
                                Err("Not connected to gRPC server".to_string())
                            } else if let (Some(channel), Some(descriptor_pool)) =
                                (&mut session.state.channel, &session.state.descriptor_pool)
                            {
                                rt.block_on(grpc_caller::execute_grpc_call(
                                    channel,
                                    descriptor_pool,
                                    &session.state.metadata,
                                    &params,
                                ))
                            } else {
                                Err("No active connection or proto files loaded".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => janx!({ "result": true, "data": data }),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::LoadProto { filename, content, response } => {
                            session.state.proto_files.insert(filename, content);
                            let _ = response.send(janx_success(None, None));
                        }
                        WorkerCommand::CompileProtos { response } => {
                            let result = if session.state.proto_files.is_empty() {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            } else {
                                match proto_loader::load_proto_files(
                                    session.state.proto_files.clone(),
                                ) {
                                    Ok(descriptor_pool) => {
                                        session.state.descriptor_pool = Some(descriptor_pool);
                                        Ok(())
                                    }
                                    Err(e) => Err(e),
                                }
                            };
                            let response_msg = match result {
                                Ok(_) => janx_success(None, None),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::SetMetadata { metadata, response } => {
                            session.state.set_metadata(metadata);
                            let _ = response.send(janx_success(None, None));
                        }
                        WorkerCommand::ListServices { response } => {
                            let result = if let Some(descriptor_pool) =
                                &session.state.descriptor_pool
                            {
                                introspection::list_services(descriptor_pool)
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => janx_success(Some(data.into_janx()), Some("data")),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::ListMethods { service_name, response } => {
                            let result = if let Some(descriptor_pool) =
                                &session.state.descriptor_pool
                            {
                                introspection::list_methods(descriptor_pool, &service_name)
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => janx_success(Some(data.into_janx()), Some("data")),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::GetMethodInfo {
                            service_name,
                            method_name,
                            response,
                        } => {
                            let result = if let Some(descriptor_pool) =
                                &session.state.descriptor_pool
                            {
                                introspection::get_method_info(
                                    descriptor_pool,
                                    &service_name,
                                    &method_name,
                                )
                            } else {
                                Err("No proto files loaded. Call LoadProto first.".to_string())
                            };
                            let response_msg = match result {
                                Ok(data) => janx_success(Some(json_value_to_janx(data)), Some("data")),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::CallServerStream { params, response } => {
                            use crate::streaming_caller;

                            let result = if !session.state.connected {
                                Err("Not connected to gRPC server".to_string())
                            } else if let (Some(channel), Some(descriptor_pool)) =
                                (&session.state.channel, &session.state.descriptor_pool)
                            {
                                let params = match streaming_caller::StreamCallParams::from_value(&params) {
                                    Ok(p) => p,
                                    Err(e) => {
                                        let _ = response.send(janx_error(e));
                                        continue;
                                    }
                                };
                                rt.block_on(streaming_caller::start_server_stream(
                                    channel,
                                    descriptor_pool,
                                    &session.state.metadata,
                                    &session.state.stream_manager,
                                    &params,
                                ))
                            } else {
                                Err("No active connection or proto files loaded".to_string())
                            };

                            let response_msg = match result {
                                Ok(stream_id) => janx!({
                                    "result": true,
                                    "streamId": stream_id,
                                }),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::StartClientStream { params, response } => {
                            use crate::streaming_caller;

                            let result = if !session.state.connected {
                                Err("Not connected to gRPC server".to_string())
                            } else if let (Some(channel), Some(descriptor_pool)) =
                                (&session.state.channel, &session.state.descriptor_pool)
                            {
                                let params = match streaming_caller::StreamCallParams::from_value(&params) {
                                    Ok(p) => p,
                                    Err(e) => {
                                        let _ = response.send(janx_error(e));
                                        continue;
                                    }
                                };
                                rt.block_on(streaming_caller::start_client_stream(
                                    channel,
                                    descriptor_pool,
                                    &session.state.metadata,
                                    &session.state.stream_manager,
                                    &params,
                                ))
                            } else {
                                Err("No active connection or proto files loaded".to_string())
                            };

                            let response_msg = match result {
                                Ok(stream_id) => janx!({
                                    "result": true,
                                    "streamId": stream_id,
                                }),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::StartBidiStream { params, response } => {
                            use crate::streaming_caller;

                            let result = if !session.state.connected {
                                Err("Not connected to gRPC server".to_string())
                            } else if let (Some(channel), Some(descriptor_pool)) =
                                (&session.state.channel, &session.state.descriptor_pool)
                            {
                                let params = match streaming_caller::StreamCallParams::from_value(&params) {
                                    Ok(p) => p,
                                    Err(e) => {
                                        let _ = response.send(janx_error(e));
                                        continue;
                                    }
                                };
                                rt.block_on(streaming_caller::start_bidi_stream(
                                    channel,
                                    descriptor_pool,
                                    &session.state.metadata,
                                    &session.state.stream_manager,
                                    &params,
                                ))
                            } else {
                                Err("No active connection or proto files loaded".to_string())
                            };

                            let response_msg = match result {
                                Ok(stream_id) => janx!({
                                    "result": true,
                                    "streamId": stream_id,
                                }),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::SendMessage {
                            stream_id,
                            message,
                            response,
                        } => {
                            use crate::streaming_caller;

                            let result = rt.block_on(streaming_caller::send_stream_message(
                                &session.state.stream_manager,
                                &stream_id,
                                &message,
                            ));

                            let response_msg = match result {
                                Ok(_) => janx_success(None, None),
                                Err(e) => janx_error(e),
                            };

                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::GetNextMessage { stream_id, response } => {
                            use crate::streaming_caller;

                            let result = rt.block_on(streaming_caller::get_next_message(
                                &session.state.stream_manager,
                                &stream_id,
                            ));

                            let response_msg = match result {
                                Ok(data) => data,
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::FinishSending { stream_id, response } => {
                            let result = rt.block_on(
                                session.state.stream_manager.finish_sending(&stream_id),
                            );

                            let response_msg = match result {
                                Ok(_) => janx_success(None, None),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::CloseStream { stream_id, response } => {
                            let result = rt.block_on(
                                session.state.stream_manager.close_stream(&stream_id),
                            );

                            let response_msg = match result {
                                Ok(_) => janx_success(None, None),
                                Err(e) => janx_error(e),
                            };
                            let _ = response.send(response_msg);
                        }
                        WorkerCommand::CloseAllStreams { response } => {
                            let result =
                                rt.block_on(session.state.stream_manager.close_all_streams());
                            let _ = response.send(result);
                        }
                        WorkerCommand::SetLogger { logger, response } => {
                            session.logger = Some(logger);
                            session.log("Logger initialized");
                            let _ = response.send(Ok(()));
                        }
                        WorkerCommand::IsConnected { response } => {
                            let _ = response.send(session.state.connected);
                        }
                        WorkerCommand::Shutdown => {
                            session.log("Shutting down gRPC backend");
                            let _ =
                                rt.block_on(session.state.stream_manager.close_all_streams());
                            session.state.disconnect();
                            break;
                        }
                    }
                }
    })
}