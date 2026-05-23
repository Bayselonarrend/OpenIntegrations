use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_utils::utils::json_error;
use rcon_client::{AuthRequest, RCONClient, RCONConfig, RCONRequest};
use serde_json::json;

use crate::settings::ConnectionSettings;

pub enum WorkerCommand {
    Connect {
        settings: ConnectionSettings,
        response: Sender<Result<(), String>>,
    },
    Execute {
        command: String,
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
    client: Option<RCONClient>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            client: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn connect(&mut self, settings: &ConnectionSettings) -> Result<(), String> {
        self.log(&format!("Connecting to RCON server {}", settings.url));

        let mut client = RCONClient::new(RCONConfig {
            url: settings.url.clone(),
            read_timeout: Some(settings.read_timeout as u64),
            write_timeout: Some(settings.write_timeout as u64),
        })
        .map_err(|e| e.to_string())?;

        let auth_result = client
            .auth(AuthRequest::new(settings.password.clone()))
            .map_err(|e| e.to_string())?;

        if auth_result.is_success() {
            self.client = Some(client);
            self.log("Connected to RCON server");
            Ok(())
        } else {
            let response_type = auth_result.response_type;
            Err(format!(
                "Unexpected authorization rejection (type {})",
                response_type
            ))
        }
    }

    fn execute(&mut self, command: &str) -> String {
        self.log(&format!("Execute command: {}", command));

        let Some(client) = &mut self.client else {
            return json_error("No client found. Initialize connection first");
        };

        match client.execute(RCONRequest::new(command.to_string())) {
            Ok(response) => json!({"result": true, "data": response.body}).to_string(),
            Err(e) => json_error(&e.to_string()),
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_rcon_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect { settings, response } => {
                    let result = session.connect(&settings);
                    if let Err(ref e) = result {
                        session.log(&format!("Connect failed: {}", e));
                    }
                    let _ = response.send(result);
                }
                WorkerCommand::Execute { command, response } => {
                    let result = session.execute(&command);
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.client.is_some());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down RCON backend");
                    session.client = None;
                    break;
                }
            }
        }
    })
}
