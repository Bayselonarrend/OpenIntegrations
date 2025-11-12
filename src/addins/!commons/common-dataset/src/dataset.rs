use std::fs;
use dashmap::DashMap;
use serde_json::{json, Value};
use std::sync::Arc;
use uuid::Uuid;

pub struct Datasets {
    data: Arc<DashMap<String, QueryData>>,
}

#[derive(Debug, Clone)]
pub struct QueryData {
    pub results: Vec<Value>,
    pub params: Vec<Value>,
    pub text: String,
    pub force_result: bool,
}

impl Datasets {
    pub fn new() -> Self {
        Self {
            data: Arc::new(DashMap::new()),
        }
    }

    pub fn init_query(&self, text: &str, force_result: bool, from_file: bool) -> Result<String, String> {

        let content = read_input(text, from_file)?;

        let key = Uuid::new_v4().to_string();
        let query = QueryData::new();
        self.data.insert(key.clone(), query);

        self.set_text(&key, &content);
        self.set_force_result(&key, force_result);

        Ok(key)
    }

    pub fn get_query(&self, key: &str) -> Option<QueryData> {
        self.data.get(key).map(|guard| guard.value().clone())
    }

    pub fn set_results(&self, key: &str, values: Vec<Value>) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.results = values;
        }
    }

    pub fn result_as_string(&self, key: &str) -> Result<String, String> {

        let (_, query_data) = self.data.remove(key)
            .ok_or_else(|| format!("Key '{}' not found", key))?;

        let response = json!({
            "result": true,
            "data": query_data.results
        });

        serde_json::to_string(&response)
            .map_err(|e| format!("Serialization failed: {}", e))
    }

    pub fn result_as_file(&self, key: &str, filepath: &str) -> Result<(), String> {

        let json_data = self.result_as_string(key)?;

        fs::write(filepath, json_data)
            .map_err(|e| format!("Failed to write file: {}", e))?;

        Ok(())
    }

    pub fn params_from_file(&self, key: &str, filepath: &str) -> Result<(), String> {
        let content = fs::read_to_string(filepath)
            .map_err(|e| format!("Failed to read file '{}': {}", filepath, e))?;

        let value = serde_json::from_str(&content)
            .map_err(|e| format!("Invalid JSON in file '{}': {}", filepath, e))?;

        self.set_params(key, value)
    }

    pub fn params_from_string(&self, key: &str, json_str: &str) -> Result<(), String> {
        let value = serde_json::from_str(json_str)
            .map_err(|e| format!("Invalid JSON string: {}", e))?;

        self.set_params(key, value)
    }

    pub fn batch_query_init(&self, input_file: &str, output_file: &str) -> Result<(), String> {

        let content = fs::read_to_string(input_file)
            .map_err(|e| format!("Failed to read file '{}': {}", input_file, e))?;

        let queries: Vec<Value> = serde_json::from_str(&content)
            .map_err(|e| format!("Invalid JSON in file '{}': {}", input_file, e))?;

        let mut keys = Vec::new();

        for query in queries.into_iter() {
            let obj = query.as_object()
                .ok_or_else(|| "Each query should be a JSON object".to_string())?;

            let text = obj.get("text")
                .and_then(Value::as_str)
                .ok_or_else(|| "Missing or invalid 'text' field".to_string())?;

            let force_result = obj.get("force_result")
                .and_then(Value::as_bool)
                .unwrap_or(false);

            let params = obj.get("params")
                .cloned()
                .unwrap_or_else(|| Value::Array(Vec::new()));

            let key = self.init_query(text, force_result, false)?;

            self.set_params(&key, params)?;

            keys.push(key);
        }

        let keys_json = serde_json::to_string(&keys)
            .map_err(|e| format!("Failed to serialize keys: {}", e))?;

        fs::write(output_file, keys_json)
            .map_err(|e| format!("Failed to write keys to '{}': {}", output_file, e))?;

        Ok(())
    }

    pub fn remove(&self, key: &str) {
        self.data.remove(key);
    }

    fn set_text(&self, key: &str, text: &str) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.text = text.to_string();
        }
    }

    fn set_force_result(&self, key: &str, enabled: bool) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.force_result = enabled;
        }
    }

    fn set_params(&self, key: &str, value: Value) -> Result<(), String> {
        if let Some(mut entry) = self.data.get_mut(key) {
            match value {
                Value::Array(arr) => entry.params = arr,
                Value::Object(obj) => entry.params = vec![Value::Object(obj)],
                _ => return Err("Expected JSON array or object".to_string()),
            }
            Ok(())
        } else {
            Err(format!("Key '{}' not found", key))
        }
    }
}

fn read_input(input: &str, from_file: bool) -> Result<String, String> {
    if from_file {
        fs::read_to_string(input)
            .map_err(|e| format!("Failed to read file '{}': {}", input, e))
    } else {
        Ok(input.to_string())
    }
}

impl QueryData {
    fn new() -> Self {
        Self {
            results: Vec::new(),
            params: Vec::new(),
            text: String::new(),
            force_result: false,
        }
    }
}