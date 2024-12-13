use std::io::{Read, Write};
use std::net::TcpStream;
use native_tls::TlsStream;
use std::time::{Duration, Instant};

pub enum Connection {
    Tcp(TcpStream),
    Tls(TlsStream<TcpStream>),
}

impl Connection {
    pub fn write(&mut self, data: &[u8]) -> std::io::Result<usize> {
        match self {
            Connection::Tcp(stream) => stream.write(data),
            Connection::Tls(stream) => stream.write(data),
        }
    }

    pub fn read(&mut self, buffer: &mut [u8]) -> std::io::Result<usize> {
        match self {
            Connection::Tcp(stream) => stream.read(buffer),
            Connection::Tls(stream) => stream.read(buffer),
        }
    }
}

/// Отправляет данные
pub fn send(connection: &mut Connection, data: Vec<u8>, timeout_ms: i32) -> bool {

    match connection {
        Connection::Tcp(stream) => {
            stream.set_write_timeout(Some(Duration::from_millis(timeout_ms as u64))).ok();
        }
        Connection::Tls(stream) => {
            stream.get_ref().set_write_timeout(Some(Duration::from_millis(timeout_ms as u64))).ok();
        }
    }

    match connection.write(&data) {
        Ok(_) => true,
        Err(_) => false, // Ошибка при отправке данных
    }
}

/// Считывает данные
pub fn receive(
    connection: &mut Connection,
    timeout_ms: i32,
    max_attempts: i32,
    max_data_size: i32,
) -> Vec<u8> {
    const BUFFER_SIZE: usize = 4096; // Фиксированный размер буфера

    let mut result = Vec::new();
    let mut buffer = vec![0u8; BUFFER_SIZE];
    let mut attempts = 0;

    // Устанавливаем таймаут для чтения
    let timeout = Duration::from_millis(timeout_ms as u64);
    match connection {
        Connection::Tcp(stream) => {
            stream.set_read_timeout(Some(timeout)).ok();
        }
        Connection::Tls(stream) => {
            stream.get_ref().set_read_timeout(Some(timeout)).ok();
        }
    }

    loop {
        // Завершаем цикл, если превышен лимит данных
        if max_data_size > 0 && result.len() >= max_data_size as usize {
            break;
        }

        match connection.read(&mut buffer) {
            Ok(0) => break, // Конец данных (EOF)
            Ok(size) => {
                result.extend_from_slice(&buffer[..size]);
                attempts = 0; // Сбрасываем счетчик попыток при успешном чтении
            }
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                attempts += 1;
                if attempts >= max_attempts {
                    break; // Превышено число попыток ожидания
                }
                continue; // Пробуем снова
            }
            Err(_) => break // Любая другая ошибка
        }
    }

    result
}

/// Закрывает соединение
pub fn disconnect(add_in: &mut crate::component::AddIn) -> bool {
    add_in.connection = None;
    true
}