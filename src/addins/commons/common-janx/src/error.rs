use std::fmt;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum JanxError {
    TooShort,
    JsonLengthOutOfBounds,
    AppendixOutOfBounds,
}

impl fmt::Display for JanxError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::TooShort => write!(f, "Janx frame is too short"),
            Self::JsonLengthOutOfBounds => {
                write!(f, "Janx JSON length exceeds frame size")
            }
            Self::AppendixOutOfBounds => write!(f, "Janx appendix slice is out of bounds"),
        }
    }
}

impl std::error::Error for JanxError {}
