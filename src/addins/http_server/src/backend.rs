use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_server::{Backend, send_command, handle_async_command, handle_sync_command};
use crate::server::ServerState;

pub struct HttpServerBackend {
    backend: Backend<BackendCommand>,
    logger: Option<Arc<Logger>>,
}

pub enum BackendCommand {
    Start {
        port: u16,
        config: String,
        logger: Option<Arc<Logger>>,
        response: Sender<String>,
    },
    HandleRequest {
        timeout_ms: u64,
        response: Sender<String>,
    },
    SendResponse {
        request_id: String,
        status_code: u16,
        body: Vec<u8>,
        response: Sender<String>,
    },
    GetWebSocketMessage {
        connection_id: String,
        timeout_ms: u64,
        response: Sender<String>,
    },
    SendWebSocketMessage {
        connection_id: String,
        message: Vec<u8>,
        response: Sender<String>,
    },
    CloseWebSocket {
        connection_id: String,
        response: Sender<String>,
    },
    GetConnectionsList {
        response: Sender<String>,
    },
    Shutdown,
}

impl HttpServerBackend {
    pub fn new(vault: BinaryVault) -> Self {
        let backend = Backend::new(
            "opi_httpserver_backend".to_string(),
            move |rt, rx| {
                let mut server_state: Option<ServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Start { port, config, logger, response } => {
                            if server_state.is_some() {
                                let _ = response.send(json_error("Server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                ServerState::start(port, &config, vault.clone(), logger).await
                            });

                            match result {
                                Ok(state) => {
                                    server_state = Some(state);
                                    let _ = response.send(json_success());
                                }
                                Err(e) => {
                                    let _ = response.send(json_error(&e));
                                }
                            }
                        }

                        BackendCommand::HandleRequest { timeout_ms, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.handle_request(timeout_ms).await
                            );
                        }

                        BackendCommand::SendResponse { request_id, status_code, body, response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.send_response(&request_id, status_code, body)
                            );
                        }

                        BackendCommand::GetWebSocketMessage { connection_id, timeout_ms, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.get_websocket_message(&connection_id, timeout_ms).await
                            );
                        }

                        BackendCommand::SendWebSocketMessage { connection_id, message, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.send_websocket_message(&connection_id, message).await
                            );
                        }

                        BackendCommand::CloseWebSocket { connection_id, response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.close_websocket(&connection_id)
                            );
                        }

                        BackendCommand::GetConnectionsList { response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.get_connections_list()
                            );
                        }

                        BackendCommand::Shutdown => {
                            #[allow(unused_assignments)]
                            {
                                server_state = None;
                            }
                            break;
                        }
                    }
                }
            },
        );

        Self {
            backend,
            logger: None,
        }
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) {
        self.logger = Some(logger);
    }

    pub fn start(&self, port: u16, config: &str) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::Start {
                port,
                config: config.to_string(),
                logger: self.logger.clone(),
                response,
            }
        })
    }

    pub fn handle_request(&self, timeout_ms: u64) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::HandleRequest {
                timeout_ms,
                response,
            }
        })
    }

    pub fn send_response(&self, request_id: String, status_code: u16, body: Vec<u8>) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::SendResponse {
                request_id,
                status_code,
                body,
                response,
            }
        })
    }

    pub fn get_websocket_message(&self, connection_id: String, timeout_ms: u64) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::GetWebSocketMessage {
                connection_id,
                timeout_ms,
                response,
            }
        })
    }

    pub fn send_websocket_message(&self, connection_id: String, message: Vec<u8>) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::SendWebSocketMessage {
                connection_id,
                message,
                response,
            }
        })
    }

    pub fn close_websocket(&self, connection_id: String) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::CloseWebSocket {
                connection_id,
                response,
            }
        })
    }

    pub fn get_connections_list(&self) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::GetConnectionsList { response }
        })
    }

    pub fn shutdown(&mut self) {
        let _ = self.backend.send(BackendCommand::Shutdown);
    }
}
