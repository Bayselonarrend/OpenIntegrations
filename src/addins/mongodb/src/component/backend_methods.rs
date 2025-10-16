use std::sync::mpsc;
use crate::component::backend_core::{BackendCommand, MongoBackend};

impl MongoBackend {

    pub fn connect(&self, connection_string: &str) -> Result<(), String>{

        let (response_tx, response_rx) = mpsc::channel();
        let sending = self.tx.send(
            BackendCommand::Connect {
                connection_string: connection_string.to_string(),
                response:  response_tx
            }
        );
        
        sending.map_err(|e| format!("Sending error: {}", e.to_string()))?;
        response_rx.recv().map_err(|e| format!("Response receiver error: {}", e.to_string()))?;
        Ok(())
    }

}