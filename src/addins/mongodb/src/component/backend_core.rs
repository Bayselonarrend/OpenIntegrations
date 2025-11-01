use serde_json::Value;
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use mongodb::Client;

pub struct MongoBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

pub enum BackendCommand {
    Connect {
        connection_string: String,
        response: Sender<String>,
    },
    Shutdown,
    Execute {
        operation: String,
        database: Option<String>,
        collection: Option<String>,
        data: Option<Value>,
        fields: Option<Value>,
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
                        BackendCommand::Execute {
                            operation,
                            database,
                            collection,
                            data,
                            fields,
                            response,
                        } => {
                            if client.is_none() {
                                let _ = response.send("Not connected to MongoDB".to_string());
                                continue;
                            }

                            let _ = response.send(format!("Executing operation: {}", operation));
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

    pub fn send_command(&self, cmd: BackendCommand) {
        let _ = self.tx.send(cmd);
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