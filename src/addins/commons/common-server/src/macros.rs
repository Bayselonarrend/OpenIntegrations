
#[macro_export]
macro_rules! handle_async_command {
    ($state:expr, $rt:expr, $response:expr, |$s:ident| $($body:tt)*) => {
        if let Some(ref mut $s) = $state {
            let result = $rt.block_on(async { $($body)* });
            let _ = $response.send(result);
        } else {
            let _ = $response.send(common_utils::utils::janx_error("Server not started"));
        }
    };
}

#[macro_export]
macro_rules! handle_sync_command {
    ($state:expr, $response:expr, |$s:ident| $($body:tt)*) => {
        if let Some(ref mut $s) = $state {
            let result = { $($body)* };
            let _ = $response.send(result);
        } else {
            let _ = $response.send(common_utils::utils::janx_error("Server not started"));
        }
    };
}

#[macro_export]
macro_rules! send_command {
    ($backend:expr, $command:expr) => {{
        let (response_tx, response_rx) = ::std::sync::mpsc::channel();

        if let Err(e) = $backend.send($command(response_tx)) {
            return common_utils::utils::janx_error(format!("Failed to send command: {}", e));
        }

        response_rx.recv().unwrap_or_else(|e| {
            common_utils::utils::janx_error(format!("Failed to receive response: {}", e))
        })
    }};
}
