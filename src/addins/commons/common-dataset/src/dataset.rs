use std::fs;
use std::sync::Arc;

use common_janx::{decode, encode, FromJanx, JanxValue};
use common_utils::utils::janx_success;
use dashmap::DashMap;
use uuid::Uuid;

pub struct Datasets {
    data: Arc<DashMap<String, QueryData>>,
}

#[derive(Debug, Clone)]
pub struct QueryData {
    pub results: Vec<JanxValue>,
    pub params: Vec<JanxValue>,
    pub text: String,
    pub force_result: bool,
}

impl Datasets {
    pub fn new() -> Self {
        Self {
            data: Arc::new(DashMap::new()),
        }
    }

    pub fn init_query(
        &self,
        text: &str,
        force_result: bool,
        from_file: bool,
    ) -> Result<String, String> {
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

    pub fn set_results(&self, key: &str, values: Vec<JanxValue>) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.results = values;
        }
    }

    pub fn result_as_janx(&self, key: &str) -> Result<JanxValue, String> {
        let (_, query_data) = self
            .data
            .remove(key)
            .ok_or_else(|| format!("Key '{}' not found", key))?;

        Ok(janx_success(
            Some(JanxValue::Array(query_data.results)),
            None,
        ))
    }

    pub fn result_as_file(&self, key: &str, filepath: &str) -> Result<(), String> {
        let janx_data = self.result_as_janx(key)?;
        let encoded = encode(&janx_data).map_err(|e| format!("Janx encoding failed: {}", e))?;

        fs::write(filepath, encoded).map_err(|e| format!("Failed to write file: {}", e))?;

        Ok(())
    }

    pub fn params_from_file(&self, key: &str, filepath: &str) -> Result<(), String> {
        let content =
            fs::read(filepath).map_err(|e| format!("Failed to read file '{}': {}", filepath, e))?;

        let value = decode(&content).map_err(|e| format!("Invalid Janx in file '{}': {}", filepath, e))?;

        self.set_params(key, value)
    }

    pub fn params_from_janx(&self, key: &str, value: JanxValue) -> Result<(), String> {
        self.set_params(key, value)
    }

    pub fn batch_query_init(&self, input_file: &str, output_file: &str) -> Result<(), String> {
        let content = fs::read(input_file)
            .map_err(|e| format!("Failed to read file '{}': {}", input_file, e))?;

        let queries = decode(&content)
            .map_err(|e| format!("Invalid Janx in file '{}': {}", input_file, e))?;

        let queries = Vec::<JanxValue>::from_janx(&queries)
            .ok_or_else(|| "Batch file must contain a Janx array of queries".to_string())?;

        let mut keys = Vec::new();

        for query in queries.into_iter() {
            let obj = query
                .as_object()
                .ok_or_else(|| "Each query should be a Janx object".to_string())?;

            let text = obj
                .get("text")
                .and_then(String::from_janx)
                .ok_or_else(|| "Missing or invalid 'text' field".to_string())?;

            let force_result = obj
                .get("force_result")
                .and_then(bool::from_janx)
                .unwrap_or(false);

            let params = obj
                .get("params")
                .and_then(Vec::<JanxValue>::from_janx)
                .unwrap_or_default();

            let key = self.init_query(&text, force_result, false)?;

            self.set_params(&key, JanxValue::Array(params))?;

            keys.push(JanxValue::String(key));
        }

        let keys_janx = JanxValue::Array(keys);
        let encoded = encode(&keys_janx).map_err(|e| format!("Failed to encode keys: {}", e))?;

        fs::write(output_file, encoded)
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

    fn set_params(&self, key: &str, value: JanxValue) -> Result<(), String> {
        if let Some(mut entry) = self.data.get_mut(key) {
            match value {
                JanxValue::Array(arr) => entry.params = arr,
                JanxValue::Object(obj) => entry.params = vec![JanxValue::Object(obj)],
                _ => return Err("Expected Janx array or object for query params".to_string()),
            }
            Ok(())
        } else {
            Err(format!("Key '{}' not found", key))
        }
    }
}

fn read_input(input: &str, from_file: bool) -> Result<String, String> {
    if from_file {
        fs::read_to_string(input).map_err(|e| format!("Failed to read file '{}': {}", input, e))
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
