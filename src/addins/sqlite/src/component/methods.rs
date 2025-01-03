use rusqlite::{types::ValueRef, types::Value as SqlValue, params_from_iter, ParamsFromIter};
use serde_json::{Value, json, Map};
use crate::component;
use base64::{engine::general_purpose, Engine as _};



pub fn execute_query(
    client: &mut component::AddIn,
    query: String,
    params_json: String,
    force_result: bool
) -> String {

    let conn = match client.get_connection() {
        Some(c) => c,
        None => return format_json_error("No connection initialized"),
    };

    // Парсинг JSON параметров
    let mut parsed_params: Value = match serde_json::from_str(&params_json) {
        Ok(params) => params,
        Err(e) => return format_json_error(e)
    };

    let params_array = match parsed_params.as_array_mut() {
        Some(array) => array,
        None => return format_json_error("Parameters must be a JSON array")
    };

    let convert = process_blobs(params_array);

    // Определяем тип запроса
    if query.trim_start().to_uppercase().starts_with("SELECT") || force_result == true {
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
                    Ok(mut rows) =>  rows_to_json_array(&mut rows, &cols),
                    Err(e) => format_json_error(e)
                }

            }
            Err(e) => format_json_error(e)
        }
    } else {

        match conn.execute(&query, convert) {
            Ok(_) => r#"{"result": true}"#.to_string(),
            Err(e) => format_json_error(e),
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

                    let val = match row.get_ref(i) {
                        Ok(v) => v,
                        Err(e) => {
                            current.insert("error".to_string(), Value::String(e.to_string()));
                            continue;
                        }
                    };

                    let json_val = from_sql_to_json(val);

                    current.insert(cols[i].to_string(), json_val);
                };

                json_array.push(current);

            }

            Ok(None) => break,
            Err(e) => {
                current.insert("error".to_string(), Value::String(e.to_string()));
            }

        }
    }

    json!({ "result": true, "data": json_array }).to_string()
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

fn process_blobs(json_array: &mut Vec<Value>) -> ParamsFromIter<Vec<SqlValue>> {

    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        match item {
            Value::Null => { result.push(SqlValue::Null); },
            Value::Bool(b) => { result.push(SqlValue::from(*b)); }
            Value::String(s) => { result.push(SqlValue::from(s.clone())); }
            Value::Number(num) => {
                if let Some(int_val) = num.as_i64() {
                    result.push(SqlValue::from(int_val));
                } else if let Some(float_val) = num.as_f64() {
                    result.push(SqlValue::from(float_val));
                } else {
                    result.push(SqlValue::from(0));
                }
            }
            Value::Object(obj) => {

                if let Some(Value::String(blob_str)) = obj.get("blob") {

                    let cleaned_base64 = blob_str.replace(&['\n', '\r', ' '][..], "");

                    match general_purpose::STANDARD.decode(cleaned_base64) {
                        Ok(decoded_blob) => result.push(SqlValue::Blob(decoded_blob)),
                        Err(e) => result.push(SqlValue::Blob(e.to_string().into_bytes()))
                    }
                } else { result.push(SqlValue::Blob([].to_vec())) }

            }
            _ => { result.push(SqlValue::Null) }
        }
    }
   params_from_iter(result)
}

pub fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}