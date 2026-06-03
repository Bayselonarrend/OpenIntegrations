use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::janx_error;

use crate::worker::{self, WorkerCommand};

pub struct LynaBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl LynaBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            logger: None,
        }
    }

    pub fn execute_string(&mut self, code: String) -> JanxValue {
        self.call(|response| WorkerCommand::ExecuteString { code, response })
    }

    pub fn execute_file(&mut self, path: String) -> JanxValue {
        self.call(|response| WorkerCommand::ExecuteFile { path, response })
    }

    pub fn execute_bytecode(&mut self, bytecode: Vec<u8>) -> JanxValue {
        self.call(|response| WorkerCommand::ExecuteBytecode { bytecode, response })
    }

    pub fn execute_bytecode_file(&mut self, path: String) -> JanxValue {
        self.call(|response| WorkerCommand::ExecuteBytecodeFile { path, response })
    }

    pub fn compile_to_bytecode(&mut self, code: String) -> Result<Vec<u8>, String> {
        self.call_binary(|response| WorkerCommand::CompileToBytecode { code, response })
    }

    pub fn compile_file_to_bytecode(&mut self, path: String) -> Result<Vec<u8>, String> {
        self.call_binary(|response| WorkerCommand::CompileFileToBytecode { path, response })
    }

    pub fn call_function(&mut self, function_name: String, args_janx: Vec<u8>) -> JanxValue {
        self.call(|response| WorkerCommand::CallFunction {
            function_name,
            args_janx,
            response,
        })
    }

    pub fn set_global(&mut self, variable_name: String, value_janx: Vec<u8>) -> JanxValue {
        self.call(|response| WorkerCommand::SetGlobal {
            variable_name,
            value_janx,
            response,
        })
    }

    pub fn get_global(&mut self, variable_name: String) -> JanxValue {
        self.call(|response| WorkerCommand::GetGlobal {
            variable_name,
            response,
        })
    }

    pub fn add_package(&mut self, package_name: String, code: String) -> JanxValue {
        self.call(|response| WorkerCommand::AddPackage {
            package_name,
            code,
            response,
        })
    }

    pub fn load_package_from_file(&mut self, package_name: String, file_path: String) -> JanxValue {
        self.call(|response| WorkerCommand::LoadPackageFromFile {
            package_name,
            file_path,
            response,
        })
    }

    pub fn get_packages(&mut self) -> JanxValue {
        self.call(|response| WorkerCommand::GetPackages { response })
    }

    pub fn reset(&mut self) -> JanxValue {
        self.call(|response| WorkerCommand::Reset { response })
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

    fn call_binary<F>(&mut self, build: F) -> Result<Vec<u8>, String>
    where
        F: FnOnce(Sender<Result<Vec<u8>, String>>) -> WorkerCommand,
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

        let thread = worker::spawn_thread()?;
        self.thread = Some(thread);

        if let Some(logger) = self.logger.clone() {
            self.call_result(|response| WorkerCommand::SetLogger { logger, response })?;
        }

        Ok(())
    }
}

impl Drop for LynaBackend {
    fn drop(&mut self) {
        self.close_backend();
    }
}
