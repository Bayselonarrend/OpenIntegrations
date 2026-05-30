/// Builds a [`JanxValue`](crate::JanxValue) from literal or expression syntax (similar to [`serde_json::json!`]).
///
/// # Examples
///
/// ```
/// use common_janx::{janx, JanxValue};
///
/// let msg = janx!({
///     "result": true,
///     "connectionId": "abc",
///     "message": vec![1u8, 2, 3],
///     "active": true,
/// });
/// assert!(matches!(msg, JanxValue::Object(_)));
/// ```
#[macro_export]
macro_rules! janx {
    ($($json:tt)+) => {
        $crate::__janx_internal!($($json)+)
    };
}

#[macro_export]
#[doc(hidden)]
macro_rules! __janx_internal {
    // Must come before `@object` — otherwise `{ "a": 1 }` is parsed as a block.
    (@object {$($tt:tt)*}) => {
        $crate::__janx_internal!({$($tt)*})
    };

    (null) => {
        $crate::JanxValue::Null
    };

    (true) => {
        $crate::JanxValue::Bool(true)
    };

    (false) => {
        $crate::JanxValue::Bool(false)
    };

    ([]) => {
        $crate::JanxValue::Array(Vec::new())
    };

    ([ $($elem:expr,)* $(,)? ]) => {
        $crate::JanxValue::Array(vec![ $( $crate::into_janx::IntoJanx::into_janx($elem) ),* ])
    };

    ({ $($key:tt : $value:expr),* $(,)? }) => {
        {
            let mut __janx_map = std::collections::BTreeMap::new();
            $(
                __janx_map.insert(
                    $crate::__janx_key!($key),
                    $crate::into_janx::IntoJanx::into_janx($value),
                );
            )*
            $crate::JanxValue::Object(__janx_map)
        }
    };

    ($other:expr) => {
        $crate::into_janx::IntoJanx::into_janx($other)
    };
}

#[macro_export]
#[doc(hidden)]
macro_rules! __janx_key {
    ($key:literal) => {
        $key.to_string()
    };
    ($key:ident) => {
        stringify!($key).to_string()
    };
}
