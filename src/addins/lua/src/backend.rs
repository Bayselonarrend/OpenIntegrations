use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_utils::utils::json_error;

use crate::worker::{self, WorkerCommand};

pub struct LynaBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl LynaBackend {
    pub fn new() -> Self {
        let thread = worker::spawn_thread()
            .unwrap_or_else(|e| panic!("Failed to initialize lyna backend thread: {}", e));
        Self {
            thread: Some(thread),
            logger: None,
        }
    }

    pub fn execute_string(&self, code: String) -> String {
        self.call_json(|response| WorkerCommand::ExecuteString { code, response })
    }

    pub fn execute_file(&self, path: String) -> String {
        self.call_json(|response| WorkerCommand::ExecuteFile { path, response })
    }

    pub fn execute_bytecode(&self, bytecode: Vec<u8>) -> String {
        self.call_json(|response| WorkerCommand::ExecuteBytecode { bytecode, response })
    }

    pub fn execute_bytecode_file(&self, path: String) -> String {
        self.call_json(|response| WorkerCommand::ExecuteBytecodeFile { path, response })
    }

    pub fn compile_to_bytecode(&self, code: String) -> Result<Vec<u8>, String> {
        self.call_binary(|response| WorkerCommand::CompileToBytecode { code, response })
    }

    pub fn compile_file_to_bytecode(&self, path: String) -> Result<Vec<u8>, String> {
        self.call_binary(|response| WorkerCommand::CompileFileToBytecode { path, response })
    }

    pub fn call_function(&self, function_name: String, args_json: String) -> String {
        self.call_json(|response| WorkerCommand::CallFunction {
            function_name,
            args_json,
            response,
        })
    }

    pub fn set_global(&self, variable_name: String, value_json: String) -> String {
        self.call_json(|response| WorkerCommand::SetGlobal {
            variable_name,
            value_json,
            response,
        })
    }

    pub fn get_global(&self, variable_name: String) -> String {
        self.call_json(|response| WorkerCommand::GetGlobal {
            variable_name,
            response,
        })
    }

    pub fn add_package(&self, package_name: String, code: String) -> String {
        self.call_json(|response| WorkerCommand::AddPackage {
            package_name,
            code,
            response,
        })
    }

    pub fn load_package_from_file(&self, package_name: String, file_path: String) -> String {
        self.call_json(|response| WorkerCommand::LoadPackageFromFile {
            package_name,
            file_path,
            response,
        })
    }

    pub fn get_packages(&self) -> String {
        self.call_json(|response| WorkerCommand::GetPackages { response })
    }

    pub fn reset(&self) -> Result<(), String> {
        self.call_result(|response| WorkerCommand::Reset { response })
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) -> Result<(), String> {
        if self.logger.is_some() {
            return Ok(());
        }

        self.logger = Some(logger.clone());
        self.call_result(|response| WorkerCommand::SetLogger { logger, response })
    }

    pub fn get_logs(&self, count: usize) -> Option<(Vec<String>, usize)> {
        self.logger.as_ref().map(|logger| {
            let logs = logger.get_last_logs(count);
            let total = logger.len();
            (logs, total)
        })
    }

    fn call_json<F>(&self, build: F) -> String
    where
        F: FnOnce(Sender<String>) -> WorkerCommand,
    {
        match self.call_thread(build) {
            Ok(json) => json,
            Err(e) => json_error(&e),
        }
    }

    fn call_binary<F>(&self, build: F) -> Result<Vec<u8>, String>
    where
        F: FnOnce(Sender<Result<Vec<u8>, String>>) -> WorkerCommand,
    {
        self.call_thread(build).and_then(|result| result)
    }

    fn call_result<F>(&self, build: F) -> Result<(), String>
    where
        F: FnOnce(Sender<Result<(), String>>) -> WorkerCommand,
    {
        self.call_thread(build).and_then(|result| result)
    }

    fn call_thread<T, F>(&self, build: F) -> Result<T, String>
    where
        T: Send,
        F: FnOnce(Sender<T>) -> WorkerCommand,
    {
        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;
        thread.call(build)
    }

}

impl Drop for LynaBackend {
    fn drop(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }
}

