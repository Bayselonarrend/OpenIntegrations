use crate::error::JanxError;

pub const FORMAT_VERSION: u16 = 1;
pub const VERSION_SIZE: usize = 2;
pub const JSON_LEN_SIZE: usize = 4;
pub const BINARY_COUNT_SIZE: usize = 4;
pub const HEADER_SIZE: usize = VERSION_SIZE + JSON_LEN_SIZE + BINARY_COUNT_SIZE;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DecodedFrame<'a> {
    pub version: u16,
    pub binary_count: u32,
    pub json: &'a [u8],
    pub appendix: &'a [u8],
}

pub(crate) fn encode_frame(json: &[u8], appendix: &[u8], binary_count: u32) -> Vec<u8> {
    let mut out = Vec::with_capacity(HEADER_SIZE + json.len() + appendix.len());
    out.extend_from_slice(&pack_u16_be(FORMAT_VERSION));
    out.extend_from_slice(&pack_u32_be(json.len() as u32));
    out.extend_from_slice(&pack_u32_be(binary_count));
    out.extend_from_slice(json);
    out.extend_from_slice(appendix);
    out
}

pub(crate) fn decode_frame(data: &[u8]) -> Result<DecodedFrame<'_>, JanxError> {
    if data.len() < HEADER_SIZE {
        return Err(JanxError::TooShort);
    }

    let version = read_u16_be(data, 0)?;
    if version != FORMAT_VERSION {
        return Err(JanxError::UnsupportedFormatVersion {
            version: version.into(),
        });
    }

    let json_len = read_u32_be(data, VERSION_SIZE)? as usize;
    let binary_count = read_u32_be(data, VERSION_SIZE + JSON_LEN_SIZE)?;
    let json_start = HEADER_SIZE;
    let json_end = json_start
        .checked_add(json_len)
        .ok_or(JanxError::JsonLengthOutOfBounds)?;

    if json_end > data.len() {
        return Err(JanxError::JsonLengthOutOfBounds);
    }

    Ok(DecodedFrame {
        version,
        binary_count,
        json: &data[json_start..json_end],
        appendix: &data[json_end..],
    })
}

pub fn pack_u16_be(value: u16) -> [u8; VERSION_SIZE] {
    value.to_be_bytes()
}

pub fn pack_u32_be(value: u32) -> [u8; JSON_LEN_SIZE] {
    value.to_be_bytes()
}

pub fn read_u16_be(data: &[u8], offset: usize) -> Result<u16, JanxError> {
    if offset + VERSION_SIZE > data.len() {
        return Err(JanxError::TooShort);
    }
    let mut bytes = [0u8; VERSION_SIZE];
    bytes.copy_from_slice(&data[offset..offset + VERSION_SIZE]);
    Ok(u16::from_be_bytes(bytes))
}

pub fn read_u32_be(data: &[u8], offset: usize) -> Result<u32, JanxError> {
    if offset + JSON_LEN_SIZE > data.len() {
        return Err(JanxError::TooShort);
    }
    let mut bytes = [0u8; JSON_LEN_SIZE];
    bytes.copy_from_slice(&data[offset..offset + JSON_LEN_SIZE]);
    Ok(u32::from_be_bytes(bytes))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn frame_starts_with_format_version() {
        let frame = encode_frame(b"{}", b"", 0);
        assert_eq!(read_u16_be(&frame, 0).unwrap(), FORMAT_VERSION);
        assert_eq!(read_u32_be(&frame, VERSION_SIZE).unwrap(), 2);
        assert_eq!(
            read_u32_be(&frame, VERSION_SIZE + JSON_LEN_SIZE).unwrap(),
            0
        );
    }

    #[test]
    fn rejects_unsupported_format_version() {
        let mut frame = encode_frame(b"{}", b"", 0);
        frame[1] = 2;
        let err = decode_frame(&frame).unwrap_err();
        assert!(matches!(
            err,
            JanxError::UnsupportedFormatVersion { version: 2 }
        ));
    }
}
