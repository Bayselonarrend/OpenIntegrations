use serde_json::{Value, json};
use crate::component;
use base64::{engine::general_purpose, Engine as _};
use mysql::prelude::Queryable;
use std::collections::HashMap;

pub fn execute_query(
    client: &mut component::AddIn,
    query: String,
    params_json: String,
    force_result: bool
) -> String {

    let pool = match client.connections {
        Some(ref mut conns) => conns,
        None => return format_json_error("No connections pool!")
    };

    // Парсинг JSON параметров
    let mut parsed_params: Value = match serde_json::from_str(&params_json) {
        Ok(params) => params,
        Err(e) => return format_json_error(e)
    };

    let params_array = match parsed_params.as_array_mut() {
        Some(array) => process_mysql_params(array),
        None => return format_json_error("Parameters must be a JSON array")
    };

    let mut conn = match pool.get_conn(){
        Ok(conn) => conn,
        Err(e) => return format_json_error(e)
    };

    // Определяем тип запроса
    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result == true {

        let mut rows: Vec<mysql::Row> = match conn.exec(query, params_array){
            Ok(rows) => rows,
            Err(e) => return format_json_error(e)
        };

        rows_to_json_array(&mut rows)

    } else {

        match conn.exec_drop(query, params_array){
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
                    Some(value) => from_sql_to_json(value),
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

fn from_sql_to_json(value: mysql::Value) -> Value {
    match value {
        mysql::Value::NULL => Value::Null,
        mysql::Value::Int(i) => Value::Number(i.into()),
        mysql::Value::Double(d) => serde_json::Number::from_f64(d).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::Float(f) => serde_json::Number::from_f64(f as f64).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::UInt(i) => serde_json::Number::from_f64(i as f64).map(Value::Number).unwrap_or(Value::Null),
        mysql::Value::Bytes(b) => {
            let base64_string = general_purpose::STANDARD.encode(b); // Кодируем в Base64
            let mut blob_object = serde_json::Map::new();
            blob_object.insert("BYTES".to_string(), Value::String(base64_string)); // Оборачиваем в объект
            Value::Object(blob_object)
        },
        _ => Value::Null
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

                            let cleaned_base64 = value.to_string().replace(&['\n', '\r', ' '][..], "");

                            match general_purpose::STANDARD.decode(cleaned_base64) {
                                Ok(decoded_blob) => mysql::Value::Bytes(decoded_blob),
                                Err(e) => mysql::Value::Bytes(e.to_string().into_bytes())
                            }
                        },
                        "UINT" => mysql::Value::UInt(value.as_u64().unwrap_or(0)),
                        "INT" => mysql::Value::Int(value.as_i64().unwrap_or(0)),
                        "FLOAT" => mysql::Value::Float(value.as_f64().unwrap_or(0.0) as f32),
                        "DOUBLE" => mysql::Value::Double(value.as_f64().unwrap_or(0.0)),
                        "DATE" => {
                            match chrono::DateTime::parse_from_rfc3339(value.as_str().unwrap_or("")) {
                                Ok(datetime) => mysql::Value::from(datetime.naive_utc()),
                                Err(_) => mysql::Value::from(chrono::DateTime::from_timestamp(0, 0).unwrap().naive_utc())
                            }
                        },
                        "TIME" => {
                            match chrono::DateTime::parse_from_rfc3339(value.as_str().unwrap_or("")) {
                                Ok(datetime) => mysql::Value::from(datetime.time()),
                                Err(_) => mysql::Value::from(chrono::DateTime::from_timestamp(0, 0).unwrap().time())
                            }
                        },
                        _ => mysql::Value::from(item.clone())
                    }
                }else{ mysql::Value::NULL }
            }
            _ => mysql::Value::from(item.clone())
        })
    };

    result
}

fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}