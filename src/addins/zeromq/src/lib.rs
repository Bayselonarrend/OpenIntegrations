mod backend;
mod methods;

use common_core::*;
use common_logs::Logger;
use common_core::JanxValue;
use common_utils::utils::{janx_error, janx_logs, janx_success, version};
use std::sync::{Arc, Mutex};

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("ConnectReq"),
    name!("ConnectSub"),
    name!("ConnectPush"),
    name!("ConnectPull"),
    name!("BindRep"),
    name!("BindPub"),
    name!("BindPush"),
    name!("BindPull"),
    name!("Subscribe"),
    name!("Send"),
    name!("Recv"),
    name!("Close"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0..=7 => 1, // Connect*/Bind*(endpoint)
        8 => 1,     // Subscribe(prefix)
        9 => 2,     // Send(data, timeout_ms)
        10 => 1,    // Recv(timeout_ms)
        11 => 0,    // Close
        12 => 1,    // SetLogger(logger_config_json)
        13 => 1,    // GetLogs(count)
        14 => 0,    // Version
        _ => 0,
    }
}

pub fn cal_func(
    obj: &mut AddIn,
    num: usize,
    params: &mut [Variant],
) -> Box<dyn getset::ValueType> {
    let empty: [u8; 0] = [];

    match num {
        0 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(backend::ExchangeScheme::ReqRep, &ep))
        }
        1 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(backend::ExchangeScheme::PubSub, &ep))
        }
        2 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(backend::ExchangeScheme::Push, &ep))
        }
        3 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(backend::ExchangeScheme::Pull, &ep))
        }
        4 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(backend::ExchangeScheme::ReqRep, port))
        }
        5 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(backend::ExchangeScheme::PubSub, port))
        }
        6 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(backend::ExchangeScheme::Push, port))
        }
        7 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(backend::ExchangeScheme::Pull, port))
        }
        8 => {
            let prefix = params[0].get_string().unwrap_or_default();
            Box::new(obj.subscribe(&prefix))
        }
        9 => {
            let data = params[0].get_blob().unwrap_or(&empty).to_vec();
            let timeout_ms = params[1].get_i32().unwrap_or(-1);
            Box::new(obj.send(data, timeout_ms))
        }
        10 => {
            let timeout_ms = params[0].get_i32().unwrap_or(0);
            Box::new(obj.recv(timeout_ms))
        }
        11 => Box::new(obj.close()),
        12 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        13 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        14 => Box::new(version()),
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    backend: Arc<Mutex<backend::ZeroMqBackend>>,
    logger: Option<Arc<Logger>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(backend::ZeroMqBackend::new())),
            logger: None,
        }
    }

    pub fn set_logger(&mut self, logger_config: &str) -> JanxValue {
        if logger_config.is_empty() {
            return janx_error("Logger config is empty");
        }

        if self.logger.is_some() {
            return janx_success(None, None);
        }

        match Logger::from_json(logger_config) {
            Ok(logger) => {
                let logger_arc = Arc::new(logger);
                match self.lock_backend().and_then(|g| g.set_logger(logger_arc.clone())) {
                    Ok(()) => {
                        self.logger = Some(logger_arc);
                        janx_success(None, None)
                    }
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        if let Some(ref logger) = self.logger {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            janx_logs(logs, total)
        } else {
            janx_error("Logger not initialized")
        }
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("This add-in exposes no exported properties.");
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }

    pub(crate) fn lock_backend(&self) -> Result<std::sync::MutexGuard<'_, backend::ZeroMqBackend>, String> {
        self.backend
            .lock()
            .map_err(|e| format!("{}", e))
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if let Ok(guard) = self.backend.lock() {
            let _ = guard.close_socket();
        }
    }
}
