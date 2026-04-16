mod read;
mod write;
mod connections;

use std::sync::Arc;
use std::sync::Mutex;
use std::net::SocketAddr;
use axum::{
    Router,
    routing::get,
    extract::{ConnectInfo, State, WebSocketUpgrade, ws::{WebSocket, Message}},
    response::Response,
};
use tokio::sync::mpsc;
use tokio::sync::oneshot;
use tokio::task::JoinHandle;
use futures_util::{StreamExt, SinkExt};
use common_binary::vault::BinaryVault;
use common_logs::{Logger, log};
use common_server::ConnectionManager;
use common_utils::utils::lock_unpoisoned;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct WebSocketServerConfig {
    #[serde(default = "default_max_connections")]
    pub max_connections: usize,

    #[serde(default = "default_ws_routes")]
    pub routes: Vec<String>,
}

fn default_max_connections() -> usize {
    100
}

fn default_ws_routes() -> Vec<String> {
    vec!["/".to_string()]
}

impl Default for WebSocketServerConfig {
    fn default() -> Self {
        Self {
            max_connections: 100,
            routes: vec!["/".to_string()],
        }
    }
}

pub struct WebSocketServerState {
    pub(crate) vault: BinaryVault,
    pub(crate) logger: Option<Arc<Logger>>,
    pub(crate) manager: Arc<Mutex<ConnectionManager<WebSocketConnection>>>,
    pub(crate) shutdown_tx: Option<oneshot::Sender<()>>,
    pub(crate) server_task: Option<JoinHandle<()>>,
}

pub struct WebSocketConnection {
    pub(crate) addr: String,
    pub(crate) outgoing_tx: mpsc::UnboundedSender<OutgoingMessage>,
    pub(crate) incoming_rx: mpsc::UnboundedReceiver<Vec<u8>>,
    pub(crate) is_closed: bool,
}

pub(crate) enum OutgoingMessage {
    Binary(Vec<u8>),
    Text(String),
    Ping(Vec<u8>),
    Pong(Vec<u8>),
    Close,
}

impl WebSocketServerState {
    pub(crate) fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    pub async fn start(
        port: u16,
        config_json: &str,
        vault: BinaryVault,
        logger: Option<Arc<Logger>>,
    ) -> Result<Self, String> {

        let config = if config_json.is_empty() {
            WebSocketServerConfig::default()
        } else {
            serde_json::from_str::<WebSocketServerConfig>(config_json)
                .map_err(|e| format!("Invalid WebSocket server config: {}", e))?
        };

        if let Some(ref log) = logger {
            log!(log, "Starting WebSocket server on port {} with config: {:?}", port, config);
        }

        let manager = Arc::new(Mutex::new(ConnectionManager::new(config.max_connections, logger.clone())));
        let (shutdown_tx, shutdown_rx) = oneshot::channel::<()>();
        let state = Arc::new(tokio::sync::Mutex::new(WebSocketServerState {
            vault: vault.clone(),
            logger: logger.clone(),
            manager: manager.clone(),
            shutdown_tx: None,
            server_task: None,
        }));

        let mut app = Router::new();
        for route in &config.routes {
            if let Some(ref log) = logger {
                log!(log, "Adding WebSocket route: {}", route);
            }
            app = app.route(route, get(ws_handler));
        }
        let app = app.with_state(state.clone());

        let addr = format!("0.0.0.0:{}", port);
        let listener = tokio::net::TcpListener::bind(&addr)
            .await
            .map_err(|e| format!("Failed to bind to {}: {}", addr, e))?;

        if let Some(ref log) = logger {
            log!(log, "WebSocket server listening on {}", addr);
        }

        let server_task = tokio::spawn(async move {
            if let Err(e) = axum::serve(listener, app.into_make_service_with_connect_info::<SocketAddr>())
                .with_graceful_shutdown(async {
                    let _ = shutdown_rx.await;
                })
                .await
            {
                eprintln!("WebSocket server error: {}", e);
            }
        });

        Ok(WebSocketServerState {
            vault,
            logger: logger.clone(),
            manager,
            shutdown_tx: Some(shutdown_tx),
            server_task: Some(server_task),
        })
    }

    pub async fn shutdown(&mut self) {
        self.close_all_connections_internal();

        if let Some(shutdown_tx) = self.shutdown_tx.take() {
            let _ = shutdown_tx.send(());
        }

        if let Some(server_task) = self.server_task.take() {
            let _ = server_task.await;
        }
    }

}

async fn ws_handler(
    ws: WebSocketUpgrade,
    ConnectInfo(addr): ConnectInfo<SocketAddr>,
    State(state): State<Arc<tokio::sync::Mutex<WebSocketServerState>>>,
) -> Response {
    ws.on_upgrade(move |socket| handle_websocket(socket, state, addr))
}

async fn handle_websocket(
    socket: WebSocket,
    state: Arc<tokio::sync::Mutex<WebSocketServerState>>,
    addr: SocketAddr,
) {
    let connection_id = ConnectionManager::<WebSocketConnection>::generate_id();
    let (outgoing_tx, mut outgoing_rx) = mpsc::unbounded_channel();
    let (incoming_tx, incoming_rx) = mpsc::unbounded_channel();

    {
        let locked_state = state.lock().await;
        {
            let mut manager = lock_unpoisoned(&locked_state.manager);
            
            manager.add(connection_id.clone(), WebSocketConnection {
                addr: addr.to_string(),
                outgoing_tx,
                incoming_rx,
                is_closed: false,
            });
        }
        locked_state.log(&format!("WebSocket connected: {}", connection_id));
    }

    let state_clone = state.clone();

    let (mut ws_sender, mut ws_receiver) = socket.split();

    let mut send_task = tokio::spawn(async move {
        while let Some(msg) = outgoing_rx.recv().await {
            match msg {
                OutgoingMessage::Binary(data) => {
                    if ws_sender.send(Message::Binary(data.into())).await.is_err() {
                        break;
                    }
                }
                OutgoingMessage::Text(text) => {
                    if ws_sender.send(Message::Text(text.into())).await.is_err() {
                        break;
                    }
                }
                OutgoingMessage::Ping(data) => {
                    if ws_sender.send(Message::Ping(data.into())).await.is_err() {
                        break;
                    }
                }
                OutgoingMessage::Pong(data) => {
                    if ws_sender.send(Message::Pong(data.into())).await.is_err() {
                        break;
                    }
                }
                OutgoingMessage::Close => {
                    let _ = ws_sender.send(Message::Close(None)).await;
                    break;
                }
            }
        }
    });

    let mut recv_task = tokio::spawn(async move {
        while let Some(Ok(msg)) = ws_receiver.next().await {
            if let Message::Binary(data) = msg {
                let _ = incoming_tx.send(data.to_vec());
            } else if let Message::Text(text) = msg {
                let _ = incoming_tx.send(text.as_bytes().to_vec());
            }
        }
    });

    tokio::select! {
        _ = &mut send_task => {
            recv_task.abort();
            let _ = recv_task.await;
        },
        _ = &mut recv_task => {
            send_task.abort();
            let _ = send_task.await;
        },
    }

    let locked_state = state_clone.lock().await;
    {
        let mut manager = lock_unpoisoned(&locked_state.manager);

        let _ = manager.get_mut(&connection_id, |conn| {
            conn.is_closed = true;
        });
    }
    locked_state.log(&format!("WebSocket disconnected: {}", connection_id));
}
