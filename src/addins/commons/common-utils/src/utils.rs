use serde_json::json;

pub fn json_error<E: ToString>(error: E) -> String {
    let err = error.to_string();
    json!({"result": false, "error": err}).to_string()
}

pub fn json_success() -> String{
    json!({"result": true}).to_string()
}