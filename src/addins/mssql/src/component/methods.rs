use serde_json::{Value, json, Number};
use crate::component::{format_json_error, AddIn};
use base64::{engine::general_purpose, Engine as _};
use std::collections::HashMap;
use chrono::*;
use tiberius::{Column, Row, ToSql};
use tiberius::ColumnType;
use uuid::Uuid;

pub fn execute_query(
    obj: &mut AddIn,
    query: String,
    params_json: String,
    force_result: bool
) -> String {

    let conn = match obj.get_connection() {
        Ok(conn) => conn,
        Err(e) => return e,
    };

    let rt = match obj.get_runtime() {
        Ok(rt) => rt,
        Err(e) => return e,
    };

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

    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        match rt.block_on(async {
            client.simple_query(query).await
        }) {
            Ok(stream) => {
                let rows = match rt.block_on(async {
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
        match rt.block_on(async {
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
            let value = from_sql_to_json(&row, i, column);
            json_obj.insert(column_name, value);

        }
        match serde_json::to_value(json_obj) {
            Ok(json) => json_array.push(json),
            Err(e) => return format_json_error(e)
        }
    }

    json!({ "result": true, "data": json_array }).to_string()
}

fn from_sql_to_json(row: &Row, index: usize, column: &Column) -> Value {
    match column.column_type() {
        ColumnType::Bit => {
            row.try_get::<bool, _>(index)
                .ok()
                .flatten()
                .map(Value::Bool)
                .unwrap_or(Value::Null)
        }
        ColumnType::Int1 | ColumnType::Int2 | ColumnType::Int4 | ColumnType::Int8 => {
            row.try_get::<i64, _>(index)
                .ok()
                .flatten()
                .and_then(|n| Number::from_i128(n as i128))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        }
        ColumnType::Float4 | ColumnType::Float8 | ColumnType::Money | ColumnType::Money4 | ColumnType::Decimaln | ColumnType::Numericn=> {
            row.try_get::<f64, _>(index)
                .ok()
                .flatten()
                .and_then(|f| Number::from_f64(f))
                .map(Value::Number)
                .unwrap_or(Value::Null)
        }
        ColumnType::Daten => {
            row.try_get::<NaiveDate, _>(index)
                .ok()
                .flatten()
                .map(|d| Value::String(d.format("%Y-%m-%d").to_string()))
                .unwrap_or(Value::Null)
        }
        ColumnType::Datetime | ColumnType::Datetime2 | ColumnType::Datetime4 | ColumnType::Datetimen => {
            row.try_get::<NaiveDateTime, _>(index)
                .ok()
                .flatten()
                .map(|dt| Value::String(dt.format("%Y-%m-%dT%H:%M:%S").to_string()))
                .unwrap_or(Value::Null)
        }
        ColumnType::Timen => {
            row.try_get::<NaiveTime, _>(index)
                .ok()
                .flatten()
                .map(|t| Value::String(t.format("%H:%M:%S").to_string()))
                .unwrap_or(Value::Null)
        }
        ColumnType::DatetimeOffsetn => {
            row.try_get::<DateTime<Utc>, _>(index)
                .ok()
                .flatten()
                .map(|dt| Value::String(dt.to_rfc3339()))
                .unwrap_or(Value::Null)
        }
        ColumnType::BigVarBin | ColumnType::BigBinary => {
            row.try_get::<&[u8], _>(index)
                .ok()
                .flatten()
                .map(encode_to_base64)
                .unwrap_or(Value::Null)
        }
        ColumnType::Guid => {
            row.try_get::<Uuid, _>(index)
                .ok()
                .flatten()
                .map(|u| Value::String(u.to_string()))
                .unwrap_or(Value::Null)
        }
        ColumnType::Xml => {
            row.try_get::<&str, _>(index)
                .ok()
                .flatten()
                .map(|s| Value::String(s.to_string()))
                .unwrap_or(Value::Null)
        }
        _ => {
            row.try_get::<&str, _>(index)
                .ok()
                .flatten()
                .map(|s| Value::String(s.to_string()))
                .unwrap_or(Value::Null)
        }
    }
}

fn encode_to_base64(bytes: &[u8]) -> Value {
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
                            match value.as_str().and_then(|s| Uuid::parse_str(s).ok()) {
                                Some(uuid) => Box::new(uuid),
                                None => Box::new(Uuid::nil())
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