use addin1c::{name, Variant};

pub use crate::commons::{getset, CONNECTIONS};
use crate::commons;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Receive"),           // 2
    name!("Send"),              // 3
    name!("Close"),             // 4
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 2,
        1 => 2,
        2 => 1,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(_obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        1 => {

            let connection_id = params[0].get_string().unwrap_or("".to_string());
            let max_size = params[1].get_i32().unwrap_or(0);

            commons::receive_data(connection_id, max_size as usize)
        },
        2 => {

            let connection_id = params[0].get_string().unwrap_or("".to_string());
            let data = params[1].get_blob().unwrap_or(&[]).to_vec();

            Box::new(commons::send_data(connection_id, data))

        },
        3 => {
            let connection_id = params[0].get_string().unwrap_or("".to_string());
            Box::new(commons::close_connection(connection_id))
        }
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];


pub struct AddIn {
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {}
    }
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
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