use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use rusqlite::{Connection, OpenFlags};

use crate::query;

pub enum WorkerCommand {
    Connect {
        database: String,
        response: Sender<Result<(), String>>,
    },
    Execute {
        query: String,
        params: Vec<JanxValue>,
        force_result: bool,
        response: Sender<Result<Option<Vec<JanxValue>>, String>>,
    },
    LoadExtension {
        path: String,
        entry_point: String,
        response: Sender<Result<(), String>>,
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
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            connection: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn is_connected(&self) -> bool {
        self.connection.is_some()
    }

    fn close_connection(&mut self) {
        if let Some(conn) = self.connection.take() {
            let _ = conn.close();
        }
    }
}

pub fn spawn_thread(
    logger: Option<Arc<Logger>>,
) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_sqlite_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect { database, response } => {
                    let result = handle_connect(&mut session, &database);
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
                WorkerCommand::LoadExtension {
                    path,
                    entry_point,
                    response,
                } => {
                    let result = handle_load_extension(&mut session, path, entry_point);
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
                    session.log("Shutting down SQLite backend");
                    session.close_connection();
                    break;
                }
            }
        }
    })
}

fn open_connection(database: &str) -> Result<Connection, String> {
    let conn_result = if database.is_empty() {
        Connection::open_in_memory()
    } else {
        let flags = OpenFlags::SQLITE_OPEN_READ_WRITE
            | OpenFlags::SQLITE_OPEN_CREATE
            | OpenFlags::SQLITE_OPEN_URI
            | OpenFlags::SQLITE_OPEN_NO_MUTEX;
        Connection::open_with_flags(database, flags)
    };

    conn_result.map_err(|e| match e {
        rusqlite::Error::SqliteFailure(err, msg) => format!(
            "SQLite error: code={:?}, message='{}', details={:?}",
            err.code, err.extended_code, msg
        ),
        _ => e.to_string(),
    })
}

fn handle_connect(session: &mut Session, database: &str) -> Result<(), String> {
    session.log(&format!(
        "Connecting to SQLite (in_memory={})",
        database.is_empty()
    ));

    match open_connection(database) {
        Ok(conn) => {
            session.log("Connected to SQLite");
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

    let result = if let Some(conn) = session.connection.as_mut() {
        query::execute(conn, &query, params, force_result)
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

fn handle_load_extension(
    session: &mut Session,
    path: String,
    entry_point: String,
) -> Result<(), String> {
    session.log(&format!("LoadExtension path={path}"));

    let result = if let Some(conn) = session.connection.as_mut() {
        query::load_extension(conn, path, entry_point)
    } else {
        Err("Not connected".to_string())
    };

    match &result {
        Ok(()) => session.log("Extension loaded"),
        Err(e) => session.log(&format!("LoadExtension failed: {}", e)),
    }

    result
}
