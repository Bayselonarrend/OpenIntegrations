mod methods;

use std::error::Error;
use std::ops::{Index, IndexMut};
use addin1c::{name, MethodInfo, PropInfo, SimpleAddin, Variant};
use crate::core::{getset, self, SimpleRaw};
use crate::core::getset::ValueType;

pub struct AddIn {
    pub prop1: String,
}


impl SimpleRaw for AddIn {

    fn new() -> Self {
        todo!()
    }

    fn classname() -> &'static [u16] {
        todo!()
    }

    fn method_signatures(&self) -> Vec<(&str, i32)> {
        todo!()
    }

    fn execute(&mut self, num: usize, params: &mut [Variant]) -> Box<dyn ValueType> {
        todo!()
    }

    fn props(&self) -> Vec<(&str, &dyn ValueType)> {
        todo!()
    }

    fn destroy(&mut self) {
        todo!()
    }
}
// -------------------------------------------------------------------------------------------------
