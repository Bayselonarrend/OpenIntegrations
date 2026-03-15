use super::ServerState;

impl ServerState {
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
                        // Соединение закрыто (FIN получен)
                        drop(entry);
                        self.connections.remove(conn_id);
                        if self.last_processed.as_ref() == Some(&conn_id.to_string()) {
                            self.last_processed = None;
                        }
                        Err("Connection closed".to_string())
                    }
                    Ok(n) => {
                        // Получены данные - соединение активно
                        let message = buffer[..n].to_vec();
                        
                        // Возвращаем данные, соединение активно
                        Ok(Some((message, addr, true)))
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
