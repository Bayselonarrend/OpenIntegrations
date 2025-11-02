use serde_json::Value;
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use mongodb::bson::{Bson, Document};
use mongodb::Client;
use serde::{Deserialize, Serialize};
use crate::component::bson::{bson_to_json_value, json_value_to_bson};

pub struct MongoBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

#[derive(Serialize, Deserialize)]
pub struct ExecuteParams {
    pub operation: String,
    pub database: Option<String>,
    pub argument: Option<Value>,
    pub data: Option<Value>
}

pub enum BackendCommand {
    Connect {
        connection_string: String,
        response: Sender<String>,
    },
    Shutdown,
    Execute {
        params: ExecuteParams,
        response: Sender<String>,
    },
    Disconnect {
        response: Sender<String>,
    },
}

impl MongoBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let thread_handle = thread::Builder::new()
            .name("opi_mongodb_backend".to_string())
            .spawn(move || {
                let rt = tokio::runtime::Runtime::new().unwrap();
                let mut client: Option<Client> = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Connect { connection_string, response } => {
                            let client_result = rt.block_on(handle_connect(&connection_string));
                            match client_result {
                                Ok(new_client) => {
                                    client = Some(new_client);
                                    let _ = response.send("Connection established successfully".to_string());
                                }
                                Err(error_msg) => {
                                    let _ = response.send(error_msg);
                                }
                            }
                        }
                        BackendCommand::Execute { params, response } => {
                            if client.is_none() {
                                let _ = response.send("Not connected to MongoDB".to_string());
                                continue;
                            }

                            let result = rt.block_on(execute_operation(
                                client.as_ref().unwrap(),
                                &params
                            ));

                            let _ = response.send(result.unwrap_or_else(|e| e));
                        },
                        BackendCommand::Disconnect { response } => {
                            client = None;
                            let _ = response.send("Disconnected successfully".to_string());
                        }
                        BackendCommand::Shutdown => break,
                    }
                }
            })
            .unwrap();

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }
}

async fn handle_connect(connection_string: &str) -> Result<Client, String> {
    let client = Client::with_uri_str(connection_string)
        .await
        .map_err(|e| format!("Failed to connect to MongoDB: {}", e))?;

    client
        .list_database_names()
        .await
        .map_err(|e| format!("Failed to verify connection: {}", e))?;

    Ok(client)
}

async fn execute_operation(
    client: &Client,
    params: &ExecuteParams,
) -> Result<String, String> {

    let db_name = params.database.as_deref().unwrap_or("admin");
    let db = client.database(db_name);

    let mut command = Document::new();

    if let Some(value) = &params.argument {
        command.insert(&params.operation, json_value_to_bson(value));
    } else {
        command.insert(&params.operation, 1);
    }

    if let Some(Value::Object(data_map)) = &params.data {
        for (key, value) in data_map {
            if key != &params.operation {
                command.insert(key, json_value_to_bson(value));
            }
        }
    }

    let result_doc = db
        .run_command(command)
        .await
        .map_err(|e| format!("MongoDB command '{}' failed: {}", &params.operation, e))?;

    let json_result = bson_to_json_value(&Bson::Document(result_doc));
    serde_json::to_string(&json_result)
        .map_err(|e| format!("Failed to serialize command result: {}", e))
}

impl Drop for MongoBackend {
    fn drop(&mut self) {
        let _ = self.tx.send(BackendCommand::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            if let Err(e) = handle.join() {
                eprintln!("Backend thread panicked: {:?}", e);
            }
        }
    }
}