use rusqlite::{LoadExtensionGuard, types::ValueRef, types::Value as SqlValue, params_from_iter, ParamsFromIter};
use serde_json::{Value, json, Map};
use crate::component;
use base64::{engine::general_purpose, Engine as _};
use crate::component::AddIn;

pub fn init_query(add_in: &mut AddIn, text: &str, force_result: bool) -> String {

    let key = add_in.datasets.init_query();
    add_in.datasets.set_text(&key, text);
    add_in.datasets.set_force_result(&key, force_result);

    key
}

pub fn add_query_param(add_in: &mut AddIn, key: &str, param: String) -> String {

    let value: Value = match serde_json::from_str(&param) {
        Ok(param) => param,
        Err(e) => return format_json_error(&e.to_string()),
    };

    add_in.datasets.add_param(key, value);
    json!({"result": true}).to_string()

}

pub fn execute_query(
    client: &mut AddIn,
    query: String,
    params_json: String,
    force_result: bool
) -> String {

    let conn_arc = match client.get_connection() {
        Some(c) => c,
        None => return format_json_error("No connection initialized"),
    };

    let conn = match conn_arc.lock() {
        Ok(conn) => conn,
        Err(_) => return format_json_error("Failed to acquire connection lock"),
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

    let convert = match process_blobs(params_array){
        Ok(v) => v,
        Err(e) => return format_json_error(e)
    };

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

pub fn load_extension(client: &mut component::AddIn, path: String, point: String) -> String {
    let conn_arc = match client.get_connection() {
        Some(c) => c,
        None => return format_json_error("No connection initialized"),
    };

    let conn = match conn_arc.lock() {
        Ok(conn) => conn,
        Err(_) => return format_json_error("Failed to acquire connection lock"),
    };

    let entry_point = match point.is_empty() {
        true => None,
        false => Some(point.as_str())
    };

    unsafe {
        // Здесь мы берем ссылку на Connection из MutexGuard
        let _guard = match LoadExtensionGuard::new(&*conn) {
            Ok(g) => g,
            Err(e) => return format_json_error(e),
        };

        match conn.load_extension(path, entry_point) {
            Ok(_) => r#"{"result": true}"#.to_string(),
            Err(e) => format_json_error(e)
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

fn process_blobs(json_array: &mut Vec<Value>) -> Result<ParamsFromIter<Vec<SqlValue>>, String> {

    let mut result = Vec::new();

    for item in json_array.iter_mut() {
        let processed: SqlValue = match item {
            Value::Null => SqlValue::Null,
            Value::Bool(b) => SqlValue::from(*b),
            Value::String(s) => SqlValue::from(s.clone()),
            Value::Number(num) => {
                if let Some(int_val) = num.as_i64() {
                    SqlValue::from(int_val)
                } else if let Some(float_val) = num.as_f64() {
                    SqlValue::from(float_val)
                } else {
                    SqlValue::from(0)
                }
            }
            Value::Object(obj) => process_object(obj)?,
            _ => SqlValue::Null
        };

        result.push(processed);
    }

   Ok(params_from_iter(result))
}

fn process_object(object: &Map<String, Value>) -> Result<SqlValue, String> {
    if object.len() != 1 {
        return Err("Object must have exactly one key-value pair specifying the type and value".to_string());
    }

    let (key, value) = object.iter().next()
        .ok_or_else(|| "Empty object: expected one key-value pair".to_string())?;

    let key_upper = key.as_str().to_uppercase();

    let processed = match key_upper.as_str() {
        "BOOL" => value
            .as_bool()
            .map(|v| SqlValue::from(*v))
            .unwrap_or(SqlValue::from(false)),
        "INTEGER" => value
            .as_i64()
            .map(|v| SqlValue::from(*v))
            .unwrap_or(SqlValue::from(0)),
        "REAL" => value
            .as_f64()
            .map(|v| SqlValue::from(*v))
            .unwrap_or(SqlValue::from(0)),
        "BLOB" => {

            let cleaned_base64 = value.to_string().replace(&['\n', '\r', ' '][..], "");

            match general_purpose::STANDARD.decode(cleaned_base64) {
                Ok(decoded_blob) => SqlValue::Blob(decoded_blob),
                Err(e) => SqlValue::Blob(e.to_string().into_bytes())
            }
        }
        _ => value
            .to_string()
            .map(|v| SqlValue::from(*v))
            .unwrap_or(SqlValue::from("")),
    };

    Ok(processed)
}

pub fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}