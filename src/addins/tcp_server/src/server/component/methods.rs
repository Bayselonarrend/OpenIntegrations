use std::net::{TcpListener};
use std::time::{Duration, Instant};
use serde_json::{json};
use std::sync::{Arc, Mutex};

use crate::commons::{CONNECTIONS, create_error, create_success};
use crate::server::component::AddIn;

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
                    // Формируем уникальный идентификатор соединения
                    let id = format!("{}:{}", tcp.port, tcp.next_id);

                    // Получаем адрес клиента
                    let addr = match stream.peer_addr() {
                        Ok(addr) => addr.to_string(),
                        Err(e) => e.to_string(),
                    };

                    // Увеличиваем счётчик ID
                    tcp.next_id += 1;

                    let connection = Arc::new(Mutex::new(stream));

                    // Вставляем соединение в глобальное хранилище
                    CONNECTIONS.insert(id.clone(), connection);

                    // Возвращаем успешный ответ
                    return json!({
                        "result": true,
                        "connection": {
                            "id": id,
                            "addr": addr,
                        }
                    })
                        .to_string();
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

pub fn list_connections() -> String {
    let ids: Vec<String> = CONNECTIONS.iter().map(|entry| entry.key().clone()).collect();
    json!({ "result": true, "connections": ids }).to_string()
}

pub fn remove_inactive_connections() -> String {
    let mut inactive_ids = Vec::new();

    for element in CONNECTIONS.iter() {
        let id = element.key();
        let stream = element.value();

        let mut temp_buffer = vec![0; 1];

        match stream.lock() {
            Ok(locked_stream) => match locked_stream.peek(&mut temp_buffer) {
                Err(e) if e.kind() != std::io::ErrorKind::WouldBlock => inactive_ids.push(id.clone()),
                _ => continue,
            },
            Err(e) => return create_error(&format!("Failed to lock stream: {}", e)),
        }
    }

    // Удаляем неактивные соединения
    for id in &inactive_ids {
        match CONNECTIONS.remove(id) {
            Some(_) => {} // Успешное удаление
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

    // Удаляем все соединения, связанные с данным сервером
    let prefix = format!("{}:", tcp.port);
    CONNECTIONS.retain(|key, _| !key.starts_with(&prefix));

    create_success()
}
