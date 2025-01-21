use std::io::{Read, Write};
use std::net::{TcpListener};
use std::time::{Duration, Instant};
use crate::component::AddIn;
use serde_json::{json};
use crate::core::getset::ValueType;

/// Запускает сервер на указанном порту
pub fn start(tcp: &mut AddIn) -> String {

    match TcpListener::bind(format!("0.0.0.0:{}", tcp.port)) {
        Ok(listener) => {
            tcp.listener = Some(listener);
            json!({ "result": true }).to_string()
        }
        Err(e) =>  create_error(&e.to_string())
    }
}

/// Ожидает новое соединение с возможностью указания таймаута (в секундах)
pub fn wait_for_connection(tcp: &mut AddIn, timeout: i32) -> String {

    if let Some(listener) = &tcp.listener {

        let start_time = Instant::now();
        listener.set_nonblocking(true).ok();

        while start_time.elapsed() < Duration::from_secs(timeout as u64) || timeout == 0 {
            match listener.accept() {
                Ok((stream, _)) => {
                    let id = tcp.next_id.to_string();
                    tcp.next_id += 1;
                    tcp.connections.insert(id.clone(), stream);
                    return json!({ "result": true, "connection": id }).to_string();
                }
                Err(e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    std::thread::sleep(Duration::from_millis(100));
                }
                Err(e) => {
                    return create_error(&e.to_string());
                }
            }
        }
        create_error("Timeout expired")
    } else {
        create_error("Listener not initialized")
    }
}


/// Получает данные из соединения по указанному УИД
pub fn receive_data(tcp: &mut AddIn, connection_id: String, max_size: usize) -> Box<dyn ValueType> {

    if let Some(stream) = tcp.connections.get_mut(&connection_id) {

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
                    return Box::new(create_error(&e.to_string()));
                }
            }
        }

        Box::new(buffer)
    } else {
        Box::new(create_error("Connection not found"))
    }
}

/// Отправляет данные в соединение по указанному УИД
pub fn send_data(tcp: &mut AddIn, connection_id: String, data: Vec<u8>) -> String {

    if let Some(stream) = tcp.connections.get_mut(&connection_id) {
        match stream.write_all(&data) {
            Ok(_) => create_success(),
            Err(e) => create_error(&e.to_string())
        }
    } else {
        create_error("Connection not found")
    }
}

/// Закрывает соединение по указанному УИД
pub fn close_connection(tcp: &mut AddIn, connection_id: String) -> String {

    if tcp.connections.remove(&connection_id).is_some() {
        create_success()
    } else {
        create_error("Connection not found")
    }
}

pub fn list_connections(tcp: &AddIn) -> String {
    let ids: Vec<String> = tcp.connections.keys().cloned().collect();
    json!({ "result": true, "connections": ids }).to_string()
}

pub fn remove_inactive_connections(tcp: &mut AddIn) -> String {

    let mut inactive_ids = Vec::new();

    for (id, stream) in tcp.connections.iter_mut() {

        let mut temp_buffer = vec![0; 1];

        match stream.read(&mut temp_buffer) {
            Ok(size) if size > 0 => {
                let _ = stream.write_all(&temp_buffer[0..size]);
                continue;
            }
            Ok(_) => continue,
            Err(e) if e.kind() == std::io::ErrorKind::WouldBlock => continue,
            Err(_) => inactive_ids.push(id.clone())
        }
    }

    for id in inactive_ids {
        tcp.connections.remove(&id);
    }

    json!({ "result": true, "removed_connections": inactive_ids }).to_string()
}

fn create_error(message: &str) -> String {
    json!({ "result": false, "error": message }).to_string()
}

fn create_success() -> String {
    json!({ "result": true }).to_string()
}