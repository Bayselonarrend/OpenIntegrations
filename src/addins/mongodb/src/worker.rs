use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::BackendThread;
use common_janx::{FromJanx, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};
use mongodb::bson::{Bson, Document};
use mongodb::Client;
use tokio::runtime::Runtime;

use crate::bson::{bson_to_janx_value, janx_value_to_bson};

pub struct ExecuteParams {
    pub operation: String,
    pub database: Option<String>,
    pub argument: Option<JanxValue>,
    pub data: Option<JanxValue>,
}

pub fn parse_execute_params(value: JanxValue) -> Result<ExecuteParams, String> {
    use std::collections::BTreeMap;

    let map = BTreeMap::<String, JanxValue>::from_janx(&value)
        .ok_or_else(|| "Execute params must be a Janx object".to_string())?;

    let operation = map
        .get("operation")
        .and_then(String::from_janx)
        .ok_or_else(|| "Missing or invalid 'operation' field".to_string())?;

    Ok(ExecuteParams {
        operation,
        database: map.get("database").and_then(String::from_janx),
        argument: map.get("argument").cloned(),
        data: map.get("data").cloned(),
    })
}

pub enum WorkerCommand {
    Connect {
        connection_string: String,
        response: Sender<Result<(), String>>,
    },
    Execute {
        params: ExecuteParams,
        response: Sender<JanxValue>,
    },
    Disconnect {
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
    client: Option<Client>,
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
}

pub fn spawn_thread(
    logger: Option<Arc<Logger>>,
) -> Result<BackendThread<WorkerCommand>, String> {
    BackendThread::spawn("opi_mongodb_backend", move |rt, rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    connection_string,
                    response,
                } => {
                    let result = handle_connect(&rt, &mut session, &connection_string);
                    let _ = response.send(result);
                }
                WorkerCommand::Execute { params, response } => {
                    let result_frame = if session.client.is_none() {
                        janx_error("Not connected to MongoDB")
                    } else {
                        let result = rt.block_on(execute_operation(
                            session.client.as_ref().unwrap(),
                            &params,
                        ));

                        match result {
                            Ok(data) => janx_success(Some(data), None),
                            Err(e) => janx_error(&e),
                        }
                    };

                    session.log(&format!("Execute operation: {}", params.operation));
                    let _ = response.send(result_frame);
                }
                WorkerCommand::Disconnect { response } => {
                    session.log("Disconnecting from MongoDB");
                    session.client = None;
                    let _ = response.send(Ok(()));
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
                    session.log("Shutting down MongoDB backend");
                    break;
                }
            }
        }
    })
}

fn handle_connect(
    rt: &Runtime,
    session: &mut Session,
    connection_string: &str,
) -> Result<(), String> {
    session.log("Connecting to MongoDB...");

    let result = rt.block_on(async {
        let client = Client::with_uri_str(connection_string)
            .await
            .map_err(|e| format!("Failed to connect to MongoDB: {}", e))?;

        client
            .list_database_names()
            .await
            .map_err(|e| format!("Failed to verify connection: {}", e))?;

        Ok(client)
    });

    match result {
        Ok(client) => {
            session.log("Connected to MongoDB");
            session.client = Some(client);
            Ok(())
        }
        Err(e) => {
            session.log(&format!("Connect failed: {}", e));
            Err(e)
        }
    }
}

async fn execute_operation(
    client: &Client,
    params: &ExecuteParams,
) -> Result<JanxValue, String> {
    let db = match &params.database {
        Some(d) => client.database(d),
        None => client
            .default_database()
            .unwrap_or_else(|| client.database("admin")),
    };

    let mut command = Document::new();

    if let Some(value) = &params.argument {
        command.insert(&params.operation, janx_value_to_bson(value)?);
    } else {
        command.insert(&params.operation, 1);
    }

    if let Some(JanxValue::Object(data_map)) = &params.data {
        for (key, value) in data_map {
            if key != &params.operation {
                command.insert(key, janx_value_to_bson(value)?);
            }
        }
    }

    let result_doc = db
        .run_command(command)
        .await
        .map_err(|e| format!("MongoDB command '{}' failed: {}", &params.operation, e))?;

    Ok(bson_to_janx_value(&Bson::Document(result_doc)))
}
