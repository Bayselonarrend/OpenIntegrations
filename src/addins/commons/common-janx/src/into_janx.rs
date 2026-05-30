use std::collections::BTreeMap;

use serde_json::Number;

use crate::JanxValue;

/// Converts Rust values into [`JanxValue`] (used by [`janx!`](crate::janx)).
pub trait IntoJanx {
    fn into_janx(self) -> JanxValue;
}

impl IntoJanx for JanxValue {
    fn into_janx(self) -> JanxValue {
        self
    }
}

impl IntoJanx for () {
    fn into_janx(self) -> JanxValue {
        JanxValue::Null
    }
}

impl IntoJanx for bool {
    fn into_janx(self) -> JanxValue {
        JanxValue::Bool(self)
    }
}

impl IntoJanx for &str {
    fn into_janx(self) -> JanxValue {
        JanxValue::String(self.to_string())
    }
}

impl IntoJanx for String {
    fn into_janx(self) -> JanxValue {
        JanxValue::String(self)
    }
}

impl IntoJanx for &String {
    fn into_janx(self) -> JanxValue {
        JanxValue::String(self.clone())
    }
}

impl IntoJanx for Number {
    fn into_janx(self) -> JanxValue {
        JanxValue::Number(self)
    }
}

macro_rules! impl_into_janx_int {
    ($($ty:ty),+ $(,)?) => {
        $(
            impl IntoJanx for $ty {
                fn into_janx(self) -> JanxValue {
                    JanxValue::Number(Number::from(self))
                }
            }
        )+
    };
}

impl_into_janx_int!(i8, i16, i32, i64, isize, u8, u16, u32, u64, usize);

impl IntoJanx for f32 {
    fn into_janx(self) -> JanxValue {
        Number::from_f64(f64::from(self))
            .map(JanxValue::Number)
            .unwrap_or(JanxValue::Null)
    }
}

impl IntoJanx for f64 {
    fn into_janx(self) -> JanxValue {
        Number::from_f64(self)
            .map(JanxValue::Number)
            .unwrap_or(JanxValue::Null)
    }
}

impl IntoJanx for Vec<u8> {
    fn into_janx(self) -> JanxValue {
        JanxValue::binary(self)
    }
}

impl IntoJanx for &[u8] {
    fn into_janx(self) -> JanxValue {
        JanxValue::binary(self.to_vec())
    }
}

/// Element types for Janx arrays (`Vec<u8>` / `&[u8]` are binary, not arrays).
pub trait JanxSeqElement: IntoJanx {}

impl JanxSeqElement for bool {}
impl JanxSeqElement for &str {}
impl JanxSeqElement for String {}
impl JanxSeqElement for Number {}
impl JanxSeqElement for JanxValue {}

macro_rules! impl_janx_seq_element {
    ($($ty:ty),+ $(,)?) => {
        $( impl JanxSeqElement for $ty {} )+
    };
}

impl_janx_seq_element!(i8, i16, i32, i64, isize, u16, u32, u64, f32, f64);

impl<T> IntoJanx for Option<T>
where
    T: IntoJanx,
{
    fn into_janx(self) -> JanxValue {
        match self {
            Some(value) => value.into_janx(),
            None => JanxValue::Null,
        }
    }
}

impl<T> IntoJanx for Vec<T>
where
    T: JanxSeqElement,
{
    fn into_janx(self) -> JanxValue {
        JanxValue::Array(self.into_iter().map(IntoJanx::into_janx).collect())
    }
}

impl<T> IntoJanx for &[T]
where
    T: JanxSeqElement + Clone,
{
    fn into_janx(self) -> JanxValue {
        JanxValue::Array(self.iter().cloned().map(IntoJanx::into_janx).collect())
    }
}

impl<T, const N: usize> IntoJanx for [T; N]
where
    T: IntoJanx,
{
    fn into_janx(self) -> JanxValue {
        JanxValue::Array(self.into_iter().map(IntoJanx::into_janx).collect())
    }
}

impl IntoJanx for BTreeMap<String, JanxValue> {
    fn into_janx(self) -> JanxValue {
        JanxValue::Object(self)
    }
}

/// HTTP-style header list `[(name, value), …]` → Janx array of `[name, value]` pairs.
impl IntoJanx for Vec<(String, String)> {
    fn into_janx(self) -> JanxValue {
        JanxValue::Array(
            self.into_iter()
                .map(|(k, v)| {
                    JanxValue::Array(vec![
                        JanxValue::String(k),
                        JanxValue::String(v),
                    ])
                })
                .collect(),
        )
    }
}

impl IntoJanx for &[(String, String)] {
    fn into_janx(self) -> JanxValue {
        JanxValue::Array(
            self.iter()
                .map(|(k, v)| {
                    JanxValue::Array(vec![
                        JanxValue::String(k.clone()),
                        JanxValue::String(v.clone()),
                    ])
                })
                .collect(),
        )
    }
}
