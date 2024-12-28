use rusqlite::{types::ValueRef};
use serde_json::{Value, json, Map};
use crate::component;
use serde_rusqlite::{to_params};
use base64::{engine::general_purpose, Engine as _};

pub fn execute_query(
    client: &mut component::AddIn,
    query: String,
    params_json: String,
) -> String {

    let conn = match client.get_connection() {
        Some(c) => c,
        None => return r#"{"result": false, "error": "No connection initialized"}"#.to_string(),
    };

    // Парсинг JSON параметров
    let parsed_params: Value = match serde_json::from_str(&params_json) {
        Ok(params) => params,
        Err(e) => {
            return format!(
                r#"{{"result": false, "error": "Invalid JSON parameters: {}"}}"#,
                e.to_string()
            );
        }
    };

    let params_array = match parsed_params.as_array() {
        Some(array) => array,
        None => {
            return r#"{"result": false, "error": "Parameters must be a JSON array"}"#.to_string();
        }
    };


    let convert = to_params(params_array).unwrap();

    // Определяем тип запроса
    if query.trim_start().to_uppercase().starts_with("SELECT") {
        // Выполняем SELECT
        match conn.prepare(&query) {
            Ok(mut query_result) => {

                let cols: Vec<String> = query_result
                    .column_names()
                    .iter()
                    .map(|name| name.to_string())
                    .collect();

                let res = query_result.query(convert);

                match res{
                    Ok(mut rows) => {
                        rows_to_json_array(&mut rows, &cols)
                    }
                    Err(e) => {
                        format!(r#"{{"result": false, "error": "{}"}}"#, e.to_string())
                    }
                }

            }
            Err(e) => {
                format!(r#"{{"result": false, "error": "{}"}}"#, e.to_string())
            }
        }
    } else {

        match conn.execute(&query, convert) {
            Ok(_) => r#"{"result": true}"#.to_string(),
            Err(e) => format!(r#"{{"result": false, "error": "{}"}}"#, e.to_string()),
        }
    }
}

fn rows_to_json_array(rows: &mut rusqlite::Rows, cols: &Vec<String>) -> String {

    let mut json_array = Vec::new();

    loop {

        let mut current: Map<String, Value> = Map::new();

        match rows.next() {

            Ok(Some(row)) => {

                for i in 0..cols.len() {

                    let val = row.get_ref_unwrap(i);
                    let jval = from_sql_to_json(val);

                    current.insert(cols[i].to_string(), jval);
                };

                json_array.push(current);

            }

            Ok(None) => break,
            Err(e) => {
                current.insert("error".to_string(), Value::String(e.to_string()));
            }

        }
    }

    json!(json_array).to_string()
}

fn from_sql_to_json(value: ValueRef) -> Value {
    match value {
        ValueRef::Null => Value::Null,
        ValueRef::Integer(i) => Value::Number(i.into()),
        ValueRef::Real(f) => {
            serde_json::Number::from_f64(f).map(Value::Number).unwrap_or(Value::Null)
        }
        ValueRef::Text(t) => Value::String(String::from_utf8_lossy(t).into_owned()),
        ValueRef::Blob(b) => {
            let base64_string = general_purpose::STANDARD.encode(b); // Кодируем в Base64
            let mut blob_object = serde_json::Map::new();
            blob_object.insert("blob".to_string(), Value::String(base64_string)); // Оборачиваем в объект
            Value::Object(blob_object)
        },
    }
}