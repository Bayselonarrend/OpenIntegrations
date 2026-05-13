mod backend;
mod methods;

use common_binary::vault::BinaryVault;
use common_core::*;
use std::sync::{Arc, Mutex};

impl_addin_exports!(AddIn, "ZeroMQ");
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func, "ZeroMQ");

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
    name!("RetrieveBinaryFromVault"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0..=7 => 1, // Connect*/Bind*(endpoint)
        8 => 1,     // Subscribe(prefix)
        9 => 2,     // Send(data, timeout_ms)
        10 => 1,    // Recv(timeout_ms)
        11 => 0,    // Close
        12 => 1,    // RetrieveBinaryFromVault
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
            let key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&key))
        }
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    vault: BinaryVault,
    backend: Arc<Mutex<backend::ZeroMqBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            vault: BinaryVault::new(),
            backend: Arc::new(Mutex::new(backend::ZeroMqBackend::new())),
        }
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("This add-in exposes no exported properties.")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }

    pub fn retrieve_binary_from_vault(&self, vault_key: &str) -> Vec<u8> {
        self.vault
            .retrieve(&vault_key.to_string())
            .unwrap_or_else(|_| Vec::new())
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
