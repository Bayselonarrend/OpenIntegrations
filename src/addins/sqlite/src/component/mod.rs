mod methods;

use addin1c::{name, Variant};
use std::sync::{Mutex, Arc};
use crate::core::getset;
use rusqlite::{Connection, OpenFlags};
use serde_json::json;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("LoadExtension")

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 2,
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
        3 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let point = params[1].get_string().unwrap_or("".to_string());

            Box::new(methods::load_extension(obj, path, point))
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
    connection: Option<Arc<Mutex<Connection>>>,
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
            let flags = OpenFlags::SQLITE_OPEN_READ_WRITE
                | OpenFlags::SQLITE_OPEN_CREATE
                | OpenFlags::SQLITE_OPEN_URI
                | OpenFlags::SQLITE_OPEN_NO_MUTEX;
            Connection::open_with_flags(&self.connection_string, flags)
        };

        match conn_result {
            Ok(conn) => {
                self.connection = Some(Arc::new(Mutex::new(conn)));
                r#"{"result": true}"#.to_string()
            }
            Err(e) => {

                let detailed_error = match e {
                    rusqlite::Error::SqliteFailure(err, msg) => {
                        format!(
                            "SQLite error: code={:?}, message='{}', details={:?}",
                            err.code,
                            err.extended_code,
                            msg
                        )
                    }
                    _ => e.to_string(),
                };

                json!({
                    "result": false,
                    "error": detailed_error
                    }).to_string()
            }
        }
    }

    pub fn get_connection(&self) -> Option<Arc<Mutex<Connection>>> {
        self.connection.clone()
    }

    pub fn close_connection(&mut self) -> String {
        if let Some(conn) = self.connection.take() {
            match Arc::try_unwrap(conn) {
                Ok(conn_mutex) => match conn_mutex.into_inner() {
                    Ok(conn) => match conn.close() {
                        Ok(_) => json!({"result": true}).to_string(),
                        Err((_conn, err)) => json!({
                            "result": false,
                            "error": err.to_string()
                        }).to_string(),
                    },
                    Err(_) => json!({
                        "result": false,
                        "error": "Failed to acquire connection lock"
                    }).to_string(),
                },
                Err(_) => json!({
                    "result": false,
                    "error": "Connection is still in use by other threads"
                }).to_string(),
            }
        } else {
            json!({
                "result": false,
                "error": "Connection already closed"
            }).to_string()
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