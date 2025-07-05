use serde_json::{Value, json};
use crate::component::format_json_error;
use base64::{engine::general_purpose, Engine as _};
use mysql::prelude::Queryable;
use std::collections::HashMap;
use chrono::*;
use mysql::PooledConn;
use mysql_common::packets::Column;
use dateparser::parse;

pub fn execute_query(
    conn: &mut PooledConn,
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
        Some(array) => process_mysql_params(array),
        None => return format_json_error("Parameters must be a JSON array")
    };

    // Определяем тип запроса
    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result == true {

        let mut rows: Vec<mysql::Row> = match conn.exec(query, params_array){
            Ok(rows) => rows,
            Err(e) => return format_json_error(e)
        };

        rows_to_json_array(&mut rows)

    } else {

        let exec_result = match params_array.len() == 0 {
            true => conn.query_drop(query),
            false => conn.exec_drop(query, params_array)
        };

        match exec_result{
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(e)
        }
    }
}

fn rows_to_json_array(rows: &mut Vec<mysql::Row>) -> String {

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
            Err(e) => return format_json_error(e)
        }

    }

    json!({ "result": true, "data": json_array }).to_string()
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
            // Используем "нулевую" дату (1970-01-01) и переданное время
            let date = NaiveDate::from_ymd_opt(1970, 1, 1).unwrap();
            let total_hours = days * 24 + (hours as u32);
            let time = NaiveTime::from_hms_micro_opt(total_hours, minutes as u32, seconds as u32, micros)
                .unwrap_or_else(|| NaiveTime::from_hms_opt(0, 0, 0).unwrap());
            let datetime = NaiveDateTime::new(date, time);

            // Преобразуем в UTC и форматируем как RFC 3339
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
    use mysql::consts::ColumnType; // или mysql_async::consts::ColumnType

    let column_type = column.column_type();

    match column.column_type() {
        // Обычные строковые типы
        ColumnType::MYSQL_TYPE_STRING
        | ColumnType::MYSQL_TYPE_VAR_STRING
        | ColumnType::MYSQL_TYPE_VARCHAR => true,

        // BLOB — только если charset не binary (63)
        ColumnType::MYSQL_TYPE_BLOB => column.character_set() != 63,

        // ENUM/SET — текстовые
        _ if column_type.is_enum_or_set_type() => true,

        // Остальные (включая TINYBLOB/MEDIUMBLOB/LONGBLOB) — не текстовые
        _ => false,
    }
}

fn process_mysql_params(json_array: &mut Vec<Value>) -> Vec<mysql::Value> {

    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        result.push(match item {
            Value::Null => mysql::Value::NULL,
            Value::Object(obj) => {
                if let Some((key, value)) = obj.iter().next() {

                    match key.to_uppercase().as_str(){
                        "BYTES" => {

                            match value.as_str(){
                                Some(b64) => {

                                    let cleaned_base64 = b64.replace(&['\n', '\r', ' '][..], "");
                                    match general_purpose::STANDARD.decode(cleaned_base64) {
                                        Ok(decoded_blob) => mysql::Value::Bytes(decoded_blob),
                                        Err(e) => mysql::Value::Bytes(e.to_string().into_bytes())
                                    }

                                },
                                None => mysql::Value::Bytes("Not a Base64 value passed".as_bytes().to_vec()),
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

    result
}