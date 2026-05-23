use crate::backend_core::{BackendCommand, ExecuteParams, MongoBackend};

impl MongoBackend {
    pub fn connect(&self, connection_string: &str) -> Result<(), String> {
        let result = self.thread.call(|response| BackendCommand::Connect {
            connection_string: connection_string.to_string(),
            response,
        })?;

        if result.is_empty() {
            Ok(())
        } else {
            Err(result)
        }
    }

    pub fn disconnect(&self) -> Result<(), String> {
        self.thread
            .call(|response| BackendCommand::Disconnect { response })?;
        Ok(())
    }

    pub fn execute(&self, json_input: &str) -> Result<String, String> {
        let params: ExecuteParams = serde_json::from_str(json_input)
            .map_err(|e| format!("Invalid JSON: {}", e))?;

        self.thread.call(|response| BackendCommand::Execute {
            params,
            response,
        })
    }
}
