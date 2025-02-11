use postgres::types::{ToSql};
use serde_json::{Value, json, Map};
use base64::{engine::general_purpose, Engine as _};
use crate::component::AddIn;
use std::collections::HashMap;
use std::net::IpAddr;
use std::time::{SystemTime, UNIX_EPOCH};

pub fn execute_query(
    add_in: &mut AddIn,
    query: String,
    params_json: String,
    force_result: bool,
) -> String {

    let client = match add_in.get_connection() {
        Some(c) => c,
        None => return format_json_error("No connection initialized"),
    };

    // Парсинг JSON параметров
    let params: Vec<Value> = match serde_json::from_str(&params_json) {
        Ok(params) => params,
        Err(e) => return format_json_error(&e.to_string()),
    };

    let params_ref = match process_params(&params){
        Ok(params) => params,
        Err(e) => return format_json_error(&e.to_string()),
    };

    let params_unboxed: Vec<_> = params_ref.iter().map(AsRef::as_ref).collect();

    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        match client.query(&query, &params_unboxed) {
            Ok(rows) => {
                rows_to_json(rows)
            }
            Err(e) => format_json_error(&e.to_string()),
        }
    } else {
        match client.execute(&query, &params_unboxed.as_slice()) {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string()),
        }
    }
}

/// Конвертирует JSON-параметры в Postgres-совместимые типы
fn process_params(params: &Vec<Value>) -> Result<Vec<Box<dyn ToSql + Sync>>, String> {
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
            Value::Object(obj) => process_object(obj)?,
            _ => return Err("Unsupported parameter type".to_string()),
        };
        result.push(processed);
    }
    Ok(result)
}

fn process_object(object: &Map<String, Value>) -> Result<Box<dyn ToSql + Sync>, String> {
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
        "\"CHAR\"" | "OLDCHAR" => value
            .as_i64()
            .and_then(|v| i8::try_from(v).ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for \"char\"".to_string()),
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
        "VARCHAR" | "TEXT" | "CHAR" | "CITEXT" | "NAME" | "LTREE" | "LQUERY" | "LTXTQUERY" => value
            .as_str()
            .map(|v| Box::new(v.to_string()) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| format!("Invalid value for {}", key)),
        "BYTEA" => value
            .as_str()
            .map(|blob_str| {
                // Очистка строки base64 от лишних символов
                let cleaned_base64 = blob_str.replace(&['\n', '\r', ' '][..], "");
                general_purpose::STANDARD.decode(&cleaned_base64)
            })
            .and_then(|res| res.ok())
            .map(|v| Box::new(v) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid base64 value for BYTEA".to_string()),
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
        "TIMESTAMP" | "TIMESTAMP WITH TIME ZONE" => value
            .as_i64()
            .map(|v| {
                let duration = UNIX_EPOCH + std::time::Duration::from_millis(v as u64 * 1000);
                let system_time = SystemTime::from(duration);
                Box::new(system_time) as Box<dyn ToSql + Sync>
            })
            .ok_or_else(|| "Invalid value for TIMESTAMP".to_string()),
        "INET" => value
            .as_str()
            .and_then(|s| s.parse::<IpAddr>().ok())
            .map(|ip| Box::new(ip) as Box<dyn ToSql + Sync>)
            .ok_or_else(|| "Invalid value for INET".to_string()),
        _ => Err(format!("Unsupported type: {}", key)),
    }
}

fn rows_to_json(rows: Vec<postgres::Row>) -> String {
    let mut result = Vec::new();

    for row in rows {
        let mut row_map = Map::new();

        for column in row.columns() {
            let column_name = column.name();
            let column_type = column.type_().name();

            let value = match column_type.to_lowercase().as_str() {
                "bool" => row.get::<_, Option<bool>>(column_name).map(Value::Bool).unwrap_or(Value::Null),
                "int2" | "smallint" | "smallserial" => row.get::<_, Option<i16>>(column_name)
                    .map(|v| Value::Number(v.into()))
                    .unwrap_or(Value::Null),
                "int4" | "int" | "serial" => row.get::<_, Option<i32>>(column_name)
                    .map(|v| Value::Number(v.into()))
                    .unwrap_or(Value::Null),
                "oid" => row.get::<_, Option<u32>>(column_name)
                    .map(|v| Value::Number(v.into()))
                    .unwrap_or(Value::Null),
                "int8" | "bigint" | "bigserial" => row.get::<_, Option<i64>>(column_name)
                    .map(|v| Value::Number(v.into()))
                    .unwrap_or(Value::Null),
                "float4" | "real" => row.get::<_, Option<f32>>(column_name)
                    .map(|v| match v {
                        v if v.is_nan() => Value::String("NaN".to_string()),
                        v if v.is_infinite() => Value::String("Infinity".to_string()),
                        _ => serde_json::Number::from_f64(v as f64).map(Value::Number).unwrap_or(Value::Null),
                    })
                    .unwrap_or(Value::Null),
                "float8" | "double precision" => row.get::<_, Option<f64>>(column_name)
                    .map(|v| match v {
                        v if v.is_nan() => Value::String("NaN".to_string()),
                        v if v.is_infinite() => Value::String("Infinity".to_string()),
                        _ => serde_json::Number::from_f64(v).map(Value::Number).unwrap_or(Value::Null),
                    })
                    .unwrap_or(Value::Null),
                "varchar" | "text" | "char" | "citext" | "name" | "unknown" => row.get::<_, Option<String>>(column_name)
                    .map(Value::String)
                    .unwrap_or(Value::Null),
                "bytea" => {

                    let base64_string = row.get::<_, Option<Vec<u8>>>(column_name)
                        .map(|v| general_purpose::STANDARD.encode(v))
                        .unwrap_or("Unable to make Base64 string".to_string());

                    let mut blob_object = serde_json::Map::new();
                    blob_object.insert("BYTEA".to_string(), Value::String(base64_string)); // Оборачиваем в объект
                    Value::Object(blob_object)
                },
                "hstore" => row.get::<_, Option<HashMap<String, Option<String>>>>(column_name)
                    .map(|hstore| {
                        let mut map = Map::new();
                        for (k, v) in hstore {
                            map.insert(k, v.map(Value::String).unwrap_or(Value::Null));
                        }
                        Value::Object(map)
                    })
                    .unwrap_or(Value::Null),
                "timestamp" | "timestamptz" => row.get::<_, Option<SystemTime>>(column_name)
                    .map(|time| {
                        match time.duration_since(SystemTime::UNIX_EPOCH) {
                            Ok(d) => Value::Number(d.as_secs().into()), // Положительное значение для времени после UNIX_EPOCH
                            Err(_) => match SystemTime::UNIX_EPOCH.duration_since(time) {
                                Ok(d) => Value::Number((-(d.as_secs() as i64)).into()), // Отрицательное значение для даты до UNIX_EPOCH
                                Err(_) => Value::Null, // Это вообще не должно произойти
                            },
                        }

                    })
                    .unwrap_or(Value::Null),
                "inet" => row.get::<_, Option<IpAddr>>(column_name)
                    .map(|ip| Value::String(ip.to_string()))
                    .unwrap_or(Value::Null),
                _ => Value::Null,
            };

            row_map.insert(column_name.to_string(), value);
        }

        result.push(Value::Object(row_map));
    };

    json!({
        "result": true,
        "data": result
    }).to_string()
}

fn format_json_error(error: &str) -> String {
    json!({
        "result": false,
        "error": error
    })
        .to_string()
}
