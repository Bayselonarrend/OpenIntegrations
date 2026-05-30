use chrono::*;
use common_core::{FromJanx, JanxValue};
use dateparser::parse;
use mysql::prelude::Queryable;
use mysql::PooledConn;
use mysql_common::constants::ColumnType;
use mysql_common::packets::Column;
use std::collections::BTreeMap;

pub fn execute(
    conn: &mut PooledConn,
    text: &str,
    params: Vec<JanxValue>,
    force_result: bool,
) -> Result<Option<Vec<JanxValue>>, String> {
    let params_array = process_mysql_params(&params)?;

    if text.trim_start().to_uppercase().starts_with("SELECT") || force_result {
        let mut rows: Vec<mysql::Row> = conn
            .exec(text, params_array)
            .map_err(|e| e.to_string())?;
        Ok(Some(rows_to_janx_array(&mut rows)?))
    } else if params_array.is_empty() {
        conn.query_drop(text).map_err(|e| e.to_string())?;
        Ok(None)
    } else {
        conn.exec_drop(text, params_array)
            .map_err(|e| e.to_string())?;
        Ok(None)
    }
}

fn rows_to_janx_array(rows: &mut Vec<mysql::Row>) -> Result<Vec<JanxValue>, String> {
    let mut janx_array = Vec::new();

    for row in rows {
        let mut row_map = BTreeMap::new();
        for (i, column) in row.columns_ref().iter().enumerate() {
            let column_name = column.name_str().to_string();
            let value = match row.get::<Option<mysql::Value>, usize>(i) {
                Some(mysql_value) => match mysql_value {
                    Some(value) => from_sql_to_janx(value, column),
                    None => JanxValue::Null,
                },
                None => JanxValue::Null,
            };
            row_map.insert(column_name, value);
        }
        janx_array.push(JanxValue::Object(row_map));
    }
    Ok(janx_array)
}

fn from_sql_to_janx(value: mysql::Value, column: &Column) -> JanxValue {
    match value {
        mysql::Value::NULL => JanxValue::Null,
        mysql::Value::Int(i) => JanxValue::Number(i.into()),
        mysql::Value::Double(d) => serde_json::Number::from_f64(d)
            .map(JanxValue::Number)
            .unwrap_or(JanxValue::Null),
        mysql::Value::Float(f) => serde_json::Number::from_f64(f as f64)
            .map(JanxValue::Number)
            .unwrap_or(JanxValue::Null),
        mysql::Value::UInt(i) => serde_json::Number::from_f64(i as f64)
            .map(JanxValue::Number)
            .unwrap_or(JanxValue::Null),
        mysql::Value::Bytes(b) => process_bytes(b, column),
        mysql::Value::Date(year, month, day, hour, minute, second, micros) => {
            let date = NaiveDate::from_ymd_opt(year as i32, month as u32, day as u32)
                .unwrap_or_else(|| NaiveDate::from_ymd_opt(1970, 1, 1).unwrap());
            let time =
                NaiveTime::from_hms_micro_opt(hour as u32, minute as u32, second as u32, micros)
                    .unwrap_or_else(|| NaiveTime::from_hms_opt(0, 0, 0).unwrap());
            let datetime = NaiveDateTime::new(date, time);

            let datetime_utc = DateTime::<Utc>::from_naive_utc_and_offset(datetime, Utc);
            JanxValue::String(datetime_utc.to_rfc3339())
        }
        mysql::Value::Time(_is_neg, days, hours, minutes, seconds, micros) => {
            let date = NaiveDate::from_ymd_opt(1970, 1, 1).unwrap();
            let total_hours = days * 24 + (hours as u32);
            let time =
                NaiveTime::from_hms_micro_opt(total_hours, minutes as u32, seconds as u32, micros)
                    .unwrap_or_else(|| NaiveTime::from_hms_opt(0, 0, 0).unwrap());
            let datetime = NaiveDateTime::new(date, time);
            let datetime_utc = DateTime::<Utc>::from_naive_utc_and_offset(datetime, Utc);
            JanxValue::String(datetime_utc.to_rfc3339())
        }
    }
}

fn process_bytes(bytes: Vec<u8>, column: &Column) -> JanxValue {
    if is_text_type(column) {
        match String::from_utf8(bytes) {
            Ok(text) => JanxValue::String(text),
            Err(e) => JanxValue::String(e.to_string()),
        }
    } else {
        JanxValue::binary(bytes)
    }
}

fn is_text_type(column: &Column) -> bool {
    let column_type = column.column_type();
    match column_type {
        ColumnType::MYSQL_TYPE_STRING
        | ColumnType::MYSQL_TYPE_VAR_STRING
        | ColumnType::MYSQL_TYPE_VARCHAR
        | ColumnType::MYSQL_TYPE_JSON => true,
        ColumnType::MYSQL_TYPE_TINY_BLOB
        | ColumnType::MYSQL_TYPE_MEDIUM_BLOB
        | ColumnType::MYSQL_TYPE_LONG_BLOB
        | ColumnType::MYSQL_TYPE_BLOB => column.character_set() != 63,
        _ if column_type.is_enum_or_set_type() => true,
        _ => false,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn column(column_type: ColumnType, character_set: u16) -> Column {
        Column::new(column_type).with_character_set(character_set)
    }

    #[test]
    fn text_blob_wire_types_use_charset_not_binary() {
        assert!(is_text_type(&column(
            ColumnType::MYSQL_TYPE_LONG_BLOB,
            mysql_common::constants::UTF8_GENERAL_CI,
        )));
        assert!(is_text_type(&column(
            ColumnType::MYSQL_TYPE_MEDIUM_BLOB,
            mysql_common::constants::UTF8MB4_GENERAL_CI,
        )));
        assert!(!is_text_type(&column(ColumnType::MYSQL_TYPE_MEDIUM_BLOB, 63)));
        assert!(!is_text_type(&column(ColumnType::MYSQL_TYPE_LONG_BLOB, 63)));
    }

    #[test]
    fn varchar_and_json_are_text() {
        assert!(is_text_type(&column(ColumnType::MYSQL_TYPE_VAR_STRING, 63)));
        assert!(is_text_type(&column(ColumnType::MYSQL_TYPE_JSON, 63)));
    }

    #[test]
    fn process_bytes_returns_string_for_text_blob_columns() {
        let value = process_bytes(
            b"mediumtext".to_vec(),
            &column(
                ColumnType::MYSQL_TYPE_LONG_BLOB,
                mysql_common::constants::UTF8_GENERAL_CI,
            ),
        );
        assert_eq!(value, JanxValue::String("mediumtext".into()));
    }

    #[test]
    fn process_bytes_returns_binary_for_blob_columns() {
        let bytes = b"binary payload".to_vec();
        let value = process_bytes(
            bytes.clone(),
            &column(ColumnType::MYSQL_TYPE_MEDIUM_BLOB, 63),
        );
        assert_eq!(value, JanxValue::Binary(bytes));
    }
}

fn process_mysql_params(json_array: &[JanxValue]) -> Result<Vec<mysql::Value>, String> {
    let mut result = Vec::new();

    for item in json_array.iter() {
        result.push(match item {
            JanxValue::Null => mysql::Value::NULL,
            JanxValue::Object(obj) => {
                if let Some((key, value)) = obj.iter().next() {
                    match key.to_uppercase().as_str() {
                        "BYTES" => {
                            let binary = Vec::<u8>::from_janx(value)
                                .ok_or_else(|| "Invalid value for BYTES: expected Janx binary".to_string())?;
                            mysql::Value::Bytes(binary)
                        }
                        "UINT" => mysql::Value::UInt(value.as_i64().unwrap_or(0) as u64),
                        "INT" => mysql::Value::Int(value.as_i64().unwrap_or(0)),
                        "FLOAT" => mysql::Value::Float(value.as_f64().unwrap_or(0.0) as f32),
                        "DOUBLE" => mysql::Value::Double(value.as_f64().unwrap_or(0.0)),
                        "DATE" => match parse(value.as_str().unwrap_or("")) {
                            Ok(datetime) => mysql::Value::from(datetime.naive_utc()),
                            Err(_) => mysql::Value::from(
                                chrono::DateTime::from_timestamp(0, 0).unwrap().naive_utc(),
                            ),
                        },
                        "TIME" => match parse(value.as_str().unwrap_or("")) {
                            Ok(datetime) => mysql::Value::from(datetime.time()),
                            Err(_) => mysql::Value::from(
                                chrono::DateTime::from_timestamp(0, 0).unwrap().time(),
                            ),
                        },
                        "TEXT" => match value.as_str() {
                            Some(value_str) => mysql::Value::Bytes(value_str.as_bytes().to_vec()),
                            None => mysql::Value::NULL,
                        },
                        _ => janx_to_mysql_value(item),
                    }
                } else {
                    mysql::Value::NULL
                }
            }
            _ => janx_to_mysql_value(item),
        })
    }
    Ok(result)
}

fn janx_to_mysql_value(value: &JanxValue) -> mysql::Value {
    match value {
        JanxValue::Null => mysql::Value::NULL,
        JanxValue::Bool(b) => mysql::Value::Int(if *b { 1 } else { 0 }),
        JanxValue::Number(n) => {
            if let Some(i) = n.as_i64() {
                mysql::Value::Int(i)
            } else if let Some(f) = n.as_f64() {
                mysql::Value::Double(f)
            } else {
                mysql::Value::NULL
            }
        }
        JanxValue::String(s) => mysql::Value::Bytes(s.as_bytes().to_vec()),
        JanxValue::Binary(b) => mysql::Value::Bytes(b.clone()),
        JanxValue::Array(_) | JanxValue::Object(_) => mysql::Value::NULL,
    }
}
