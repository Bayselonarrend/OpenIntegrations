use std::collections::HashMap;

use common_janx::{janx, JanxValue};
use prost_reflect::{DynamicMessage, Kind, MessageDescriptor, ReflectMessage, Value as ProstValue};

pub fn janx_to_dynamic_message(
    json_value: &JanxValue,
    message_desc: &MessageDescriptor,
) -> Result<DynamicMessage, String> {
    let mut message = DynamicMessage::new(message_desc.clone());

    let Some(obj) = json_value.as_object() else {
        return Err("Expected object for message".to_string());
    };

    for (field_name, field_value) in obj {
        if matches!(field_value, JanxValue::Null) {
            continue;
        }

        if let Some(field_desc) = message_desc.get_field_by_name(field_name) {
            let prost_value = janx_to_prost_value(field_value, &field_desc)?;
            message.set_field(&field_desc, prost_value);
        }
    }

    Ok(message)
}

fn janx_to_prost_value(
    value: &JanxValue,
    field_desc: &prost_reflect::FieldDescriptor,
) -> Result<ProstValue, String> {
    if field_desc.is_list() {
        let Some(arr) = value.as_array() else {
            return Err(format!(
                "Expected array for repeated field '{}'",
                field_desc.name()
            ));
        };
        let list: Result<Vec<ProstValue>, String> = arr
            .iter()
            .map(|item| janx_to_prost_value_scalar(item, field_desc))
            .collect();
        return Ok(ProstValue::List(list?));
    }

    if field_desc.is_map() {
        let Some(obj) = value.as_object() else {
            return Err(format!(
                "Expected object for map field '{}'",
                field_desc.name()
            ));
        };
        let mut map = HashMap::new();
        for (key, item) in obj {
            let val_value = janx_to_prost_value_scalar(item, field_desc)?;
            map.insert(prost_reflect::MapKey::String(key.clone()), val_value);
        }
        return Ok(ProstValue::Map(map));
    }

    janx_to_prost_value_scalar(value, field_desc)
}

fn janx_to_prost_value_scalar(
    value: &JanxValue,
    field_desc: &prost_reflect::FieldDescriptor,
) -> Result<ProstValue, String> {
    match field_desc.kind() {
        Kind::Double => match value {
            JanxValue::Number(n) => Ok(ProstValue::F64(n.as_f64().unwrap_or(0.0))),
            JanxValue::String(s) => Ok(ProstValue::F64(s.parse().unwrap_or(0.0))),
            _ => Err("Expected number for double field".to_string()),
        },
        Kind::Float => match value {
            JanxValue::Number(n) => Ok(ProstValue::F32(n.as_f64().unwrap_or(0.0) as f32)),
            JanxValue::String(s) => Ok(ProstValue::F32(s.parse().unwrap_or(0.0))),
            _ => Err("Expected number for float field".to_string()),
        },
        Kind::Int32 | Kind::Sint32 | Kind::Sfixed32 => match value {
            JanxValue::Number(n) => Ok(ProstValue::I32(n.as_i64().unwrap_or(0) as i32)),
            _ => Err("Expected number for int32 field".to_string()),
        },
        Kind::Int64 | Kind::Sint64 | Kind::Sfixed64 => match value {
            JanxValue::Number(n) => Ok(ProstValue::I64(n.as_i64().unwrap_or(0))),
            _ => Err("Expected number for int64 field".to_string()),
        },
        Kind::Uint32 | Kind::Fixed32 => match value {
            JanxValue::Number(n) => Ok(ProstValue::U32(n.as_u64().unwrap_or(0) as u32)),
            _ => Err("Expected number for uint32 field".to_string()),
        },
        Kind::Uint64 | Kind::Fixed64 => match value {
            JanxValue::Number(n) => Ok(ProstValue::U64(n.as_u64().unwrap_or(0))),
            _ => Err("Expected number for uint64 field".to_string()),
        },
        Kind::Bool => match value {
            JanxValue::Bool(b) => Ok(ProstValue::Bool(*b)),
            _ => Err("Expected boolean for bool field".to_string()),
        },
        Kind::String => match value {
            JanxValue::String(s) => Ok(ProstValue::String(s.clone())),
            _ => Err("Expected string for string field".to_string()),
        },
        Kind::Bytes => decode_bytes_value(value),
        Kind::Message(msg_desc) => match value {
            JanxValue::Object(_) => {
                let sub_message = janx_to_dynamic_message(value, &msg_desc)?;
                Ok(ProstValue::Message(sub_message))
            }
            _ => Err("Expected object for message field".to_string()),
        },
        Kind::Enum(enum_desc) => match value {
            JanxValue::String(s) => {
                if let Some(enum_value) = enum_desc.get_value_by_name(s) {
                    Ok(ProstValue::EnumNumber(enum_value.number()))
                } else {
                    Err(format!("Unknown enum value: {}", s))
                }
            }
            JanxValue::Number(n) => Ok(ProstValue::EnumNumber(n.as_i64().unwrap_or(0) as i32)),
            _ => Err("Expected string or number for enum field".to_string()),
        },
    }
}

fn decode_bytes_value(value: &JanxValue) -> Result<ProstValue, String> {
    match value {
        JanxValue::Binary(bytes) => Ok(ProstValue::Bytes(bytes.clone().into())),
        JanxValue::String(path) => {
            let bytes = std::fs::read(path)
                .map_err(|e| format!("Failed to read bytes from file '{}': {}", path, e))?;
            Ok(ProstValue::Bytes(bytes.into()))
        }
        _ => Err("Expected Janx binary or file path string for bytes field".to_string()),
    }
}

pub fn dynamic_message_to_janx(message: &DynamicMessage) -> Result<JanxValue, String> {
    let mut fields = std::collections::BTreeMap::new();

    for field_desc in message.descriptor().fields() {
        let field_value = message.get_field(&field_desc);
        let janx_value = prost_value_to_janx(&field_value, &field_desc)?;
        fields.insert(field_desc.name().to_string(), janx_value);
    }

    Ok(JanxValue::Object(fields))
}

fn prost_value_to_janx(
    prost_value: &ProstValue,
    field_desc: &prost_reflect::FieldDescriptor,
) -> Result<JanxValue, String> {
    match prost_value {
        ProstValue::Bool(b) => Ok(JanxValue::Bool(*b)),
        ProstValue::I32(i) => Ok(JanxValue::Number((*i).into())),
        ProstValue::I64(i) => Ok(JanxValue::Number((*i).into())),
        ProstValue::U32(u) => Ok(JanxValue::Number((*u).into())),
        ProstValue::U64(u) => Ok(JanxValue::Number((*u).into())),
        ProstValue::F32(f) => Ok(janx!(*f)),
        ProstValue::F64(f) => Ok(janx!(*f)),
        ProstValue::String(s) => Ok(JanxValue::String(s.clone())),
        ProstValue::Bytes(b) => Ok(JanxValue::binary(b.to_vec())),
        ProstValue::EnumNumber(n) => {
            if let Kind::Enum(enum_desc) = field_desc.kind() {
                if let Some(enum_value) = enum_desc.get_value(*n) {
                    Ok(JanxValue::String(enum_value.name().to_string()))
                } else {
                    Ok(JanxValue::Number((*n).into()))
                }
            } else {
                Ok(JanxValue::Number((*n).into()))
            }
        }
        ProstValue::Message(msg) => dynamic_message_to_janx(msg),
        ProstValue::List(list) => {
            let items: Result<Vec<JanxValue>, String> = list
                .iter()
                .map(|item| prost_value_to_janx(item, field_desc))
                .collect();
            Ok(JanxValue::Array(items?))
        }
        ProstValue::Map(map) => {
            let mut fields = std::collections::BTreeMap::new();
            for (key, value) in map {
                let key_str = format!("{:?}", key);
                fields.insert(key_str, prost_value_to_janx(value, field_desc)?);
            }
            Ok(JanxValue::Object(fields))
        }
    }
}
