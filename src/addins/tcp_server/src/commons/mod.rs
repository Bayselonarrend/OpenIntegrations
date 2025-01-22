use std::io::{Read, Write};
use std::net::TcpStream;
use std::sync::{Arc, Mutex};
use std::time::Duration;
use dashmap::DashMap;
use once_cell::sync::Lazy;
use serde_json::json;
use crate::commons::getset::ValueType;

pub mod getset;

pub static CONNECTIONS: Lazy<DashMap<String, Arc<Mutex<TcpStream>>>> = Lazy::new(DashMap::new);

pub fn receive_data(connection_id: String, max_size: usize) -> Box<dyn ValueType> {
    let mut stream = match get_stream(connection_id) {
        Ok(s) => s,
        Err(e) => return Box::new(create_error(&e)),
    };

    let mut buffer = Vec::new();
    let mut temp_buffer = vec![0; 1024]; // Буфер для чтения данных
    let mut total_read = 0; // Счетчик прочитанных байт

    loop {
        let remaining = if max_size > 0 {
            max_size.saturating_sub(total_read) // Оставшееся место до max_size
        } else {
            usize::MAX // Без ограничения по размеру
        };

        if remaining == 0 {
            break;
        }

        let to_read = remaining.min(temp_buffer.len());

        match stream.read(&mut temp_buffer[..to_read]) {
            Ok(0) => {
                break;
            }
            Ok(size) => {
                total_read += size;
                buffer.extend_from_slice(&temp_buffer[..size]);

                if total_read >= max_size && max_size > 0 {
                    break;
                }
            }
            Err(e) => {
                return Box::new(create_error(&format!("Error reading from stream: {}", e)));
            }
        }
    }

    Box::new(buffer)
}

/// Отправляет данные в соединение по указанному УИД
pub fn send_data(connection_id: String, data: Vec<u8>) -> String {
    let mut stream = match get_stream(connection_id) {
        Ok(s) => s,
        Err(e) => return create_error(&e),
    };

    // Пытаемся отправить данные в поток
    match stream.write_all(&data) {
        Ok(_) => create_success(),
        Err(e) => create_error(&format!("Error writing to stream: {}", e)),
    }
}

/// Закрывает соединение по указанному УИД
pub fn close_connection(connection_id: String) -> String {
    if CONNECTIONS.remove(&connection_id).is_some() {
        create_success()
    } else {
        create_error("Connection not found")
    }
}

pub fn get_stream(connection_id: String) -> Result<TcpStream, String> {
    // Найти соединение по идентификатору
    let stream = CONNECTIONS
        .get(&connection_id)
        .ok_or_else(|| format!("Connection '{}' not found", connection_id))?;

    // Заблокировать доступ к потоку и клонировать его
    let stream = stream.lock().map_err(|e| e.to_string())?;
    match stream.try_clone().map_err(|e| e.to_string()) {
        Ok(stream) => {
            stream.set_read_timeout(Some(Duration::from_secs(30))).ok();
            stream.set_write_timeout(Some(Duration::from_secs(30))).ok();
            Ok(stream)
        }
        Err(e) => Err(e.to_string()),
    }
}

pub fn create_error(message: &str) -> String {
    json!({ "result": false, "error": message }).to_string()
}

pub fn create_success() -> String {
    json!({ "result": true }).to_string()
}