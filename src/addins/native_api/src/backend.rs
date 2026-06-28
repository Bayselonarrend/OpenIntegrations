use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::janx_error;

use crate::worker::{self, WorkerCommand};

pub struct NativeApiBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl NativeApiBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
        }
    }

    pub fn open_library(&mut self, path: String) -> JanxValue {
        self.call(|response| WorkerCommand::OpenLibrary { path, response })
    }

    pub fn get_class_names(&mut self) -> JanxValue {
        self.call(|response| WorkerCommand::GetClassNames { response })
    }

    pub fn create_instance(&mut self, class_name: String) -> JanxValue {
        self.call(|response| WorkerCommand::CreateInstance {
            class_name,
            response,
        })
    }

    pub fn destroy_instance(&mut self, instance_id: String) -> JanxValue {
        self.call(|response| WorkerCommand::DestroyInstance {
            instance_id,
            response,
        })
    }

    pub fn get_metadata(&mut self, instance_ref: String) -> JanxValue {
        self.call(|response| WorkerCommand::GetMetadata {
            instance_ref,
            response,
        })
    }

    pub fn call_method(
        &mut self,
        instance_ref: String,
        method: String,
        params: Vec<u8>,
        properties: Vec<u8>,
    ) -> JanxValue {
        self.call(|response| WorkerCommand::CallMethod {
            instance_ref,
            method,
            params,
            properties,
            response,
        })
    }

    pub fn get_property(&mut self, instance_ref: String, property: String) -> JanxValue {
        self.call(|response| WorkerCommand::GetProperty {
            instance_ref,
            property,
            response,
        })
    }

    pub fn set_property(
        &mut self,
        instance_ref: String,
        property: String,
        value: Vec<u8>,
    ) -> JanxValue {
        self.call(|response| WorkerCommand::SetProperty {
            instance_ref,
            property,
            value,
            response,
        })
    }

    pub fn get_properties(&mut self, instance_ref: String) -> JanxValue {
        self.call(|response| WorkerCommand::GetProperties {
            instance_ref,
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
        match self.call_thread(build) {
            Ok(value) => value,
            Err(error) => janx_error(error),
        }
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
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;
        thread.call(build)
    }

    fn ensure_thread(&mut self) -> Result<(), String> {
        if self.thread.is_some() {
            return Ok(());
        }

        let thread = worker::spawn_thread()?;
        self.thread = Some(thread);

        if let Some(logger) = self.logger.clone() {
            self.call_result(|response| WorkerCommand::SetLogger { logger, response })?;
        }

        Ok(())
    }
}

impl Drop for NativeApiBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
