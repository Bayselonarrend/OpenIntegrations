use super::{ServerState, TcpConnectionInfo};
use tokio::net::tcp::OwnedReadHalf;
use tokio::io::ReadBuf;
use std::task::{Context, Poll};
use futures_util::task::noop_waker;

impl ServerState {

    pub(super) fn check_connection_active(read_half: &mut OwnedReadHalf) -> bool {
        let waker = noop_waker();
        let mut cx = Context::from_waker(&waker);
        
        let mut buf = [0u8; 1];
        let mut read_buf = ReadBuf::new(&mut buf);
        
        match read_half.poll_peek(&mut cx, &mut read_buf) {
            Poll::Pending => true,
            Poll::Ready(Ok(n)) => n > 0,
            Poll::Ready(Err(_)) => false,
        }
    }

    pub(super) fn try_read_from_connection(
        &mut self,
        conn_id: &str,
        buffer: &mut [u8],
    ) -> Result<Option<(Vec<u8>, String, bool)>, String> {
        let mut result = None;
        let mut should_remove = false;
        let mut error = None;

        self.manager.get_mut(conn_id, |conn_info: &mut TcpConnectionInfo| {
            let addr = conn_info.addr.clone();

            if let Some(ref mut read_half) = conn_info.read_half {
                match read_half.try_read(buffer) {
                    Ok(0) => {
                        should_remove = true;
                        error = Some("Connection closed".to_string());
                    }
                    Ok(n) => {
                        let message = buffer[..n].to_vec();
                        let still_active = Self::check_connection_active(read_half);

                        if !still_active {
                            should_remove = true;
                        }

                        result = Some((message, addr, still_active));
                    }
                    Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                        // No data available
                    }
                    Err(e) => {
                        should_remove = true;
                        error = Some(format!("Read error: {}", e));
                    }
                }
            } else {
                error = Some("Read half is closed".to_string());
            }
        });

        if should_remove {
            self.manager.remove(conn_id);
        }

        if let Some(err) = error {
            Err(err)
        } else {
            Ok(result)
        }
    }
}