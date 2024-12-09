mod methods;

use addin1c::{name, Variant};
use crate::core::getset;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("InsertData"),     // 2
    name!("FindData"),       // 3
    name!("CountDocuments"), // 4
    name!("DocumentExists"), // 5
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,
        1 => 3,
        2 => 2,
        3 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &AddIn, num: usize, params: &mut [Variant]) -> Box<dyn crate::core::getset::ValueType> {

    let address = &obj.address;
    let client = methods::MongoClient::new(address);

    match num {
        0 => {

            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name= params[1].get_string().unwrap_or(String::new());
            let data = params[2].get_string().unwrap_or(String::new());

            Box::new(client.insert_data(&db_name, &collection_name, &data))
        },

        1 => {

            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name= params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());

            Box::new(client.find_data(&db_name, &collection_name, &query))

        },

        2 => {

            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name= params[1].get_string().unwrap_or(String::new());

            Box::new(client.count_documents(&db_name, &collection_name))

        },

        3 => {

            let db_name = params[0].get_string().unwrap_or(String::new());
            let collection_name= params[1].get_string().unwrap_or(String::new());
            let query = params[2].get_string().unwrap_or(String::new());

            Box::new(client.document_exists(&db_name, &collection_name, &query))

        }
        _ => Box::new(false),
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("address")
];

// Имена и типы
pub struct AddIn {
    address: String
}

// Конструктор
impl AddIn {

    // Значения по умолчанию
    pub fn new() -> AddIn {
        AddIn {
            address: String::from("")
        }
    }

    // Сюда просто нужно еще раз добавить имена полей
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.address as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

// -------------------------------------------------------------------------------------------------