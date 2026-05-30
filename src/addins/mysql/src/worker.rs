use std::path::PathBuf;
use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use mysql::{Opts, OptsBuilder, Pool, PooledConn, SslOpts};

use crate::query;

pub enum WorkerCommand {
    Connect {
        conn_str: String,
        tls: Option<TlsSettings>,
        response: Sender<Result<(), String>>,
    },
    Execute {
        query: String,
        params: Vec<JanxValue>,
        force_result: bool,
        response: Sender<Result<Option<Vec<JanxValue>>, String>>,
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
    pool: Option<Pool>,
    connection: Option<PooledConn>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            pool: None,
            connection: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn is_connected(&self) -> bool {
        self.pool.is_some()
    }

    fn acquire_connection(&mut self) -> Result<PooledConn, String> {
        if let Some(mut conn) = self.connection.take() {
            if conn.as_mut().ping().is_ok() {
                return Ok(conn);
            }
        }

        let pool = self
            .pool
            .as_mut()
            .ok_or_else(|| "No connections pool!".to_string())?;

        pool.get_conn().map_err(|e| e.to_string())
    }

    fn release_connection(&mut self, mut conn: PooledConn) {
        match conn.as_mut().ping() {
            Ok(_) => self.connection = Some(conn),
            Err(_) => {}
        }
    }
}

pub fn spawn_thread(
    logger: Option<Arc<Logger>>,
) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_mysql_backend", move |rx| {
        let mut session = Session::new(logger);

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
                    params,
                    force_result,
                    response,
                } => {
                    let result = handle_execute(&mut session, query, params, force_result);
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.is_connected());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down MySQL backend");
                    session.pool = None;
                    session.connection = None;
                    break;
                }
            }
        }
    })
}

fn build_pool(conn_str: &str, tls: &Option<TlsSettings>) -> Result<Pool, String> {
    let opts = Opts::from_url(conn_str).map_err(|e| e.to_string())?;
    let mut opts_builder = OptsBuilder::from_opts(opts);

    if let Some(tls) = tls {
        if tls.enabled() {
            let mut ssl_opts =
                SslOpts::default().with_danger_accept_invalid_certs(tls.accept_invalid_certs);

            if !tls.ca_cert_path.is_empty() {
                ssl_opts = ssl_opts.with_root_cert_path(Some(PathBuf::from(&tls.ca_cert_path)));
            }

            opts_builder = opts_builder.ssl_opts(ssl_opts);
        }
    }

    Pool::new(opts_builder).map_err(|e| e.to_string())
}

fn handle_connect(
    session: &mut Session,
    conn_str: &str,
    tls: &Option<TlsSettings>,
) -> Result<(), String> {
    session.log("Connecting to MySQL...");

    match build_pool(conn_str, tls) {
        Ok(pool) => {
            let conn = pool.get_conn().map_err(|e| e.to_string())?;
            session.log("Connected to MySQL");
            session.pool = Some(pool);
            session.connection = Some(conn);
            Ok(())
        }
        Err(e) => {
            session.log(&format!("Connect failed: {}", e));
            Err(e)
        }
    }
}

fn handle_execute(
    session: &mut Session,
    query: String,
    params: Vec<JanxValue>,
    force_result: bool,
) -> Result<Option<Vec<JanxValue>>, String> {
    session.log(&format!(
        "Execute query (params={}, force_result={}): {}",
        params.len(),
        force_result,
        &query
    ));

    let result = if session.is_connected() {
        let mut conn = session.acquire_connection()?;
        let result = query::execute(&mut conn, &query, params, force_result);
        session.release_connection(conn);
        result
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
