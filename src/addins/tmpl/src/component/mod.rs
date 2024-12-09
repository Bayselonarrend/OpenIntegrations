mod methods;

use addin1c::{name, Variant};
use crate::core::getset;


// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Метод1"), // 0
    name!("Сложение") // 1
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &AddIn, num: usize, params: &mut [Variant]) -> Box<dyn crate::core::getset::ValueType> {

    match num {
        0 => Box::new(methods::send_message(&obj, &params)),
        1 => Box::new(methods::amount(&obj, &params)),
        _ => Box::new(false),
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("Свойство1"),
    name!("Свойство2")
];

// Имена и типы
pub struct AddIn {
    field1: String,
    field2: i32
}

// Конструктор
impl AddIn {

    // Значения по умолчанию
    pub fn new() -> AddIn {
        AddIn {
            field1: String::from(""),
            field2: 0
        }
    }

    // Сюда просто нужно еще раз добавить имена полей
    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.field1 as &dyn getset::ValueType as *const _,
            1 => &self.field2 as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

// -------------------------------------------------------------------------------------------------