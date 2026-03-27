/// Macro for executing async state methods with error handling
/// 
/// # Example
/// ```ignore
/// handle_async_command!(server_state, rt, response, |state| 
///     state.get_next_message(timeout_ms, max_message_size).await
/// );
/// ```
#[macro_export]
macro_rules! handle_async_command {
    ($state:expr, $rt:expr, $response:expr, |$s:ident| $($body:tt)*) => {
        if let Some(ref mut $s) = $state {
            let result = $rt.block_on(async { $($body)* });
            let _ = $response.send(result);
        } else {
            let _ = $response.send($crate::json_error("Server not started"));
        }
    };
}

/// Macro for executing sync state methods with error handling
/// 
/// # Example
/// ```ignore
/// handle_sync_command!(server_state, response, |state| 
///     state.shutdown_read(&connection_id)
/// );
/// ```
#[macro_export]
macro_rules! handle_sync_command {
    ($state:expr, $response:expr, |$s:ident| $($body:tt)*) => {
        if let Some(ref mut $s) = $state {
            let result = { $($body)* };
            let _ = $response.send(result);
        } else {
            let _ = $response.send($crate::json_error("Server not started"));
        }
    };
}

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

