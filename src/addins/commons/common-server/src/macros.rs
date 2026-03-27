/// Macro for sending command and receiving response
/// 
/// # Example
/// ```ignore
/// send_command!(self.backend, |response| {
///     BackendCommand::GetNextMessage {
///         timeout_ms,
///         max_message_size,
///         response,
///     }
/// });
/// ```
#[macro_export]
macro_rules! send_command {
    ($backend:expr, $command:expr) => {{
        let (response_tx, response_rx) = ::std::sync::mpsc::channel();
        
        if let Err(e) = $backend.send($command(response_tx)) {
            return $crate::json_error(&format!("Failed to send command: {}", e));
        }

        response_rx
            .recv()
            .unwrap_or_else(|e| $crate::json_error(&format!("Failed to receive response: {}", e)))
    }};
}

