use std::str::FromStr;
use rusqlite::{LoadExtensionGuard, types::ValueRef, types::Value as SqlValue, params_from_iter, ParamsFromIter};
use serde_json::{Value, json, Map};
use base64::{engine::general_purpose, Engine as _};
use common_binary::vault::{BinaryVault, VaultKey};
use common_utils::utils::{json_error, json_success};
use crate::AddIn;

impl AddIn{
    pub fn execute_query(&self, key: &str) -> String {

        let conn_arc = match self.get_connection() {
            Some(c) => c,
            None => return json_error("No connection initialized"),
        };

        let conn = match conn_arc.lock() {
            Ok(conn) => conn,
            Err(_) => return json_error("Failed to acquire connection lock"),
        };

        let query = match self.datasets.get_query(key){
            Some(q) => q,
            None => return json_error(format!("No query found by key: {}", key)),
        };

        let params = query.params;
        let text = query.text;
        let force_result = query.force_result;

        let convert = match process_blobs(&self.binary_vault, &params){
            Ok(v) => v,
            Err(e) => return json_error(&e)
        };

        if text.trim_start().to_uppercase().starts_with("SELECT") || force_result == true {
            match conn.prepare(&text) {
                Ok(mut query_result) => {

                    let cols: Vec<String> = query_result
                        .column_names()
                        .iter()
                        .map(|name| name.to_string())
                        .collect();

                    match query_result.query(convert){
                        Ok(mut rows) =>  {
                            let processed_rows = rows_to_json_array(&mut rows, &cols);
                            self.datasets.set_results(&key, processed_rows);
                            json!({"result": true, "data": true}).to_string()
                        },
                        Err(e) => json_error(&e)
                    }
                }
                Err(e) => json_error(&e)
            }
        } else {
            match conn.execute(&text, convert) {
                Ok(_) => json!({"result": true, "data": false}).to_string(),
                Err(e) => json_error(&e),
            }
        }
    }

    pub fn load_extension(&mut self, path: String, point: String) -> String {

        let conn_arc = match self.get_connection() {
            Some(c) => c,
            None => return json_error("No connection initialized"),
        };

        let conn = match conn_arc.lock() {
            Ok(conn) => conn,
            Err(_) => return json_error("Failed to acquire connection lock"),
        };

        let entry_point = match point.is_empty() {
            true => None,
            false => Some(point.as_str())
        };

        unsafe {
            let _guard = match LoadExtensionGuard::new(&*conn) {
                Ok(g) => g,
                Err(e) => return json_error(&e),
            };
            match conn.load_extension(path, entry_point) {
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            }
        }
    }

}

fn rows_to_json_array(rows: &mut rusqlite::Rows, cols: &Vec<String>) -> Vec<Value> {
    let mut json_array = Vec::new();
    loop {
        let mut row_map = Map::new();
        match rows.next() {
            Ok(Some(row)) => {
                for i in 0..cols.len() {
                    let key = cols[i].to_string();
                    let val = match row.get_ref(i) {
                        Ok(v) => from_sql_to_json(v),
                        Err(e) => json!({"error": e.to_string()})
                    };
                    row_map.insert(key, val);
                };
            }
            Err(e) => { row_map.insert("ROW_ERR".to_string(), Value::String(e.to_string())); },
            Ok(None) => break,
        }
        json_array.push(Value::Object(row_map));
    }
    json_array
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
            let base64_string = general_purpose::STANDARD.encode(b);
            let mut blob_object = serde_json::Map::new();
            blob_object.insert("blob".to_string(), Value::String(base64_string));
            Value::Object(blob_object)
        },
    }
}

fn process_blobs(binary_vault: &BinaryVault, json_array: &Vec<Value>) -> Result<ParamsFromIter<Vec<SqlValue>>, String> {
    let mut result = Vec::new();

    for item in json_array.iter() {
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
            Value::Object(obj) => process_object(binary_vault, obj)?,
            _ => SqlValue::Null
        };
        result.push(processed);
    }
   Ok(params_from_iter(result))
}

fn process_object(binary_vault: &BinaryVault, object: &Map<String, Value>) -> Result<SqlValue, String> {
    if object.len() != 1 {
        return Err("Object must have exactly one key-value pair specifying the type and value".to_string());
    }

    let (key, value) = object.iter().next()
        .ok_or_else(|| "Empty object: expected one key-value pair".to_string())?;

    let key_upper = key.as_str().to_uppercase();
    let processed = match key_upper.as_str() {
        "BOOL" => value
            .as_bool()
            .map(|v| SqlValue::from(v))
            .unwrap_or(SqlValue::from(false)),
        "INTEGER" => value
            .as_i64()
            .map(|v| SqlValue::from(v))
            .unwrap_or(SqlValue::from(0)),
        "REAL" => value
            .as_f64()
            .map(|v| SqlValue::from(v))
            .unwrap_or(SqlValue::from(0)),
        "BLOB" => {
            let key = value.as_str().ok_or("Binary vault ket must be string")?;
            let binary = binary_vault
                .retrieve(&VaultKey::from_str(key).unwrap_or_default())
                .map_err(|_| {"Value not found in binary vault!".to_string() })?;
            SqlValue::Blob(binary)
        },
        _ => SqlValue::from(value.as_str().unwrap_or("").to_string())
    };
    Ok(processed)
}
