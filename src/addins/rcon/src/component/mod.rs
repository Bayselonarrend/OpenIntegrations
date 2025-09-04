mod methods;

use addin1c::{name, Variant};
use rcon_client::RCONClient;
use serde_json::json;
use crate::core::getset;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),     // 0
    name!("Command"),     // 1
    name!("GetSettings")  // 2

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 4,
        1 => 1,
        2 => 0,
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

            obj.settings = Some(ConnectionSettings::new(&url, &password, read_timeout, write_timeout));

            Box::new(methods::connect(obj))
        },
        1 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::execute_command(obj, &command))
        },

        2 => {
            Box::new(match &obj.settings{
                Some(settings) =>  settings.get_settings(),
                None => json!({"result":false, "error": "No connection settings found"}).to_string()
            })
        }
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[];


pub struct AddIn {
    client: Option<RCONClient>,
    settings: Option<ConnectionSettings>
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            client: None,
            settings: None
        }
    }


    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

struct ConnectionSettings{
    url: String,
    password: String,
    read_timeout: i32,
    write_timeout: i32,
}

impl ConnectionSettings{
    pub fn new(url: &str, password: &str, read_timeout: i32, write_timeout: i32) -> ConnectionSettings{
        ConnectionSettings{
            url: url.to_string(),
            password: password.to_string(),
            read_timeout,
            write_timeout,
        }
    }

    pub fn get_settings(&self) -> String{

        json!({
            "url": &self.url,
            "password": &self.password,
            "read_timeout": &self.read_timeout,
            "write_timeout": &self.write_timeout
        }).to_string()
    }
}
// -------------------------------------------------------------------------------------------------