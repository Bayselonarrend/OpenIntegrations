use super::ServerState;
use tokio::net::tcp::OwnedReadHalf;

impl ServerState {
    /// Проверяет, активно ли соединение (не закрыто ли)
    pub(super) fn check_connection_active(read_half: &mut OwnedReadHalf) -> bool {
        match read_half.try_read(&mut []) {
            Ok(0) => false,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => true,
            _ => true,
        }
    }

    /// Внутренняя функция для чтения из соединения с обработкой ошибок
    pub(super) fn try_read_from_connection(
        &mut self,
        conn_id: &str,
        buffer: &mut [u8],
    ) -> Result<Option<(Vec<u8>, String, bool)>, String> {
        if let Some(mut entry) = self.connections.get_mut(conn_id) {
            let addr = entry.addr.clone();
            
            if let Some(ref mut read_half) = entry.read_half {
                match read_half.try_read(buffer) {
                    Ok(0) => {
                        // Соединение закрыто
                        drop(entry);
                        self.connections.remove(conn_id);
                        if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                            self.last_processed = None;
                        }
                        Err("Connection closed".to_string())
                    }
                    Ok(n) => {
                        // Получены данные
                        let message = buffer[..n].to_vec();
                        let still_active = Self::check_connection_active(read_half);

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
                        // Нет данных
                        Ok(None)
                    }
                    Err(e) => {
                        // Ошибка чтения
                        drop(entry);
                        self.connections.remove(conn_id);
                        if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                            self.last_processed = None;
                        }
                        Err(format!("Read error: {}", e))
                    }
                }
            } else {
                // Read half закрыт
                Err("Read half is closed".to_string())
            }
        } else {
            Err("Connection not found".to_string())
        }
    }
}
