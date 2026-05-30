use std::collections::BTreeMap;

use serde_json::{Number, Value};

use crate::codec::{decode_frame, encode_frame};
use crate::error::JanxError;
use crate::marker::{marker_to_json, parse_marker_json, read_appendix};

#[derive(Debug, Clone, PartialEq)]
pub enum JanxValue {
    Null,
    Bool(bool),
    Number(Number),
    String(String),
    Array(Vec<JanxValue>),
    Object(BTreeMap<String, JanxValue>),
    Binary(Vec<u8>),
}

impl JanxValue {
    pub fn binary(bytes: impl Into<Vec<u8>>) -> Self {
        Self::Binary(bytes.into())
    }
}

pub fn encode(value: &JanxValue) -> Result<Vec<u8>, JanxError> {
    let mut binaries = Vec::new();
    let mut offset = 0u32;
    let prepared = value_to_json(value, &mut binaries, &mut offset)?;
    let json = serde_json::to_vec(&prepared)?;
    let appendix = concat_appendix(&binaries);
    Ok(encode_frame(&json, &appendix))
}

pub fn decode(data: &[u8]) -> Result<JanxValue, JanxError> {
    let frame = decode_frame(data)?;
    let parsed: Value = serde_json::from_slice(frame.json)?;
    restore_from_json(&parsed, frame.appendix)
}

fn value_to_json(
    value: &JanxValue,
    binaries: &mut Vec<Vec<u8>>,
    offset: &mut u32,
) -> Result<Value, JanxError> {
    match value {
        JanxValue::Null => Ok(Value::Null),
        JanxValue::Bool(v) => Ok(Value::Bool(*v)),
        JanxValue::Number(v) => Ok(Value::Number(v.clone())),
        JanxValue::String(v) => Ok(Value::String(v.clone())),
        JanxValue::Binary(bytes) => {
            let start = *offset;
            let length = bytes.len() as u32;
            binaries.push(bytes.clone());
            *offset = offset.saturating_add(length);
            Ok(marker_to_json(start, length))
        }
        JanxValue::Array(items) => {
            let out = items
                .iter()
                .map(|item| value_to_json(item, binaries, offset))
                .collect::<Result<Vec<_>, _>>()?;
            Ok(Value::Array(out))
        }
        JanxValue::Object(map) => {
            let mut out = serde_json::Map::new();
            for (key, item) in map {
                out.insert(key.clone(), value_to_json(item, binaries, offset)?);
            }
            Ok(Value::Object(out))
        }
    }
}

fn restore_from_json(value: &Value, appendix: &[u8]) -> Result<JanxValue, JanxError> {
    if let Some(marker) = parse_marker_json(value) {
        let bytes = read_appendix(appendix, marker)?;
        return Ok(JanxValue::Binary(bytes.to_vec()));
    }

    match value {
        Value::Null => Ok(JanxValue::Null),
        Value::Bool(v) => Ok(JanxValue::Bool(*v)),
        Value::Number(v) => Ok(JanxValue::Number(v.clone())),
        Value::String(v) => Ok(JanxValue::String(v.clone())),
        Value::Array(items) => {
            let mut out = Vec::with_capacity(items.len());
            for item in items {
                out.push(restore_from_json(item, appendix)?);
            }
            Ok(JanxValue::Array(out))
        }
        Value::Object(map) => {
            let mut out = BTreeMap::new();
            for (key, item) in map {
                out.insert(key.clone(), restore_from_json(item, appendix)?);
            }
            Ok(JanxValue::Object(out))
        }
    }
}

fn concat_appendix(binaries: &[Vec<u8>]) -> Vec<u8> {
    let size: usize = binaries.iter().map(Vec::len).sum();
    let mut out = Vec::with_capacity(size);
    for block in binaries {
        out.extend_from_slice(block);
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::BTreeMap;

    #[test]
    fn roundtrip_nested_binary() {
        let mut attrs = BTreeMap::new();
        attrs.insert("enabled".to_string(), JanxValue::Bool(true));

        let mut item = BTreeMap::new();
        item.insert("index".to_string(), JanxValue::Number(Number::from(1)));
        item.insert(
            "payload".to_string(),
            JanxValue::binary(vec![1, 2, 3, 4, 5]),
        );
        item.insert("attrs".to_string(), JanxValue::Object(attrs));

        let mut root = BTreeMap::new();
        root.insert("label".to_string(), JanxValue::String("test".to_string()));
        root.insert("items".to_string(), JanxValue::Array(vec![JanxValue::Object(item)]));

        let input = JanxValue::Object(root);
        let frame = encode(&input).unwrap();
        let restored = decode(&frame).unwrap();
        assert_eq!(restored, input);
    }
}
