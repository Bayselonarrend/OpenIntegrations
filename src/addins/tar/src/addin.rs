use std::sync::{Arc, Mutex};

use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_logs, janx_success, lock_unpoisoned};

use crate::backend::TarBackend;

pub struct AddIn {
    backend: Arc<Mutex<TarBackend>>,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            backend: Arc::new(Mutex::new(TarBackend::new())),
        }
    }

    fn lock_backend(&self) -> std::sync::MutexGuard<'_, TarBackend> {
        lock_unpoisoned(&self.backend)
    }

    pub fn pack_to_file_from_file(
        &mut self,
        source_path: &str,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.lock_backend()
            .pack_to_file_from_file(source_path, archive_path, settings)
    }

    pub fn pack_to_buffer_from_file(
        &mut self,
        source_path: &str,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.lock_backend()
            .pack_to_buffer_from_file(source_path, settings)
    }

    pub fn pack_to_buffer_from_description(
        &mut self,
        description: &JanxValue,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.lock_backend()
            .pack_to_buffer_from_description(description, settings)
    }

    pub fn pack_to_file_from_description(
        &mut self,
        description: &JanxValue,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.lock_backend()
            .pack_to_file_from_description(description, archive_path, settings)
    }

    pub fn unpack_to_file_from_file(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.lock_backend()
            .unpack_to_file_from_file(archive_path, destination_path, password)
    }

    pub fn unpack_to_file_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.lock_backend()
            .unpack_to_file_from_buffer(archive_data, destination_path, password)
    }

    pub fn unpack_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .unpack_to_description_from_buffer(archive_data, password)
    }

    pub fn unpack_to_description_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .unpack_to_description_from_file(archive_path, password)
    }

    pub fn list_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .list_to_description_from_buffer(archive_data, password)
    }

    pub fn list_to_description_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .list_to_description_from_file(archive_path, password)
    }

    pub fn get_metadata_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .get_metadata_from_buffer(archive_data, password)
    }

    pub fn get_metadata_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .get_metadata_from_file(archive_path, password)
    }

    pub fn unpack_partial_to_file_from_file(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        self.lock_backend().unpack_partial_to_file_from_file(
            archive_path,
            destination_path,
            paths,
            password,
        )
    }

    pub fn unpack_partial_to_file_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        self.lock_backend().unpack_partial_to_file_from_buffer(
            archive_data,
            destination_path,
            paths,
            password,
        )
    }

    pub fn unpack_partial_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .unpack_partial_to_description_from_buffer(archive_data, paths, password)
    }

    pub fn unpack_partial_to_description_from_file(
        &mut self,
        archive_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.lock_backend()
            .unpack_partial_to_description_from_file(archive_path, paths, password)
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
