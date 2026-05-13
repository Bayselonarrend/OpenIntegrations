mod methods;

use std::sync::{Mutex, Arc};
use rusqlite::{Connection, OpenFlags};
use serde_json::json;
use common_dataset::dataset::Datasets;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::{BinaryInput, BinaryVault};
use common_core::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("LoadExtension"),
    name!("InitQuery"),
    name!("GetResultAsFile"),
    name!("GetResultAsString"),
    name!("SetParamsFromFile"),
    name!("SetParamsFromString"),
    name!("RemoveQueryDataset"),
    name!("BatchQuery"),
    name!("LoadBinaryToVault"),
    name!("LoadFileToVault"),
    name!("LoadBase64ToVault"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 2,
        4 => 3,
        5 => 2,
        6 => 1,
        7 => 2,
        8 => 2,
        9 => 1,
        10 => 2,
        11 => 1,
        12 => 1,
        13 => 1,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute_query(&key))
        },
        3 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let point = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.load_extension(path, point))
        },
        4 => {
            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);
            let from_file = params[2].get_bool().unwrap_or(false);
            let result = match obj.datasets.init_query(&text, force, from_file){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.result_as_file(&key, &filepath){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let result = obj.datasets.result_as_string(&key)
                .unwrap_or_else(|e| json_error(&e));
            Box::new(result)
        },
        7 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.params_from_file(&key, &filepath){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let json = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.params_from_string(&key, &json){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        9 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(json_success())
        },
        10 => {
            let input = params[0].get_string().unwrap_or("".to_string());
            let output = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.batch_query_init(&input, &output){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        11 => {
            let binary = params[0].get_blob().unwrap_or(&empty_array);
            let result = match obj.binary_vault.store(BinaryInput::Bytes(Vec::from(binary))){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        12 => {
            let file = params[0].get_string().unwrap_or("".to_string());
            let result = match obj.binary_vault.store(BinaryInput::FilePath(file)){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        13 => {
            let base64 = params[0].get_string().unwrap_or("".to_string());
            let result = match obj.binary_vault.store(BinaryInput::Base64(base64)){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        }
        _ => Box::new(false),
    }

}

pub const PROPS: &[&[u16]] = &[
    name!("Database")
];

pub struct AddIn {
    connection_string: String,
    connection: Option<Arc<Mutex<Connection>>>,
    datasets: Datasets,
    binary_vault: BinaryVault
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connection: None,
            datasets: Datasets::new(),
            binary_vault: BinaryVault::new()
        }
    }

    pub fn initialize(&mut self) -> String {
        let conn_result = if self.connection_string.is_empty() {
            Connection::open_in_memory()
        } else {
            let flags = OpenFlags::SQLITE_OPEN_READ_WRITE
                | OpenFlags::SQLITE_OPEN_CREATE
                | OpenFlags::SQLITE_OPEN_URI
                | OpenFlags::SQLITE_OPEN_NO_MUTEX;
            Connection::open_with_flags(&self.connection_string, flags)
        };

        match conn_result {
            Ok(conn) => {
                self.connection = Some(Arc::new(Mutex::new(conn)));
                r#"{"result": true}"#.to_string()
            }
            Err(e) => {
                let detailed_error = match e {
                    rusqlite::Error::SqliteFailure(err, msg) => {
                        format!(
                            "SQLite error: code={:?}, message='{}', details={:?}",
                            err.code,
                            err.extended_code,
                            msg
                        )
                    }
                    _ => e.to_string(),
                };
                json_error(detailed_error)
            }
        }
    }

    pub fn get_connection(&self) -> Option<Arc<Mutex<Connection>>> {
        self.connection.clone()
    }

    pub fn close_connection(&mut self) -> String {
        if let Some(conn) = self.connection.take() {
            match Arc::try_unwrap(conn) {
                Ok(conn_mutex) => match conn_mutex.into_inner() {
                    Ok(conn) => match conn.close() {
                        Ok(_) => json_success(),
                        Err((_conn, err)) => json_error(&err),
                    },
                    Err(_) => json_error("Failed to acquire connection lock"),
                },
                Err(_) => json_error("Connection is still in use by other threads"),
            }
        } else { json_error("Connection already closed") }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

impl Drop for AddIn {
    fn drop(&mut self) {}
}