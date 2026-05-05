use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use std::time::Duration;

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
        dontwait: bool,
        response: Sender<Result<(), String>>,
    },
    Recv {
        timeout_ms: i32,
        response: Sender<Result<Vec<u8>, String>>,
    },
    Close {
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}

pub struct ZeroMqBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
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
}

impl BackendState {
    fn new() -> Self {
        Self {
            socket: OpenSocket::None,
        }
    }

    fn is_busy(&self) -> bool {
        !matches!(self.socket, OpenSocket::None)
    }

    fn close_async(&mut self, rt: &tokio::runtime::Runtime) {
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

async fn send_with_dontwait<S: SocketSend + Unpin>(
    sock: &mut S,
    msg: ZmqMessage,
    dontwait: bool,
) -> Result<(), String> {
    if dontwait {
        match timeout(Duration::from_millis(0), sock.send(msg)).await {
            Ok(Ok(())) => Ok(()),
            Ok(Err(e)) => Err(e.to_string()),
            Err(_) => Err("Send would block (DONTWAIT).".to_owned()),
        }
    } else {
        sock.send(msg).await.map_err(|e| e.to_string())
    }
}

impl ZeroMqBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let thread_handle = thread::Builder::new()
            .name("opi_zeromq_backend".to_string())
            .spawn(move || {
                let rt = tokio::runtime::Runtime::new().expect("opi_zeromq tokio Runtime");
                let mut state = BackendState::new();

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Connect { scheme, endpoint, response } => {
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
                            let _ = response.send(res);
                        }
                        BackendCommand::Bind { scheme, endpoint, response } => {
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
                            let _ = response.send(res);
                        }
                        BackendCommand::Subscribe { prefix, response } => {
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
                            let _ = response.send(res);
                        }
                        BackendCommand::Send { payload, dontwait, response } => {
                            let res = rt.block_on(async {
                                match &mut state.socket {
                                    OpenSocket::Req(sock) => {
                                        send_with_dontwait(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            dontwait,
                                        )
                                        .await
                                    }
                                    OpenSocket::Rep(sock) => {
                                        send_with_dontwait(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            dontwait,
                                        )
                                        .await
                                    }
                                    OpenSocket::Pub(sock) => {
                                        send_with_dontwait(
                                            sock,
                                            ZmqMessage::from(payload.clone()),
                                            dontwait,
                                        )
                                        .await
                                    }
                                    OpenSocket::Push(sock) => {
                                        send_with_dontwait(sock, ZmqMessage::from(payload), dontwait).await
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
                            let _ = response.send(res);
                        }
                        BackendCommand::Recv { timeout_ms, response } => {
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

                            let _ = response.send(res);
                        }
                        BackendCommand::Close { response } => {
                            state.close_async(&rt);
                            let _ = response.send(Ok(()));
                        }
                        BackendCommand::Shutdown => {
                            state.close_async(&rt);
                            break;
                        }
                    }
                }
            })
            .expect("opi_zeromq backend thread spawn");

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }

    pub fn connect(&self, scheme: ExchangeScheme, endpoint: &str) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Connect {
                scheme,
                endpoint: endpoint.to_string(),
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Connect: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }

    pub fn bind(&self, scheme: ExchangeScheme, endpoint: &str) -> Result<String, String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Bind {
                scheme,
                endpoint: endpoint.to_string(),
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Bind: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }

    pub fn subscribe(&self, prefix: &str) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Subscribe {
                prefix: prefix.to_string(),
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Subscribe: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }

    pub fn send_payload(&self, payload: Vec<u8>, dontwait: bool) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Send {
                payload,
                dontwait,
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Send: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }

    pub fn recv_payload(&self, timeout_ms: i32) -> Result<Vec<u8>, String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Recv {
                timeout_ms,
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Recv: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }

    pub fn close_socket(&self) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Close {
                response: response_tx,
            })
            .map_err(|e| format!("Failed to enqueue Close: {}", e))?;

        response_rx
            .recv()
            .map_err(|_| "Backend thread stopped unexpectedly.".to_string())?
    }
}

impl Drop for ZeroMqBackend {
    fn drop(&mut self) {
        let _ = self.tx.send(BackendCommand::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            if let Err(e) = handle.join() {
                eprintln!("opi_zeromq backend thread panicked: {:?}", e);
            }
        }
    }
}
