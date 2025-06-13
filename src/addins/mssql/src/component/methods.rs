use serde_json::{Value, json, Number};
use crate::component::format_json_error;
use base64::{engine::general_purpose, Engine as _};
use std::collections::HashMap;
use chrono::*;
use tiberius::{Client, Column, Row, ToSql};
use std::sync::{Arc, Mutex};
use tiberius::ColumnType;
use tokio::net::TcpStream;
use tokio_util::compat::Compat;

pub fn execute_query(
    conn: Arc<Mutex<Client<Compat<TcpStream>>>>,
    query: String,
    params_json: String,
    force_result: bool
) -> String {
    // Парсинг JSON параметров
    let mut parsed_params: Value = match serde_json::from_str(&params_json) {
        Ok(params) => params,
        Err(e) => return format_json_error(e)
    };

    let params_array = match parsed_params.as_array_mut() {
        Some(array) => process_mssql_params(array),
        None => return format_json_error("Parameters must be a JSON array")
    };

    let mut client = match conn.lock() {
        Ok(client) => client,
        Err(e) => return format_json_error(format!("Failed to lock connection: {}", e))
    };

    // Определяем тип запроса
    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        match tokio::runtime::Runtime::new().unwrap().block_on(async {
            client.simple_query(query).await
        }) {
            Ok(stream) => {
                let rows = match tokio::runtime::Runtime::new().unwrap().block_on(async {
                    stream.into_results().await
                }) {
                    Ok(rows) => rows.into_iter().flatten().collect(),
                    Err(e) => return format_json_error(e)
                };
                rows_to_json_array(rows)
            },
            Err(e) => format_json_error(e)
        }
    } else {
        let params_refs: Vec<&dyn ToSql> = params_array.iter().map(|b| b.as_ref()).collect();
        match tokio::runtime::Runtime::new().unwrap().block_on(async {
            client.execute(query, &params_refs).await
        }) {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(e)
        }
    }
}

fn rows_to_json_array(rows: Vec<Row>) -> String {
    let mut json_array = Vec::new();

    for row in rows {
        let mut json_obj = HashMap::new();
        for (i, column) in row.columns().iter().enumerate() {
            let column_name = column.name().to_string();
            let value = match row.get::<&str, _>(i) {
                Some(value) => from_sql_to_json(value, column),
                None => Value::Null,
            };
            json_obj.insert(column_name, value);
        }
        match serde_json::to_value(json_obj) {
            Ok(json) => json_array.push(json),
            Err(e) => return format_json_error(e)
        }
    }

    json!({ "result": true, "data": json_array }).to_string()
}

fn from_sql_to_json(value: &str, column: &Column) -> Value {
    match column.column_type() {
        ColumnType::Bit => {
            value.parse::<bool>().map(Value::Bool).unwrap_or(Value::Null)
        },
        ColumnType::Int1 | ColumnType::Int2 | ColumnType::Int4 | ColumnType::Int8 => {
            value.parse::<i64>()
                .ok()
                .and_then(|n| Number::from_f64(n as f64))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        },
        ColumnType::Float4 | ColumnType::Float8 => {
            value.parse::<f64>()
                .ok()
                .and_then(|f| Number::from_f64(f))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        },
        ColumnType::Daten => {
            NaiveDate::parse_from_str(value, "%Y-%m-%d")
                .map(|d| Value::String(d.to_string()))
                .unwrap_or(Value::Null)
        },
        ColumnType::Datetime | ColumnType::Datetime2 | ColumnType::Datetime4 | ColumnType::Datetimen => {
            NaiveDateTime::parse_from_str(value, "%Y-%m-%d %H:%M:%S%.f")
                .map(|dt| Value::String(dt.to_string()))
                .unwrap_or(Value::Null)
        },
        ColumnType::Timen => {
            NaiveTime::parse_from_str(value, "%H:%M:%S%.f")
                .map(|t| Value::String(t.to_string()))
                .unwrap_or(Value::Null)
        },
        ColumnType::DatetimeOffsetn => {
            DateTime::parse_from_rfc3339(value)
                .map(|dt| Value::String(dt.to_rfc3339()))
                .unwrap_or(Value::Null)
        },
        ColumnType::BigVarBin | ColumnType::BigBinary => {
            encode_to_base64(value.as_bytes().to_vec())
        },
        ColumnType::Guid => {
            Value::String(value.to_string())
        },
        ColumnType::Money | ColumnType::Money4 => {
            let cleaned = value.replace(',', "");
            cleaned.parse::<f64>()
                .ok()
                .and_then(|f| Number::from_f64(f))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        },
        ColumnType::Decimaln | ColumnType::Numericn => {
            value.parse::<f64>()
                .ok()
                .and_then(|f| Number::from_f64(f))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        },
        ColumnType::Xml => {
            Value::String(value.to_string())
        },
        _ => Value::String(value.to_string())
    }
}

fn encode_to_base64(bytes: Vec<u8>) -> Value {
    let base64_string = general_purpose::STANDARD.encode(bytes);
    let mut blob_object = serde_json::Map::new();
    blob_object.insert("BYTES".to_string(), Value::String(base64_string));
    Value::Object(blob_object)
}

fn process_mssql_params(json_array: &mut Vec<Value>) -> Vec<Box<dyn ToSql>> {
    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        let param: Box<dyn ToSql> = match item {
            Value::Null => Box::new(None::<i32>),
            Value::Bool(b) => Box::new(*b),
            Value::Number(n) if n.is_i64() => Box::new(n.as_i64().unwrap()),
            Value::Number(n) if n.is_f64() => Box::new(n.as_f64().unwrap()),
            Value::Number(n) => Box::new(n.as_f64().unwrap()),
            Value::String(s) => Box::new(s.clone()),
            Value::Object(obj) => {
                if let Some((key, value)) = obj.iter().next() {
                    match key.to_uppercase().as_str() {
                        "BYTES" => {
                            match value.as_str() {
                                Some(b64) => {
                                    let cleaned = b64.replace(&['\n', '\r', ' '][..], "");
                                    match general_purpose::STANDARD.decode(cleaned) {
                                        Ok(decoded) => Box::new(decoded),
                                        Err(e) => Box::new(e.to_string().into_bytes())
                                    }
                                },
                                None => Box::new("Not a Base64 value passed".as_bytes().to_vec())
                            }
                        },
                        "DATE" => {
                            match value.as_str().and_then(|s| NaiveDate::parse_from_str(s, "%Y-%m-%d").ok()) {
                                Some(date) => Box::new(date),
                                None => Box::new(None::<NaiveDate>)
                            }
                        },
                        "DATETIME" => {
                            match value.as_str().and_then(|s| NaiveDateTime::parse_from_str(s, "%Y-%m-%d %H:%M:%S%.f").ok()) {
                                Some(dt) => Box::new(dt),
                                None => Box::new(None::<NaiveDateTime>)
                            }
                        },
                        "GUID" => {
                            match value.as_str().and_then(|s| uuid::Uuid::parse_str(s).ok()) {
                                Some(uuid) => Box::new(uuid),
                                None => Box::new(uuid::Uuid::nil())
                            }
                        },
                        _ => Box::new(value.to_string())
                    }
                } else {
                    Box::new(None::<i32>)
                }
            }
            _ => Box::new(None::<i32>)
        };
        result.push(param);
    }

    result
}