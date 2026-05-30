use chrono::{DateTime, FixedOffset, NaiveDate, NaiveDateTime, NaiveTime};
use common_core::{FromJanx, JanxValue};
use dateparser::parse;
use postgres::types::ToSql;
use postgres::Client;
use rust_decimal::prelude::FromPrimitive;
use rust_decimal::Decimal;
use serde_json::{Map, Value};
use std::collections::{BTreeMap, HashMap};
use std::net::IpAddr;
use std::str::FromStr;
use uuid::Uuid;

pub fn execute(
    client: &mut Client,
    text: &str,
    params: Vec<JanxValue>,
    force_result: bool,
) -> Result<Option<Vec<JanxValue>>, String> {
    let params_ref = process_params(&params)?;
    let params_unboxed: Vec<_> = params_ref.iter().map(AsRef::as_ref).collect();

    if text.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        match client.query(text, &params_unboxed) {
            Ok(rows) => Ok(Some(rows_to_janx(rows))),
            Err(e) => Err(e.to_string()),
        }
    } else {
        match client.execute(text, &params_unboxed) {
            Ok(_) => Ok(None),
            Err(e) => Err(e.to_string()),
        }
    }
}

fn process_params(params: &[JanxValue]) -> Result<Vec<Box<dyn ToSql + Sync>>, String> {
    let mut result = Vec::new();
    for param in params {
        let processed: Box<dyn ToSql + Sync> = match param {
            JanxValue::Null => Box::new(Option::<i32>::None),
            JanxValue::Bool(b) => Box::new(*b),
            JanxValue::Number(n) => {
                if let Some(i) = n.as_i64() {
                    Box::new(i)
                } else if let Some(f) = n.as_f64() {
                    Box::new(f)
                } else {
                    return Err("Invalid number".to_string());
                }
            }
            JanxValue::String(s) => Box::new(s.clone()),
            JanxValue::Object(obj) => process_object(obj)?,
            JanxValue::Binary(_) => {
                return Err(
                    "Binary parameter must be wrapped in a typed object, e.g. {\"BYTEA\": ...}"
                        .to_string(),
                )
            }
            JanxValue::Array(_) => return Err("Array is not supported as a SQL parameter".to_string()),
        };
        result.push(processed);
    }
    Ok(result)
}

fn process_object(object: &BTreeMap<String, JanxValue>) -> Result<Box<dyn ToSql + Sync>, String> {
    if object.len() != 1 {
        return Err(
            "Object must have exactly one key-value pair specifying the type and value".to_string(),
        );
    }

    let (key, value) = object
        .iter()
        .next()
        .ok_or_else(|| "Empty object: expected one key-value pair".to_string())?;

    let key_upper = key.as_str().to_uppercase();

    match key_upper.as_str() {
        "BOOL" => value
            .as_bool()
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for BOOL".to_string()),
        "SMALLINT" | "SMALLSERIAL" => value
            .as_i64()
            .and_then(|v| i16::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "INT" | "SERIAL" => value
            .as_i64()
            .and_then(|v| i32::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "OID" => value
            .as_i64()
            .and_then(|v| u32::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for OID".to_string()),
        "BIGINT" | "BIGSERIAL" => value
            .as_i64()
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "REAL" => value
            .as_f64()
            .map(|v| v as f32)
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for REAL".to_string()),
        "DOUBLE PRECISION" | "DOUBLE_PRECISION" => value
            .as_f64()
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for DOUBLE PRECISION".to_string()),
        "NUMERIC" | "DECIMAL" => {
            if let Some(num_str) = value.as_str() {
                Decimal::from_str(num_str)
                    .map(|decimal| Box::new(decimal) as Box<dyn ToSql + Sync>)
                    .map_err(|e| format!("Invalid numeric string '{}': {}", num_str, e))
            } else if let Some(num) = value.as_f64() {
                Decimal::from_f64(num)
                    .map(|decimal| Box::new(decimal) as Box<dyn ToSql + Sync>)
                    .ok_or_else(|| "Cannot convert f64 to Decimal".to_string())
            } else if let Some(num) = value.as_i64() {
                Ok(Box::new(Decimal::from(num)) as Box<dyn ToSql + Sync>)
            } else {
                Err("Invalid value for NUMERIC/DECIMAL: must be string or number".to_string())
            }
        }
        "VARCHAR" | "TEXT" | "CHAR" | "CITEXT" | "NAME" | "LTREE" | "LQUERY" | "LTXTQUERY" => {
            String::from_janx(value)
                .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
                .ok_or_else(|| format!("Invalid value for {}", key))
        }
        "\"CHAR\"" | "OLDCHAR" => value
            .as_i64()
            .and_then(|v| i8::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for \"char\"".to_string()),
        "BYTEA" => {
            let bytes = Vec::<u8>::from_janx(value)
                .ok_or_else(|| "Invalid value for BYTEA: expected Janx binary".to_string())?;
            Ok(Box::new(bytes) as Box<dyn ToSql + Sync>)
        }
        "HSTORE" => {
            let obj = BTreeMap::<String, JanxValue>::from_janx(value)
                .ok_or_else(|| "Invalid object for HSTORE".to_string())?;
            let mut map = HashMap::new();
            for (k, v) in obj.iter() {
                map.insert(k.clone(), String::from_janx(v));
            }
            Ok(Box::new(map) as Box<dyn ToSql + Sync>)
        }
        "TIMESTAMP" => {
            let value_str = value
                .as_str()
                .ok_or("Invalid value for TIMESTAMP")?;
            match parse_date(value_str) {
                Ok(date) => Ok(Box::new(date) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIMESTAMP".to_string()),
            }
        }
        "TIMESTAMP WITH TIME ZONE" | "TIMESTAMP_WITH_TIME_ZONE" => {
            let value_str = value
                .as_str()
                .ok_or("Invalid value for TIMESTAMP")?;
            match parse_date_tz(value_str) {
                Ok(date) => Ok(Box::new(date) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIMESTAMP".to_string()),
            }
        }
        "INET" => value
            .as_str()
            .and_then(|s| s.parse::<IpAddr>().ok())
            .map(|ip| Box::new(ip) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for INET".to_string()),
        "JSON" | "JSONB" => {
            if value.as_object().is_some() || value.as_array().is_some() {
                let json = janx_to_json_value(value)?;
                Ok(Box::new(json) as Box<dyn ToSql + Sync>)
            } else if let Some(json_str) = value.as_str() {
                match serde_json::from_str::<Value>(json_str) {
                    Ok(parsed_value) => Ok(Box::new(parsed_value) as Box<dyn ToSql + Sync>),
                    Err(e) => Err(format!("Invalid JSON string: {}", e)),
                }
            } else {
                Err(
                    "Invalid value for JSON/JSONB: must be an object, array, or valid JSON string"
                        .to_string(),
                )
            }
        }
        "DATE" => {
            let value_str = value.as_str().ok_or("Invalid value for DATE")?;
            match parse_date(value_str) {
                Ok(date) => Ok(Box::new(date.date()) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for DATA".to_string()),
            }
        }
        "TIME" => {
            let value_str = value.as_str().ok_or("Invalid value for TIME")?;
            match parse_date(value_str) {
                Ok(date) => Ok(Box::new(date.time()) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIME".to_string()),
            }
        }
        "UUID" => value
            .as_str()
            .and_then(|s| s.parse::<Uuid>().ok())
            .map(|uuid| Box::new(uuid) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for UUID".to_string()),
        _ => Err(format!("Unsupported type: {}", key)),
    }
}

fn rows_to_janx(rows: Vec<postgres::Row>) -> Vec<JanxValue> {
    let mut result = Vec::new();

    for row in rows {
        let mut row_map = BTreeMap::new();

        for column in row.columns() {
            let column_name = column.name();
            let column_type = column.type_().name();

            let value = process_sql_value(column_name, column_type, &row)
                .unwrap_or_else(|e| JanxValue::String(e.to_string()));

            row_map.insert(column_name.to_string(), value);
        }

        result.push(JanxValue::Object(row_map));
    }
    result
}

fn process_sql_value(
    column_name: &str,
    column_type: &str,
    row: &postgres::Row,
) -> Result<JanxValue, postgres::Error> {
    let value = match column_type.to_uppercase().as_str() {
        "BOOL" => row
            .try_get::<_, Option<bool>>(column_name)?
            .map(JanxValue::Bool)
            .unwrap_or(JanxValue::Null),
        "INT2" | "SMALLINT" | "SMALLSERIAL" => row
            .try_get::<_, Option<i16>>(column_name)?
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null),
        "INT4" | "INT" | "SERIAL" => row
            .try_get::<_, Option<i32>>(column_name)?
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null),
        "OID" => row
            .try_get::<_, Option<u32>>(column_name)?
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null),
        "INT8" | "BIGINT" | "BIGSERIAL" => row
            .try_get::<_, Option<i64>>(column_name)?
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null),
        "FLOAT4" | "REAL" => row
            .try_get::<_, Option<f32>>(column_name)?
            .map(|v| match v {
                v if v.is_nan() => JanxValue::String("NaN".to_string()),
                v if v.is_infinite() => JanxValue::String("Infinity".to_string()),
                _ => serde_json::Number::from_f64(v as f64)
                    .map(JanxValue::Number)
                    .unwrap_or(JanxValue::Null),
            })
            .unwrap_or(JanxValue::Null),
        "FLOAT8" | "DOUBLE PRECISION" => row
            .try_get::<_, Option<f64>>(column_name)?
            .map(|v| match v {
                v if v.is_nan() => JanxValue::String("NaN".to_string()),
                v if v.is_infinite() => JanxValue::String("Infinity".to_string()),
                _ => serde_json::Number::from_f64(v)
                    .map(JanxValue::Number)
                    .unwrap_or(JanxValue::Null),
            })
            .unwrap_or(JanxValue::Null),
        "CHAR" => row
            .try_get::<_, Option<i8>>(column_name)?
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null),
        "VARCHAR" | "TEXT" | "BPCHAR" | "CITEXT" | "NAME" | "LTREE" | "LQUERY" | "LTXTQUERY"
        | "UNKNOWN" => row
            .try_get::<_, Option<String>>(column_name)?
            .map(JanxValue::String)
            .unwrap_or(JanxValue::Null),
        "BYTEA" => row
            .try_get::<_, Option<Vec<u8>>>(column_name)?
            .map(JanxValue::binary)
            .unwrap_or(JanxValue::Null),
        "HSTORE" => row
            .try_get::<_, Option<HashMap<String, Option<String>>>>(column_name)?
            .map(|hstore| {
                let mut map = BTreeMap::new();
                for (k, v) in hstore {
                    map.insert(k, v.map(JanxValue::String).unwrap_or(JanxValue::Null));
                }
                JanxValue::Object(map)
            })
            .unwrap_or(JanxValue::Null),
        "TIMESTAMP" => row
            .try_get::<_, Option<NaiveDateTime>>(column_name)?
            .map(|timestamp| JanxValue::String(timestamp.format("%Y-%m-%dT%H:%M:%S").to_string()))
            .unwrap_or(JanxValue::Null),
        "TIMESTAMP WITH TIME ZONE" | "TIMESTAMPTZ" => row
            .try_get::<_, Option<DateTime<FixedOffset>>>(column_name)?
            .map(|timestamp| JanxValue::String(timestamp.to_rfc3339()))
            .unwrap_or(JanxValue::Null),
        "INET" => row
            .try_get::<_, Option<IpAddr>>(column_name)?
            .map(|ip| JanxValue::String(ip.to_string()))
            .unwrap_or(JanxValue::Null),
        "DATE" => row
            .try_get::<_, Option<NaiveDate>>(column_name)?
            .map(|date| JanxValue::String(date.format("%Y-%m-%d").to_string()))
            .unwrap_or(JanxValue::Null),
        "TIME" => row
            .try_get::<_, Option<NaiveTime>>(column_name)?
            .map(|time| JanxValue::String(time.format("%H:%M:%S").to_string()))
            .unwrap_or(JanxValue::Null),
        "JSON" | "JSONB" => row
            .try_get::<_, Option<Value>>(column_name)?
            .map(json_value_to_janx)
            .unwrap_or(JanxValue::Null),
        "UUID" => row
            .try_get::<_, Option<Uuid>>(column_name)?
            .map(|uuid| JanxValue::String(uuid.to_string()))
            .unwrap_or(JanxValue::Null),
        "NUMERIC" | "DECIMAL" => row
            .try_get::<_, Option<Decimal>>(column_name)?
            .map(|decimal| JanxValue::String(decimal.to_string()))
            .unwrap_or(JanxValue::Null),
        current_type => match try_get_unknown_type(column_name, row) {
            Ok(value) => value,
            Err(_) => JanxValue::String(format!("Unsupported type: {}", current_type)),
        },
    };
    Ok(value)
}

fn try_get_unknown_type(column_name: &str, row: &postgres::Row) -> Result<JanxValue, ()> {
    if let Ok(value) = row.try_get::<_, Option<i16>>(column_name) {
        return Ok(value
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<i32>>(column_name) {
        return Ok(value
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<i64>>(column_name) {
        return Ok(value
            .map(|v| JanxValue::Number(v.into()))
            .unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<f64>>(column_name) {
        return Ok(value
            .map(|v| {
                serde_json::Number::from_f64(v)
                    .map(JanxValue::Number)
                    .unwrap_or_else(|| JanxValue::String(v.to_string()))
            })
            .unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<String>>(column_name) {
        if let Some(ref str_val) = value {
            if str_val.parse::<f64>().is_ok() || str_val.parse::<i64>().is_ok() {
                return Ok(JanxValue::String(str_val.clone()));
            }
        }
        return Ok(value.map(JanxValue::String).unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<bool>>(column_name) {
        return Ok(value.map(JanxValue::Bool).unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<String>>(column_name) {
        return Ok(value.map(JanxValue::String).unwrap_or(JanxValue::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<Vec<u8>>>(column_name) {
        return Ok(value.map(JanxValue::binary).unwrap_or(JanxValue::Null));
    }

    Err(())
}

fn json_value_to_janx(value: Value) -> JanxValue {
    match value {
        Value::Null => JanxValue::Null,
        Value::Bool(b) => JanxValue::Bool(b),
        Value::Number(n) => JanxValue::Number(n),
        Value::String(s) => JanxValue::String(s),
        Value::Array(arr) => JanxValue::Array(arr.into_iter().map(json_value_to_janx).collect()),
        Value::Object(obj) => {
            let map = obj
                .into_iter()
                .map(|(k, v)| (k, json_value_to_janx(v)))
                .collect();
            JanxValue::Object(map)
        }
    }
}

fn janx_to_json_value(value: &JanxValue) -> Result<Value, String> {
    match value {
        JanxValue::Null => Ok(Value::Null),
        JanxValue::Bool(b) => Ok(Value::Bool(*b)),
        JanxValue::Number(n) => Ok(Value::Number(n.clone())),
        JanxValue::String(s) => Ok(Value::String(s.clone())),
        JanxValue::Array(arr) => {
            let out = arr
                .iter()
                .map(janx_to_json_value)
                .collect::<Result<Vec<_>, _>>()?;
            Ok(Value::Array(out))
        }
        JanxValue::Object(obj) => {
            let mut map = Map::new();
            for (k, v) in obj {
                map.insert(k.clone(), janx_to_json_value(v)?);
            }
            Ok(Value::Object(map))
        }
        JanxValue::Binary(_) => Err("Binary is not supported as JSON/JSONB parameter".to_string()),
    }
}

fn parse_date(input: &str) -> Result<NaiveDateTime, String> {
    parse(input)
        .map(|dt| dt.naive_local())
        .map_err(|e| format!("Failed to parse date: {}", e))
}

fn parse_date_tz(input: &str) -> Result<DateTime<FixedOffset>, String> {
    DateTime::parse_from_rfc3339(input).or_else(|_| {
        parse(input)
            .map(|dt| dt.fixed_offset())
            .map_err(|e| format!("Failed to parse date: {}", e))
    })
}
