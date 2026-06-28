use std::sync::{Arc, Mutex};

use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::NativeApiBackend;

pub struct AddIn {
    backend: Arc<Mutex<NativeApiBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(NativeApiBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, NativeApiBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn open_library(&self, path: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.open_library(path.to_string())
    }

    pub fn get_class_names(&self) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_class_names()
    }

    pub fn create_instance(&self, class_name: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.create_instance(class_name.to_string())
    }

    pub fn destroy_instance(&self, instance_id: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.destroy_instance(instance_id.to_string())
    }

    pub fn get_metadata(&self, instance_ref: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_metadata(instance_ref.to_string())
    }

    pub fn call_method(
        &self,
        instance_ref: &str,
        method: &str,
        params: &[u8],
        properties: &[u8],
    ) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.call_method(
            instance_ref.to_string(),
            method.to_string(),
            params.to_vec(),
            properties.to_vec(),
        )
    }

    pub fn get_property(&self, instance_ref: &str, property: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_property(instance_ref.to_string(), property.to_string())
    }

    pub fn set_property(&self, instance_ref: &str, property: &str, value: &[u8]) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.set_property(
            instance_ref.to_string(),
            property.to_string(),
            value.to_vec(),
        )
    }

    pub fn get_properties(&self, instance_ref: &str) -> JanxValue {
        let mut backend = self.lock_backend();
        backend.get_properties(instance_ref.to_string())
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => {
                let mut backend = self.lock_backend();
                match backend.set_logger(Arc::new(logger)) {
                    Ok(()) => janx_success(None, None),
                    Err(e) => janx_error(e),
                }
            }
            Err(e) => janx_error(format!("Failed to initialize logger: {}", e)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        let backend = self.lock_backend();
        match backend.get_logs(count) {
            Some((logs, total)) => janx_logs(logs, total),
            None => janx_error("Logger not initialized"),
        }
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
        let mut backend = self.lock_backend();
        backend.close_backend();
    }
}
