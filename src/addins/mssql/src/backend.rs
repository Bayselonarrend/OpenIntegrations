use serde_json::{json, Value, Number};
use tiberius::{Client, Config, ToSql, Row, Column};
use tokio::net::TcpStream;
use tokio_util::compat::{Compat, TokioAsyncWriteCompatExt};
use std::sync::mpsc::{self, Sender};
use std::thread::{self, JoinHandle};
use chrono::{NaiveDate, NaiveDateTime, NaiveTime, DateTime, Utc};
use uuid::Uuid;
use base64::{engine::general_purpose, Engine as _};
use std::f64;
use std::str::FromStr;
use chrono::*;
use common_binary::vault::{BinaryVault, VaultKey};
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::json_error;
use tiberius::numeric::Decimal;
use tiberius::ColumnType;
use tiberius::xml::XmlData;
use dateparser::parse;

pub struct MSSQLBackend {
    tx: Sender<BackendCommand>,
    thread_handle: Option<JoinHandle<()>>,
    pub(crate) binary_vault: BinaryVault
}

enum BackendCommand {
    Connect {
        conn_str: String,
        tls: Option<TlsSettings>,
        response: Sender<String>,
    },
    Execute {
        query: String,
        params_json: Vec<Value>,
        force_result: bool,
        response: Sender<Result<Option<Vec<Value>>, String>>,
    },
    Shutdown,
}

impl MSSQLBackend {
    pub fn new() -> Self {
        let (tx, rx) = mpsc::channel();

        let binary_vault = BinaryVault::new();
        let vault_clone = binary_vault.clone();

        let thread_handle = thread::Builder::new()
            .name("opi_mssql_backend".to_string())
            .spawn(move || {

            let rt = tokio::runtime::Runtime::new().unwrap();

            let mut client = None;

            while let Ok(cmd) = rx.recv() {

                match cmd {
                    BackendCommand::Connect { conn_str, tls, response } => {

                        let result = rt.block_on(async {
                            let mut config = Config::from_ado_string(&conn_str)?;

                            if let Some(tls) = &tls {
                                if tls.enabled(){
                                    if tls.accept_invalid_certs {
                                        config.trust_cert();
                                    } else if !tls.ca_cert_path.is_empty() {
                                        config.trust_cert_ca(&tls.ca_cert_path);
                                    }
                                }
                            }
                            let tcp = TcpStream::connect(config.get_addr()).await?;
                            tcp.set_nodelay(true)?;
                            Client::connect(config, tcp.compat_write()).await
                        });

                        client = match result{
                            Ok(client) => {

                                let process_info = format!(
                                    "Process: {} (PID: {})\nThread: {:?} (TID: {})",
                                    std::env::current_exe()
                                        .unwrap_or_default()
                                        .display(),
                                    std::process::id(),
                                    std::thread::current().name().unwrap_or("unnamed"),
                                    thread_id::get()
                                );

                                let _ = response.send(json!({"result": true, "thread_id": process_info}).to_string());
                                Some(client)
                            },
                            Err(e) => {
                                let _ =  response.send(json_error(&e));
                                None
                            }
                        };
                    }

                    BackendCommand::Execute { query, params_json, force_result, response } => {
                        let result = if let Some(client) = &mut client {
                            rt.block_on(async {
                                Self::execute_query_internal(&vault_clone, client, &query, params_json, force_result).await
                            })
                        } else {
                            Err("Not connected".to_string())
                        };

                        let _ = response.send(result);
                    }
                    BackendCommand::Shutdown => break,
                }
            }
        }).unwrap();

        Self {
            tx,
            thread_handle: Some(thread_handle),
            binary_vault
        }
    }

    pub fn connect(&self, conn_str: String, tls: Option<TlsSettings>) -> String {

        let (response_tx, response_rx) = mpsc::channel();
        let sending = self.tx.send(BackendCommand::Connect {
            conn_str,
            tls,
            response: response_tx,
        });
        match sending{
            Err(e) => {return format!("Sending error: {}", e.to_string())}
            _ => {}
        };
        response_rx.recv().unwrap_or_else(|e| format!("Response receiver error: {}", e.to_string()))
    }

    pub fn execute_query(&self, query: String, params_json: Vec<Value>, force_result: bool) -> Result<Option<Vec<Value>>, String> {

        let (response_tx, response_rx) = mpsc::channel::<Result<Option<Vec<Value>>, String>>();
        let sending = self.tx.send(BackendCommand::Execute {
            query,
            params_json,
            force_result,
            response: response_tx,
        });

        match sending {
            Err(e) => {
                let error = format!("Sending error: {}", e.to_string());
                return Err(error)
            }
            _ => {}
        }

        response_rx.recv().unwrap_or_else(|e| {
            let error = format!("Response receiver error: {}", e.to_string());
            Err(error)
        })

    }

    pub fn shutdown(&mut self) {
        let _ = self.tx.send(BackendCommand::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            if let Err(e) = handle.join() {
                eprintln!("Backend thread panicked during shutdown: {:?}", e);
            }
        }
    }

    async fn execute_query_internal(
        binary_vault: &BinaryVault,
        client: &mut Client<Compat<TcpStream>>,
        query: &str,
        params_json: Vec<Value>,
        force_result: bool,
    ) -> Result<Option<Vec<Value>>, String> {

        let mut params = params_json;
        let params_array = Self::process_mssql_params(&binary_vault, &mut params)?;
        let normalized_query = query.trim_start().to_uppercase();
        let params_refs: Vec<&dyn ToSql> = params_array.iter().map(|b| b.as_ref()).collect();

        if normalized_query.starts_with("SELECT") || force_result {
            match client.query(query, &params_refs).await {
                Ok(stream) => {
                    let rows = match stream.into_results().await {
                        Ok(rows) => rows.into_iter().flatten().collect(),
                        Err(e) => return Err(e.to_string()),
                    };
                    Ok(Some(Self::rows_to_json_array(rows)))
                },
                Err(e) => Err(e.to_string()),
            }
        } else if normalized_query == "BEGIN TRAN"
            || normalized_query == "COMMIT;"
            || normalized_query == "ROLLBACK;"
            || normalized_query == "BEGIN TRANSACTION"{

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

    fn rows_to_json_array(rows: Vec<Row>) -> Vec<Value> {
        let mut json_array = Vec::new();

        for row in rows {
            let mut json_obj = serde_json::Map::new();
            for (i, column) in row.columns().iter().enumerate() {
                let column_name = column.name().to_string();
                let value = Self::from_sql_to_json(&row, i, column);
                json_obj.insert(column_name, value);
            }
            json_array.push(Value::Object(json_obj));
        }

        json_array
    }

    fn from_sql_to_json(row: &Row, index: usize, column: &Column) -> Value {
        match column.column_type() {
            ColumnType::Null => Value::Null,
            ColumnType::Bit | ColumnType::Bitn => {
                match try_get_any_bit(row, index){
                    Some(i) => Value::Number(i.into()),
                    None => Value::Null,
                }
            },
            ColumnType::Int1 | ColumnType::Int2 | ColumnType::Int4 | ColumnType::Int8 | ColumnType::Intn => {
                match try_get_any_int(row, index){
                    Some(i) => Value::Number(i.into()),
                    None => Value::Null,
                }
            },
            ColumnType::Float4 | ColumnType::Float8 | ColumnType::Floatn | ColumnType::Money | ColumnType::Money4 => {
                match try_get_any_float(row, index) {
                    Some(i) => Number::from_f64(i).map(Value::Number).unwrap_or(Value::Null),
                    None => Value::Null,
                }
            },
            ColumnType::Decimaln | ColumnType::Numericn => {
                row.try_get::<Decimal, _>(index)
                    .ok()
                    .flatten()
                    .and_then(|f| Number::from_f64(f64::try_from(f).unwrap_or(0.0)))
                    .map(|num| Value::Number(num))
                    .unwrap_or(Value::Null)
            },
            ColumnType::Daten => {
                row.try_get::<NaiveDate, _>(index)
                    .ok()
                    .flatten()
                    .map(|d| Value::String(d.format("%Y-%m-%d").to_string()))
                    .unwrap_or(Value::Null)
            }
            ColumnType::Datetime | ColumnType::Datetime2 | ColumnType::Datetime4 | ColumnType::Datetimen => {
                row.try_get::<NaiveDateTime, _>(index)
                    .ok()
                    .flatten()
                    .map(|dt| Value::String(dt.format("%Y-%m-%dT%H:%M:%S").to_string()))
                    .unwrap_or(Value::Null)
            }
            ColumnType::Timen => {
                row.try_get::<NaiveTime, _>(index)
                    .ok()
                    .flatten()
                    .map(|t| Value::String(t.format("%H:%M:%S").to_string()))
                    .unwrap_or(Value::Null)
            }
            ColumnType::DatetimeOffsetn => {
                row.try_get::<DateTime<Utc>, _>(index)
                    .ok()
                    .flatten()
                    .map(|dt| Value::String(dt.to_rfc3339()))
                    .unwrap_or(Value::Null)
            }
            ColumnType::BigVarBin | ColumnType::BigBinary => {
                row.try_get::<&[u8], _>(index)
                    .ok()
                    .flatten()
                    .map(Self::encode_to_base64)
                    .unwrap_or(Value::Null)
            }
            ColumnType::Guid => {
                row.try_get::<Uuid, _>(index)
                    .ok()
                    .flatten()
                    .map(|u| Value::String(u.to_string()))
                    .unwrap_or(Value::Null)
            },
            ColumnType::Xml => {
                row.try_get::<&XmlData, _>(index)
                    .ok()
                    .flatten()
                    .map(|d| Value::String(d.clone().into_string()))
                    .unwrap_or(Value::Null)
            }
            _ => {
                row.try_get::<&str, _>(index)
                    .ok()
                    .flatten()
                    .map(|s| Value::String(s.to_string()))
                    .unwrap_or(Value::Null)
            }
        }
    }

    fn process_mssql_params(binary_vault: &BinaryVault, json_array: &mut Vec<Value>) -> Result<Vec<Box<dyn ToSql>>, String> {
        let mut result = Vec::new();

        for item in json_array.iter_mut() {
            let param: Box<dyn ToSql> = match item {
                Value::Null => Box::new(None::<i32>),
                Value::Bool(b) => Box::new(*b),
                Value::Number(n) if n.is_i64() => Box::new(n.as_i64().unwrap_or(0)),
                Value::Number(n) if n.is_f64() => Box::new(n.as_f64().unwrap_or(0.0)),
                Value::Number(n) => Box::new(n.as_f64().unwrap_or(0.0)),
                Value::String(s) => Box::new(s.clone()),
                Value::Object(obj) => {
                    if let Some((key, value)) = obj.iter().next() {
                        match key.to_uppercase().as_str() {
                            "TINYINT" => {
                                match value.as_u64() {
                                    Some(num) => Box::new(num as u8),
                                    None => Box::new(0)
                                }
                            },
                            "SMALLINT" => {
                                match value.as_i64() {
                                    Some(num) => Box::new(num as i16),
                                    None => Box::new(0)
                                }
                            },
                            "INT" => {
                                match value.as_i64() {
                                    Some(num) => Box::new(num as i32),
                                    None => Box::new(0)
                                }
                            },
                            "BIGINT" => {
                                match value.as_i64() {
                                    Some(num) => Box::new(num),
                                    None => Box::new(0)
                                }
                            },
                            "FLOAT24" => {
                                match value.as_f64() {
                                    Some(num) => Box::new(num as f32),
                                    None => Box::new(0.0)
                                }
                            },
                            "FLOAT53" => {
                                match value.as_f64() {
                                    Some(num) => Box::new(num),
                                    None => Box::new(0.0)
                                }
                            },
                            "BIT" => {
                                match value.as_bool() {
                                    Some(b) => Box::new(b),
                                    None => Box::new(false)
                                }
                            },
                            "NVARCHAR" => {
                                match value.as_str() {
                                    Some(s) => Box::new(s.to_string()),
                                    None => Box::new(String::new())
                                }
                            },
                            "BYTES" => {

                                match value.as_str(){
                                    Some(key) => {

                                        let binary = binary_vault
                                            .retrieve(&VaultKey::from_str(key).unwrap_or_default());

                                        Box::new(binary.map_err(|e| e.to_string())?)
                                    },
                                    None => Box::new("Not a binary vault key passed".as_bytes().to_vec()),
                                }

                            },
                            "UUID" => {
                                match value.as_str().and_then(|s| Uuid::parse_str(s).ok()) {
                                    Some(uuid) => Box::new(uuid),
                                    None => Box::new(Uuid::nil())
                                }
                            },
                            "NUMERIC" | "DECIMAL" => {
                                match value.as_f64().and_then(|v| Decimal::from_f64_retain(v)) {
                                    Some(num) => Box::new(num),
                                    None => Box::new(Decimal::from(0))
                                }
                            },
                            "XML" => {
                                match value.as_str() {
                                    Some(xml) => Box::new(XmlData::new(xml)),
                                    None => Box::new(XmlData::new("".to_string()))
                                }
                            },
                            "DATE" => {
                                match value.as_str().and_then(|s| parse(s).ok().map(|dt| dt.date_naive())) {
                                    Some(date) => Box::new(date),
                                    None => Box::new(None::<NaiveDate>)
                                }
                            },
                            "TIME" => {
                                match value.as_str().and_then(|s| parse(s).ok().map(|dt| dt.time())) {
                                    Some(time) => Box::new(time),
                                    None => Box::new(None::<NaiveTime>)
                                }
                            },
                            "DATETIME" => {
                                match value.as_str().and_then(|s| parse(s).ok().map(|dt| dt.naive_local())) {
                                    Some(dt) => Box::new(dt),
                                    None => Box::new(None::<NaiveDateTime>)
                                }
                            },
                            "DATETIMEOFFSET" => {
                                match value.as_str().and_then(|s| Self::parse_date_tz(s).ok()) {
                                    Some(dt) => Box::new(dt),
                                    None => Box::new(None::<DateTime<Utc>>)
                                }
                            },
                            _ => Box::new(value.to_string())
                        }
                    } else {
                        Box::new(None::<i32>)
                    }
                }
                _ => Box::new(None::<i32>)
            };
            result.push(param);
        }
        Ok(result)
    }

    fn parse_date_tz(input: &str) -> Result<DateTime<FixedOffset>, String> {
        DateTime::parse_from_rfc3339(input)
            .or_else(|_| {
                parse(input)
                    .map(|dt| dt.fixed_offset())
                    .map_err(|e| format!("Failed to parse date: {}", e))
            })
    }

    fn encode_to_base64(bytes: &[u8]) -> Value {
        let base64_string = general_purpose::STANDARD.encode(bytes);
        let mut blob_object = serde_json::Map::new();
        blob_object.insert("BYTES".to_string(), Value::String(base64_string));
        Value::Object(blob_object)
    }
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

impl Drop for MSSQLBackend {
    fn drop(&mut self) {

        let _ = self.tx.send(BackendCommand::Shutdown);

        if let Some(handle) = self.thread_handle.take() {
            if let Err(e) = handle.join() {
                eprintln!("Backend thread panicked: {:?}", e);
            }
        }
    }
}