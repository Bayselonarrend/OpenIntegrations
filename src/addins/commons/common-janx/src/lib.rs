mod codec;
mod error;
mod marker;
mod value;

pub use error::JanxError;
pub use value::{decode, encode, JanxValue};
