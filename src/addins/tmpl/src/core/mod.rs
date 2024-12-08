mod getset;
mod methods;

use addin1c::{name, ParamValue, RawAddin, Variant};
use std::ops::{Index, IndexMut};

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Русские синонимы
const METHODS: &[&[u16]] = &[
    name!("Метод1")
];

// Число параметров по индексу
fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        _ => 0,
    }
}

fn cal_func(obj: &AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

     match num {
        0 => Box::new(methods::send_message(&obj, &params)),
        _ => Box::new(false),
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Русские синонимы
const PROPS: &[&[u16]] = &[
    name!("Свойство1"),
    name!("Свойство2")
];

// Имена и типы
pub struct AddIn {
    field1: String,
    field2: i32
}

// Значения по умолчанию
impl AddIn {
    pub fn new() -> AddIn {
        AddIn {
            field1: String::from(""),
            field2: 0
        }
    }
}

// Индекс
impl Index<usize> for AddIn {
    type Output = dyn getset::ValueType;

    fn index(&self, index: usize) -> &Self::Output {
        match index {
            0 => &self.field1, // Возвращаем ссылку на field1
            1 => &self.field2, // Возвращаем ссылку на field2
            _ => panic!("Index out of bounds"),
        }
    }
}

impl IndexMut<usize> for AddIn {

    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        match index {
            0 => &mut self.field1, // Возвращаем изменяемую ссылку на field1
            1 => &mut self.field2, // Возвращаем изменяемую ссылку на field2
            _ => panic!("Index out of bounds"),
        }
    }
}

// -------------------------------------------------------------------------------------------------

// ТО, ЧТО ТРОГАТЬ НЕ НУЖНО ------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}

// Определение класса
impl RawAddin for AddIn {

    fn register_extension_as(&mut self) -> &'static [u16] {
        name!("Test")
    }
    fn get_n_props(&mut self) -> usize {
        PROPS.len()
    }
    fn find_prop(&mut self, name: &[u16]) -> Option<usize> {
        PROPS.iter().position(|&x| x == name)
    }
    fn get_prop_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { PROPS.get(num).copied() }
    fn get_prop_val(&mut self, num: usize, val: &mut Variant) -> bool {let field: &dyn getset::ValueType = &self[num]; field.get_value(val) }
    fn set_prop_val(&mut self, num: usize, val: &ParamValue) -> bool {let field: &mut dyn getset::ValueType = &mut self[num]; field.set_value(&val); true }
    fn is_prop_readable(&mut self, _num: usize) -> bool { true }
    fn is_prop_writable(&mut self, num: usize) -> bool { true }
    fn get_n_methods(&mut self) -> usize { METHODS.len() }
    fn find_method(&mut self, name: &[u16]) -> Option<usize> { METHODS.iter().position(|&x| x == name) }
    fn get_method_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { METHODS.get(num).copied() }
    fn get_n_params(&mut self, num: usize) -> usize { get_params_amount(num) }
    fn get_param_def_value(&mut self, _method_num: usize, _param_num: usize, _value: Variant, ) -> bool { true }
    fn has_ret_val(&mut self, num: usize) -> bool { true }
    fn call_as_proc(&mut self, _num: usize, _params: &mut [Variant]) -> bool { false }
    fn call_as_func(&mut self, num: usize, params: &mut [Variant], ret_value: &mut Variant, ) -> bool { cal_func(self, num, params).get_value(ret_value) }

}


