mod codec;
mod error;
mod from_janx;
mod into_janx;
mod marker;
#[macro_use]
mod macros;
mod value;

pub type JanxNumber = serde_json::Number;

pub use codec::FORMAT_VERSION;
pub use error::JanxError;
pub use from_janx::FromJanx;
pub use into_janx::{IntoJanx, JanxSeqElement};
pub use value::{decode, encode, JanxValue};

#[cfg(test)]
mod macro_tests;
