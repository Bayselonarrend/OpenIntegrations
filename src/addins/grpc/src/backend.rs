use std::collections::HashMap;
use std::sync::Arc;

use common_backend::BackendThread;
use common_binary::vault::{BinaryInput, BinaryVault};
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;

use crate::grpc_caller::CallParams;
use crate::worker::{self, WorkerCommand};

pub struct GrpcBackend {
    thread: Option<BackendThread<WorkerCommand>>,
    binary_vault: BinaryVault,
    logger: Option<Arc<Logger>>,
}

impl GrpcBackend {
    pub fn new() -> Self {
        Self {
            thread: None,
            binary_vault: BinaryVault::new(),
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

    pub fn store_binary(&mut self, input: BinaryInput) -> Result<String, String> {
        self.binary_vault.store(input).map_err(|e| e.to_string())
    }

    pub fn connect(&mut self, address: &str, tls_settings: &Option<TlsSettings>) -> Result<(), String> {
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

    pub fn call(&self, request_json: &str) -> Result<String, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        let params: CallParams = serde_json::from_str(request_json)
            .map_err(|e| format!("Invalid request JSON: {}", e))?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::Call { params, response })
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

        if response.is_empty() {
            Ok(())
        } else {
            Err(response)
        }
    }

    pub fn compile_protos(&mut self) -> Result<(), String> {
        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        let response = thread.call(|response| WorkerCommand::CompileProtos { response })?;

        if response.is_empty() {
            Ok(())
        } else {
            Err(response)
        }
    }

    pub fn set_metadata(&mut self, metadata: HashMap<String, String>) -> Result<(), String> {
        self.ensure_thread()?;

        let thread = self
            .thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?;

        thread.call(|response| WorkerCommand::SetMetadata { metadata, response })?;
        Ok(())
    }

    pub fn list_services(&self) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::ListServices { response })
    }

    pub fn list_methods(&self, service_name: &str) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::ListMethods {
                service_name: service_name.to_string(),
                response,
            })
    }

    pub fn get_method_info(&self, service_name: &str, method_name: &str) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::GetMethodInfo {
                service_name: service_name.to_string(),
                method_name: method_name.to_string(),
                response,
            })
    }

    pub fn call_server_stream(&self, params_json: &str) -> Result<String, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::CallServerStream {
                params_json: params_json.to_string(),
                response,
            })
    }

    pub fn start_client_stream(&self, params_json: &str) -> Result<String, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::StartClientStream {
                params_json: params_json.to_string(),
                response,
            })
    }

    pub fn start_bidi_stream(&self, params_json: &str) -> Result<String, String> {
        if !self.is_connected() {
            return Err("Connection not initialized".to_string());
        }

        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::StartBidiStream {
                params_json: params_json.to_string(),
                response,
            })
    }

    pub fn send_message(&self, stream_id: &str, message_json: &str) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::SendMessage {
                stream_id: stream_id.to_string(),
                message_json: message_json.to_string(),
                response,
            })
    }

    pub fn get_next_message(&self, stream_id: &str) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::GetNextMessage {
                stream_id: stream_id.to_string(),
                response,
            })
    }

    pub fn finish_sending(&self, stream_id: &str) -> Result<String, String> {
        self.thread
            .as_ref()
            .ok_or_else(|| "Backend thread is not available".to_string())?
            .call(|response| WorkerCommand::FinishSending {
                stream_id: stream_id.to_string(),
                response,
            })
    }

    pub fn close_stream(&self, stream_id: &str) -> Result<String, String> {
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

        let thread = worker::spawn_thread(self.binary_vault.clone(), self.logger.clone())?;
        self.thread = Some(thread);
        Ok(())
    }
}

impl Drop for GrpcBackend {
    fn drop(&mut self) {
        self.close();
    }
}
