use std::fmt;

#[derive(Debug)]
pub enum JanxError {
    TooShort,
    JsonLengthOutOfBounds,
    AppendixOutOfBounds,
    Json(serde_json::Error),
}

impl fmt::Display for JanxError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::TooShort => write!(f, "Janx frame is too short"),
            Self::JsonLengthOutOfBounds => {
                write!(f, "Janx JSON length exceeds frame size")
            }
            Self::AppendixOutOfBounds => write!(f, "Janx appendix slice is out of bounds"),
            Self::Json(err) => write!(f, "JSON error: {err}"),
        }
    }
}

impl std::error::Error for JanxError {}

impl From<serde_json::Error> for JanxError {
    fn from(value: serde_json::Error) -> Self {
        Self::Json(value)
    }
}
