use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::SevenZBackend;

pub struct AddIn {
    backend: Arc<Mutex<SevenZBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(SevenZBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, SevenZBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn pack(&mut self, source_path: &str, archive_path: &str, password: &str) -> JanxValue {
        self.lock_backend()
            .pack(source_path, archive_path, password)
    }

    pub fn unpack(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.lock_backend()
            .unpack(archive_path, destination_path, password)
    }

    pub fn pack_to_buffer(&mut self, source_path: &str, password: &str) -> Result<Vec<u8>, String> {
        self.lock_backend().pack_to_buffer(source_path, password)
    }

    pub fn unpack_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.lock_backend()
            .unpack_from_buffer(archive_data, destination_path, password)
    }

    pub fn pack_from_description(
        &mut self,
        description: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.lock_backend().pack_from_description(description)
    }

    pub fn pack_from_description_to_file(
        &mut self,
        description: &JanxValue,
        archive_path: &str,
    ) -> JanxValue {
        self.lock_backend()
            .pack_from_description_to_file(description, archive_path)
    }

    pub fn set_logger(&mut self, logger_config: &JanxValue) -> JanxValue {
        match Logger::from_janx(logger_config) {
            Ok(logger) => match self.lock_backend().set_logger(Arc::new(logger)) {
                Ok(()) => janx_success(None, None),
                Err(error) => janx_error(error),
            },
            Err(error) => janx_error(format!("Failed to initialize logger: {}", error)),
        }
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        match self.lock_backend().get_logs(count) {
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
        self.lock_backend().close_backend();
    }
}
