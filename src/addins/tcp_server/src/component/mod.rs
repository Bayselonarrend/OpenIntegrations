mod methods;

use addin1c::{name, Variant};
use crate::core::getset;

use std::collections::HashMap;
use std::net::TcpStream;
use std::sync::mpsc::{Sender, Receiver};
use self::methods::{ServerEvent};


// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Start"),
    name!("Await"),
    name!("ReceiveMessage"),
    name!("SendResponse"),
    name!("Stop"),

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 1,
        2 => 1,
        3 => 2,
        4 => 0,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(methods::start_server(obj)),
        1 => {
            let timeout = params[0].get_i32().unwrap_or(0);
            Box::new(methods::await_connections(obj, timeout))
        }
        2 => {
            let addr = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::receive_message(obj, &addr))
        }
        3 =>{
            let empty_array: [u8; 0] = [];

            let addr = params[0].get_string().unwrap_or("".to_string());
            let data = params[1].get_blob().unwrap_or(&empty_array);

            Box::new(methods::send_response(obj, &addr, data))
        }
        4 => Box::new(methods::stop(obj)),
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
    pub port: i32,
    pub connections: HashMap<String, TcpStream>,
    pub sender: Sender<ServerEvent>,
    pub receiver: Receiver<ServerEvent>,
}

impl AddIn {
    pub fn new() -> Self {
        let (sender, receiver) = std::sync::mpsc::channel();
        AddIn {
            port: 0,
            connections: HashMap::new(),
            sender,
            receiver,
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

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {
        methods::stop(self);
    }
}