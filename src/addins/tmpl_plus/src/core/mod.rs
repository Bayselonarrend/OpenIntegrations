pub mod getset;

use addin1c::{RawAddin, Variant};

// Определение класса
pub trait SimpleRaw: RawAddin + Drop + std::ops::Index<usize> + std::ops::IndexMut<usize> {

    fn new() -> Self;
    fn classname() -> &'static [u16];
    fn method_signatures(&self) -> Vec<(&str, i32)>;
    fn execute(&mut self, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType>;
    fn props(&self) -> Vec<(&str, &dyn getset::ValueType)>;
    fn destroy(&mut self);

    fn register_extension_as(&mut self) -> &'static [u16] {
        self.classname()
    }
    fn get_n_props(&mut self) -> usize {
        self.len()
    }
    fn find_prop(&mut self, name: &[u16]) -> Option<usize> { self.convert_to_u16(self.props()).iter().position(|&x| x == name) }
    fn get_prop_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { self.convert_to_u16(self.props()).get(num).copied() }
    fn get_prop_val(&mut self, num: usize, val: &mut Variant) -> bool {let field: &dyn getset::ValueType = &self[num]; field.get_value(val) }
    fn set_prop_val(&mut self, num: usize, val: &Variant) -> bool {let field: &mut dyn getset::ValueType = &mut self[num]; field.set_value(val); true }
    fn is_prop_readable(&mut self, _num: usize) -> bool { true }
    fn is_prop_writable(&mut self, _num: usize) -> bool { true }
    fn get_n_methods(&mut self) -> usize { self.method_names().len() }
    fn find_method(&mut self, name: &[u16]) -> Option<usize> { self.method_names().iter().position(|&x| x == name) }
    fn get_method_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { self.method_names().get(num).copied() }
    fn get_n_params(&mut self, num: usize) -> usize { self.get_params_amount(num) }
    fn get_param_def_value(&mut self, _method_num: usize, _param_num: usize, _value: Variant, ) -> bool { true }
    fn has_ret_val(&mut self, _num: usize) -> bool { true }
    fn call_as_proc(&mut self, _num: usize, _params: &mut [Variant]) -> bool { false }
    fn call_as_func(&mut self, num: usize, params: &mut [Variant], ret_value: &mut Variant, ) -> bool { self.execute(num, params).get_value(ret_value) }
    fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
    fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {

        let field_map = self.props();

        if index < field_map.len() {
            field_map[index].1 as *const _
        } else {
            "Err: Prop not found!".to_string() as &dyn getset::ValueType
        }
    }

    fn drop(&mut self) { self.destroy()}
    fn index(&self, index: usize) -> &dyn getset::ValueType { unsafe { &*self.get_field_ptr(index) } }
    fn index_mut(&mut self, index: usize) -> &mut Self::Output { unsafe { &mut *self.get_field_ptr_mut(index) } }

    fn convert_to_u16(values: Vec<(&str, &dyn getset::ValueType)>) -> Vec<u16> {
        let mut result = Vec::new();

        for (_, value) in values {
            let s = value.as_str();
            result.extend(s.encode_utf16());
        }

        result
    }

    fn get_params_amount(&self, index: usize) -> usize {

        let data = self.method_signatures();

        if index < data.len() {
            data[index].1 as usize
        } else {
            0
        }
    }

}




