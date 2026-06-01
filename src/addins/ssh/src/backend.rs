use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_core::JanxValue;
use common_utils::utils::{janx_success, json_value_to_janx};

use crate::ssh_settings::SshConf;
use crate::worker::{self, WorkerCommand};

pub struct SshBackend {
    thread: Option<SyncBackendThread<WorkerCommand>>,
    conf: Option<SshConf>,
    logger: Option<Arc<Logger>>,
}

impl SshBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            conf: None,
            logger: None,
        }
    }

    pub fn is_connected(&self) -> bool {
        let Some(thread) = &self.thread else {
            return false;
        };
        thread
            .call(|response| WorkerCommand::IsConnected { response })
            .unwrap_or(false)
    }

    pub fn set_settings(&mut self, settings: String) -> Result<(), String> {
        if self.is_connected() {
            return Err("Settings can only be set before the connection is established".to_string());
        }
        let mut conf = self.conf.take().unwrap_or_else(SshConf::new);
        conf.set_settings(settings)?;
        self.conf = Some(conf);
        Ok(())
    }

    pub fn set_proxy(&mut self, proxy: String) -> Result<(), String> {
        if self.is_connected() {
            return Err("Proxy can only be set before the connection is established".to_string());
        }
        let mut conf = self.conf.take().unwrap_or_else(SshConf::new);
        conf.set_proxy(proxy)?;
        self.conf = Some(conf);
        Ok(())
    }

    pub fn set_logger(&mut self, logger: Arc<Logger>) -> Result<(), String> {
        if self.is_connected() {
            return Err(
                "Logger can only be set before the connection is established".to_string(),
            );
        }
        if self.logger.is_some() {
            return Ok(());
        }
        self.logger = Some(logger.clone());
        if let Some(ref thread) = self.thread {
            thread
                .call(|response| WorkerCommand::SetLogger { logger, response })
                .and_then(|result| result)?;
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

    pub fn connect(&mut self) -> Result<JanxValue, String> {
        if self.is_connected() {
            return Err("Connection already initialized".to_string());
        }

        let conf = self
            .conf
            .clone()
            .ok_or_else(|| "No configuration found".to_string())?;

        if conf.set.is_none() {
            return Err("No settings found".to_string());
        }

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Connect { conf, response })
    }

    pub fn disconnect(&mut self) -> Result<(), String> {
        if !self.is_connected() {
            return Err("No session".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .and_then(|result| result)
    }

    pub fn execute(&self, command: &str) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("No session".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Execute {
            command: command.to_string(),
            response,
        })
    }

    pub fn get_configuration(&self) -> Result<JanxValue, String> {
        let conf = self
            .conf
            .as_ref()
            .ok_or_else(|| "No configuration found".to_string())?;
        Ok(janx_success(
            Some(json_value_to_janx(
                serde_json::to_value(conf).unwrap_or(serde_json::Value::Null),
            )),
            Some("conf"),
        ))
    }

    pub fn make_sftp(&self) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::ToSftp { response })
    }

    pub fn make_directory(&self, path: &str, mode: i32) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::MakeDirectory {
            path: path.to_string(),
            mode,
            response,
        })
    }

    pub fn remove_directory(&self, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::RemoveDirectory {
            path: path.to_string(),
            response,
        })
    }

    pub fn list_directory(&self, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::ListDirectory {
            path: path.to_string(),
            response,
        })
    }

    pub fn upload_file(&self, file: &str, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::UploadFile {
            file: file.to_string(),
            path: path.to_string(),
            response,
        })
    }

    pub fn upload_data(&self, data: Vec<u8>, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::UploadData {
            data,
            path: path.to_string(),
            response,
        })
    }

    pub fn delete_file(&self, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::RemoveFile {
            path: path.to_string(),
            response,
        })
    }

    pub fn is_sftp(&self) -> Result<bool, String> {
        if !self.is_connected() {
            return Ok(false);
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::IsSftp { response })
    }

    pub fn download_to_file(&self, path: &str, filepath: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::DownloadToFile {
            path: path.to_string(),
            filepath: filepath.to_string(),
            response,
        })
    }

    pub fn download_to_vec(&self, path: &str) -> Result<Vec<u8>, String> {
        if !self.is_connected() {
            return Err("No session".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::DownloadToBuffer {
                path: path.to_string(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn rename_object(&self, path: &str, new_path: &str, overwrite: bool) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::RenameObject {
            path: path.to_string(),
            new_path: new_path.to_string(),
            overwrite,
            response,
        })
    }

    pub fn get_file_info(&self, path: &str) -> Result<JanxValue, String> {
        self.call_janx(|response| WorkerCommand::GetFileInfo {
            path: path.to_string(),
            response,
        })
    }

    pub fn close(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
    }

    fn call_janx<F>(&self, build: F) -> Result<JanxValue, String>
    where
        F: FnOnce(std::sync::mpsc::Sender<JanxValue>) -> WorkerCommand,
    {
        if !self.is_connected() {
            return Err("No session".to_string());
        }

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

        let thread = worker::spawn_thread(self.logger.clone())?;
        self.thread = Some(thread);
        Ok(())
    }
}

impl Drop for SshBackend {
    fn drop(&mut self) {
        self.close();
    }
}
