mod methods;

use common_core::*;
use methods::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, call_func);

pub const PROPS: &[&[u16]] = &[];

pub const METHODS: &[&[u16]] = &[
    name!("HmacSha1"),
    name!("HmacSha256"),
    name!("RsaSha1"),
    name!("RsaSha256"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 2,
        1 => 2,
        2 => 2,
        3 => 2,
        _ => 0,
    }
}

pub fn call_func(_obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let key = params[0].get_blob().unwrap_or_default();
    let data = params[1].get_blob().unwrap_or_default();

    match num {
        0 => box_result(hmac_sha1(key, data)),
        1 => box_result(hmac_sha256(key, data)),
        2 => box_result(rsa_sha1(key, data)),
        3 => box_result(rsa_sha256(key, data)),
        _ => Box::new(false),
    }

}

fn box_result(result:  Result<Vec<u8>, String>) -> Box<dyn getset::ValueType> {
    match result {
        Ok(data) => Box::new(data),
        Err(e) => Box::new(e),
    }
}

pub struct AddIn {}

impl AddIn {
    pub fn new() -> Self { AddIn {} }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

impl Drop for AddIn {
    fn drop(&mut self) {}
}

