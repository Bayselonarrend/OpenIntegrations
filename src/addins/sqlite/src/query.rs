use std::collections::BTreeMap;

use common_core::{FromJanx, JanxNumber, JanxValue};
use rusqlite::{
    types::Value as SqlValue, types::ValueRef, Connection, LoadExtensionGuard, ParamsFromIter,
    params_from_iter,
};

pub fn execute(
    conn: &mut Connection,
    text: &str,
    params: Vec<JanxValue>,
    force_result: bool,
) -> Result<Option<Vec<JanxValue>>, String> {
    let convert = process_params(&params)?;

    if text.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        let mut query_result = conn.prepare(text).map_err(|e| e.to_string())?;
        let cols: Vec<String> = query_result
            .column_names()
            .iter()
            .map(|name| name.to_string())
            .collect();
        let mut rows = query_result.query(convert).map_err(|e| e.to_string())?;
        Ok(Some(rows_to_values(&mut rows, &cols)))
    } else {
        conn.execute(text, convert).map_err(|e| e.to_string())?;
        Ok(None)
    }
}

pub fn load_extension(conn: &mut Connection, path: String, point: String) -> Result<(), String> {
    let entry_point = if point.is_empty() {
        None
    } else {
        Some(point.as_str())
    };

    unsafe {
        let _guard = LoadExtensionGuard::new(conn).map_err(|e| e.to_string())?;
        conn.load_extension(path, entry_point)
            .map_err(|e| e.to_string())
    }
}

fn rows_to_values(rows: &mut rusqlite::Rows, cols: &Vec<String>) -> Vec<JanxValue> {
    let mut janx_array = Vec::new();
    loop {
        let mut row_map = BTreeMap::new();
        match rows.next() {
            Ok(Some(row)) => {
                for i in 0..cols.len() {
                    let key = cols[i].to_string();
                    let val = match row.get_ref(i) {
                        Ok(v) => from_sql_value(v),
                        Err(e) => JanxValue::String(e.to_string()),
                    };
                    row_map.insert(key, val);
                }
            }
            Err(e) => {
                row_map.insert("ROW_ERR".to_string(), JanxValue::String(e.to_string()));
            }
            Ok(None) => break,
        }
        janx_array.push(JanxValue::Object(row_map));
    }
    janx_array
}

fn from_sql_value(value: ValueRef) -> JanxValue {
    match value {
        ValueRef::Null => JanxValue::Null,
        ValueRef::Integer(i) => JanxValue::Number(i.into()),
        ValueRef::Real(f) => {
            JanxNumber::from_f64(f)
                .map(JanxValue::Number)
                .unwrap_or(JanxValue::Null)
        }
        ValueRef::Text(t) => JanxValue::String(String::from_utf8_lossy(t).into_owned()),
        ValueRef::Blob(b) => JanxValue::binary(b.to_vec()),
    }
}

fn process_params(json_array: &[JanxValue]) -> Result<ParamsFromIter<Vec<SqlValue>>, String> {
    let mut result = Vec::new();

    for item in json_array.iter() {
        let processed: SqlValue = match item {
            JanxValue::Null => SqlValue::Null,
            JanxValue::Bool(b) => SqlValue::from(*b),
            JanxValue::String(s) => SqlValue::from(s.clone()),
            JanxValue::Number(num) => {
                if let Some(int_val) = num.as_i64() {
                    SqlValue::from(int_val)
                } else if let Some(float_val) = num.as_f64() {
                    SqlValue::from(float_val)
                } else {
                    SqlValue::from(0)
                }
            }
            JanxValue::Object(obj) => process_object(obj)?,
            JanxValue::Binary(_) => {
                return Err("Binary parameter must be wrapped in a typed object, e.g. {\"BLOB\": ...}".to_string())
            }
            JanxValue::Array(_) => {
                return Err("Array is not supported as a SQL parameter".to_string())
            }
        };
        result.push(processed);
    }
    Ok(params_from_iter(result))
}

fn process_object(object: &BTreeMap<String, JanxValue>) -> Result<SqlValue, String> {
    if object.len() != 1 {
        return Err(
            "Object must have exactly one key-value pair specifying the type and value".to_string(),
        );
    }

    let (key, value) = object
        .iter()
        .next()
        .ok_or_else(|| "Empty object: expected one key-value pair".to_string())?;

    let key_upper = key.as_str().to_uppercase();
    let processed = match key_upper.as_str() {
        "BOOL" => value
            .as_bool()
            .map(SqlValue::from)
            .unwrap_or(SqlValue::from(false)),
        "INTEGER" => value
            .as_i64()
            .map(SqlValue::from)
            .unwrap_or(SqlValue::from(0)),
        "REAL" => value
            .as_f64()
            .map(SqlValue::from)
            .unwrap_or(SqlValue::from(0)),
        "BLOB" => {
            let bytes = Vec::<u8>::from_janx(value)
                .ok_or_else(|| "Invalid value for BLOB: expected Janx binary".to_string())?;
            SqlValue::Blob(bytes)
        }
        _ => SqlValue::from(
            String::from_janx(value)
                .unwrap_or_default(),
        ),
    };
    Ok(processed)
}
