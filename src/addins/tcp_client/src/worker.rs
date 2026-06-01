use std::io::{Read, Write};
use std::net::{Shutdown, SocketAddr};
use std::sync::mpsc::Sender;
use std::sync::Arc;
use std::time::{Duration, Instant};

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish::{create_connection, Connection};
use common_tcp::tls_settings::TlsSettings;

pub enum WorkerCommand {
    Connect {
        address: SocketAddr,
        tls: Option<TlsSettings>,
        proxy: Option<ProxySettings>,
        response: Sender<bool>,
    },
    Disconnect {
        response: Sender<bool>,
    },
    Read {
        max_data_size: i32,
        end_marker: Vec<u8>,
        timeout_ms: i32,
        response: Sender<Vec<u8>>,
    },
    Send {
        data: Vec<u8>,
        timeout_ms: i32,
        response: Sender<bool>,
    },
    CloseOutput {
        response: Sender<bool>,
    },
    GetLastError {
        response: Sender<String>,
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
    logger: Option<Arc<Logger>>,
    connection: Option<Connection>,
    last_error: String,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            connection: None,
            last_error: String::new(),
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn save_error(&mut self, message: &str) {
        self.last_error = message.to_string();
    }

    fn connect(
        &mut self,
        address: SocketAddr,
        tls: &Option<TlsSettings>,
        proxy: &Option<ProxySettings>,
    ) -> bool {
        if self.connection.is_some() {
            self.save_error("Connection already initialized");
            return false;
        }

        self.log(&format!("Connecting to TCP {}", address));

        let host = address.ip().to_string();
        let port = address.port();

        match create_connection(&host, port, proxy, tls) {
            Ok(conn) => {
                self.connection = Some(conn);
                self.log("Connected to TCP server");
                true
            }
            Err(e) => {
                self.save_error(&e.to_string());
                false
            }
        }
    }

    fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        self.log(&format!("Send {} bytes", data.len()));

        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                self.save_error("No connection found!");
                return false;
            }
        };

        if timeout_ms > 0 {
            let timeout = Duration::from_millis(timeout_ms as u64);
            let tm_result = match connection {
                Connection::Plain(tcp_stream) => tcp_stream.set_write_timeout(Some(timeout)),
                Connection::Tls(tls_stream) => tls_stream.get_ref().set_write_timeout(Some(timeout)),
            };

            if let Err(e) = tm_result {
                self.save_error(&e.to_string());
                return false;
            }
        }

        let ok = match connection {
            Connection::Plain(tcp_stream) => match tcp_stream.write(&data) {
                Ok(_) => tcp_stream.flush().is_ok(),
                Err(e) => {
                    self.save_error(&e.to_string());
                    false
                }
            },
            Connection::Tls(tls_stream) => match tls_stream.write(&data) {
                Ok(_) => tls_stream.flush().is_ok(),
                Err(e) => {
                    self.save_error(&e.to_string());
                    false
                }
            },
        };

        if !ok && self.last_error.is_empty() {
            self.save_error("Send failed");
        }

        ok
    }

    fn receive(&mut self, max_data_size: i32, end_marker: Vec<u8>, timeout_ms: i32) -> Vec<u8> {
        self.log("Read data from TCP connection");

        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                self.save_error("No connection found!");
                return vec![];
            }
        };

        const BUFFER_SIZE: usize = 1024;
        const MIN_READ_TIMEOUT_MS: u64 = 200;

        let mut result = Vec::new();
        let mut buffer = vec![0u8; BUFFER_SIZE];

        let total_timeout = Duration::from_millis(timeout_ms.max(0) as u64);
        let start_time = Instant::now();
        let min_read_timeout = Duration::from_millis(MIN_READ_TIMEOUT_MS);
        let marker_exists = !end_marker.is_empty();

        let connection_result = match connection {
            Connection::Plain(tcp_stream) => tcp_stream.set_read_timeout(Some(min_read_timeout)),
            Connection::Tls(tls_stream) => tls_stream.get_ref().set_read_timeout(Some(min_read_timeout)),
        };

        if let Err(e) = connection_result {
            self.save_error(&e.to_string());
            return vec![];
        }

        loop {
            if timeout_ms > 0 && start_time.elapsed() >= total_timeout {
                break;
            }

            if max_data_size > 0 && result.len() >= max_data_size as usize {
                break;
            }

            let read_result = match connection {
                Connection::Plain(tcp_stream) => tcp_stream.read(&mut buffer),
                Connection::Tls(tls_stream) => tls_stream.read(&mut buffer),
            };

            match read_result {
                Ok(0) => break,
                Ok(size) => {
                    result.extend_from_slice(&buffer[..size]);

                    if marker_exists && result.ends_with(&end_marker) {
                        break;
                    }
                }
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => continue,
                Err(e) => {
                    self.save_error(&e.to_string());
                    break;
                }
            }
        }

        result
    }

    fn disconnect(&mut self) -> bool {
        self.log("Disconnecting from TCP server");
        self.connection = None;
        true
    }

    fn close_output(&mut self) -> bool {
        self.log("Close TCP output stream");

        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                self.save_error("No connection found!");
                return false;
            }
        };

        match connection {
            Connection::Plain(tcp_stream) => tcp_stream.shutdown(Shutdown::Write).is_ok(),
            Connection::Tls(tls_stream) => tls_stream.shutdown().is_ok(),
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_tcpclient_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    address,
                    tls,
                    proxy,
                    response,
                } => {
                    let result = session.connect(address, &tls, &proxy);
                    let _ = response.send(result);
                }
                WorkerCommand::Disconnect { response } => {
                    let _ = response.send(session.disconnect());
                }
                WorkerCommand::Read {
                    max_data_size,
                    end_marker,
                    timeout_ms,
                    response,
                } => {
                    let data = session.receive(max_data_size, end_marker, timeout_ms);
                    let _ = response.send(data);
                }
                WorkerCommand::Send {
                    data,
                    timeout_ms,
                    response,
                } => {
                    let _ = response.send(session.send(data, timeout_ms));
                }
                WorkerCommand::CloseOutput { response } => {
                    let _ = response.send(session.close_output());
                }
                WorkerCommand::GetLastError { response } => {
                    let _ = response.send(session.last_error.clone());
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.connection.is_some());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down TCP client backend");
                    let _ = session.disconnect();
                    break;
                }
            }
        }
    })
}
