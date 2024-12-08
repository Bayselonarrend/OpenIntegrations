use addin1c::{Variant, ParamValue, Tm};

// Реализация для i32

pub trait ValueType {
    fn get_value(&self, val: &mut Variant) -> bool;
    fn set_value(&mut self, val: &ParamValue);
}

impl ValueType for i32 {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_i32(*self);
        true
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::I32(x) = val {
            *self = *x;
        }
    }
}

// Реализация для f64
impl ValueType for f64 {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_f64(*self);
        true
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::F64(x) = val {
            *self = *x;
        }
    }
}

// Реализация для bool
impl ValueType for bool {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_bool(*self);
        true
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::Bool(x) = val {
            *self = *x;
        }
    }
}

// Реализация для tm
impl ValueType for Tm {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_date(*self);
        true
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::Date(x) = val {
            *self = *x;
        }
    }
}

// Реализация для String
impl ValueType for String {
    fn get_value(&self, val: &mut Variant) -> bool {
        let s: Vec<u16> = self.encode_utf16().collect();
        val.set_str(s.as_slice())
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::Str(x) = val {
            *self = String::from_utf16(*x).unwrap();
        }
    }
}

// Реализация для Vec<u8>
impl ValueType for Vec<u8> {
    fn get_value(&self, val: &mut Variant) -> bool {
        val.set_blob(self.as_slice())
    }

    fn set_value(&mut self, val: &ParamValue) {
        if let ParamValue::Blob(x) = val {
            self.clear();
            self.extend_from_slice(x);
        }
    }
}