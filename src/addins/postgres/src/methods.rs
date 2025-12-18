use postgres::types::{ToSql};
use serde_json::{Value, json, Map};
use base64::{engine::general_purpose, Engine as _};

use std::collections::HashMap;
use std::net::IpAddr;
use std::str::FromStr;
use chrono::{NaiveDate, NaiveTime, FixedOffset, NaiveDateTime, DateTime};
use common_binary::vault::{BinaryVault, VaultKey};
use common_utils::utils::json_error;
use uuid::Uuid;
use dateparser::parse;
use rust_decimal::Decimal;
use rust_decimal::prelude::FromPrimitive;
use crate::AddIn;

impl AddIn{

    pub fn execute_query(&mut self, key: &str) -> String {

        let client_arc = match self.get_connection() {
            Some(c) => c,
            None => return json_error("No connection initialized"),
        };

        let mut client = match client_arc.lock(){
            Ok(c) => c,
            Err(_) => return json_error("Cannot acquire client lock"),
        };

        let query = match self.datasets.get_query(key){
            Some(q) => q,
            None => return json_error(format!("No query found by key: {}", key).as_str()),
        };

        let params = query.params;
        let text = query.text;
        let force_result = query.force_result;

        let params_ref = match process_params(&self.binary_vault, &params){
            Ok(params) => params,
            Err(e) => return json_error(&e.to_string()),
        };

        let params_unboxed: Vec<_> = params_ref.iter().map(AsRef::as_ref).collect();

        if text.trim_start().to_uppercase().starts_with("SELECT") || force_result {
            match client.query(&text, &params_unboxed) {
                Ok(rows) => {

                    let processed_rows = rows_to_json(rows);
                    self.datasets.set_results(key, processed_rows);
                    json!({"result": true, "data": true}).to_string()

                }
                Err(e) => json_error(&e.to_string()),
            }
        } else {
            match client.execute(&text, &params_unboxed.as_slice()) {
                Ok(_) => json!({"result": true, "data": false}).to_string(),
                Err(e) => json_error(&e.to_string()),
            }
        }
    }

}

fn process_params(binary_vault: &BinaryVault, params: &Vec<Value>) -> Result<Vec<Box<dyn ToSql + Sync>>, String> {

    let mut result = Vec::new();
    for param in params {
        let processed: Box<dyn ToSql + Sync> = match param {
            Value::Null => Box::new(Option::<i32>::None),
            Value::Bool(b) => Box::new(*b),
            Value::Number(n) => {
                if let Some(i) = n.as_i64() {
                    Box::new(i)
                } else if let Some(f) = n.as_f64() {
                    Box::new(f)
                } else {
                    return Err("Invalid number".to_string());
                }
            }
            Value::String(s) => Box::new(s.clone()),
            Value::Object(obj) => process_object(binary_vault, obj)?,
            _ => return Err("Unsupported parameter type".to_string()),
        };
        result.push(processed);
    }
    Ok(result)
}

fn process_object(binary_vault: &BinaryVault, object: &Map<String, Value>) -> Result<Box<dyn ToSql + Sync>, String> {

    if object.len() != 1 {
        return Err("Object must have exactly one key-value pair specifying the type and value".to_string());
    }

    let (key, value) = object.iter().next()
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
            .as_u64()
            .and_then(|v| u32::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for OID".to_string()),
        "BIGINT" | "BIGSERIAL" => value
            .as_i64()
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "REAL" => value
            .as_f64()
            .map(|v| v as f32) // Преобразование f64 в f32
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
        "VARCHAR" | "TEXT" | "CHAR" | "CITEXT" | "NAME" | "LTREE" | "LQUERY" | "LTXTQUERY" => value
            .as_str()
            .map(|v| Box::new(v.to_string()) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "\"CHAR\"" | "OLDCHAR" => value
            .as_i64()
            .and_then(|v| i8::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for \"char\"".to_string()),
        "BYTEA" => {
            let key_str = value.as_str()
                .ok_or_else(|| "Invalid value for BYTEA: expected a string key".to_string())?;

            let key_obj = VaultKey::from_str(key_str)
                .map_err(|e| format!("Invalid vault key format: {}", e))?;

            match binary_vault.retrieve(&key_obj) {
                Ok(data) => Ok(Box::new(data) as Box<dyn ToSql + Sync>),
                Err(e) => Err(format!("Failed to retrieve binary data from vault: {}", e)),
            }
        },
        "HSTORE" => value
            .as_object()
            .map(|obj| {
                let mut map = HashMap::new();
                for (k, v) in obj.iter() {
                    map.insert(
                        k.clone(),
                        v.as_str().map(String::from), // Значение может быть None
                    );
                }
                Box::new(map) as Box<dyn ToSql + Sync>
            })
            .ok_or_else(|| "Invalid object for HSTORE".to_string()),
        "TIMESTAMP"  => {
            let value_str = value.as_str().ok_or("Invalid value for TIMESTAMP")?;
            match parse_date(&value_str){
                Ok(date) => Ok(Box::new(date) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIMESTAMP".to_string()),
            }
        },
        "TIMESTAMP WITH TIME ZONE" | "TIMESTAMP_WITH_TIME_ZONE"  => {
            let value_str = value.as_str().ok_or("Invalid value for TIMESTAMP")?;
            match parse_date_tz(&value_str){
                Ok(date) => Ok(Box::new(date) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIMESTAMP".to_string()),
            }
        },
        "INET" => value
            .as_str()
            .and_then(|s| s.parse::<IpAddr>().ok())
            .map(|ip| Box::new(ip) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for INET".to_string()),
        "JSON" | "JSONB" => {
            // Если значение уже является объектом или массивом, передаем его как есть
            if value.is_object() || value.is_array() {
                Ok(Box::new(value.clone()) as Box<dyn ToSql + Sync>)
            } else if value.is_string() {

                let json_str = value.as_str().ok_or("Expected a string value for JSON/JSONB")?;
                match serde_json::from_str::<Value>(json_str) {
                    Ok(parsed_value) => Ok(Box::new(parsed_value) as Box<dyn ToSql + Sync>),
                    Err(e) => Err(format!("Invalid JSON string: {}", e)),
                }
            } else {
                Err("Invalid value for JSON/JSONB: must be an object, array, or valid JSON string".to_string())
            }
        },
        "DATE" => {
            let value_str = value.as_str().ok_or("Invalid value for DATE")?;
            match parse_date(&value_str){
                Ok(date) => Ok(Box::new(date.date()) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for DATA".to_string()),
            }
        },
        "TIME" => {
            let value_str = value.as_str().ok_or("Invalid value for TIME")?;
            match parse_date(&value_str){
                Ok(date) => Ok(Box::new(date.time()) as Box<dyn ToSql + Sync>),
                Err(_) => Err("Invalid value for TIME".to_string()),
            }
        }
        "UUID" => {
            value
                .as_str()
                .and_then(|s| s.parse::<Uuid>().ok())
                .map(|uuid| Box::new(uuid) as Box<dyn ToSql + Sync>)
                .ok_or_else(|| "Invalid value for UUID".to_string())
        }
        _ => Err(format!("Unsupported type: {}", key)),
    }
}

fn rows_to_json(rows: Vec<postgres::Row>) ->  Vec<Value> {
    let mut result = Vec::new();

    for row in rows {
        let mut row_map = Map::new();

        for column in row.columns() {
            let column_name = column.name();
            let column_type = column.type_().name();

            let value = process_sql_value(&column_name, &column_type, &row)
                .unwrap_or_else(|e| Value::String(e.to_string()));

            row_map.insert(column_name.to_string(), value);
        }

        result.push(Value::Object(row_map));
    };
    result
}

fn process_sql_value(column_name: &str, column_type: &str, row: &postgres::Row) -> Result<Value, postgres::Error> {
    let value = match column_type.to_uppercase().as_str() {
        "BOOL" => row.try_get::<_, Option<bool>>(column_name)?
            .map(Value::Bool)
            .unwrap_or(Value::Null),
        "INT2" | "SMALLINT" | "SMALLSERIAL" => row.try_get::<_, Option<i16>>(column_name)?
            .map(|v| Value::Number(v.into()))
            .unwrap_or(Value::Null),
        "INT4" | "INT" | "SERIAL" => row.try_get::<_, Option<i32>>(column_name)?
            .map(|v| Value::Number(v.into()))
            .unwrap_or(Value::Null),
        "OID" => row.try_get::<_, Option<u32>>(column_name)?
            .map(|v| Value::Number(v.into()))
            .unwrap_or(Value::Null),
        "INT8" | "BIGINT" | "BIGSERIAL" => row.try_get::<_, Option<i64>>(column_name)?
            .map(|v| Value::Number(v.into()))
            .unwrap_or(Value::Null),
        "FLOAT4" | "REAL" => row.try_get::<_, Option<f32>>(column_name)?
            .map(|v| match v {
                v if v.is_nan() => Value::String("NaN".to_string()),
                v if v.is_infinite() => Value::String("Infinity".to_string()),
                _ => serde_json::Number::from_f64(v as f64).map(Value::Number).unwrap_or(Value::Null),
            })
            .unwrap_or(Value::Null),
        "FLOAT8" | "DOUBLE PRECISION" => row.try_get::<_, Option<f64>>(column_name)?
            .map(|v| match v {
                v if v.is_nan() => Value::String("NaN".to_string()),
                v if v.is_infinite() => Value::String("Infinity".to_string()),
                _ => serde_json::Number::from_f64(v).map(Value::Number).unwrap_or(Value::Null),
            })
            .unwrap_or(Value::Null),
        "CHAR" => {
            row.try_get::<_, Option<i8>>(column_name)?
                .map(|v| Value::Number(v.into()))
                .unwrap_or(Value::Null)
        },
        "VARCHAR" | "TEXT" | "BPCHAR" | "CITEXT" | "NAME" | "LTREE" | "LQUERY" | "LTXTQUERY" | "UNKNOWN" => row.try_get::<_, Option<String>>(column_name)?
            .map(Value::String)
            .unwrap_or(Value::Null),
        "BYTEA" => {
            let base64_string = row.try_get::<_, Option<Vec<u8>>>(column_name)?
                .map(|v| general_purpose::STANDARD.encode(v))
                .unwrap_or("Unable to make Base64 string".to_string());

            let mut blob_object = serde_json::Map::new();
            blob_object.insert("BYTEA".to_string(), Value::String(base64_string));
            Value::Object(blob_object)
        },
        "HSTORE" => row.try_get::<_, Option<HashMap<String, Option<String>>>>(column_name)?
            .map(|hstore| {
                let mut map = Map::new();
                for (k, v) in hstore {
                    map.insert(k, v.map(Value::String).unwrap_or(Value::Null));
                }
                Value::Object(map)
            })
            .unwrap_or(Value::Null),
        "TIMESTAMP" => row.try_get::<_, Option<NaiveDateTime>>(column_name)?
            .map(|timestamp| Value::String(timestamp.format("%Y-%m-%dT%H:%M:%S").to_string()))
            .unwrap_or(Value::Null),
        "TIMESTAMP WITH TIME ZONE" | "TIMESTAMPTZ" => row.try_get::<_, Option<DateTime<FixedOffset>>>(column_name)?
            .map(|timestamp| Value::String(timestamp.to_rfc3339()))
            .unwrap_or(Value::Null),
        "INET" => row.try_get::<_, Option<IpAddr>>(column_name)?
            .map(|ip| Value::String(ip.to_string()))
            .unwrap_or(Value::Null),
        "DATE" => row.try_get::<_, Option<NaiveDate>>(column_name)?
            .map(|date| Value::String(date.format("%Y-%m-%d").to_string()))
            .unwrap_or(Value::Null),
        "TIME" => row.try_get::<_, Option<NaiveTime>>(column_name)?
            .map(|time| Value::String(time.format("%H:%M:%S").to_string()))
            .unwrap_or(Value::Null),
        "JSON" | "JSONB" => {
            row.try_get::<_, Option<Value>>(column_name)?
                .unwrap_or(Value::Null)
        },
        "UUID" => {
            row.try_get::<_, Option<Uuid>>(column_name)?
                .map(|uuid| Value::String(uuid.to_string()))
                .unwrap_or(Value::Null)
        },
        "NUMERIC" | "DECIMAL" => {
            row.try_get::<_, Option<Decimal>>(column_name)?
                .map(|decimal| Value::String(decimal.to_string()))
                .unwrap_or(Value::Null)
        },
        current_type => {
            match try_get_unknown_type(column_name, row) {
                Ok(value) => value,
                Err(_) => Value::String(format!("Unsupported type: {}", current_type)),
            }
        },
    };
    Ok(value)
}

fn try_get_unknown_type(column_name: &str, row: &postgres::Row) -> Result<Value, ()> {

    if let Ok(value) = row.try_get::<_, Option<i16>>(column_name) {
        return Ok(value.map(|v| Value::Number(v.into())).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<i32>>(column_name) {
        return Ok(value.map(|v| Value::Number(v.into())).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<i64>>(column_name) {
        return Ok(value.map(|v| Value::Number(v.into())).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<f64>>(column_name) {
        return Ok(value.map(|v| {
            serde_json::Number::from_f64(v)
                .map(Value::Number)
                .unwrap_or_else(|| Value::String(v.to_string()))
        }).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<String>>(column_name) {
        if let Some(ref str_val) = value {
            if str_val.parse::<f64>().is_ok() || str_val.parse::<i64>().is_ok() {
                return Ok(Value::String(str_val.clone()));
            }
        }
        return Ok(value.map(Value::String).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<bool>>(column_name) {
        return Ok(value.map(Value::Bool).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<String>>(column_name) {
        return Ok(value.map(Value::String).unwrap_or(Value::Null));
    }

    if let Ok(value) = row.try_get::<_, Option<Vec<u8>>>(column_name) {
        let base64_string = value.map(|v| general_purpose::STANDARD.encode(v))
            .unwrap_or_else(|| "Unable to make Base64 string".to_string());
        let mut blob_object = serde_json::Map::new();
        blob_object.insert("BYTEA".to_string(), Value::String(base64_string));
        return Ok(Value::Object(blob_object));
    }

    Err(())
}

fn parse_date(input: &str) -> Result<NaiveDateTime, String> {
    parse(input)
        .map(|dt| dt.naive_local())
        .map_err(|e| format!("Failed to parse date: {}", e))
}

fn parse_date_tz(input: &str) -> Result<DateTime<FixedOffset>, String> {
    DateTime::parse_from_rfc3339(input)
        .or_else(|_| {
            parse(input)
                .map(|dt| dt.fixed_offset())
                .map_err(|e| format!("Failed to parse date: {}", e))
        })
}