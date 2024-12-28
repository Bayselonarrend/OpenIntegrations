mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use rusqlite::{Connection};

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Execute"),    // 0

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 =>{
            Box::new(obj.initialize())
        },

        1 => {

            let query = params[0].get_string().unwrap_or("".to_string());
            let params_json = params[1].get_string().unwrap_or("".to_string());

            Box::new(methods::execute_query(obj, query, params_json))
        },
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("Database")
];


pub struct AddIn {
    connection_string: String,
    connection: Option<Connection>,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connection: None,
        }
    }

    pub fn initialize(&mut self) -> String {
        let conn_result = if self.connection_string.is_empty() {
            Connection::open_in_memory()
        } else {
            Connection::open(&self.connection_string)
        };

        match conn_result {
            Ok(conn) => {
                self.connection = Some(conn);
                r#"{"result": true}"#.to_string()
            }
            Err(e) => {
                format!(r#"{{"result": false, "error": "{}"}}"#, e.to_string())
            }
        }
    }

    pub fn get_connection(&self) -> Option<&Connection> {
        self.connection.as_ref()
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