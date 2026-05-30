use std::collections::BTreeMap;
use std::sync::{Mutex, MutexGuard};

use common_janx::{encode, JanxValue};
use serde_json::json;

pub fn json_error<E: ToString>(error: E) -> String {
    let err = error.to_string();
    json!({"result": false, "error": err}).to_string()
}

pub fn json_success() -> String {
    json!({"result": true}).to_string()
}

pub fn janx_error<E: ToString>(error: E) -> Vec<u8> {
    let mut map = BTreeMap::new();
    map.insert("result".to_string(), JanxValue::Bool(false));
    map.insert("error".to_string(), JanxValue::String(error.to_string()));
    janx_encode(map).unwrap_or_default()
}

pub fn janx_success(payload: Option<JanxValue>, field: Option<&str>) -> Vec<u8> {
    let mut map = BTreeMap::new();
    map.insert("result".to_string(), JanxValue::Bool(true));

    if let Some(payload) = payload {
        let field_name = field.unwrap_or("data");
        map.insert(field_name.to_string(), payload);
    }

    janx_encode(map).unwrap_or_default()
}

fn janx_encode(map: BTreeMap<String, JanxValue>) -> Result<Vec<u8>, String> {
    encode(&JanxValue::Object(map)).map_err(|e| e.to_string())
}

pub fn lock_unpoisoned<T>(mutex: &Mutex<T>) -> MutexGuard<'_, T> {
    mutex.lock().unwrap_or_else(|poisoned| poisoned.into_inner())
}

pub fn version() -> String {
    "2.1.0".to_string()
}
