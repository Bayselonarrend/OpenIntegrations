pub mod getset;

use addin1c::{name, RawAddin, Variant};

use crate::component::METHODS;
use crate::component::PROPS;
use crate::component::get_params_amount;
use crate::component::cal_func;
use crate::component::AddIn;

// Определение класса
impl RawAddin for AddIn {

    fn register_extension_as(&mut self) -> &'static [u16] {
        name!("Main")
    }
    fn get_n_props(&mut self) -> usize {
        PROPS.len()
    }
    fn find_prop(&mut self, name: &[u16]) -> Option<usize> {
        PROPS.iter().position(|&x| x == name)
    }
    fn get_prop_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { PROPS.get(num).copied() }
    fn get_prop_val(&mut self, num: usize, val: &mut Variant) -> bool {let field: &dyn getset::ValueType = &self[num]; field.get_value(val) }
    fn set_prop_val(&mut self, num: usize, val: &Variant) -> bool {let field: &mut dyn getset::ValueType = &mut self[num]; field.set_value(val); true }
    fn is_prop_readable(&mut self, _num: usize) -> bool { true }
    fn is_prop_writable(&mut self, _num: usize) -> bool { true }
    fn get_n_methods(&mut self) -> usize { METHODS.len() }
    fn find_method(&mut self, name: &[u16]) -> Option<usize> { METHODS.iter().position(|&x| x == name) }
    fn get_method_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> { METHODS.get(num).copied() }
    fn get_n_params(&mut self, num: usize) -> usize { get_params_amount(num) }
    fn get_param_def_value(&mut self, _method_num: usize, _param_num: usize, _value: Variant, ) -> bool { true }
    fn has_ret_val(&mut self, _num: usize) -> bool { true }
    fn call_as_proc(&mut self, _num: usize, _params: &mut [Variant]) -> bool { false }
    fn call_as_func(&mut self, num: usize, params: &mut [Variant], ret_value: &mut Variant, ) -> bool { cal_func(self, num, params).get_value(ret_value) }

}

impl std::ops::Index<usize> for AddIn {
    type Output = dyn getset::ValueType;

    fn index(&self, index: usize) -> &Self::Output {
        unsafe { &*self.get_field_ptr(index) }
    }
}

impl std::ops::IndexMut<usize> for AddIn {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        unsafe { &mut *self.get_field_ptr_mut(index) }
    }
}


