use serde_json::Value;

use crate::error::JanxError;

pub const MARKER_KEY: &str = "__JANXB__";
pub const FIELD_START: &str = "s";
pub const FIELD_LENGTH: &str = "l";

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct BinaryMarker {
    pub start: u32,
    pub length: u32,
}

pub(crate) fn marker_to_json(start: u32, length: u32) -> Value {
    serde_json::json!({
        MARKER_KEY: {
            FIELD_START: start,
            FIELD_LENGTH: length,
        }
    })
}

pub(crate) fn parse_marker_json(value: &Value) -> Option<BinaryMarker> {
    let fields = value.get(MARKER_KEY)?;
    let start = fields.get(FIELD_START)?.as_u64()? as u32;
    let length = fields.get(FIELD_LENGTH)?.as_u64()? as u32;
    Some(BinaryMarker { start, length })
}

pub(crate) fn read_appendix(appendix: &[u8], marker: BinaryMarker) -> Result<&[u8], JanxError> {
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
