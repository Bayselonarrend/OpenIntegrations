use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::BackendThread;
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use postgres::Client;
use postgres_native_tls::MakeTlsConnector;
use postgres::NoTls;
use serde_json::Value;

use crate::query;

pub enum WorkerCommand {
    Connect {
        conn_str: String,
        tls: Option<TlsSettings>,
        response: Sender<Result<(), String>>,
    },
    Execute {
        query: String,
        params_json: Vec<Value>,
        force_result: bool,
        response: Sender<Result<Option<Vec<Value>>, String>>,
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
    binary_vault: BinaryVault,
    logger: Option<Arc<Logger>>,
    client: Option<Client>,
}

impl Session {
    fn new(binary_vault: BinaryVault, logger: Option<Arc<Logger>>) -> Self {
        Self {
            binary_vault,
            logger,
            client: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }
}

pub fn spawn_thread(
    binary_vault: BinaryVault,
    logger: Option<Arc<Logger>>,
) -> Result<BackendThread<WorkerCommand>, String> {
    BackendThread::spawn("opi_postgres_backend", move |_rt, rx| {
        let mut session = Session::new(binary_vault, logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    conn_str,
                    tls,
                    response,
                } => {
                    let result = handle_connect(&mut session, &conn_str, &tls);
                    let _ = response.send(result);
                }
                WorkerCommand::Execute {
                    query,
                    params_json,
                    force_result,
                    response,
                } => {
                    let result =
                        handle_execute(&mut session, query, params_json, force_result);
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
                    session.log("Shutting down PostgreSQL backend");
                    break;
                }
            }
        }
    })
}

fn handle_connect(
    session: &mut Session,
    conn_str: &str,
    tls: &Option<TlsSettings>,
) -> Result<(), String> {
    session.log("Connecting to PostgreSQL...");

    let tls_connector = if let Some(tls) = tls {
        if tls.enabled() {
            let connector = tls
                .get_connector()
                .map_err(|e| format!("TLS connector error: {}", e))?;
            Some(MakeTlsConnector::new(connector))
        } else {
            None
        }
    } else {
        None
    };

    let result = match tls_connector {
        Some(connector) => Client::connect(conn_str, connector),
        None => Client::connect(conn_str, NoTls),
    };

    match result {
        Ok(client) => {
            session.log("Connected to PostgreSQL");
            session.client = Some(client);
            Ok(())
        }
        Err(e) => {
            session.log(&format!("Connect failed: {}", e));
            Err(e.to_string())
        }
    }
}

fn handle_execute(
    session: &mut Session,
    query: String,
    params_json: Vec<Value>,
    force_result: bool,
) -> Result<Option<Vec<Value>>, String> {
    session.log(&format!(
        "Execute query (params={}, force_result={}): {}",
        params_json.len(),
        force_result,
        &query
    ));

    let result = if let Some(client) = &mut session.client {
        query::execute(
            &session.binary_vault,
            client,
            &query,
            params_json,
            force_result,
        )
    } else {
        Err("Not connected".to_string())
    };

    match &result {
        Ok(Some(rows)) => session.log(&format!("Query returned {} row(s)", rows.len())),
        Ok(None) => session.log("Query executed without result set"),
        Err(e) => session.log(&format!("Query failed: {}", e)),
    }

    result
}
