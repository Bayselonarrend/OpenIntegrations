mod backend;
mod methods;

use common_binary::vault::BinaryVault;
use common_core::*;
use std::sync::{Arc, Mutex};

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Bind"),
    name!("Subscribe"),
    name!("Send"),                    // 3
    name!("Recv"),                    // 4
    name!("Close"),                   // 5
    name!("RetrieveBinaryFromVault"),
    name!("BindPub"),
    name!("ConnectSub"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 | 1 | 7 | 8 => 1, // Connect/Bind/BindPub/ConnectSub(endpoint)
        2 => 1,             // Subscribe(prefix)
        3 => 2,             // Send(data, flags)
        4 => 1,             // Recv
        5 => 0,             // Close
        6 => 1,             // RetrieveBinaryFromVault
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
            Box::new(obj.connect(&ep))
        }
        1 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.bind(&ep))
        }
        2 => {
            let prefix = params[0].get_string().unwrap_or_default();
            Box::new(obj.subscribe(&prefix))
        }
        3 => {
            let data = params[0].get_blob().unwrap_or(&empty).to_vec();
            let flags = params[1].get_i32().unwrap_or(0);
            Box::new(obj.send(data, flags))
        }
        4 => {
            let timeout_ms = params[0].get_i32().unwrap_or(0);
            Box::new(obj.recv(timeout_ms))
        }
        5 => Box::new(obj.close()),
        6 => {
            let key = params[0].get_string().unwrap_or_default();
            Box::new(obj.retrieve_binary_from_vault(&key))
        }
        7 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.bind_pub(&ep))
        }
        8 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect_sub(&ep))
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
