use addin1c::{Variant, ParamValue};
use crate::component::AddIn;

pub fn send_message(obj: &AddIn, params: &[Variant]) -> String {

    let field1 = &obj.field1;


    if let ParamValue::Str(x) = &params[0].get() {
        let pref = String::from_utf16(*x).unwrap();
        pref + field1
    } else {
        "Param error".to_string()
    }

}

pub fn amount(obj: &AddIn, params: &[Variant]) -> i32 {
    params[0].get_i32().unwrap() + params[1].get_i32().unwrap()
}
