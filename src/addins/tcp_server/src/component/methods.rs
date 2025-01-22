use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::time::{Duration, Instant};
use serde_json::{json};
use std::sync::{Arc, Mutex};

use crate::core::getset::ValueType;
use crate::component::AddIn;

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

                    // Получаем id соединения
                    let id = tcp.next_id.to_string();

                    // Получаем адрес клиента
                    let addr = match stream.peer_addr() {
                        Ok(addr) => addr.to_string(),
                        Err(e) => e.to_string(),
                    };

                    // Обновляем id
                    tcp.next_id += 1;

                    let connection = Arc::new(Mutex::new(stream));

                    // Вставляем соединение
                    tcp.connections.insert(id.clone(), connection);

                    // Возвращаем успешный ответ
                    return json!({
                        "result": true,
                        "connection": {
                            "id": id,
                            "addr": addr,
                        }
                    }).to_string();
                }
                Err(e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    // Если нет соединений, ожидаем немного и пробуем снова
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

    let mut stream = match get_stream(tcp, connection_id){
        Ok(s) => s,
        Err(e) => return Box::new(create_error(&e))
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
pub fn send_data(tcp: &mut AddIn, connection_id: String, data: Vec<u8>) -> String {

    let mut stream = match get_stream(tcp, connection_id){
        Ok(s) => s,
        Err(e) => return create_error(&e)
    };

    // Пытаемся отправить данные в поток
    match stream.write_all(&data) {
        Ok(_) => create_success(),
        Err(e) => create_error(&format!("Error writing to stream: {}", e)),
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

    let ids: Vec<String> = tcp.connections.iter().map(|entry| entry.key().clone()).collect();
    json!({ "result": true, "connections": ids }).to_string()
}

pub fn remove_inactive_connections(tcp: &mut AddIn) -> String {

    let mut inactive_ids = Vec::new();

    for element in tcp.connections.iter() {

        let id = element.key();
        let stream = element.value();

        let mut temp_buffer = vec![0; 1];

        match stream.lock() {
            Ok(locked_stream) => match locked_stream.peek(&mut temp_buffer) {
                Err(e) if e.kind() != std::io::ErrorKind::WouldBlock=> inactive_ids.push(id.clone()),
                _ => continue
            },
            Err(e) => return create_error(&format!("Failed to lock stream: {}", e)),
        }
    }

    // Удаляем неактивные соединения
    for id in &inactive_ids {
        match tcp.connections.remove(id) {
            Some(_) => {}, // Успешное удаление
            None => return create_error(&format!("Failed to remove connection with id: {}", id)),
        }
    }

    json!({ "result": true, "removed_connections": inactive_ids }).to_string()
}

pub fn stop_server(tcp: &mut AddIn) -> String {

    if let Some(listener) = tcp.listener.take() {
        drop(listener); // Освобождаем ресурс TcpListener
    } else {
        return create_error("Listener not initialized");
    }

    tcp.connections.clear();

    create_success()
}

fn get_stream(tcp: &mut AddIn, connection_id: String) -> Result<TcpStream, String> {

    // Найти соединение по идентификатору
    let stream = tcp.connections.get(&connection_id)
        .ok_or_else(|| format!("Connection '{}' not found", connection_id))?;

    // Заблокировать доступ к потоку и клонировать его
    let stream = stream.lock().map_err(|e| e.to_string())?;
    match stream.try_clone().map_err(|e| e.to_string()) {
        Ok(stream) => {
            stream.set_read_timeout(Some(Duration::from_secs(30))).ok();
            stream.set_write_timeout(Some(Duration::from_secs(30))).ok();
            Ok(stream)
        },
        Err(e) => Err(e.to_string())
    }
}

fn create_error(message: &str) -> String {
    json!({ "result": false, "error": message }).to_string()
}

fn create_success() -> String {
    json!({ "result": true }).to_string()
}