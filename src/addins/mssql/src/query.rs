use std::f64;
use std::str::FromStr;

use base64::{engine::general_purpose, Engine as _};
use chrono::{DateTime, FixedOffset, NaiveDate, NaiveDateTime, NaiveTime, Utc};
use common_binary::vault::{BinaryVault, VaultKey};
use dateparser::parse;
use serde_json::{Number, Value};
use tiberius::numeric::Decimal;
use tiberius::{Client, Column, ColumnType, Row, ToSql};
use tiberius::xml::XmlData;
use tokio::net::TcpStream;
use tokio_util::compat::Compat;
use uuid::Uuid;

pub async fn execute(
    binary_vault: &BinaryVault,
    client: &mut Client<Compat<TcpStream>>,
    query: &str,
    params_json: Vec<Value>,
    force_result: bool,
) -> Result<Option<Vec<Value>>, String> {
    let mut params = params_json;
    let params_array = process_params(binary_vault, &mut params)?;
    let normalized_query = query.trim_start().to_uppercase();
    let params_refs: Vec<&dyn ToSql> = params_array.iter().map(|b| b.as_ref()).collect();

    if normalized_query.starts_with("SELECT") || force_result {
        match client.query(query, &params_refs).await {
            Ok(stream) => {
                let rows = match stream.into_results().await {
                    Ok(rows) => rows.into_iter().flatten().collect(),
                    Err(e) => return Err(e.to_string()),
                };
                Ok(Some(rows_to_json(rows)))
            }
            Err(e) => Err(e.to_string()),
        }
    } else if normalized_query == "BEGIN TRAN"
        || normalized_query == "COMMIT;"
        || normalized_query == "ROLLBACK;"
        || normalized_query == "BEGIN TRANSACTION"
    {
        match client.simple_query(query).await {
            Ok(_) => Ok(None),
            Err(e) => Err(e.to_string()),
        }
    } else {
        match client.execute(query, &params_refs).await {
            Ok(_) => Ok(None),
            Err(e) => Err(e.to_string()),
        }
    }
}

fn rows_to_json(rows: Vec<Row>) -> Vec<Value> {
    let mut json_array = Vec::new();

    for row in rows {
        let mut json_obj = serde_json::Map::new();
        for (i, column) in row.columns().iter().enumerate() {
            let column_name = column.name().to_string();
            let value = cell_to_json(&row, i, column);
            json_obj.insert(column_name, value);
        }
        json_array.push(Value::Object(json_obj));
    }

    json_array
}

fn cell_to_json(row: &Row, index: usize, column: &Column) -> Value {
    match column.column_type() {
        ColumnType::Null => Value::Null,
        ColumnType::Bit | ColumnType::Bitn => match try_get_any_bit(row, index) {
            Some(i) => Value::Number(i.into()),
            None => Value::Null,
        },
        ColumnType::Int1
        | ColumnType::Int2
        | ColumnType::Int4
        | ColumnType::Int8
        | ColumnType::Intn => match try_get_any_int(row, index) {
            Some(i) => Value::Number(i.into()),
            None => Value::Null,
        },
        ColumnType::Float4
        | ColumnType::Float8
        | ColumnType::Floatn
        | ColumnType::Money
        | ColumnType::Money4 => match try_get_any_float(row, index) {
            Some(i) => Number::from_f64(i).map(Value::Number).unwrap_or(Value::Null),
            None => Value::Null,
        },
        ColumnType::Decimaln | ColumnType::Numericn => row
            .try_get::<Decimal, _>(index)
            .ok()
            .flatten()
            .and_then(|f| Number::from_f64(f64::try_from(f).unwrap_or(0.0)))
            .map(Value::Number)
            .unwrap_or(Value::Null),
        ColumnType::Daten => row
            .try_get::<NaiveDate, _>(index)
            .ok()
            .flatten()
            .map(|d| Value::String(d.format("%Y-%m-%d").to_string()))
            .unwrap_or(Value::Null),
        ColumnType::Datetime
        | ColumnType::Datetime2
        | ColumnType::Datetime4
        | ColumnType::Datetimen => row
            .try_get::<NaiveDateTime, _>(index)
            .ok()
            .flatten()
            .map(|dt| Value::String(dt.format("%Y-%m-%dT%H:%M:%S").to_string()))
            .unwrap_or(Value::Null),
        ColumnType::Timen => row
            .try_get::<NaiveTime, _>(index)
            .ok()
            .flatten()
            .map(|t| Value::String(t.format("%H:%M:%S").to_string()))
            .unwrap_or(Value::Null),
        ColumnType::DatetimeOffsetn => row
            .try_get::<DateTime<Utc>, _>(index)
            .ok()
            .flatten()
            .map(|dt| Value::String(dt.to_rfc3339()))
            .unwrap_or(Value::Null),
        ColumnType::BigVarBin | ColumnType::BigBinary => row
            .try_get::<&[u8], _>(index)
            .ok()
            .flatten()
            .map(encode_to_base64)
            .unwrap_or(Value::Null),
        ColumnType::Guid => row
            .try_get::<Uuid, _>(index)
            .ok()
            .flatten()
            .map(|u| Value::String(u.to_string()))
            .unwrap_or(Value::Null),
        ColumnType::Xml => row
            .try_get::<&XmlData, _>(index)
            .ok()
            .flatten()
            .map(|d| Value::String(d.clone().into_string()))
            .unwrap_or(Value::Null),
        _ => row
            .try_get::<&str, _>(index)
            .ok()
            .flatten()
            .map(|s| Value::String(s.to_string()))
            .unwrap_or(Value::Null),
    }
}

fn process_params(
    binary_vault: &BinaryVault,
    json_array: &mut [Value],
) -> Result<Vec<Box<dyn ToSql>>, String> {
    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        let param: Box<dyn ToSql> = match item {
            Value::Null => Box::new(None::<i32>),
            Value::Bool(b) => Box::new(*b),
            Value::Number(n) if n.is_i64() => Box::new(n.as_i64().unwrap_or(0)),
            Value::Number(n) if n.is_f64() => Box::new(n.as_f64().unwrap_or(0.0)),
            Value::Number(n) => Box::new(n.as_f64().unwrap_or(0.0)),
            Value::String(s) => Box::new(s.clone()),
            Value::Object(obj) => {
                if let Some((key, value)) = obj.iter().next() {
                    match key.to_uppercase().as_str() {
                        "TINYINT" => match value.as_u64() {
                            Some(num) => Box::new(num as u8),
                            None => Box::new(0),
                        },
                        "SMALLINT" => match value.as_i64() {
                            Some(num) => Box::new(num as i16),
                            None => Box::new(0),
                        },
                        "INT" => match value.as_i64() {
                            Some(num) => Box::new(num as i32),
                            None => Box::new(0),
                        },
                        "BIGINT" => match value.as_i64() {
                            Some(num) => Box::new(num),
                            None => Box::new(0),
                        },
                        "FLOAT24" => match value.as_f64() {
                            Some(num) => Box::new(num as f32),
                            None => Box::new(0.0),
                        },
                        "FLOAT53" => match value.as_f64() {
                            Some(num) => Box::new(num),
                            None => Box::new(0.0),
                        },
                        "BIT" => match value.as_bool() {
                            Some(b) => Box::new(b),
                            None => Box::new(false),
                        },
                        "NVARCHAR" => match value.as_str() {
                            Some(s) => Box::new(s.to_string()),
                            None => Box::new(String::new()),
                        },
                        "BYTES" => match value.as_str() {
                            Some(key) => {
                                let binary = binary_vault
                                    .retrieve(&VaultKey::from_str(key).unwrap_or_default());
                                Box::new(binary.map_err(|e| e.to_string())?)
                            }
                            None => Box::new("Not a binary vault key passed".as_bytes().to_vec()),
                        },
                        "UUID" => match value.as_str().and_then(|s| Uuid::parse_str(s).ok()) {
                            Some(uuid) => Box::new(uuid),
                            None => Box::new(Uuid::nil()),
                        },
                        "NUMERIC" | "DECIMAL" => {
                            match value.as_f64().and_then(|v| Decimal::from_f64_retain(v)) {
                                Some(num) => Box::new(num),
                                None => Box::new(Decimal::from(0)),
                            }
                        }
                        "XML" => match value.as_str() {
                            Some(xml) => Box::new(XmlData::new(xml)),
                            None => Box::new(XmlData::new("".to_string())),
                        },
                        "DATE" => match value
                            .as_str()
                            .and_then(|s| parse(s).ok().map(|dt| dt.date_naive()))
                        {
                            Some(date) => Box::new(date),
                            None => Box::new(None::<NaiveDate>),
                        },
                        "TIME" => {
                            match value.as_str().and_then(|s| parse(s).ok().map(|dt| dt.time())) {
                                Some(time) => Box::new(time),
                                None => Box::new(None::<NaiveTime>),
                            }
                        }
                        "DATETIME" => match value
                            .as_str()
                            .and_then(|s| parse(s).ok().map(|dt| dt.naive_local()))
                        {
                            Some(dt) => Box::new(dt),
                            None => Box::new(None::<NaiveDateTime>),
                        },
                        "DATETIMEOFFSET" => {
                            match value.as_str().and_then(|s| parse_date_tz(s).ok()) {
                                Some(dt) => Box::new(dt),
                                None => Box::new(None::<DateTime<Utc>>),
                            }
                        }
                        _ => Box::new(value.to_string()),
                    }
                } else {
                    Box::new(None::<i32>)
                }
            }
            _ => Box::new(None::<i32>),
        };
        result.push(param);
    }
    Ok(result)
}

fn parse_date_tz(input: &str) -> Result<DateTime<FixedOffset>, String> {
    DateTime::parse_from_rfc3339(input).or_else(|_| {
        parse(input)
            .map(|dt| dt.fixed_offset())
            .map_err(|e| format!("Failed to parse date: {}", e))
    })
}

fn encode_to_base64(bytes: &[u8]) -> Value {
    let base64_string = general_purpose::STANDARD.encode(bytes);
    let mut blob_object = serde_json::Map::new();
    blob_object.insert("BYTES".to_string(), Value::String(base64_string));
    Value::Object(blob_object)
}

fn try_get_any_int(row: &Row, index: usize) -> Option<i64> {
    row.try_get::<i64, _>(index)
        .or_else(|_| row.try_get::<i64, _>(index).map(|v| v.map(|x| x)))
        .or_else(|_| row.try_get::<i32, _>(index).map(|v| v.map(|x| x as i64)))
        .or_else(|_| row.try_get::<i16, _>(index).map(|v| v.map(|x| x as i64)))
        .or_else(|_| row.try_get::<u8, _>(index).map(|v| v.map(|x| x as i64)))
        .ok()
        .flatten()
}

fn try_get_any_bit(row: &Row, index: usize) -> Option<u8> {
    row.try_get::<u8, _>(index)
        .or_else(|_| row.try_get::<bool, _>(index).map(|v| v.map(|x| x as u8)))
        .ok()
        .flatten()
}

fn try_get_any_float(row: &Row, index: usize) -> Option<f64> {
    row.try_get::<f64, _>(index)
        .or_else(|_| row.try_get::<f32, _>(index).map(|v| v.map(|x| x as f64)))
        .ok()
        .flatten()
}
