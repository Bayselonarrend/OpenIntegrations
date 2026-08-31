use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::LdapBackend;

pub struct AddIn {
    backend: Arc<Mutex<LdapBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(LdapBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, LdapBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> JanxValue {
        match self.lock_backend().set_tls(TlsSettings {
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
        }) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => match self.lock_backend().set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(e) => janx_error(e),
            },
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.lock_backend().get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
    }

    pub fn connect(
        &mut self,
        url: &str,
        bind_dn: &str,
        password: &str,
        timeout: i32,
    ) -> JanxValue {
        match self
            .lock_backend()
            .connect(url, bind_dn, password, timeout)
        {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn disconnect(&mut self) -> JanxValue {
        match self.lock_backend().disconnect() {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn search(&self, params: &JanxValue) -> JanxValue {
        self.lock_backend()
            .search(params)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn add(&self, params: &JanxValue) -> JanxValue {
        self.lock_backend()
            .add(params)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn modify(&self, params: &JanxValue) -> JanxValue {
        self.lock_backend()
            .modify(params)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn delete(&self, dn: &str) -> JanxValue {
        self.lock_backend()
            .delete(dn)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn compare(&self, params: &JanxValue) -> JanxValue {
        self.lock_backend()
            .compare(params)
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_configuration(&self) -> JanxValue {
        self.lock_backend()
            .get_configuration()
            .unwrap_or_else(|e| janx_error(e))
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn common_core::getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn common_core::getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.lock_backend().close_backend();
    }
}
