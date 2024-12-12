use std::io::{Read, Write};
use std::net::TcpStream;
use native_tls::TlsStream;
use std::time::Duration;

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
pub fn send(connection: &mut Connection, data: Vec<u8>) -> bool {
    match connection.write(&data) {
        Ok(_) => true,
        Err(_) => false, // Ошибка при отправке данных
    }
}

/// Считывает данные
pub fn receive(connection: &mut Connection, buffer_size: i32, timeout_ms: i32) -> Vec<u8> {
    let mut result = Vec::new();
    let mut buffer = vec![0u8; buffer_size as usize];

    match connection {
        Connection::Tcp(stream) => {
            stream.set_read_timeout(Some(Duration::from_millis(timeout_ms as u64))).ok();
        }
        Connection::Tls(stream) => {
            stream.get_ref().set_read_timeout(Some(Duration::from_millis(timeout_ms as u64))).ok();
        }
    }

    loop {
        match connection.read(&mut buffer) {
            Ok(0) => break, // Конец данных (EOF)
            Ok(size) => result.extend_from_slice(&buffer[..size]),
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => break, // Нет данных
            Err(e) => break, // Любая другая ошибка
        }
    }

    result
}

/// Закрывает соединение
pub fn disconnect(add_in: &mut crate::component::AddIn) {
    add_in.connection = None;
}