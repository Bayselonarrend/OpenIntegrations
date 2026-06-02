use std::sync::{Mutex, MutexGuard};

use common_janx::{janx, JanxValue};

pub fn janx_error<E: ToString>(error: E) -> JanxValue {
    janx!({
        "result": false,
        "error": error.to_string(),
    })
}

pub fn janx_result_ok(value: &JanxValue) -> bool {
    match value {
        JanxValue::Object(map) => map
            .get("result")
            .and_then(|v| match v {
                JanxValue::Bool(b) => Some(*b),
                _ => None,
            })
            .unwrap_or(false),
        _ => false,
    }
}

pub fn janx_logs(logs: Vec<String>, total: usize) -> JanxValue {
    let returned = logs.len();
    janx!({
        "result": true,
        "logs": logs,
        "total": total,
        "returned": returned,
    })
}

pub fn janx_success(payload: Option<JanxValue>, field: Option<&str>) -> JanxValue {
    match payload {
        Some(data) => {
            let field_name = field.unwrap_or("data");
            let mut map = janx!({ "result": true });
            if let JanxValue::Object(ref mut fields) = map {
                fields.insert(field_name.to_string(), data);
            }
            map
        }
        None => janx!({ "result": true }),
    }
}

pub fn lock_unpoisoned<T>(mutex: &Mutex<T>) -> MutexGuard<'_, T> {
    mutex.lock().unwrap_or_else(|poisoned| poisoned.into_inner())
}

pub fn version() -> String {
    "2.2.0".to_string()
}
