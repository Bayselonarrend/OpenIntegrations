use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use common_utils::utils::{json_error, json_success};
use crate::listener::ServerState;

pub struct TcpServerBackend {
    tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

enum BackendCommand {
    Start {
        port: u16,
        queue_size: usize,
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
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let thread_handle = thread::Builder::new()
            .name("opi_tcpserver_backend".to_string())
            .spawn(move || {
                let rt = tokio::runtime::Runtime::new().unwrap();
                let mut server_state: Option<ServerState> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Start { port, queue_size, response } => {
                            if server_state.is_some() {
                                let _ = response.send(json_error("Server already started"));
                                continue;
                            }

                            let result = rt.block_on(async {
                                ServerState::start(port, queue_size).await
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
                            if let Some(ref mut state) = server_state {
                                let result = rt.block_on(async {
                                    state.get_next_message(timeout_ms, max_message_size).await
                                });
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::GetMessageFromConnection { connection_id, timeout_ms, max_message_size, response } => {
                            if let Some(ref mut state) = server_state {
                                let result = rt.block_on(async {
                                    state.get_message_from_connection(&connection_id, timeout_ms, max_message_size).await
                                });
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::SendMessage { connection_id, message, response } => {
                            if let Some(ref mut state) = server_state {
                                let result = rt.block_on(async {
                                    state.send_message(&connection_id, message).await
                                });
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::CloseConnection { connection_id, response } => {
                            if let Some(ref mut state) = server_state {
                                let result = rt.block_on(async {
                                    state.close_connection(&connection_id).await
                                });
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::CloseAllConnections { response } => {
                            if let Some(ref mut state) = server_state {
                                let result = rt.block_on(async {
                                    state.close_all_connections().await
                                });
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::ShutdownRead { connection_id, response } => {
                            if let Some(ref mut state) = server_state {
                                let result = state.shutdown_read(&connection_id);
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::ShutdownWrite { connection_id, response } => {
                            if let Some(ref mut state) = server_state {
                                let result = state.shutdown_write(&connection_id);
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::GetConnectionsList { response } => {
                            if let Some(ref mut state) = server_state {
                                let result = state.get_connections_list();
                                let _ = response.send(result);
                            } else {
                                let _ = response.send(json_error("Server not started"));
                            }
                        }

                        BackendCommand::Shutdown => {
                            server_state = None;
                            break;
                        }
                    }
                }
            })
            .unwrap();

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }

    pub fn start(&self, port: u16, queue_size: usize) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::Start {
            port,
            queue_size,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn get_next_message(&self, timeout_ms: u64, max_message_size: usize) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::GetNextMessage {
            timeout_ms,
            max_message_size,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn get_message_from_connection(&self, connection_id: String, timeout_ms: u64, max_message_size: usize) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::GetMessageFromConnection {
            connection_id,
            timeout_ms,
            max_message_size,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn send_message(&self, connection_id: String, message: Vec<u8>) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::SendMessage {
            connection_id,
            message,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn close_connection(&self, connection_id: String) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::CloseConnection {
            connection_id,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn close_all_connections(&self) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::CloseAllConnections {
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn shutdown_read(&self, connection_id: String) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::ShutdownRead {
            connection_id,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn shutdown_write(&self, connection_id: String) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::ShutdownWrite {
            connection_id,
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn get_connections_list(&self) -> String {
        let (response_tx, response_rx) = mpsc::channel();

        if let Err(e) = self.tx.send(BackendCommand::GetConnectionsList {
            response: response_tx,
        }) {
            return json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| json_error(&format!("Failed to receive response: {}", e)))
    }

    pub fn shutdown(&mut self) {
        let _ = self.tx.send(BackendCommand::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            let _ = handle.join();
        }
    }
}

impl Drop for TcpServerBackend {
    fn drop(&mut self) {
        self.shutdown();
    }
}
