use serde_json::{json, Value};
use prost_reflect::{DynamicMessage, MessageDescriptor, ReflectMessage};
use common_binary::vault::{BinaryVault, VaultKey};
use std::str::FromStr;
use base64::Engine;
use base64::engine::general_purpose;

pub fn json_to_dynamic_message(binary_vault: &BinaryVault, json_value: &Value, message_desc: &MessageDescriptor) -> Result<DynamicMessage, String> {
    let mut message = DynamicMessage::new(message_desc.clone());

    if let Value::Object(obj) = json_value {
        for (field_name, field_value) in obj {
            if field_value.is_null() {
                continue;
            }

            if let Some(field_desc) = message_desc.get_field_by_name(field_name) {
                let prost_value = json_value_to_prost_value(binary_vault, field_value, &field_desc)?;
                message.set_field(&field_desc, prost_value);
            }
        }
    }

    Ok(message)
}

fn json_value_to_prost_value(binary_vault: &BinaryVault, json_value: &Value, field_desc: &prost_reflect::FieldDescriptor) -> Result<prost_reflect::Value, String> {
    use prost_reflect::Value as ProstValue;

    if field_desc.is_list() {
        return match json_value {
            Value::Array(arr) => {
                let list: Result<Vec<ProstValue>, String> = arr.iter()
                    .map(|item| json_value_to_prost_value_scalar(binary_vault, item, field_desc))
                    .collect();
                Ok(ProstValue::List(list?))
            },
            _ => Err(format!("Expected array for repeated field '{}'", field_desc.name())),
        };
    }

    if field_desc.is_map() {
        return match json_value {
            Value::Object(obj) => {
                let mut map = std::collections::HashMap::new();
                for (key, value) in obj {
                    let val_value = json_value_to_prost_value_scalar(binary_vault, value, field_desc)?;
                    map.insert(prost_reflect::MapKey::String(key.clone()), val_value);
                }
                Ok(ProstValue::Map(map))
            },
            _ => Err(format!("Expected object for map field '{}'", field_desc.name())),
        };
    }

    json_value_to_prost_value_scalar(binary_vault, json_value, field_desc)
}

fn json_value_to_prost_value_scalar(binary_vault: &BinaryVault, json_value: &Value, field_desc: &prost_reflect::FieldDescriptor) -> Result<prost_reflect::Value, String> {
    use prost_reflect::{Value as ProstValue, Kind};

    match field_desc.kind() {
        Kind::Double => match json_value {
            Value::Number(n) => Ok(ProstValue::F64(n.as_f64().unwrap_or(0.0))),
            Value::String(s) => Ok(ProstValue::F64(s.parse().unwrap_or(0.0))),
            _ => Err("Expected number for double field".to_string()),
        },
        Kind::Float => match json_value {
            Value::Number(n) => Ok(ProstValue::F32(n.as_f64().unwrap_or(0.0) as f32)),
            Value::String(s) => Ok(ProstValue::F32(s.parse().unwrap_or(0.0))),
            _ => Err("Expected number for float field".to_string()),
        },
        Kind::Int32 | Kind::Sint32 | Kind::Sfixed32 => match json_value {
            Value::Number(n) => Ok(ProstValue::I32(n.as_i64().unwrap_or(0) as i32)),
            _ => Err("Expected number for int32 field".to_string()),
        },
        Kind::Int64 | Kind::Sint64 | Kind::Sfixed64 => match json_value {
            Value::Number(n) => Ok(ProstValue::I64(n.as_i64().unwrap_or(0))),
            _ => Err("Expected number for int64 field".to_string()),
        },
        Kind::Uint32 | Kind::Fixed32 => match json_value {
            Value::Number(n) => Ok(ProstValue::U32(n.as_u64().unwrap_or(0) as u32)),
            _ => Err("Expected number for uint32 field".to_string()),
        },
        Kind::Uint64 | Kind::Fixed64 => match json_value {
            Value::Number(n) => Ok(ProstValue::U64(n.as_u64().unwrap_or(0))),
            _ => Err("Expected number for uint64 field".to_string()),
        },
        Kind::Bool => match json_value {
            Value::Bool(b) => Ok(ProstValue::Bool(*b)),
            _ => Err("Expected boolean for bool field".to_string()),
        },
        Kind::String => match json_value {
            Value::String(s) => Ok(ProstValue::String(s.clone())),
            _ => Err("Expected string for string field".to_string()),
        },
        Kind::Bytes => match json_value {
            Value::String(s) => {

                if let Ok(bytes) = binary_vault.retrieve(&VaultKey::from_str(s).unwrap_or_default()) {
                    return Ok(ProstValue::Bytes(bytes.into()))
                }

                if let Ok(bytes) = std::fs::read(s) {
                    return Ok(ProstValue::Bytes(bytes.into()));
                }

                let cleaned_base64 = s
                    .as_str()
                    .replace(&['\n', '\r', ' '][..], "");

                let bytes = base64::engine::general_purpose::STANDARD.decode(cleaned_base64)
                    .map_err(|_| format!("'{}' is not a valid vault key, file path, or base64", s))?;
                Ok(ProstValue::Bytes(bytes.into()))
            },
            Value::Object(obj) => {
                if let Some(Value::String(key)) = obj.get("BYTES") {
                    let vault_key = VaultKey::from_str(key).map_err(|e| format!("Invalid vault key: {}", e))?;
                    let bytes = binary_vault.retrieve(&vault_key).map_err(|e| format!("Failed to retrieve from vault: {}", e))?;
                    Ok(ProstValue::Bytes(bytes.into()))
                } else {
                    Err("Expected {\"BYTES\": \"vault_key\"} for bytes field".to_string())
                }
            },
            _ => Err("Expected base64 string or {\"BYTES\": \"vault_key\"} for bytes field".to_string()),
        },
        Kind::Message(msg_desc) => match json_value {
            Value::Object(_) => {
                let sub_message = json_to_dynamic_message(binary_vault, json_value, &msg_desc)?;
                Ok(ProstValue::Message(sub_message))
            },
            _ => Err("Expected object for message field".to_string()),
        },
        Kind::Enum(enum_desc) => match json_value {
            Value::String(s) => {
                if let Some(enum_value) = enum_desc.get_value_by_name(s) {
                    Ok(ProstValue::EnumNumber(enum_value.number()))
                } else {
                    Err(format!("Unknown enum value: {}", s))
                }
            },
            Value::Number(n) => Ok(ProstValue::EnumNumber(n.as_i64().unwrap_or(0) as i32)),
            _ => Err("Expected string or number for enum field".to_string()),
        },
    }
}

pub fn dynamic_message_to_json(binary_vault: &BinaryVault, message: &DynamicMessage) -> Result<Value, String> {
    let mut result = serde_json::Map::new();

    for field_desc in message.descriptor().fields() {
        let field_value = message.get_field(&field_desc);
        let json_value = prost_value_to_json_value(binary_vault, &field_value, &field_desc)?;
        result.insert(field_desc.name().to_string(), json_value);
    }

    Ok(Value::Object(result))
}

fn prost_value_to_json_value(binary_vault: &BinaryVault, prost_value: &prost_reflect::Value, field_desc: &prost_reflect::FieldDescriptor) -> Result<Value, String> {
    use prost_reflect::{Value as ProstValue, Kind};

    match prost_value {
        ProstValue::Bool(b) => Ok(Value::Bool(*b)),
        ProstValue::I32(i) => Ok(Value::Number((*i).into())),
        ProstValue::I64(i) => Ok(Value::Number((*i).into())),
        ProstValue::U32(u) => Ok(Value::Number((*u).into())),
        ProstValue::U64(u) => Ok(Value::Number((*u).into())),
        ProstValue::F32(f) => Ok(json!(f)),
        ProstValue::F64(f) => Ok(json!(f)),
        ProstValue::String(s) => Ok(Value::String(s.clone())),
        ProstValue::Bytes(b) => {
            let base64_string = general_purpose::STANDARD.encode(b);
            let mut blob_object = serde_json::Map::new();
            blob_object.insert("BYTES".to_string(), Value::String(base64_string));
            Ok(Value::Object(blob_object))
        },
        ProstValue::EnumNumber(n) => {
            if let Kind::Enum(enum_desc) = field_desc.kind() {
                if let Some(enum_value) = enum_desc.get_value(*n) {
                    Ok(Value::String(enum_value.name().to_string()))
                } else {
                    Ok(Value::Number((*n).into()))
                }
            } else {
                Ok(Value::Number((*n).into()))
            }
        },
        ProstValue::Message(msg) => dynamic_message_to_json(binary_vault, msg),
        ProstValue::List(list) => {
            let json_list: Result<Vec<Value>, String> = list.iter()
                .map(|item| prost_value_to_json_value(binary_vault, item, field_desc))
                .collect();
            Ok(Value::Array(json_list?))
        },
        ProstValue::Map(map) => {
            let mut json_map = serde_json::Map::new();
            for (key, value) in map {
                let key_str = format!("{:?}", key);
                let json_value = prost_value_to_json_value(binary_vault, value, field_desc)?;
                json_map.insert(key_str, json_value);
            }
            Ok(Value::Object(json_map))
        },
    }
}