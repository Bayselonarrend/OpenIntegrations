use std::str::FromStr;
use std::time::SystemTime;
use serde_json::{Number, Value};
use mongodb::bson::{Bson, Document};
use mongodb::bson;
use base64::{Engine as _, engine::{general_purpose}};
use common_binary::vault::{BinaryVault, VaultKey};
use dateparser::parse;
use regex::Regex as StdRegex;

pub fn json_value_to_bson(binary_vault: &BinaryVault, value: &Value) -> Result<Bson, String> {
    let result = match value {
        Value::String(s) => Bson::String(s.clone()),
        Value::Number(n) if n.is_i64() => Bson::Int64(n.as_i64().unwrap()),
        Value::Number(n) if n.is_f64() => Bson::Double(n.as_f64().unwrap()),
        Value::Bool(b) => Bson::Boolean(*b),
        Value::Null => Bson::Null,
        Value::Array(arr) => {
            let converted: Result<Vec<_>, _> = arr.iter()
                .map(| el| json_value_to_bson(binary_vault, el)).collect();
            Bson::Array(converted?)
        },
        Value::Object(obj) => {

            if let Some(str_value) = obj.get("__OPI_STRING__") {
                return if let Value::String(s) = str_value {
                    Ok(Bson::String(s.clone()))
                } else {
                    Ok(Bson::String(str_value.to_string()))
                }
            }

            if let Some(int32) = obj.get("__OPI_INT32__") {
                let value = match int32.as_i64(){
                    Some(i) => i as i32,
                    None => return Err(format!("Can't parse I64: {}", int32))
                };
                return Ok(Bson::Int32(value))
            }

            if let Some(int64) = obj.get("__OPI_INT64__") {
                return Ok(Bson::Int64(int64.as_i64().ok_or(format!("Can't parse I64: {}", int64))?))
            }

            if let Some(double) = obj.get("__OPI_DOUBLE__") {
                return Ok(Bson::Double(double.as_f64().ok_or(format!("Can't parse Double: {}", double))?))
            }

            if let Some(b) = obj.get("__OPI_BOOLEAN__") {
                return Ok(Bson::Boolean(b.as_bool().ok_or(format!("Can't parse Bool: {}", b))?))
            }

            if let Some(datetime) = obj.get("__OPI_DATETIME__") {
                return if let Some(dt) = datetime.as_str() {
                    let dtp = parse(dt).map_err(|e| format!("Can't parse DateTime: {}: {}", dt, e))?;
                    Ok(Bson::DateTime(bson::DateTime::from_system_time(SystemTime::from(dtp))))
                } else {
                    Err(format!("Can't parse DateTime: {}", datetime))
                }
            }

            if let Some(timestamp) = obj.get("__OPI_TIMESTAMP__") {
                return if let Some(ts) = timestamp.as_str() {
                    let dtp = parse(ts).map_err(|e| format!("Can't parse Timestamp: {}: {}", ts, e))?;
                    let bson_ts = bson::Timestamp{
                        time: dtp.timestamp() as u32,
                        increment: 0,
                    };
                    Ok(Bson::Timestamp(bson_ts))
                } else {
                    Err(format!("Can't parse Timestamp: {}", timestamp))
                }
            }

            if let Some(oid) = obj.get("__OPI_OBJECTID__") {
                if let Some(oid_str) = oid.as_str() {
                    return if let Ok(oid) = oid_str.parse::<bson::oid::ObjectId>() {
                        Ok(Bson::ObjectId(oid))
                    } else {
                        Err(format!("Can't parse ObjectID: {}", oid_str))
                    }
                }
            }

            if let Some(regexp) = obj.get("__OPI_REGEXP__") {
                return if let Value::Object(ref regexp_obj) = regexp {

                    let pattern = regexp_obj.get("pattern")
                        .and_then(|v| v.as_str())
                        .ok_or("Missing or invalid 'pattern' field in REGEXP object")?
                        .to_string();

                    StdRegex::new(&pattern)
                        .map_err(|e| format!("Invalid regex pattern '{}': {}", pattern, e))?;

                    let options = regexp_obj.get("options")
                        .and_then(|v| v.as_str())
                        .unwrap_or("")
                        .to_string();

                    Ok(Bson::RegularExpression(bson::Regex {
                        pattern,
                        options,
                    }))
                } else {
                    Err("Value of REGEXP must be an object with 'pattern' and 'options'".to_string())
                }
            }

            if let Some(js_value) = obj.get("__OPI_JS__") {
                return if let Value::String(s) = js_value {
                    Ok(Bson::JavaScriptCode(s.clone()))
                } else {
                    Ok(Bson::JavaScriptCode(js_value.to_string()))
                }
            }

            if let Some(symbol_value) = obj.get("__OPI_SYMBOL__") {
                return if let Value::String(s) = symbol_value {
                    Ok(Bson::Symbol(s.clone()))
                } else {
                    Ok(Bson::Symbol(symbol_value.to_string()))
                }
            }

            if let Some(_) = obj.get("__OPI_MINKEY__") {
                return Ok(Bson::MinKey)
            }

            if let Some(_) = obj.get("__OPI_MAXKEY__") {
                return Ok(Bson::MaxKey)
            }

            if let Some(_) = obj.get("__OPI_NULL__"){
                return Ok(Bson::Null)
            }

            if let Some(binary) = obj.get("__OPI_BINARY__") {
                if let Some(key) = binary.as_str() {

                    let bytes = binary_vault
                        .retrieve(&VaultKey::from_str(key).unwrap_or_default())
                        .map_err(|e| e.to_string())?;

                    return Ok(Bson::Binary(bson::Binary {
                        bytes,
                        subtype: bson::spec::BinarySubtype::Generic
                    }))
                }
            }

            let mut doc = Document::new();
            for (k, v) in obj.iter() {
                let bson_value = json_value_to_bson(binary_vault, v)?;

                let transformed_key = if k.starts_with("__4") {
                    match k.strip_prefix("__4"){
                        Some(key) => "$".to_string() + key,
                        None => k.to_string(),
                    }
                } else {
                    k.clone()
                };

                doc.insert(transformed_key, bson_value);
            }

            Bson::Document(doc)
        },
        _ => Bson::Null,
    };

    Ok(result)
}

pub fn bson_to_json_value(bson: &Bson) -> Value {
    match bson {
        Bson::String(s) => Value::String(s.clone()),
        Bson::Int32(n) => Value::Number((*n).into()),
        Bson::Int64(n) => Value::Number((*n).into()),
        Bson::Double(n) => Value::Number(Number::from_f64(*n).unwrap_or(0.into())),
        Bson::Decimal128(n) => Value::String(n.to_string()),
        Bson::Boolean(b) => Value::Bool(*b),
        Bson::DateTime(dt) => Value::String(dt.try_to_rfc3339_string().unwrap_or_default()),
        Bson::ObjectId(oid) => Value::String(oid.to_hex()),
        Bson::RegularExpression(r) => Value::String(r.to_string()),
        Bson::JavaScriptCode(js) => Value::String(js.to_string()),
        Bson::Symbol(s) => Value::String(s.to_string()),
        Bson::Timestamp(ts) => Value::String(ts.to_string()),
        Bson::MaxKey => Value::String("<<MaxKey>>".to_string()),
        Bson::MinKey => Value::String("<<MinKey>>".to_string()),
        Bson::Null => Value::Null,
        Bson::Array(arr) => {
            Value::Array(arr.iter().map(bson_to_json_value).collect())
        },
        Bson::Document(doc) => {
            let mut map = serde_json::Map::new();
            for (k, v) in doc {
                map.insert(k.clone(), bson_to_json_value(v));
            }
            Value::Object(map)
        },
        Bson::JavaScriptCodeWithScope(jss) => {
            let mut map = serde_json::Map::new();
            map.insert("scope".to_string(), Value::String(jss.scope.to_string()));
            map.insert("code".to_string(), Value::String(jss.code.to_string()));
            Value::Object(map)
        }
        Bson::Binary(bin) => {
            let mut map = serde_json::Map::new();
            let base64 = general_purpose::STANDARD.encode(&bin.bytes);
            map.insert("__B64_BINARY__".to_string(), Value::String(base64));
            Value::Object(map)
        },
        _ => Value::Null,
    }
}