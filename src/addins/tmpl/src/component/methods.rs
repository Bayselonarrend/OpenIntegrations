use addin1c::{Variant};
use crate::component::AddIn;

pub fn send_message(obj: &AddIn, params: &[Variant]) -> String {

    let field1 = &obj.field1;
    params[0].get_string().unwrap_or("".to_string()) + field1

}

pub fn amount(obj: &AddIn, params: &mut [Variant]) -> i32 {

    let result = params[0].get_i32().unwrap() + params[1].get_i32().unwrap();
    params[0].set_i32(999);

    result

}
