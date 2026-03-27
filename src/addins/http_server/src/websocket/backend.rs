use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_server::{Backend, send_command, handle_async_command, handle_sync_command};
use super::WebSocketServerState;

pub struct WebSocketServerBackend {
    backend: Backend<WebSocketCommand>,
    logger: Option<Arc<Logger>>,
}

pub enum WebSocketCommand {
    Start {
        port: u16,
        config: String,
        logger: Option<Arc<Logger>>,
        response: Sender<String>,
    },
    GetMessage {
        connection_id: String,
        timeout_ms: u64,
        response: Sender<String>,
    },
    SendMessage {
        connection_id: String,
        message: Vec<u8>,
        response: Sender<String>,
    },
    CloseConnection {
        connection_id: String,
        response: Sender<String>,
    },
    GetConnectionsList {
        response: Sender<String>,
    },
    Shutdown,
}

impl WebSocketServerBackend {
    pub fn new(vault: BinaryVault) -> Self {
        let backend = Backend::new(
            "opi_websocket_backend".to_string(),
            move |rt, rx| {
                let mut server_state: Option<WebSocketServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        WebSocketCommand::Start { port, config, logger, response } => {
                            if server_state.is_some() {
                                let _ = response.send(json_error("WebSocket server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                WebSocketServerState::start(port, &config, vault.clone(), logger).await
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

                        WebSocketCommand::GetMessage { connection_id, timeout_ms, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.get_message(&connection_id, timeout_ms).await
                            );
                        }

                        WebSocketCommand::SendMessage { connection_id, message, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.send_message(&connection_id, message).await
                            );
                        }

                        WebSocketCommand::CloseConnection { connection_id, response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.close_connection(&connection_id)
                            );
                        }

                        WebSocketCommand::GetConnectionsList { response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.get_connections_list()
                            );
                        }

                        WebSocketCommand::Shutdown => {
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
            WebSocketCommand::Start {
                port,
                config: config.to_string(),
                logger: self.logger.clone(),
                response,
            }
        })
    }

    pub fn get_message(&self, connection_id: String, timeout_ms: u64) -> String {
        send_command!(self.backend, |response| {
            WebSocketCommand::GetMessage {
                connection_id,
                timeout_ms,
                response,
            }
        })
    }

    pub fn send_message(&self, connection_id: String, message: Vec<u8>) -> String {
        send_command!(self.backend, |response| {
            WebSocketCommand::SendMessage {
                connection_id,
                message,
                response,
            }
        })
    }

    pub fn close_connection(&self, connection_id: String) -> String {
        send_command!(self.backend, |response| {
            WebSocketCommand::CloseConnection {
                connection_id,
                response,
            }
        })
    }

    pub fn get_connections_list(&self) -> String {
        send_command!(self.backend, |response| {
            WebSocketCommand::GetConnectionsList { response }
        })
    }

    pub fn shutdown(&mut self) {
        let _ = self.backend.send(WebSocketCommand::Shutdown);
    }
}
