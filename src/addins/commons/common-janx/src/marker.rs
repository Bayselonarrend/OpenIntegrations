use crate::error::JanxError;

pub const MARKER_KEY: &str = "__JANXB__";
pub const FIELD_START: &str = "s";
pub const FIELD_LENGTH: &str = "l";

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct BinaryMarker {
    pub start: u32,
    pub length: u32,
}

pub fn read_appendix(appendix: &[u8], marker: BinaryMarker) -> Result<&[u8], JanxError> {
    let start = marker.start as usize;
    let length = marker.length as usize;

    if length == 0 {
        return Ok(&[]);
    }

    let end = start
        .checked_add(length)
        .ok_or(JanxError::AppendixOutOfBounds)?;

    if end > appendix.len() {
        return Err(JanxError::AppendixOutOfBounds);
    }

    Ok(&appendix[start..end])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn read_slice() {
        let appendix = [10u8, 20, 30, 40, 50];
        let slice = read_appendix(
            &appendix,
            BinaryMarker {
                start: 1,
                length: 3,
            },
        )
        .unwrap();
        assert_eq!(slice, &[20, 30, 40]);
    }
}
