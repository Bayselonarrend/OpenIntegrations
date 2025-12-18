use serde_json::{Value, json};
use base64::{engine::general_purpose, Engine as _};
use mysql::prelude::Queryable;
use std::collections::HashMap;
use std::str::FromStr;
use chrono::*;
use common_utils::utils::json_error;
use mysql_common::packets::Column;
use dateparser::parse;
use mysql::consts::ColumnType;
use common_binary::vault::{BinaryVault, VaultKey};
use crate::AddIn;

impl AddIn {
    pub fn execute_query(&mut self, key: &str) -> String {

        let mut conn = match self.get_connection() {
            Ok(conn) => conn,
            Err(e) => return json_error(&e),
        };

        let query = match self.datasets.get_query(key) {
            Some(q) => q,
            None => return json_error(format!("No query found by key: {}", key)),
        };

        let mut params = query.params;
        let text = query.text;
        let force_result = query.force_result;

        let params_array = match process_mysql_params(&self.binary_vault, &mut params) {
            Ok(params_array) => params_array,
            Err(e) => return json_error(&e),
        };

        let result = if text.trim_start().to_uppercase().starts_with("SELECT") || force_result == true {
            let mut rows: Vec<mysql::Row> = match conn.exec(text, params_array) {
                Ok(rows) => rows,
                Err(e) => return json_error(&e)
            };

            match rows_to_json_array(&mut rows) {
                Ok(json) => {
                    self.datasets.set_results(&key, json);
                    json!({"result": true, "data": true}).to_string()
                },
                Err(e) => return json_error(&e)
            }
        } else {
            let exec_result = match params_array.len() == 0 {
                true => conn.query_drop(text),
                false => conn.exec_drop(text, params_array)
            };

            match exec_result {
                Ok(_) => json!({"result": true, "data": false}).to_string(),
                Err(e) => json_error(&e)
            }
        };

        match conn.as_mut().ping(){
            Ok(_) => self.connection = Some(conn),
            Err(_) => drop(conn)
        };
        result
    }
}

fn rows_to_json_array(rows: &mut Vec<mysql::Row>) ->  Result<Vec<Value>, String> {

    let mut json_array = Vec::new();

    for row in rows {
        let mut json_obj = HashMap::new();
        for (i, column) in row.columns_ref().iter().enumerate() {

            let column_name = column.name_str().to_string();
            let value: Value = match row.get::<Option<mysql::Value>, usize>(i) {
                Some(mysql_value) => match mysql_value {
                    Some(value) => {
                        from_sql_to_json(value, &column)
                    },
                    None => Value::Null
                },
                None => Value::Null,
            };
            json_obj.insert(column_name, value);
        }
        match serde_json::to_value(json_obj){
            Ok(json) => json_array.push(json),
            Err(e) => return Err(e.to_string())
        }
    }
    Ok(json_array)
}

fn from_sql_to_json(value: mysql::Value, column: &Column) -> Value {
    match value {
        mysql::Value::NULL => Value::Null,
        mysql::Value::Int(i) => Value::Number(i.into()),
        mysql::Value::Double(d) => serde_json::Number::from_f64(d).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::Float(f) => serde_json::Number::from_f64(f as f64).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::UInt(i) => serde_json::Number::from_f64(i as f64).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::Bytes(b) => process_bytes(b, column),
        mysql::Value::Date(year, month, day, hour, minute, second, micros) => {
            // Создаем дату и время
            let date = NaiveDate::from_ymd_opt(year as i32, month as u32, day as u32)
                .unwrap_or_else(|| NaiveDate::from_ymd_opt(1970, 1, 1).unwrap());
            let time = NaiveTime::from_hms_micro_opt(hour as u32, minute as u32, second as u32, micros)
                .unwrap_or_else(|| NaiveTime::from_hms_opt(0, 0, 0).unwrap());
            let datetime = NaiveDateTime::new(date, time);

            let datetime_utc = DateTime::<Utc>::from_naive_utc_and_offset(datetime, Utc);
            Value::String(datetime_utc.to_rfc3339())
        },
        mysql::Value::Time(_is_neg, days, hours, minutes, seconds, micros) => {
            let date = NaiveDate::from_ymd_opt(1970, 1, 1).unwrap();
            let total_hours = days * 24 + (hours as u32);
            let time = NaiveTime::from_hms_micro_opt(total_hours, minutes as u32, seconds as u32, micros)
                .unwrap_or_else(|| NaiveTime::from_hms_opt(0, 0, 0).unwrap());
            let datetime = NaiveDateTime::new(date, time);
            let datetime_utc = DateTime::<Utc>::from_naive_utc_and_offset(datetime, Utc);
            Value::String(datetime_utc.to_rfc3339())
        }
    }
}

fn process_bytes(bytes: Vec<u8>, column: &Column) -> Value {
    if is_text_type(column) {
        match String::from_utf8(bytes.clone()) {
            Ok(text) => Value::String(text),
            Err(e) => Value::String(e.to_string()),
        }
    } else {
        encode_to_base64(bytes)
    }
}

fn encode_to_base64(bytes: Vec<u8>) -> Value {
    let base64_string = general_purpose::STANDARD.encode(bytes);
    let mut blob_object = serde_json::Map::new();
    blob_object.insert("BYTES".to_string(), Value::String(base64_string));
    Value::Object(blob_object)
}

fn is_text_type(column: &Column) -> bool {
    let column_type = column.column_type();
    match column.column_type() {
        ColumnType::MYSQL_TYPE_STRING
        | ColumnType::MYSQL_TYPE_VAR_STRING
        | ColumnType::MYSQL_TYPE_VARCHAR => true,
        ColumnType::MYSQL_TYPE_BLOB => column.character_set() != 63,
        _ if column_type.is_enum_or_set_type() => true,
        _ => false,
    }
}

fn process_mysql_params(binary_vault: &BinaryVault, json_array: &mut Vec<Value>) -> Result<Vec<mysql::Value>, String> {

    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        result.push(match item {
            Value::Null => mysql::Value::NULL,
            Value::Object(obj) => {
                if let Some((key, value)) = obj.iter().next() {
                    match key.to_uppercase().as_str(){
                        "BYTES" => {
                            match value.as_str(){
                                Some(key) => {

                                    let key_obj = &VaultKey::from_str(key)
                                        .map_err(|e| e.to_string())?;

                                    let binary = binary_vault
                                        .retrieve(key_obj)
                                        .map_err(|e| e.to_string())?;

                                    mysql::Value::Bytes(binary)

                                },
                                None => return Err("Not a binary vault key passed".to_string()),
                            }
                        },
                        "UINT" => mysql::Value::UInt(value.as_u64().unwrap_or(0)),
                        "INT" => mysql::Value::Int(value.as_i64().unwrap_or(0)),
                        "FLOAT" => mysql::Value::Float(value.as_f64().unwrap_or(0.0) as f32),
                        "DOUBLE" => mysql::Value::Double(value.as_f64().unwrap_or(0.0)),
                        "DATE" => {
                            match parse(value.as_str().unwrap_or("")) {
                                Ok(datetime) => mysql::Value::from(datetime.naive_utc()),
                                Err(_) => mysql::Value::from(chrono::DateTime::from_timestamp(0, 0).unwrap().naive_utc())
                            }
                        },
                        "TIME" => {
                            match parse(value.as_str().unwrap_or("")) {
                                Ok(datetime) => mysql::Value::from(datetime.time()),
                                Err(_) => mysql::Value::from(chrono::DateTime::from_timestamp(0, 0).unwrap().time())
                            }
                        },
                        "TEXT" => {
                            let value_str = value.as_str();
                            match value_str {
                                Some(value_str) => mysql::Value::Bytes(value_str.as_bytes().to_vec()),
                                None => mysql::Value::NULL
                            }
                        }
                        _ => mysql::Value::from(item.clone())
                    }
                }else{ mysql::Value::NULL }
            }
            _ => mysql::Value::from(item.clone())
        })
    };
    Ok(result)
}