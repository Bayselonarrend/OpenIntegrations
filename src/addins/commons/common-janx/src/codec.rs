use crate::error::JanxError;

pub const PREFIX_SIZE: usize = 4;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DecodedFrame<'a> {
    pub json: &'a [u8],
    pub appendix: &'a [u8],
}

pub fn pack_u32_be(value: u32) -> [u8; PREFIX_SIZE] {
    value.to_be_bytes()
}

pub fn read_u32_be(data: &[u8], offset: usize) -> Result<u32, JanxError> {
    if offset + PREFIX_SIZE > data.len() {
        return Err(JanxError::TooShort);
    }
    let mut bytes = [0u8; PREFIX_SIZE];
    bytes.copy_from_slice(&data[offset..offset + PREFIX_SIZE]);
    Ok(u32::from_be_bytes(bytes))
}

pub fn encode_frame(json: &[u8], appendix: &[u8]) -> Vec<u8> {
    let mut out = Vec::with_capacity(PREFIX_SIZE + json.len() + appendix.len());
    out.extend_from_slice(&pack_u32_be(json.len() as u32));
    out.extend_from_slice(json);
    out.extend_from_slice(appendix);
    out
}

pub fn decode_frame(data: &[u8]) -> Result<DecodedFrame<'_>, JanxError> {
    if data.len() < PREFIX_SIZE {
        return Err(JanxError::TooShort);
    }

    let json_len = read_u32_be(data, 0)? as usize;
    let json_start = PREFIX_SIZE;
    let json_end = json_start
        .checked_add(json_len)
        .ok_or(JanxError::JsonLengthOutOfBounds)?;

    if json_end > data.len() {
        return Err(JanxError::JsonLengthOutOfBounds);
    }

    Ok(DecodedFrame {
        json: &data[json_start..json_end],
        appendix: &data[json_end..],
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn roundtrip_frame() {
        let json = br#"{"a":1}"#;
        let appendix = [1u8, 2, 3];
        let frame = encode_frame(json, &appendix);
        let decoded = decode_frame(&frame).unwrap();
        assert_eq!(decoded.json, json);
        assert_eq!(decoded.appendix, appendix);
    }
}
