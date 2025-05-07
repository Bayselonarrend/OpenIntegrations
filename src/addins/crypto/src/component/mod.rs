mod methods;

use addin1c::{name, Variant};
use crate::core::getset;

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("HmacSha1"),
    name!("HmacSha256"),
    name!("RsaSha1"),
    name!("RsaSha256"),

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 2,
        1 => 2,
        2 => 2,
        3 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(_obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let key = params[0].get_blob().unwrap_or_default();
    let data = params[1].get_blob().unwrap_or_default();

    match num {

        0 => box_result(methods::hmac_sha1(key, data)),
        1 => box_result(methods::hmac_sha256(key, data)),
        2 => box_result(methods::rsa_sha1(key, data)),
        3 => box_result(methods::rsa_sha256(key, data)),
        _ => Box::new(false), // Неверный номер команды
    }

}

fn box_result(result:  Result<Vec<u8>, String>) -> Box<dyn getset::ValueType> {
    match result {
        Ok(data) => Box::new(data),
        Err(e) => Box::new(e),
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
        AddIn {
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

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}

