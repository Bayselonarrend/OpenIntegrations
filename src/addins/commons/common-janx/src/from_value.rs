use std::collections::BTreeMap;

use serde_json::Number;

use crate::JanxValue;

/// Извлечение типизированного значения из [`JanxValue`].
///
/// Аналог [`common_core::FromVariant`]: целевой тип задаётся в Turbofish или через вывод,
/// при несовпадении варианта Janx возвращается `None`.
///
/// Оператор `as` в Rust здесь не используется: он только для примитивов (`i32 as i64` и т.п.).
/// Для Janx — [`FromJanx::from_janx`], методы [`JanxValue::as_str`] / [`JanxValue::as_i64`], либо стандартный [`TryFrom`].
pub trait FromJanx: Sized {
    fn from_janx(value: &JanxValue) -> Option<Self>;
}

impl FromJanx for JanxValue {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        Some(value.clone())
    }
}

impl FromJanx for String {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_str().map(str::to_owned)
    }
}

impl FromJanx for bool {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_bool()
    }
}

impl FromJanx for i64 {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_i64()
    }
}

impl FromJanx for i32 {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_i64().map(|n| n as i32)
    }
}

impl FromJanx for f64 {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_f64()
    }
}

impl FromJanx for f32 {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_f64().map(|n| n as f32)
    }
}

impl FromJanx for Vec<u8> {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_binary().map(<[u8]>::to_vec)
    }
}

impl FromJanx for Number {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        match value {
            JanxValue::Number(n) => Some(n.clone()),
            _ => None,
        }
    }
}

impl FromJanx for BTreeMap<String, JanxValue> {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_object().cloned()
    }
}

impl FromJanx for Vec<JanxValue> {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        value.as_array().map(<[JanxValue]>::to_vec)
    }
}

macro_rules! impl_try_from_janx {
    ($($ty:ty),+ $(,)?) => {
        $(
            impl TryFrom<&JanxValue> for $ty {
                type Error = ();

                fn try_from(value: &JanxValue) -> Result<Self, Self::Error> {
                    <$ty as FromJanx>::from_janx(value).ok_or(())
                }
            }
        )+
    };
}

impl_try_from_janx! {
    String,
    bool,
    i32,
    i64,
    f32,
    f64,
    Vec<u8>,
    Number,
    BTreeMap<String, JanxValue>,
    Vec<JanxValue>,
    JanxValue,
}

impl JanxValue {
    pub fn as_str(&self) -> Option<&str> {
        match self {
            Self::String(s) => Some(s.as_str()),
            _ => None,
        }
    }

    pub fn as_bool(&self) -> Option<bool> {
        match self {
            Self::Bool(v) => Some(*v),
            _ => None,
        }
    }

    pub fn as_i64(&self) -> Option<i64> {
        match self {
            Self::Number(n) => n.as_i64(),
            _ => None,
        }
    }

    pub fn as_f64(&self) -> Option<f64> {
        match self {
            Self::Number(n) => n.as_f64(),
            _ => None,
        }
    }

    pub fn as_binary(&self) -> Option<&[u8]> {
        match self {
            Self::Binary(bytes) => Some(bytes.as_slice()),
            _ => None,
        }
    }

    pub fn as_array(&self) -> Option<&[JanxValue]> {
        match self {
            Self::Array(items) => Some(items.as_slice()),
            _ => None,
        }
    }

    pub fn as_object(&self) -> Option<&BTreeMap<String, JanxValue>> {
        match self {
            Self::Object(map) => Some(map),
            _ => None,
        }
    }

    pub fn get(&self, key: &str) -> Option<&JanxValue> {
        self.as_object()?.get(key)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn from_janx_primitives() {
        assert_eq!(String::from_janx(&JanxValue::String("x".into())), Some("x".into()));
        assert_eq!(bool::from_janx(&JanxValue::Bool(true)), Some(true));
        assert_eq!(i64::from_janx(&JanxValue::Number(1.into())), Some(1));
        assert_eq!(
            Vec::<u8>::from_janx(&JanxValue::binary(vec![1, 2])),
            Some(vec![1, 2])
        );
    }

    #[test]
    fn try_from_janx() {
        let v = JanxValue::String("ok".into());
        assert_eq!(String::try_from(&v), Ok("ok".into()));
        assert!(i64::try_from(&v).is_err());
    }

    #[test]
    fn object_get_and_as_object() {
        let mut map = BTreeMap::new();
        map.insert("k".to_string(), JanxValue::String("v".into()));
        let root = JanxValue::Object(map);

        assert!(root.get("k").is_some());
        assert!(BTreeMap::<String, JanxValue>::from_janx(&root).is_some());
    }
}
