use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_server::{Backend, send_command, handle_async_command, handle_sync_command};
use crate::listener::ServerState;

pub struct TcpServerBackend {
    backend: Backend<BackendCommand>,
    logger: Option<Arc<Logger>>,
}

pub enum BackendCommand {
    Start {
        port: u16,
        queue_size: usize,
        logger: Option<Arc<Logger>>,
        response: Sender<String>,
    },
    GetNextMessage {
        timeout_ms: u64,
        max_message_size: usize,
        response: Sender<String>,
    },
    GetMessageFromConnection {
        connection_id: String,
        timeout_ms: u64,
        max_message_size: usize,
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
    CloseAllConnections {
        response: Sender<String>,
    },
    ShutdownRead {
        connection_id: String,
        response: Sender<String>,
    },
    ShutdownWrite {
        connection_id: String,
        response: Sender<String>,
    },
    GetConnectionsList {
        response: Sender<String>,
    },
    Shutdown,
}

impl TcpServerBackend {
    pub fn new(vault: BinaryVault) -> Self {
        let backend = Backend::new(
            "opi_tcpserver_backend".to_string(),
            move |rt, rx| {
                let mut server_state: Option<ServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Start { port, queue_size, logger, response } => {
                            if server_state.is_some() {
                                let _ = response.send(json_error("Server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                ServerState::start(port, queue_size, vault.clone(), logger).await
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

                        BackendCommand::GetNextMessage { timeout_ms, max_message_size, response } => {
                            handle_async_command!(server_state, rt, response, |state| 
                                state.get_next_message(timeout_ms, max_message_size).await
                            );
                        }

                        BackendCommand::GetMessageFromConnection { connection_id, timeout_ms, max_message_size, response } => {
                            handle_async_command!(server_state, rt, response, |state| 
                                state.get_message_from_connection(&connection_id, timeout_ms, max_message_size).await
                            );
                        }

                        BackendCommand::SendMessage { connection_id, message, response } => {
                            handle_async_command!(server_state, rt, response, |state| 
                                state.send_message(&connection_id, message).await
                            );
                        }

                        BackendCommand::CloseConnection { connection_id, response } => {
                            handle_async_command!(server_state, rt, response, |state| 
                                state.close_connection(&connection_id).await
                            );
                        }

                        BackendCommand::CloseAllConnections { response } => {
                            handle_async_command!(server_state, rt, response, |state| 
                                state.close_all_connections().await
                            );
                        }

                        BackendCommand::ShutdownRead { connection_id, response } => {
                            handle_sync_command!(server_state, response, |state| 
                                state.shutdown_read(&connection_id)
                            );
                        }

                        BackendCommand::ShutdownWrite { connection_id, response } => {
                            handle_sync_command!(server_state, response, |state| 
                                state.shutdown_write(&connection_id)
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

    pub fn start(&self, port: u16, queue_size: usize) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::Start {
                port,
                queue_size,
                logger: self.logger.clone(),
                response,
            }
        })
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::GetNextMessage {
                timeout_ms,
                max_message_size,
                response,
            }
        })
    }

    pub fn get_message_from_connection(&self, connection_id: String, timeout_ms: u64, max_message_size: usize) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::GetMessageFromConnection {
                connection_id,
                timeout_ms,
                max_message_size,
                response,
            }
        })
    }

    pub fn send_message(&self, connection_id: String, message: Vec<u8>) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::SendMessage {
                connection_id,
                message,
                response,
            }
        })
    }

    pub fn close_connection(&self, connection_id: String) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::CloseConnection {
                connection_id,
                response,
            }
        })
    }

    pub fn close_all_connections(&self) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::CloseAllConnections { response }
        })
    }

    pub fn shutdown_read(&self, connection_id: String) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::ShutdownRead {
                connection_id,
                response,
            }
        })
    }

    pub fn shutdown_write(&self, connection_id: String) -> String {
        send_command!(self.backend, |response| {
            BackendCommand::ShutdownWrite {
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
        self.backend.shutdown();
    }
}

impl Drop for TcpServerBackend {
    fn drop(&mut self) {
        self.shutdown();
    }
}
