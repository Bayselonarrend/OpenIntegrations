use std::collections::HashMap;
use std::sync::Arc;

use common_backend::BackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;

use crate::worker::{self, WorkerCommand};
pub struct GrpcBackend {
    thread: Option<BackendThread<WorkerCommand>>,
    logger: Option<Arc<Logger>>,
}

impl GrpcBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
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

    pub fn connect(
        &mut self,
        address: &str,
        tls_settings: &Option<TlsSettings>,
    ) -> Result<(), String> {
        if self.is_connected() {
            return Err("Connection already initialized".to_string());
        }

        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Connect {
                address: address.to_string(),
                tls_settings: tls_settings.clone(),
                response,
            })
            .and_then(|result| result)
    }

    pub fn disconnect(&mut self) -> Result<(), String> {
        if !self.is_connected() {
            return Err("Connection already closed".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread
            .call(|response| WorkerCommand::Disconnect { response })
            .and_then(|result| result)
    }

    pub fn call(&self, request: &JanxValue) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Call {
            params: request.clone(),
            response,
        })
    }

    pub fn load_proto(&mut self, filename: &str, content: &str) -> Result<(), String> {
        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        let response = thread.call(|response| WorkerCommand::LoadProto {
            filename: filename.to_string(),
            content: content.to_string(),
            response,
        })?;

        response_to_result(response)
    }

    pub fn compile_protos(&mut self) -> Result<(), String> {
        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        let response = thread.call(|response| WorkerCommand::CompileProtos { response })?;

        response_to_result(response)
    }

    pub fn set_metadata(&mut self, metadata: HashMap<String, String>) -> Result<(), String> {
        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        let response = thread.call(|response| WorkerCommand::SetMetadata { metadata, response })?;
        response_to_result(response)
    }

    pub fn list_services(&self) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::ListServices { response })
    }

    pub fn list_methods(&self, service_name: &str) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::ListMethods {
                service_name: service_name.to_string(),
                response,
            })
    }

    pub fn get_method_info(&self, service_name: &str, method_name: &str) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::GetMethodInfo {
                service_name: service_name.to_string(),
                method_name: method_name.to_string(),
                response,
            })
    }

    pub fn call_server_stream(&self, params: &JanxValue) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::CallServerStream {
                params: params.clone(),
                response,
            })
    }

    pub fn start_client_stream(&self, params: &JanxValue) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::StartClientStream {
                params: params.clone(),
                response,
            })
    }

    pub fn start_bidi_stream(&self, params: &JanxValue) -> Result<JanxValue, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::StartBidiStream {
                params: params.clone(),
                response,
            })
    }

    pub fn send_message(&self, stream_id: &str, message: &JanxValue) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::SendMessage {
                stream_id: stream_id.to_string(),
                message: message.clone(),
                response,
            })
    }

    pub fn get_next_message(&self, stream_id: &str) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::GetNextMessage {
                stream_id: stream_id.to_string(),
                response,
            })
    }

    pub fn finish_sending(&self, stream_id: &str) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::FinishSending {
                stream_id: stream_id.to_string(),
                response,
            })
    }

    pub fn close_stream(&self, stream_id: &str) -> Result<JanxValue, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::CloseStream {
                stream_id: stream_id.to_string(),
                response,
            })
    }

    pub fn close_all_streams(&mut self) -> Result<(), String> {
        let Some(thread) = self.thread.as_ref() else {
            return Ok(());
        };

        thread
            .call(|response| WorkerCommand::CloseAllStreams { response })
            .and_then(|result| result)
    }

    pub fn close(&mut self) {
        if let Some(mut thread) = self.thread.take() {
            let _ = thread.shutdown(Some(WorkerCommand::Shutdown));
        }
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

fn response_to_result(value: JanxValue) -> Result<(), String> {
    if common_utils::utils::janx_result_ok(&value) {
        Ok(())
    } else {
        match value {
            JanxValue::Object(map) => Err(map
                .get("error")
                .and_then(|v| match v {
                    JanxValue::String(s) => Some(s.clone()),
                    _ => None,
                })
                .unwrap_or_else(|| "Unknown error".to_string())),
            _ => Err("Invalid response".to_string()),
        }
    }
}

impl Drop for GrpcBackend {
    fn drop(&mut self) {
        self.close();
    }
}
