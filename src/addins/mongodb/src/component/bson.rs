use serde_json::{Number, Value};
use mongodb::bson::{Bson, Document};
use mongodb::bson;
use base64::{Engine as _, engine::{general_purpose}};

pub fn json_value_to_bson(value: &Value) -> Bson {
    match value {

        Value::String(s) => Bson::String(s.clone()),
        Value::Number(n) if n.is_i64() => Bson::Int64(n.as_i64().unwrap()),
        Value::Number(n) if n.is_f64() => Bson::Double(n.as_f64().unwrap()),
        Value::Bool(b) => Bson::Boolean(*b),
        Value::Null => Bson::Null,

        Value::Array(arr) => {
            Bson::Array(arr.iter().map(json_value_to_bson).collect())
        },

        Value::Object(obj) => {

            if let Some(oid) = obj.get("__OPI_OID__") {
                if let Some(oid_str) = oid.as_str() {
                    if let Ok(oid) = oid_str.parse::<bson::oid::ObjectId>() {
                        return Bson::ObjectId(oid);
                    }
                }
            }

            if let Some(binary) = obj.get("__OPI_BINARY__") {
                if let Some(base64_str) = binary.as_str() {
                    if let Ok(bytes) = general_purpose::STANDARD.decode(base64_str) {
                        return Bson::Binary(bson::Binary {
                            bytes,
                            subtype: bson::spec::BinarySubtype::Generic
                        });
                    }
                }
            }

            if let Some(timestamp) = obj.get("__OPI_DATE__") {
                if let Some(ts) = timestamp.as_i64() {
                    return Bson::DateTime(bson::DateTime::from_millis(ts));
                }
            }

            let doc: Document = obj.iter()
                .map(|(k, v)| (k.clone(), json_value_to_bson(v)))
                .collect();
            Bson::Document(doc)
        },

        _ => Bson::Null,
    }
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
        Bson::MaxKey => Value::String("MaxKey".to_string()),
        Bson::MinKey => Value::String("MinKey".to_string()),
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