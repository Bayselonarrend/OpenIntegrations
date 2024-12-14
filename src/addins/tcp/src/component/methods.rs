use std::io::{Read, Write};
use std::net::TcpStream;
use std::time::{Duration};

/// Отправляет данные
pub fn send(connection: &mut TcpStream, data: Vec<u8>, timeout_ms: i32) -> bool {

    if timeout_ms > 0 {
        let timeout = Duration::from_millis(timeout_ms as u64);
        connection.set_write_timeout(Some(timeout)).ok();
    }

    match connection.write(&data) {
        Ok(_) => connection.flush().is_ok(),
        Err(_) => false, // Ошибка при отправке данных
    }
}

/// Считывает данные
pub fn receive(
    connection: &mut TcpStream,
    max_data_size: i32,
    timeout_ms: i32,
) -> Vec<u8> {
    const BUFFER_SIZE: usize = 1024; // Фиксированный размер буфера

    let mut result = Vec::new();
    let mut buffer = vec![0u8; BUFFER_SIZE];

    // Устанавливаем таймаут для чтения
    if timeout_ms > 0 {
        let timeout = Duration::from_millis(timeout_ms as u64);
        connection.set_read_timeout(Some(timeout)).ok();
    }

    loop {
        // Завершаем цикл, если превышен лимит данных
        if max_data_size > 0 && result.len() >= max_data_size as usize {
            break;
        }

        match connection.read(&mut buffer) {
            Ok(0) => break, // Конец данных (EOF)
            Ok(size) => result.extend_from_slice(&buffer[..size]),
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => break,
            Err(_) => break
        }
    }

    result
}

/// Закрывает соединение
pub fn disconnect(add_in: &mut crate::component::AddIn) -> bool {
    add_in.connection = None;
    true
}