use serde_json::json;
use std::sync::{Mutex, MutexGuard};

pub fn json_error<E: ToString>(error: E) -> String {
    let err = error.to_string();
    json!({"result": false, "error": err}).to_string()
}

pub fn json_success() -> String {
    json!({"result": true}).to_string()
}

pub fn lock_unpoisoned<T>(mutex: &Mutex<T>) -> MutexGuard<'_, T> {
    mutex.lock().unwrap_or_else(|poisoned| poisoned.into_inner())
}
