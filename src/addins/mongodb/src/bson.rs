use std::collections::BTreeMap;
use std::time::SystemTime;

use common_janx::{FromJanx, JanxNumber, JanxValue};
use dateparser::parse;
use mongodb::bson;
use mongodb::bson::{Bson, Document};
use regex::Regex as StdRegex;

pub fn value_to_bson(value: &JanxValue) -> Result<Bson, String> {
    let result = match value {
        JanxValue::String(s) => Bson::String(s.clone()),
        JanxValue::Number(_) => {
            if let Some(i) = value.as_i64() {
                Bson::Int64(i)
            } else if let Some(f) = value.as_f64() {
                Bson::Double(f)
            } else {
                Bson::Null
            }
        }
        JanxValue::Bool(b) => Bson::Boolean(*b),
        JanxValue::Null => Bson::Null,
        JanxValue::Binary(bytes) => Bson::Binary(bson::Binary {
            bytes: bytes.clone(),
            subtype: bson::spec::BinarySubtype::Generic,
        }),
        JanxValue::Array(arr) => {
            let converted: Result<Vec<_>, _> =
                arr.iter().map(value_to_bson).collect();
            Bson::Array(converted?)
        }
        JanxValue::Object(obj) => {
            if let Some(str_value) = obj.get("__OPI_STRING__") {
                return Ok(Bson::String(
                    String::from_janx(str_value)
                        .ok_or_else(|| format!("Can't parse STRING: {str_value:?}"))?,
                ));
            }

            if let Some(int32) = obj.get("__OPI_INT32__") {
                let value = i64::from_janx(int32)
                    .ok_or_else(|| format!("Can't parse I64: {int32:?}"))? as i32;
                return Ok(Bson::Int32(value));
            }

            if let Some(int64) = obj.get("__OPI_INT64__") {
                return Ok(Bson::Int64(
                    i64::from_janx(int64).ok_or_else(|| format!("Can't parse I64: {int64:?}"))?,
                ));
            }

            if let Some(double) = obj.get("__OPI_DOUBLE__") {
                return Ok(Bson::Double(
                    f64::from_janx(double)
                        .ok_or_else(|| format!("Can't parse Double: {double:?}"))?,
                ));
            }

            if let Some(b) = obj.get("__OPI_BOOLEAN__") {
                return Ok(Bson::Boolean(
                    bool::from_janx(b).ok_or_else(|| format!("Can't parse Bool: {b:?}"))?,
                ));
            }

            if let Some(datetime) = obj.get("__OPI_DATETIME__") {
                let dt = String::from_janx(datetime)
                    .ok_or_else(|| format!("Can't parse DateTime: {datetime:?}"))?;
                let dtp = parse(&dt).map_err(|e| format!("Can't parse DateTime: {dt}: {e}"))?;
                return Ok(Bson::DateTime(bson::DateTime::from_system_time(
                    SystemTime::from(dtp),
                )));
            }

            if let Some(timestamp) = obj.get("__OPI_TIMESTAMP__") {
                let ts = String::from_janx(timestamp)
                    .ok_or_else(|| format!("Can't parse Timestamp: {timestamp:?}"))?;
                let dtp = parse(&ts).map_err(|e| format!("Can't parse Timestamp: {ts}: {e}"))?;
                let bson_ts = bson::Timestamp {
                    time: dtp.timestamp() as u32,
                    increment: 0,
                };
                return Ok(Bson::Timestamp(bson_ts));
            }

            if let Some(oid) = obj.get("__OPI_OBJECTID__") {
                let oid_str = String::from_janx(oid)
                    .ok_or_else(|| format!("Can't parse ObjectID: {oid:?}"))?;
                return oid_str
                    .parse::<bson::oid::ObjectId>()
                    .map(Bson::ObjectId)
                    .map_err(|_| format!("Can't parse ObjectID: {oid_str}"));
            }

            if let Some(regexp) = obj.get("__OPI_REGEXP__") {
                let regexp_obj = regexp.as_object().ok_or_else(|| {
                    "Value of REGEXP must be an object with 'pattern' and 'options'".to_string()
                })?;

                let pattern = regexp_obj
                    .get("pattern")
                    .and_then(String::from_janx)
                    .ok_or_else(|| "Missing or invalid 'pattern' field in REGEXP object".to_string())?;

                StdRegex::new(&pattern)
                    .map_err(|e| format!("Invalid regex pattern '{pattern}': {e}"))?;

                let options = regexp_obj
                    .get("options")
                    .and_then(String::from_janx)
                    .unwrap_or_default();

                return Ok(Bson::RegularExpression(bson::Regex { pattern, options }));
            }

            if let Some(js_value) = obj.get("__OPI_JS__") {
                return Ok(Bson::JavaScriptCode(
                    String::from_janx(js_value)
                        .ok_or_else(|| format!("Can't parse JS: {js_value:?}"))?,
                ));
            }

            if let Some(symbol_value) = obj.get("__OPI_SYMBOL__") {
                return Ok(Bson::Symbol(
                    String::from_janx(symbol_value)
                        .ok_or_else(|| format!("Can't parse SYMBOL: {symbol_value:?}"))?,
                ));
            }

            if obj.contains_key("__OPI_MINKEY__") {
                return Ok(Bson::MinKey);
            }

            if obj.contains_key("__OPI_MAXKEY__") {
                return Ok(Bson::MaxKey);
            }

            if obj.contains_key("__OPI_NULL__") {
                return Ok(Bson::Null);
            }

            if let Some(inner) = obj.get("__OPI_BINARY__") {
                return value_to_bson(inner);
            }

            let mut doc = Document::new();
            for (k, v) in obj {
                let bson_value = value_to_bson(v)?;

                let transformed_key = if k.starts_with("__4") {
                    match k.strip_prefix("__4") {
                        Some(key) => "$".to_string() + key,
                        None => k.clone(),
                    }
                } else {
                    k.clone()
                };

                doc.insert(transformed_key, bson_value);
            }

            Bson::Document(doc)
        }
    };

    Ok(result)
}

pub fn bson_to_value(bson: &Bson) -> JanxValue {
    match bson {
        Bson::String(s) => JanxValue::String(s.clone()),
        Bson::Int32(n) => JanxValue::Number((*n).into()),
        Bson::Int64(n) => JanxValue::Number((*n).into()),
        Bson::Double(n) => JanxValue::Number(JanxNumber::from_f64(*n).unwrap_or(JanxNumber::from(0))),
        Bson::Decimal128(n) => JanxValue::String(n.to_string()),
        Bson::Boolean(b) => JanxValue::Bool(*b),
        Bson::DateTime(dt) => JanxValue::String(dt.try_to_rfc3339_string().unwrap_or_default()),
        Bson::ObjectId(oid) => JanxValue::String(oid.to_hex()),
        Bson::RegularExpression(r) => JanxValue::String(r.to_string()),
        Bson::JavaScriptCode(js) => JanxValue::String(js.to_string()),
        Bson::Symbol(s) => JanxValue::String(s.to_string()),
        Bson::Timestamp(ts) => JanxValue::String(ts.to_string()),
        Bson::MaxKey => JanxValue::String("<<MaxKey>>".to_string()),
        Bson::MinKey => JanxValue::String("<<MinKey>>".to_string()),
        Bson::Null => JanxValue::Null,
        Bson::Array(arr) => JanxValue::Array(arr.iter().map(bson_to_value).collect()),
        Bson::Document(doc) => {
            let mut map = BTreeMap::new();
            for (k, v) in doc {
                map.insert(k.clone(), bson_to_value(v));
            }
            JanxValue::Object(map)
        }
        Bson::JavaScriptCodeWithScope(jss) => {
            let mut map = BTreeMap::new();
            map.insert("scope".to_string(), JanxValue::String(jss.scope.to_string()));
            map.insert("code".to_string(), JanxValue::String(jss.code.to_string()));
            JanxValue::Object(map)
        }
        Bson::Binary(bin) => JanxValue::binary(bin.bytes.clone()),
        _ => JanxValue::Null,
    }
}
