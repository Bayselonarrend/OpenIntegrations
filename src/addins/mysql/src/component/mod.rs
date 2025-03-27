mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use mysql::*;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {

            let query = params[0].get_string().unwrap_or("".to_string());
            let params_json = params[1].get_string().unwrap_or("".to_string());
            let force_result = params[2].get_bool().unwrap_or(false);

            Box::new(methods::execute_query(obj, query, params_json, force_result))
        },
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];


pub struct AddIn {
    connection_string: String,
    connections: Option<Pool>,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connections: None,
        }
    }

    pub fn initialize(&mut self) -> String {

        let connection_string = if self.connection_string.is_empty() {
            return json!({"result": false, "error": "Empty connection string!"}).to_string()
        } else {
            &self.connection_string
        };

        match Pool::new(connection_string.as_str()){
            Ok(p) => {
                self.connections = Some(p);
                json!({"result": true}).to_string()
            },
            Err(e) => json!({"result": false, "error": e.to_string()}).to_string()
        }
    }

    pub fn close_connection(&mut self) -> String {
        if self.connections.take().is_some() {
            json!({"result": true}).to_string()
        } else {
            json!({
                "result": false,
                "error": "Connection already closed"
            })
                .to_string()
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn getset::ValueType as *const _,
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