use super::ServerState;
use tokio::net::TcpStream;

impl ServerState {

    pub(super) fn check_connection_active(stream: &mut TcpStream) -> bool {
        match stream.try_read(&mut []) {
            Ok(0) => false,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => true,
            _ => true,
        }
    }

    pub(super) fn try_read_from_connection(
        &mut self,
        conn_id: &str,
        buffer: &mut [u8],
    ) -> Result<Option<(Vec<u8>, String, bool)>, String> {
        if let Some(mut entry) = self.connections.get_mut(conn_id) {
            match entry.stream.try_read(buffer) {
                Ok(0) => {
                    drop(entry);
                    self.connections.remove(conn_id);
                    if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                        self.last_processed = None;
                    }
                    Err("Connection closed".to_string())
                }
                Ok(n) => {
                    let message = buffer[..n].to_vec();
                    let addr = entry.addr.clone();
                    let still_active = Self::check_connection_active(&mut entry.stream);

                    if !still_active {
                        drop(entry);
                        self.connections.remove(conn_id);
                        if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                            self.last_processed = None;
                        }
                    }

                    Ok(Some((message, addr, still_active)))
                }
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    Ok(None)
                }
                Err(e) => {
                    drop(entry);
                    self.connections.remove(conn_id);
                    if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                        self.last_processed = None;
                    }
                    Err(format!("Read error: {}", e))
                }
            }
        } else {
            Err("Connection not found".to_string())
        }
    }
}
