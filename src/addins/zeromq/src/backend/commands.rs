use std::sync::Arc;
use std::sync::mpsc::Sender;
use common_logs::Logger;
use crate::backend::ExchangeScheme;

#[derive(Debug)]
pub enum BackendCommand {
    Connect {
        scheme: ExchangeScheme,
        endpoint: String,
        response: Sender<Result<(), String>>,
    },
    Bind {
        scheme: ExchangeScheme,
        endpoint: String,
        response: Sender<Result<String, String>>,
    },
    Subscribe {
        prefix: String,
        response: Sender<Result<(), String>>,
    },
    Send {
        payload: Vec<u8>,
        timeout_ms: i32,
        response: Sender<Result<(), String>>,
    },
    Recv {
        timeout_ms: i32,
        response: Sender<Result<Vec<u8>, String>>,
    },
    Close {
        response: Sender<Result<(), String>>,
    },
    IsBusy {
        response: Sender<bool>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}