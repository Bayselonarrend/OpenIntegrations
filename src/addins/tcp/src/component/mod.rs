mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use methods::Connection;
use std::net::TcpStream;
use native_tls::{TlsConnector};
use crate::component::methods::disconnect;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),    // 0
    name!("Disconnect"), // 1
    name!("Read"),       // 2
    name!("Write"),      // 3
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 2,
        3 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(obj.connect()),
        1 => {
            disconnect(obj);
            Box::new(true) // Возвращаем true для обозначения успешного выполнения
        },
        2 => {

            let size    = params[0].get_i32().unwrap_or(0);
            let timeout = params[1].get_i32().unwrap_or(0);

            if let Some(ref mut connection) = obj.connection {
                Box::new(methods::receive(connection, size, timeout))
            } else {
                Box::new(Vec::<u8>::new()) // Если соединения нет, возвращаем пустой массив
            }
        },
        3 => {

            let empty_array: [u8; 0] = [];

            let data   = params[0].get_blob().unwrap_or(&empty_array);
            let timeout = params[1].get_i32().unwrap_or(0);

            if let Some(ref mut connection) = obj.connection {
                Box::new(methods::send(connection, data.to_vec(), timeout))
            } else {
                Box::new(false) // Если соединения нет, возвращаем false
            }
        },
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("Address"),
    name!("SSL")
];


pub struct AddIn {
    pub address: String,
    pub use_ssl: bool,
    connection: Option<Connection>,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            address: String::new(),
            use_ssl: false,
            connection: None,
        }
    }

    /// Подключается к серверу
    pub fn connect(&mut self) -> bool {
        if self.address.is_empty() {
            return false; // Ошибка: пустой адрес
        }

        if self.use_ssl {
            let connector = match TlsConnector::new() {
                Ok(conn) => conn,
                Err(_) => return false, // Ошибка при создании TLS-коннектора
            };
            let stream = match TcpStream::connect(&self.address) {
                Ok(s) => s,
                Err(_) => return false, // Ошибка при подключении
            };
            match connector.connect(&self.address, stream) {
                Ok(tls_stream) => {
                    self.connection = Some(Connection::Tls(tls_stream));
                    true
                }
                Err(_) => false, // Ошибка при установлении TLS
            }
        } else {
            match TcpStream::connect(&self.address) {
                Ok(tcp_stream) => {
                    self.connection = Some(Connection::Tcp(tcp_stream));
                    true
                }
                Err(_) => false, // Ошибка при подключении
            }
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.address as &dyn getset::ValueType as *const _,
            1 => &self.use_ssl as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------