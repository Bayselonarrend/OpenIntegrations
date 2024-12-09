use addin1c::{Variant, ParamValue, Tm};

// Реализация для i32

pub trait ValueType {
    fn get_value(&self, val: &mut Variant) -> bool;
    fn set_value(&mut self, val: &Variant);
}

impl ValueType for i32 {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_i32(*self);
        true
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_i32().unwrap();
    }
}

// Реализация для f64
impl ValueType for f64 {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_f64(*self);
        true
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_f64().unwrap();
    }
}

// Реализация для bool
impl ValueType for bool {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_bool(*self);
        true
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_bool().unwrap();
    }
}

// Реализация для tm
impl ValueType for Tm {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_date(*self);
        true
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_date().unwrap();
    }
}

// Реализация для String
impl ValueType for String {
    fn get_value(&self, val: &mut Variant) -> bool {
        let s: Vec<u16> = self.encode_utf16().collect();
        val.set_str1c(s.as_slice()).is_ok()
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_string().unwrap_or("".to_string());
    }
}

// Реализация для Vec<u8>
impl ValueType for Vec<u8> {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_blob(self.as_slice()).is_ok()
    }

    fn set_value(&mut self, val: &Variant) {
        *self = val.get_blob().unwrap().to_vec()
    }
}