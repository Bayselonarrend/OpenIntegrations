mod methods;

use addin1c::{name, Variant};
use rcon_client::RCONClient;
use crate::core::getset;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),    // 0
    name!("Command")     // 1

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 4,
        1 => 1,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => {

            let url = params[0].get_string().unwrap_or("".to_string());
            let password = params[1].get_string().unwrap_or("".to_string());
            let read_timeout = params[2].get_i32().unwrap_or(0);
            let write_timeout = params[3].get_i32().unwrap_or(0);

            Box::new(methods::connect(obj, &url, &password, read_timeout, write_timeout))
        },
        1 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::execute_command(obj, &command))
        },

        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];


pub struct AddIn {
    client: Option<RCONClient>,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            client: None,
        }
    }


    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------