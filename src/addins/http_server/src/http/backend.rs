use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_server::{Backend, send_command, handle_async_command, handle_sync_command};
use super::HttpServerState;

pub struct HttpServerBackend {
    backend: Backend<HttpCommand>,
    logger: Option<Arc<Logger>>,
}

pub enum HttpCommand {
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
    HandleRequestById {
        request_id: String,
        response: Sender<String>,
    },
    SendResponse {
        request_id: String,
        status_code: u16,
        body: Vec<u8>,
        response: Sender<String>,
    },
    GetPendingRequests {
        response: Sender<String>,
    },
    Shutdown,
}

impl HttpServerBackend {
    pub fn new(vault: BinaryVault) -> Self {
        let backend = Backend::new(
            "opi_http_backend".to_string(),
            move |rt, rx| {
                let mut server_state: Option<HttpServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        HttpCommand::Start { port, config, logger, response } => {
                            if server_state.is_some() {
                                let _ = response.send(json_error("HTTP server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                HttpServerState::start(port, &config, vault.clone(), logger).await
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

                        HttpCommand::HandleRequest { timeout_ms, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.handle_request(timeout_ms).await
                            );
                        }

                        HttpCommand::HandleRequestById { request_id, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.handle_request_by_id(&request_id).await
                            );
                        }

                        HttpCommand::SendResponse { request_id, status_code, body, response } => {
                            handle_async_command!(server_state, rt, response, |state|
                                state.send_response(&request_id, status_code, body).await
                            );
                        }

                        HttpCommand::GetPendingRequests { response } => {
                            handle_sync_command!(server_state, response, |state|
                                state.get_pending_requests()
                            );
                        }

                        HttpCommand::Shutdown => {
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
            HttpCommand::Start {
                port,
                config: config.to_string(),
                logger: self.logger.clone(),
                response,
            }
        })
    }

    pub fn handle_request(&self, timeout_ms: u64) -> String {
        send_command!(self.backend, |response| {
            HttpCommand::HandleRequest {
                timeout_ms,
                response,
            }
        })
    }

    pub fn handle_request_by_id(&self, request_id: String) -> String {
        send_command!(self.backend, |response| {
            HttpCommand::HandleRequestById {
                request_id,
                response,
            }
        })
    }

    pub fn send_response(&self, request_id: String, status_code: u16, body: Vec<u8>) -> String {
        send_command!(self.backend, |response| {
            HttpCommand::SendResponse {
                request_id,
                status_code,
                body,
                response,
            }
        })
    }

    pub fn get_pending_requests(&self) -> String {
        send_command!(self.backend, |response| {
            HttpCommand::GetPendingRequests { response }
        })
    }

    pub fn shutdown(&mut self) {
        let _ = self.backend.send(HttpCommand::Shutdown);
    }
}
