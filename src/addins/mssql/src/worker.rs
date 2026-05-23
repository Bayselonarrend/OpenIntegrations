use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::BackendThread;
use common_binary::vault::BinaryVault;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use serde_json::Value;
use tiberius::Client;
use tokio::net::TcpStream;
use tokio::runtime::Runtime;
use tokio_util::compat::{Compat, TokioAsyncWriteCompatExt};
use tiberius::Config;

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
    Shutdown,
}

pub struct Session {
    client: Option<Client<Compat<TcpStream>>>,
    logger: Option<Arc<Logger>>,
}

impl Session {
    pub fn new() -> Self {
        Self {
            client: None,
            logger: None,
        }
    }

    pub fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }
}

pub fn spawn_thread(
    binary_vault: BinaryVault,
) -> Result<BackendThread<WorkerCommand>, String> {
    let vault = binary_vault.clone();

    BackendThread::spawn("opi_mssql_backend", move |rt, rx| {
        let mut session = Session::new();

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    conn_str,
                    tls,
                    response,
                } => {
                    let result = handle_connect(&rt, &mut session, &conn_str, &tls);
                    let _ = response.send(result);
                }
                WorkerCommand::Execute {
                    query,
                    params_json,
                    force_result,
                    response,
                } => {
                    let result = handle_execute(
                        &rt,
                        &mut session,
                        &vault,
                        query,
                        params_json,
                        force_result,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down MSSQL backend");
                    break;
                }
            }
        }
    })
}

pub fn forward_logger(
    thread: &BackendThread<WorkerCommand>,
    logger: Arc<Logger>,
) -> Result<(), String> {
    thread
        .call(|response| WorkerCommand::SetLogger { logger, response })
        .and_then(|result| result)
}

fn handle_connect(
    rt: &Runtime,
    session: &mut Session,
    conn_str: &str,
    tls: &Option<TlsSettings>,
) -> Result<(), String> {
    session.log("Connecting to MSSQL...");

    let result = rt.block_on(async {
        let mut config = Config::from_ado_string(conn_str)?;

        if let Some(tls) = tls {
            if tls.enabled() {
                if tls.accept_invalid_certs {
                    config.trust_cert();
                } else if !tls.ca_cert_path.is_empty() {
                    config.trust_cert_ca(&tls.ca_cert_path);
                }
            }
        }
        let tcp = TcpStream::connect(config.get_addr()).await?;
        tcp.set_nodelay(true)?;
        Client::connect(config, tcp.compat_write()).await
    });

    match result {
        Ok(client) => {
            session.log("Connected to MSSQL");
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
    rt: &Runtime,
    session: &mut Session,
    vault: &BinaryVault,
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
        rt.block_on(query::execute(vault, client, &query, params_json, force_result))
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
