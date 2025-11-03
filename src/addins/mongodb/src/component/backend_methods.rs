use std::sync::mpsc;
use crate::component::backend_core::{BackendCommand, ExecuteParams, MongoBackend};

impl MongoBackend {
    pub fn connect(&self, connection_string: &str) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Connect {
                connection_string: connection_string.to_string(),
                response: response_tx,
            })
            .map_err(|e| format!("Sending error: {}", e))?;

        let result = response_rx
            .recv()
            .map_err(|e| format!("Response receiver error: {}", e))?;

        match result.is_empty(){
            true => Ok(()),
            false => Err(result),
        }

    }

    pub fn disconnect(&self) -> Result<(), String> {
        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Disconnect {
                response: response_tx,
            })
            .map_err(|e| format!("Sending disconnect command failed: {}", e))?;

        response_rx
            .recv()
            .map_err(|e| format!("Failed to receive disconnect response: {}", e))?;
        Ok(())
    }

    pub fn execute(&self, json_input: &str) -> Result<String, String> {

        let params: ExecuteParams = serde_json::from_str(json_input)
            .map_err(|e| format!("Invalid JSON: {}", e))?;

        let (response_tx, response_rx) = mpsc::channel();
        self.tx
            .send(BackendCommand::Execute {
                params,
                response: response_tx,
            })
            .map_err(|e| format!("Failed to send command: {}", e))?;

        response_rx
            .recv()
            .map_err(|e| format!("No response from backend: {}", e))
    }
}