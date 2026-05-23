use std::sync::mpsc::Sender;
use std::sync::Arc;
use common_backend::BackendThread;
use std::time::Duration;

use common_logs::{log, Logger};
use tokio::time::timeout;
use zeromq::prelude::*;
use zeromq::{PubSocket, PullSocket, PushSocket, RepSocket, ReqSocket, Socket, SubSocket, ZmqMessage};

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(crate) enum ExchangeScheme {
    ReqRep,
    PubSub,
    Push,
    Pull,
}

#[derive(Debug)]
pub enum BackendCommand {
    Connect {
        scheme: ExchangeScheme,
        endpoint: String,
        response: Sender<Result<(), String>>,
    },
    Bind {
        scheme: ExchangeScheme,
        endpoint: String,
        response: Sender<Result<String, String>>,
    },
    Subscribe {
        prefix: String,
        response: Sender<Result<(), String>>,
    },
    Send {
        payload: Vec<u8>,
        timeout_ms: i32,
        response: Sender<Result<(), String>>,
    },
    Recv {
        timeout_ms: i32,
        response: Sender<Result<Vec<u8>, String>>,
    },
    Close {
        response: Sender<Result<(), String>>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}

pub struct ZeroMqBackend {
    thread: BackendThread<BackendCommand>,
}

enum OpenSocket {
    None,
    Req(ReqSocket),
    Rep(RepSocket),
    Pub(PubSocket),
    Sub(SubSocket),
    Push(PushSocket),
    Pull(PullSocket),
}

struct BackendState {
    socket: OpenSocket,
    logger: Option<Arc<Logger>>,
}

impl BackendState {
    fn new() -> Self {
        Self {
            socket: OpenSocket::None,
            logger: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    fn scheme_label(scheme: ExchangeScheme) -> &'static str {
        match scheme {
            ExchangeScheme::ReqRep => "REQ/REP",
            ExchangeScheme::PubSub => "PUB/SUB",
            ExchangeScheme::Push => "PUSH",
            ExchangeScheme::Pull => "PULL",
        }
    }

    fn is_busy(&self) -> bool {
        !matches!(self.socket, OpenSocket::None)
    }

    fn close_async(&mut self, rt: &tokio::runtime::Runtime) {
        self.log("Closing socket");
        match std::mem::replace(&mut self.socket, OpenSocket::None) {
            OpenSocket::None => {}
            OpenSocket::Req(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Rep(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Pub(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Sub(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Push(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Pull(s) => {
                let _ = rt.block_on(s.close());
            }
        }
    }
}

fn zmq_msg_to_concat_bytes(msg: ZmqMessage) -> Vec<u8> {
    msg.into_vec()
        .into_iter()
        .flat_map(|frame| frame.to_vec())
        .collect()
}

async fn recv_with_timeout<S: SocketRecv + Unpin>(
    sock: &mut S,
    timeout_ms: i32,
) -> Result<Vec<u8>, String> {
    if timeout_ms <= 0 {
        let msg = sock.recv().await.map_err(|e| e.to_string())?;
        Ok(zmq_msg_to_concat_bytes(msg))
    } else {
        match timeout(Duration::from_millis(timeout_ms as u64), sock.recv()).await {
            Ok(Ok(msg)) => Ok(zmq_msg_to_concat_bytes(msg)),
            Ok(Err(e)) => Err(e.to_string()),
            Err(_) => Err("Receive timed out.".to_owned()),
        }
    }
}

async fn send_with_timeout<S: SocketSend + Unpin>(
    sock: &mut S,
    msg: ZmqMessage,
    timeout_ms: i32,
) -> Result<(), String> {
    if timeout_ms < 0 {
        sock.send(msg).await.map_err(|e| e.to_string())
    } else {
        match timeout(Duration::from_millis(timeout_ms as u64), sock.send(msg)).await {
            Ok(Ok(())) => Ok(()),
            Ok(Err(e)) => Err(e.to_string()),
            Err(_) => Err("Send timed out.".to_owned()),
        }
    }
}

impl ZeroMqBackend {
    pub fn new() -> Self {
        let thread = BackendThread::spawn("opi_zeromq_backend", move |rt, rx| {
            let mut state = BackendState::new();

            while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Connect { scheme, endpoint, response } => {
                            state.log(&format!(
                                "Connecting ({}) to {}...",
                                BackendState::scheme_label(scheme),
                                endpoint
                            ));
                            let res = rt.block_on(async {
                                if state.is_busy() {
                                    return Err("Socket is already connected or bound.".to_owned());
                                }
                                match scheme {
                                    ExchangeScheme::ReqRep => {
                                        let mut sock = ReqSocket::new();
                                        sock.connect(&endpoint).await.map_err(|e| e.to_string())?;
                                        state.socket = OpenSocket::Req(sock);
                                        Ok(())
                                    }
                                    ExchangeScheme::PubSub => {
                                        let mut sock = SubSocket::new();
                                        sock.connect(&endpoint).await.map_err(|e| e.to_string())?;
                                        state.socket = OpenSocket::Sub(sock);
                                        Ok(())
                                    }
                                    ExchangeScheme::Push => {
                                        let mut sock = PushSocket::new();
                                        sock.connect(&endpoint).await.map_err(|e| e.to_string())?;
                                        state.socket = OpenSocket::Push(sock);
                                        Ok(())
                                    }
                                    ExchangeScheme::Pull => {
                                        let mut sock = PullSocket::new();
                                        sock.connect(&endpoint).await.map_err(|e| e.to_string())?;
                                        state.socket = OpenSocket::Pull(sock);
                                        Ok(())
                                    }
                                }
                            });
                            match &res {
                                Ok(()) => state.log(&format!(
                                    "Connected ({}) to {}",
                                    BackendState::scheme_label(scheme),
                                    endpoint
                                )),
                                Err(e) => state.log(&format!(
                                    "Connect ({}) to {} failed: {}",
                                    BackendState::scheme_label(scheme),
                                    endpoint,
                                    e
                                )),
                            }
                            let _ = response.send(res);
                        }
                        BackendCommand::Bind { scheme, endpoint, response } => {
                            state.log(&format!(
                                "Binding ({}) on {}...",
                                BackendState::scheme_label(scheme),
                                endpoint
                            ));
                            let res = rt.block_on(async {
                                if state.is_busy() {
                                    return Err("Socket is already connected or bound.".to_owned());
                                }
                                match scheme {
                                    ExchangeScheme::ReqRep => {
                                        let mut sock = RepSocket::new();
                                        let bound =
                                            sock.bind(&endpoint).await.map_err(|e| e.to_string())?;
                                        let ep_str = bound.to_string();
                                        state.socket = OpenSocket::Rep(sock);
                                        Ok(ep_str)
                                    }
                                    ExchangeScheme::PubSub => {
                                        let mut sock = PubSocket::new();
                                        let bound =
                                            sock.bind(&endpoint).await.map_err(|e| e.to_string())?;
                                        let ep_str = bound.to_string();
                                        state.socket = OpenSocket::Pub(sock);
                                        Ok(ep_str)
                                    }
                                    ExchangeScheme::Push => {
                                        let mut sock = PushSocket::new();
                                        let bound =
                                            sock.bind(&endpoint).await.map_err(|e| e.to_string())?;
                                        let ep_str = bound.to_string();
                                        state.socket = OpenSocket::Push(sock);
                                        Ok(ep_str)
                                    }
                                    ExchangeScheme::Pull => {
                                        let mut sock = PullSocket::new();
                                        let bound =
                                            sock.bind(&endpoint).await.map_err(|e| e.to_string())?;
                                        let ep_str = bound.to_string();
                                        state.socket = OpenSocket::Pull(sock);
                                        Ok(ep_str)
                                    }
                                }
                            });
                            match &res {
                                Ok(bound) => state.log(&format!(
                                    "Bound ({}) on {}",
                                    BackendState::scheme_label(scheme),
                                    bound
                                )),
                                Err(e) => state.log(&format!(
                                    "Bind ({}) on {} failed: {}",
                                    BackendState::scheme_label(scheme),
                                    endpoint,
                                    e
                                )),
                            }
                            let _ = response.send(res);
                        }
                        BackendCommand::Subscribe { prefix, response } => {
                            state.log(&format!("Subscribing to prefix: {:?}", prefix));
                            let res = rt.block_on(async {
                                match &mut state.socket {
                                    OpenSocket::Sub(sock) => sock
                                        .subscribe(&prefix)
                                        .await
                                        .map_err(|e| e.to_string()),
                                    OpenSocket::None => Err(
                                        "No socket: call ConnectSub(endpoint) before Subscribe."
                                            .to_owned(),
                                    ),
                                    _ => Err(
                                        "Subscribe is only allowed on SUB (after ConnectSub)."
                                            .to_owned(),
                                    ),
                                }
                            });
                            match &res {
                                Ok(()) => state.log(&format!(
                                    "Subscribed to prefix: {:?}",
                                    prefix
                                )),
                                Err(e) => state.log(&format!("Subscribe failed: {}", e)),
                            }
                            let _ = response.send(res);
                        }
                        BackendCommand::Send {
                            payload,
                            timeout_ms,
                            response,
                        } => {
                            let payload_len = payload.len();
                            state.log(&format!(
                                "Sending {} bytes (timeout_ms={})...",
                                payload_len, timeout_ms
                            ));
                            let res = rt.block_on(async {
                                match &mut state.socket {
                                    OpenSocket::Req(sock) => {
                                        send_with_timeout(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            timeout_ms,
                                        )
                                        .await
                                    }
                                    OpenSocket::Rep(sock) => {
                                        send_with_timeout(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            timeout_ms,
                                        )
                                        .await
                                    }
                                    OpenSocket::Pub(sock) => {
                                        send_with_timeout(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            timeout_ms,
                                        )
                                        .await
                                    }
                                    OpenSocket::Push(sock) => {
                                        send_with_timeout(sock, ZmqMessage::from(payload), timeout_ms).await
                                    }
                                    OpenSocket::Sub(_) => Err(
                                        "Send is not supported on SUB sockets.".to_owned(),
                                    ),
                                    OpenSocket::Pull(_) => Err(
                                        "Send is not supported on PULL sockets.".to_owned(),
                                    ),
                                    OpenSocket::None => Err("No open socket.".to_owned()),
                                }
                            });
                            match &res {
                                Ok(()) => state.log(&format!(
                                    "Sent {} bytes successfully",
                                    payload_len
                                )),
                                Err(e) => state.log(&format!(
                                    "Send {} bytes failed: {}",
                                    payload_len, e
                                )),
                            }
                            let _ = response.send(res);
                        }
                        BackendCommand::Recv { timeout_ms, response } => {
                            state.log(&format!("Receiving (timeout_ms={})...", timeout_ms));
                            let res = rt.block_on(async {
                                match &mut state.socket {
                                    OpenSocket::Req(sock) => {
                                        recv_with_timeout(sock, timeout_ms).await
                                    }
                                    OpenSocket::Rep(sock) => {
                                        recv_with_timeout(sock, timeout_ms).await
                                    }
                                    OpenSocket::Sub(sock) => {
                                        recv_with_timeout(sock, timeout_ms).await
                                    }
                                    OpenSocket::Pull(sock) => {
                                        recv_with_timeout(sock, timeout_ms).await
                                    }
                                    OpenSocket::Pub(_) => Err(
                                        "Recv is not supported on PUB sockets.".to_owned(),
                                    ),
                                    OpenSocket::Push(_) => Err(
                                        "Recv is not supported on PUSH sockets.".to_owned(),
                                    ),
                                    OpenSocket::None => Err("No open socket.".to_owned()),
                                }
                            });
                            match &res {
                                Ok(buf) => state.log(&format!("Received {} bytes", buf.len())),
                                Err(e) => state.log(&format!("Receive failed: {}", e)),
                            }

                            let _ = response.send(res);
                        }
                        BackendCommand::Close { response } => {
                            state.close_async(&rt);
                            state.log("Socket closed");
                            let _ = response.send(Ok(()));
                        }
                        BackendCommand::SetLogger { logger, response } => {
                            state.logger = Some(logger);
                            state.log("Logger initialized");
                            let _ = response.send(Ok(()));
                        }
                        BackendCommand::Shutdown => {
                            state.close_async(&rt);
                            break;
                        }
                    }
                }
        })
        .expect("failed to start ZeroMQ backend thread");

        Self { thread }
    }

    pub fn connect(&self, scheme: ExchangeScheme, endpoint: &str) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::Connect {
                scheme,
                endpoint: endpoint.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn bind(&self, scheme: ExchangeScheme, endpoint: &str) -> Result<String, String> {
        self.thread
            .call(|response| BackendCommand::Bind {
                scheme,
                endpoint: endpoint.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn subscribe(&self, prefix: &str) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::Subscribe {
                prefix: prefix.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn send_payload(&self, payload: Vec<u8>, timeout_ms: i32) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::Send {
                payload,
                timeout_ms,
                response,
            })
            .and_then(|result| result)
    }

    pub fn recv_payload(&self, timeout_ms: i32) -> Result<Vec<u8>, String> {
        self.thread
            .call(|response| BackendCommand::Recv {
                timeout_ms,
                response,
            })
            .and_then(|result| result)
    }

    pub fn set_logger(&self, logger: Arc<Logger>) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::SetLogger { logger, response })
            .and_then(|result| result)
    }

    pub fn close_socket(&self) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::Close { response })
            .and_then(|result| result)
    }
}

impl Drop for ZeroMqBackend {
    fn drop(&mut self) {
        let _ = self
            .thread
            .shutdown(Some(BackendCommand::Shutdown));
    }
}
