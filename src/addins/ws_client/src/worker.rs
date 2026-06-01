use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tls_settings::TlsSettings;

use crate::client::WebSocketClient;

pub enum WorkerCommand {
    Connect {
        url: String,
        tls: Option<TlsSettings>,
        proxy: Option<ProxySettings>,
        headers: Option<Vec<(String, String)>>,
        response: Sender<JanxValue>,
    },
    SendText {
        text: String,
        response: Sender<JanxValue>,
    },
    SendBinary {
        data: Vec<u8>,
        response: Sender<JanxValue>,
    },
    ReceiveMessage {
        timeout_ms: u64,
        response: Sender<JanxValue>,
    },
    SendPing {
        response: Sender<JanxValue>,
    },
    SendPong {
        response: Sender<JanxValue>,
    },
    Close {
        code: u16,
        reason: String,
        response: Sender<JanxValue>,
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
    client: WebSocketClient,
}

impl Session {
    fn new() -> Self {
        Self {
            client: WebSocketClient::new(),
        }
    }

    fn is_connected(&self) -> bool {
        self.client.socket.is_some()
    }
}

pub fn spawn_thread(
    logger: Option<Arc<Logger>>,
) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_wsclient_backend", move |rx| {
        let mut session = Session::new();

        if let Some(logger) = logger {
            session.client.set_logger(logger);
        }

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    url,
                    tls,
                    proxy,
                    headers,
                    response,
                } => {
                    if let Some(tls) = tls {
                        session.client.tls_settings = Some(tls);
                    }
                    if let Some(proxy) = proxy {
                        session.client.proxy_settings = Some(proxy);
                    }
                    if let Some(headers) = headers {
                        session.client.headers = Some(headers);
                    }
                    let result = session.client.connect(&url);
                    let _ = response.send(result);
                }
                WorkerCommand::SendText { text, response } => {
                    let _ = response.send(session.client.send_text(&text));
                }
                WorkerCommand::SendBinary { data, response } => {
                    let _ = response.send(session.client.send_binary(data));
                }
                WorkerCommand::ReceiveMessage { timeout_ms, response } => {
                    let _ = response.send(session.client.receive_message(timeout_ms));
                }
                WorkerCommand::SendPing { response } => {
                    let _ = response.send(session.client.send_ping());
                }
                WorkerCommand::SendPong { response } => {
                    let _ = response.send(session.client.send_pong());
                }
                WorkerCommand::Close {
                    code,
                    reason,
                    response,
                } => {
                    let _ = response.send(session.client.close(code, &reason));
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.client.set_logger(logger);
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.is_connected());
                }
                WorkerCommand::Shutdown => break,
            }
        }
    })
}
