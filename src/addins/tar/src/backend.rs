use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::janx_error;

use crate::worker::{self, WorkerCommand};

pub struct SevenZBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl SevenZBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
        }
    }

    pub fn pack_to_file_from_file(
        &mut self,
        source_path: &str,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        let source_path = source_path.to_string();
        let archive_path = archive_path.to_string();
        let settings = settings.clone();
        self.call(|response| WorkerCommand::PackToFileFromFile {
            source_path,
            archive_path,
            settings,
            response,
        })
    }

    pub fn pack_to_buffer_from_file(
        &mut self,
        source_path: &str,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        let source_path = source_path.to_string();
        let settings = settings.clone();
        self.call_binary(|response| WorkerCommand::PackToBufferFromFile {
            source_path,
            settings,
            response,
        })
    }

    pub fn pack_to_buffer_from_description(
        &mut self,
        description: &JanxValue,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        let description = description.clone();
        let settings = settings.clone();
        self.call_binary(|response| WorkerCommand::PackToBufferFromDescription {
            description,
            settings,
            response,
        })
    }

    pub fn pack_to_file_from_description(
        &mut self,
        description: &JanxValue,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        let description = description.clone();
        let archive_path = archive_path.to_string();
        let settings = settings.clone();
        self.call(|response| WorkerCommand::PackToFileFromDescription {
            description,
            archive_path,
            settings,
            response,
        })
    }

    pub fn unpack_to_file_from_file(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        let archive_path = archive_path.to_string();
        let destination_path = destination_path.to_string();
        let password = password.to_string();
        self.call(|response| WorkerCommand::UnpackToFileFromFile {
            archive_path,
            destination_path,
            password,
            response,
        })
    }

    pub fn unpack_to_file_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        let archive_data = archive_data.to_vec();
        let destination_path = destination_path.to_string();
        let password = password.to_string();
        self.call(|response| WorkerCommand::UnpackToFileFromBuffer {
            archive_data,
            destination_path,
            password,
            response,
        })
    }

    pub fn unpack_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_data = archive_data.to_vec();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::UnpackToDescriptionFromBuffer {
            archive_data,
            password,
            response,
        })
    }

    pub fn unpack_to_description_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_path = archive_path.to_string();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::UnpackToDescriptionFromFile {
            archive_path,
            password,
            response,
        })
    }

    pub fn list_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_data = archive_data.to_vec();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::ListToDescriptionFromBuffer {
            archive_data,
            password,
            response,
        })
    }

    pub fn list_to_description_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_path = archive_path.to_string();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::ListToDescriptionFromFile {
            archive_path,
            password,
            response,
        })
    }

    pub fn get_metadata_from_buffer(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_data = archive_data.to_vec();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::GetMetadataFromBuffer {
            archive_data,
            password,
            response,
        })
    }

    pub fn get_metadata_from_file(
        &mut self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_path = archive_path.to_string();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::GetMetadataFromFile {
            archive_path,
            password,
            response,
        })
    }

    pub fn unpack_partial_to_file_from_file(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        let archive_path = archive_path.to_string();
        let destination_path = destination_path.to_string();
        let paths = paths.clone();
        let password = password.to_string();
        self.call(|response| WorkerCommand::UnpackPartialToFileFromFile {
            archive_path,
            destination_path,
            paths,
            password,
            response,
        })
    }

    pub fn unpack_partial_to_file_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        let archive_data = archive_data.to_vec();
        let destination_path = destination_path.to_string();
        let paths = paths.clone();
        let password = password.to_string();
        self.call(|response| WorkerCommand::UnpackPartialToFileFromBuffer {
            archive_data,
            destination_path,
            paths,
            password,
            response,
        })
    }

    pub fn unpack_partial_to_description_from_file(
        &mut self,
        archive_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_path = archive_path.to_string();
        let paths = paths.clone();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::UnpackPartialToDescriptionFromFile {
            archive_path,
            paths,
            password,
            response,
        })
    }

    pub fn unpack_partial_to_description_from_buffer(
        &mut self,
        archive_data: &[u8],
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_data = archive_data.to_vec();
        let paths = paths.clone();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::UnpackPartialToDescriptionFromBuffer {
            archive_data,
            paths,
            password,
            response,
        })
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) -> Result<(), String> {
        if self.logger.is_some() {
            return Ok(());
        }

        self.logger = Some(logger.clone());
        if self.thread.is_some() {
            self.call_result(|response| WorkerCommand::SetLogger { logger, response })?;
        }
        Ok(())
    }

    pub fn get_logs(&self, count: usize) -> Option<(Vec<String>, usize)> {
        self.logger.as_ref().map(|logger| {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            (logs, total)
        })
    }

    pub fn close_backend(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn call<F>(&mut self, build: F) -> JanxValue
    where
        F: FnOnce(Sender<JanxValue>) -> WorkerCommand,
    {
        self.call_thread(build).unwrap_or_else(|error| janx_error(error))
    }

    fn call_binary<F>(&mut self, build: F) -> Result<Vec<u8>, String>
    where
        F: FnOnce(Sender<Result<Vec<u8>, String>>) -> WorkerCommand,
    {
        self.call_thread(build).and_then(|result| result)
    }

    fn call_janx<F>(&mut self, build: F) -> Result<JanxValue, String>
    where
        F: FnOnce(Sender<Result<JanxValue, String>>) -> WorkerCommand,
    {
        self.call_thread(build).and_then(|result| result)
    }

    fn call_result<F>(&mut self, build: F) -> Result<(), String>
    where
        F: FnOnce(Sender<Result<(), String>>) -> WorkerCommand,
    {
        self.call_thread(build).and_then(|result| result)
    }

    fn call_thread<T, F>(&mut self, build: F) -> Result<T, String>
    where
        T: Send,
        F: FnOnce(Sender<T>) -> WorkerCommand,
    {
        self.ensure_thread()?;
        let thread = self.require_thread()?;
        thread.call(build)
    }

    fn require_thread(&self) -> Result<&SyncBackendThread<WorkerCommand>, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())
    }

    fn ensure_thread(&mut self) -> Result<(), String> {
        if self.thread.is_some() {
            return Ok(());
        }

        let thread = worker::spawn_thread(self.logger.clone())?;
        self.thread = Some(thread);

        if let Some(logger) = self.logger.clone() {
            self.call_result(|response| WorkerCommand::SetLogger { logger, response })?;
        }

        Ok(())
    }
}

impl Drop for SevenZBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
