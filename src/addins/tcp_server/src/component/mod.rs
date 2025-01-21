mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use std::collections::HashMap;
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Start"),             // 0
    name!("Wait"),              // 1
    name!("Receive"),           // 2
    name!("Send"),              // 3
    name!("Close"),             // 4
    name!("ListConnections"),   // 5
    name!("UpdateConnections"), // 6

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 1,
        2 => 2,
        3 => 2,
        4 => 1,
        5 => 0,
        6 => 0,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(methods::start(obj)),
        1 => {
            let timeout = params[0].get_i32().unwrap_or(0);
            Box::new(methods::wait_for_connection(obj, timeout))
        },
        2 => {

            let connection_id = params[0].get_string().unwrap_or("".to_string());
            let max_size = params[1].get_i32().unwrap_or(0);

            methods::receive_data(obj, connection_id, max_size as usize)
        },
        3 => {

            let connection_id = params[0].get_string().unwrap_or("".to_string());
            let data = params[1].get_blob().unwrap_or(&[]).to_vec();

            Box::new(methods::send_data(obj, connection_id, data))

        },
        4 => {
            let connection_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::close_connection(obj, connection_id))
        }

        5 => Box::new(methods::list_connections(obj)),
        6 => Box::new(methods::remove_inactive_connections(obj)),
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("Port")
];


pub struct AddIn {
    port: i32,
    connections: HashMap<String, TcpStream>,
    next_id: i32,
    listener: Option<TcpListener>,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            port: 0,
            connections: HashMap::new(),
            next_id: 1,
            listener: None,
        }
    }
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.port as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}