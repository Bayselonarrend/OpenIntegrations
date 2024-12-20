use std::io::{Read, Write};
use std::net::{Shutdown, TcpStream};
use std::time::{Duration, Instant};

/// Отправляет данные
pub fn send(connection: &mut TcpStream, data: Vec<u8>, timeout_ms: i32) -> bool {

    if timeout_ms > 0 {
        let timeout = Duration::from_millis(timeout_ms as u64);
        connection.set_write_timeout(Some(timeout)).ok();
    };

    match connection.write(&data) {
        Ok(_) => connection.flush().is_ok(),
        Err(_) => false, // Ошибка при отправке данных
    }
}

/// Считывает данные
pub fn receive(
    connection: &mut TcpStream,
    max_data_size: i32,
    end_marker: Vec<u8>,
    timeout_ms: i32
) -> Vec<u8> {
    const BUFFER_SIZE: usize = 1024; // Размер временного буфера
    const MIN_READ_TIMEOUT_MS: u64 = 200; // Минимальный таймаут для чтения

    let mut result = Vec::new();
    let mut buffer = vec![0u8; BUFFER_SIZE];

    // Устанавливаем общее время ожидания
    let total_timeout = Duration::from_millis(timeout_ms as u64);
    let start_time = Instant::now(); // Время начала работы функции
    let min_read_timeout = Duration::from_millis(MIN_READ_TIMEOUT_MS);
    let marker_exists = !end_marker.is_empty();

    connection.set_read_timeout(Some(min_read_timeout)).ok();

    loop {
        // Проверяем общее время выполнения
        if start_time.elapsed() >= total_timeout {
            break; // Прерываем, если общее время истекло
        }

        // Завершаем цикл, если превышен лимит данных
        if max_data_size > 0 && result.len() >= max_data_size as usize {
            break;
        }

        match connection.read(&mut buffer) {
            Ok(0) => break, // EOF — конец данных
            Ok(size) => {
                result.extend_from_slice(&buffer[..size]);

                // Завершаем цикл, если получен конец сообщения (если end_marker задан)
                if marker_exists && result.ends_with(&end_marker) {
                    break;
                }
            }
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => continue,
            Err(_) => break, // Любая другая ошибка завершает чтение
        }
    }

    result
}

/// Закрывает соединение
pub fn disconnect(add_in: &mut crate::component::AddIn) -> bool {
    add_in.connection = None;
    true
}

/// Закрытие потока записи
pub fn close_output(connection: &mut TcpStream) -> bool {
    connection.shutdown(Shutdown::Write).is_ok()
}