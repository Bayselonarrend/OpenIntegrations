use dashmap::DashMap;
use serde_json::Value;
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

    pub fn init_query(&self) -> String {
        let key = Uuid::new_v4().to_string();
        let query = QueryData::new();
        self.data.insert(key.clone(), query);
        key
    }

    pub fn get_query(&self, key: &str) -> Option<QueryData> {
        self.data.get(key).map(|guard| guard.value().clone())
    }

    pub fn set_results(&self, key: &str, values: Vec<Value>) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.results = values;
        }
    }

    pub fn add_param(&self, key: &str, value: Value) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.params.push(value);
        }
    }

    pub fn set_text(&self, key: &str, text: &str) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.text = text.to_string();
        }
    }

    pub fn set_force_result(&self, key: &str, enabled: bool) {
        if let Some(mut entry) = self.data.get_mut(key) {
            entry.force_result = enabled;
        }
    }

    pub fn len(&self, key: &str) -> Option<usize> {
        self.data.get(key).map(|entry| entry.results.len())
    }

    pub fn remove(&self, key: &str) {
        self.data.remove(key);
    }

    pub fn get_row(&self, key: &str, index: usize) -> Option<String> {
        let entry = self.data.get(key)?;
        let value = entry.results.get(index)?;
        serde_json::to_string(value).ok()
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