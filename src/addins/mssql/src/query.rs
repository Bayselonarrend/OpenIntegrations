use std::collections::BTreeMap;
use std::f64;

use chrono::{DateTime, FixedOffset, NaiveDate, NaiveDateTime, NaiveTime, Utc};
use common_core::{FromJanx, JanxValue};
use dateparser::parse;
use tiberius::numeric::Decimal;
use tiberius::{Client, Column, ColumnType, Row, ToSql};
use tiberius::xml::XmlData;
use tokio::net::TcpStream;
use tokio_util::compat::Compat;
use uuid::Uuid;

pub async fn execute(
    client: &mut Client<Compat<TcpStream>>,
    query: &str,
    params: Vec<JanxValue>,
    force_result: bool,
) -> Result<Option<Vec<JanxValue>>, String> {
    let params_array = process_params(&params)?;
    let normalized_query = query.trim_start().to_uppercase();
    let params_refs: Vec<&dyn ToSql> = params_array.iter().map(|b| b.as_ref()).collect();

    if normalized_query.starts_with("SELECT") || force_result {
        match client.query(query, &params_refs).await {
            Ok(stream) => {
                let rows = match stream.into_results().await {
                    Ok(rows) => rows.into_iter().flatten().collect(),
                    Err(e) => return Err(e.to_string()),
                };
                Ok(Some(rows_to_janx(rows)))
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

fn rows_to_janx(rows: Vec<Row>) -> Vec<JanxValue> {
    let mut janx_array = Vec::new();

    for row in rows {
        let mut row_map = BTreeMap::new();
        for (i, column) in row.columns().iter().enumerate() {
            let column_name = column.name().to_string();
            let value = cell_to_janx(&row, i, column);
            row_map.insert(column_name, value);
        }
        janx_array.push(JanxValue::Object(row_map));
    }

    janx_array
}

fn cell_to_janx(row: &Row, index: usize, column: &Column) -> JanxValue {
    match column.column_type() {
        ColumnType::Null => JanxValue::Null,
        ColumnType::Bit | ColumnType::Bitn => match try_get_any_bit(row, index) {
            Some(i) => JanxValue::Number(i.into()),
            None => JanxValue::Null,
        },
        ColumnType::Int1
        | ColumnType::Int2
        | ColumnType::Int4
        | ColumnType::Int8
        | ColumnType::Intn => match try_get_any_int(row, index) {
            Some(i) => JanxValue::Number(i.into()),
            None => JanxValue::Null,
        },
        ColumnType::Float4
        | ColumnType::Float8
        | ColumnType::Floatn
        | ColumnType::Money
        | ColumnType::Money4 => match try_get_any_float(row, index) {
            Some(i) => serde_json::Number::from_f64(i)
                .map(JanxValue::Number)
                .unwrap_or(JanxValue::Null),
            None => JanxValue::Null,
        },
        ColumnType::Decimaln | ColumnType::Numericn => row
            .try_get::<Decimal, _>(index)
            .ok()
            .flatten()
            .and_then(|f| {
                serde_json::Number::from_f64(f64::try_from(f).unwrap_or(0.0)).map(JanxValue::Number)
            })
            .unwrap_or(JanxValue::Null),
        ColumnType::Daten => row
            .try_get::<NaiveDate, _>(index)
            .ok()
            .flatten()
            .map(|d| JanxValue::String(d.format("%Y-%m-%d").to_string()))
            .unwrap_or(JanxValue::Null),
        ColumnType::Datetime
        | ColumnType::Datetime2
        | ColumnType::Datetime4
        | ColumnType::Datetimen => row
            .try_get::<NaiveDateTime, _>(index)
            .ok()
            .flatten()
            .map(|dt| JanxValue::String(dt.format("%Y-%m-%dT%H:%M:%S").to_string()))
            .unwrap_or(JanxValue::Null),
        ColumnType::Timen => row
            .try_get::<NaiveTime, _>(index)
            .ok()
            .flatten()
            .map(|t| JanxValue::String(t.format("%H:%M:%S").to_string()))
            .unwrap_or(JanxValue::Null),
        ColumnType::DatetimeOffsetn => row
            .try_get::<DateTime<Utc>, _>(index)
            .ok()
            .flatten()
            .map(|dt| JanxValue::String(dt.to_rfc3339()))
            .unwrap_or(JanxValue::Null),
        ColumnType::BigVarBin | ColumnType::BigBinary => row
            .try_get::<&[u8], _>(index)
            .ok()
            .flatten()
            .map(bytes_to_janx)
            .unwrap_or(JanxValue::Null),
        ColumnType::Guid => row
            .try_get::<Uuid, _>(index)
            .ok()
            .flatten()
            .map(|u| JanxValue::String(u.to_string()))
            .unwrap_or(JanxValue::Null),
        ColumnType::Xml => row
            .try_get::<&XmlData, _>(index)
            .ok()
            .flatten()
            .map(|d| JanxValue::String(d.clone().into_string()))
            .unwrap_or(JanxValue::Null),
        _ => row
            .try_get::<&str, _>(index)
            .ok()
            .flatten()
            .map(|s| JanxValue::String(s.to_string()))
            .unwrap_or(JanxValue::Null),
    }
}

fn process_params(json_array: &[JanxValue]) -> Result<Vec<Box<dyn ToSql>>, String> {
    let mut result = Vec::new();

    for item in json_array.iter() {
        let param: Box<dyn ToSql> = match item {
            JanxValue::Null => Box::new(None::<i32>),
            JanxValue::Bool(b) => Box::new(*b),
            JanxValue::Number(n) if n.is_i64() => Box::new(n.as_i64().unwrap_or(0)),
            JanxValue::Number(n) if n.is_f64() => Box::new(n.as_f64().unwrap_or(0.0)),
            JanxValue::Number(n) => Box::new(n.as_f64().unwrap_or(0.0)),
            JanxValue::String(s) => Box::new(s.clone()),
            JanxValue::Object(obj) => process_object(obj)?,
            JanxValue::Binary(_) => {
                return Err(
                    "Binary parameter must be wrapped in a typed object, e.g. {\"BYTES\": ...}"
                        .to_string(),
                )
            }
            JanxValue::Array(_) => {
                return Err("Array is not supported as a SQL parameter".to_string())
            }
        };
        result.push(param);
    }
    Ok(result)
}

fn process_object(object: &BTreeMap<String, JanxValue>) -> Result<Box<dyn ToSql>, String> {
    if object.len() != 1 {
        return Err(
            "Object must have exactly one key-value pair specifying the type and value".to_string(),
        );
    }

    let (key, value) = object
        .iter()
        .next()
        .ok_or_else(|| "Empty object: expected one key-value pair".to_string())?;

    let param: Box<dyn ToSql> = match key.to_uppercase().as_str() {
        "TINYINT" => match value.as_i64() {
            Some(num) => Box::new(num as u8),
            None => Box::new(0u8),
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
        "NVARCHAR" => Box::new(
            String::from_janx(value)
                .unwrap_or_default(),
        ),
        "BYTES" => {
            let bytes = Vec::<u8>::from_janx(value)
                .ok_or_else(|| "Invalid value for BYTES: expected Janx binary".to_string())?;
            Box::new(bytes)
        }
        "UUID" => match String::from_janx(value).and_then(|s| Uuid::parse_str(&s).ok()) {
            Some(uuid) => Box::new(uuid),
            None => Box::new(Uuid::nil()),
        },
        "NUMERIC" | "DECIMAL" => {
            match value.as_f64().and_then(|v| Decimal::from_f64_retain(v)) {
                Some(num) => Box::new(num),
                None => Box::new(Decimal::from(0)),
            }
        }
        "XML" => Box::new(XmlData::new(
            String::from_janx(value).unwrap_or_default(),
        )),
        "DATE" => match String::from_janx(value)
            .and_then(|s| parse(&s).ok().map(|dt| dt.date_naive()))
        {
            Some(date) => Box::new(date),
            None => Box::new(None::<NaiveDate>),
        },
        "TIME" => match String::from_janx(value).and_then(|s| parse(&s).ok().map(|dt| dt.time())) {
            Some(time) => Box::new(time),
            None => Box::new(None::<NaiveTime>),
        },
        "DATETIME" => match String::from_janx(value)
            .and_then(|s| parse(&s).ok().map(|dt| dt.naive_local()))
        {
            Some(dt) => Box::new(dt),
            None => Box::new(None::<NaiveDateTime>),
        },
        "DATETIMEOFFSET" => {
            match String::from_janx(value).and_then(|s| parse_date_tz(&s).ok()) {
                Some(dt) => Box::new(dt),
                None => Box::new(None::<DateTime<Utc>>),
            }
        }
        _ => Box::new(
            String::from_janx(value)
                .unwrap_or_default(),
        ),
    };
    Ok(param)
}

fn parse_date_tz(input: &str) -> Result<DateTime<FixedOffset>, String> {
    DateTime::parse_from_rfc3339(input).or_else(|_| {
        parse(input)
            .map(|dt| dt.fixed_offset())
            .map_err(|e| format!("Failed to parse date: {}", e))
    })
}

fn bytes_to_janx(bytes: &[u8]) -> JanxValue {
    JanxValue::binary(bytes.to_vec())
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
