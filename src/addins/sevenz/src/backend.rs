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

    pub fn pack(&mut self, source_path: &str, archive_path: &str, password: &str) -> JanxValue {
        let source_path = source_path.to_string();
        let archive_path = archive_path.to_string();
        let password = password.to_string();
        self.call(|response| WorkerCommand::Pack {
            source_path,
            archive_path,
            password,
            response,
        })
    }

    pub fn unpack(
        &mut self,
        archive_path: &str,
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        let archive_path = archive_path.to_string();
        let destination_path = destination_path.to_string();
        let password = password.to_string();
        self.call(|response| WorkerCommand::Unpack {
            archive_path,
            destination_path,
            password,
            response,
        })
    }

    pub fn pack_to_buffer(&mut self, source_path: &str, password: &str) -> Result<Vec<u8>, String> {
        let source_path = source_path.to_string();
        let password = password.to_string();
        self.call_binary(|response| WorkerCommand::PackToBuffer {
            source_path,
            password,
            response,
        })
    }

    pub fn unpack_from_buffer(
        &mut self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        let archive_data = archive_data.to_vec();
        let destination_path = destination_path.to_string();
        let password = password.to_string();
        self.call(|response| WorkerCommand::UnpackFromBuffer {
            archive_data,
            destination_path,
            password,
            response,
        })
    }

    pub fn pack_from_description(
        &mut self,
        description: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        let description = description.clone();
        self.call_binary(|response| WorkerCommand::PackFromDescription {
            description,
            response,
        })
    }

    pub fn pack_from_description_to_file(
        &mut self,
        description: &JanxValue,
        archive_path: &str,
    ) -> JanxValue {
        let description = description.clone();
        let archive_path = archive_path.to_string();
        self.call(|response| WorkerCommand::PackFromDescriptionToFile {
            description,
            archive_path,
            response,
        })
    }

    pub fn unpack_to_description(
        &mut self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        let archive_data = archive_data.to_vec();
        let password = password.to_string();
        self.call_janx(|response| WorkerCommand::UnpackToDescription {
            archive_data,
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
