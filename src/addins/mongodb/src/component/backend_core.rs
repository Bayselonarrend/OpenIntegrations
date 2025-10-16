use serde_json::{Value};
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};

pub struct MongoBackend {
    pub(crate) tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
}

pub enum BackendCommand {
    Connect {
        connection_string: String,
        response: Sender<String>
    },
    Shutdown,
    Execute {
        operation: String,
        database: Option<String>,
        collection: Option<String>,
        data: Option<Value>,
        fields: Option<Value>,
        response: Sender<String>
    },
}

impl MongoBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let thread_handle = thread::Builder::new()
            .name("opi_mongodb_backend".to_string())
            .spawn(move || {
                let rt = tokio::runtime::Runtime::new().unwrap();

                //let mut client = None;

                while let Ok(cmd) = rx.recv() {
                    match cmd {
                        BackendCommand::Connect { connection_string,  response } => {}

                        BackendCommand::Execute { operation
                            , database
                            , collection
                            , data
                            , fields
                            , response } => {}

                        BackendCommand::Shutdown => break,
                    }
                }
            }).unwrap();

        Self {
            tx,
            thread_handle: Some(thread_handle),
        }
    }
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
