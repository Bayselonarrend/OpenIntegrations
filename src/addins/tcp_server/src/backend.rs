use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_janx::JanxValue;
use common_logs::Logger;
use common_server::{
    handle_async_command, handle_sync_command, send_command, Backend,
};
use common_utils::utils::{janx_error, janx_result_ok, janx_success};
use crate::listener::ServerState;

pub struct TcpServerBackend {
    backend: Backend<BackendCommand>,
}

pub enum BackendCommand {
    Start {
        port: u16,
        queue_size: usize,
        logger: Option<Arc<Logger>>,
        response: Sender<JanxValue>,
    },
    GetNextMessage {
        timeout_ms: u64,
        max_message_size: usize,
        response: Sender<JanxValue>,
    },
    GetMessageFromConnection {
        connection_id: String,
        timeout_ms: u64,
        max_message_size: usize,
        response: Sender<JanxValue>,
    },
    SendMessage {
        connection_id: String,
        message: Vec<u8>,
        response: Sender<JanxValue>,
    },
    CloseConnection {
        connection_id: String,
        response: Sender<JanxValue>,
    },
    Stop {
        response: Sender<JanxValue>,
    },
    ShutdownRead {
        connection_id: String,
        response: Sender<JanxValue>,
    },
    ShutdownWrite {
        connection_id: String,
        response: Sender<JanxValue>,
    },
    GetConnectionsList {
        response: Sender<JanxValue>,
    },
    Shutdown,
}

impl TcpServerBackend {
    pub fn new() -> Self {
        let backend = Backend::new(
            "opi_tcpserver_backend".to_string(),
            move |rt, rx| {
                let mut server_state: Option<ServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Start { port, queue_size, logger, response } => {
                            if server_state.is_some() {
                                let _ = response.send(janx_error("Server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                ServerState::start(port, queue_size, logger).await
                            });

                            match result {
                                Ok(state) => {
                                    server_state = Some(state);
                                    let _ = response.send(janx_success(None, None));
                                }
                                Err(e) => {
                                    let _ = response.send(janx_error(&e));
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

                        BackendCommand::Stop { response } => {
                            if let Some(mut state) = server_state.take() {
                                let _ = rt.block_on(async { state.close_all_connections().await });
                                let _ = response.send(janx_success(None, None));
                                break;
                            }
                            let _ = response.send(janx_error("Server not started"));
                        }

                        BackendCommand::Shutdown => {
                            if let Some(mut state) = server_state.take() {
                                let _ = rt.block_on(async { state.close_all_connections().await });
                            }
                            break;
                        }
                    }
                }
            },
        );

        Self { backend }
    }

    pub fn start(
        &self,
        port: u16,
        queue_size: usize,
        logger: Option<Arc<Logger>>,
    ) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::Start {
                port,
                queue_size,
                logger,
                response,
            }
        })
    }

    pub fn stop(&mut self) -> JanxValue {
        let result = send_command!(self.backend, |response| BackendCommand::Stop { response });
        if janx_result_ok(&result) {
            self.shutdown();
        }
        result
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::GetNextMessage {
                timeout_ms,
                max_message_size,
                response,
            }
        })
    }

    pub fn get_message_from_connection(
        &self,
        connection_id: String,
        timeout_ms: u64,
        max_message_size: usize,
    ) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::GetMessageFromConnection {
                connection_id,
                timeout_ms,
                max_message_size,
                response,
            }
        })
    }

    pub fn send_message(&self, connection_id: String, message: Vec<u8>) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::SendMessage {
                connection_id,
                message,
                response,
            }
        })
    }

    pub fn close_connection(&self, connection_id: String) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::CloseConnection {
                connection_id,
                response,
            }
        })
    }

    pub fn shutdown_read(&self, connection_id: String) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::ShutdownRead {
                connection_id,
                response,
            }
        })
    }

    pub fn shutdown_write(&self, connection_id: String) -> JanxValue {
        send_command!(self.backend, |response| {
            BackendCommand::ShutdownWrite {
                connection_id,
                response,
            }
        })
    }

    pub fn get_connections_list(&self) -> JanxValue {
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
