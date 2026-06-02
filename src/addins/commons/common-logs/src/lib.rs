use std::collections::VecDeque;
use std::fs::OpenOptions;
use std::io::Write;
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use chrono::Local;
use common_janx::FromJanx;
use common_janx::JanxValue;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Copy, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum LogMode {
    Memory,
    File,
    Both,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Logger {
    mode: LogMode,
    #[serde(skip, default = "default_logs")]
    logs: Arc<Mutex<VecDeque<String>>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    max_entries: Option<usize>,
    #[serde(skip_serializing_if = "Option::is_none")]
    file_path: Option<PathBuf>,
}

fn default_logs() -> Arc<Mutex<VecDeque<String>>> {
    Arc::new(Mutex::new(VecDeque::new()))
}

impl Logger {
    pub fn new(mode: LogMode) -> Self {
        Self {
            mode,
            logs: Arc::new(Mutex::new(VecDeque::new())),
            max_entries: None,
            file_path: None,
        }
    }

    pub fn from_janx(config: &JanxValue) -> Result<Self, String> {
        let mode = config
            .get("mode")
            .and_then(LogMode::from_janx)
            .ok_or_else(|| "Field 'mode' is required and must be a string".to_string())?;

        let mut logger = Self::new(mode);

        if let Some(max_entries) = config.get("max_entries").and_then(i64::from_janx) {
            if max_entries >= 0 {
                logger = logger.with_max_entries(max_entries as usize);
            }
        }

        if let Some(file_path) = config.get("file_path").and_then(String::from_janx) {
            if !file_path.is_empty() {
                logger = logger.with_file_path(file_path);
            }
        }

        Ok(logger)
    }

    pub fn with_max_entries(mut self, max: usize) -> Self {
        self.max_entries = Some(max);
        self
    }

    pub fn with_file_path(mut self, path: impl Into<PathBuf>) -> Self {
        self.file_path = Some(path.into());
        self
    }

    pub fn log(&self, message: impl AsRef<str>) {
        let timestamp = Local::now().format("%Y-%m-%d %H:%M:%S%.3f");
        let log_entry = format!("[{}] {}", timestamp, message.as_ref());

        match self.mode {
            LogMode::Memory => self.log_to_memory(&log_entry),
            LogMode::File => self.log_to_file(&log_entry),
            LogMode::Both => {
                self.log_to_memory(&log_entry);
                self.log_to_file(&log_entry);
            }
        }
    }

    fn log_to_memory(&self, entry: &str) {
        if let Ok(mut logs) = self.logs.lock() {
            logs.push_back(entry.to_string());

            if let Some(max) = self.max_entries {
                while logs.len() > max {
                    logs.pop_front();
                }
            }
        }
    }

    fn log_to_file(&self, entry: &str) {
        if let Some(path) = &self.file_path {
            if let Ok(mut file) = OpenOptions::new()
                .create(true)
                .append(true)
                .open(path)
            {
                let _ = writeln!(file, "{}", entry);
            }
        }
    }

    pub fn get_logs(&self) -> Vec<String> {
        self.logs
            .lock()
            .map(|logs| logs.iter().cloned().collect())
            .unwrap_or_default()
    }

    pub fn get_last_logs(&self, count: usize) -> Vec<String> {
        self.logs
            .lock()
            .map(|logs| {
                if count == 0 || count >= logs.len() {
                    logs.iter().cloned().collect()
                } else {
                    logs.iter().skip(logs.len() - count).cloned().collect()
                }
            })
            .unwrap_or_default()
    }

    pub fn clear(&self) {
        if let Ok(mut logs) = self.logs.lock() {
            logs.clear();
        }
    }

    pub fn len(&self) -> usize {
        self.logs.lock().map(|logs| logs.len()).unwrap_or(0)
    }

    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }
}

impl FromJanx for LogMode {
    fn from_janx(value: &JanxValue) -> Option<Self> {
        match value.as_str()?.to_lowercase().as_str() {
            "memory" => Some(Self::Memory),
            "file" => Some(Self::File),
            "both" => Some(Self::Both),
            _ => None,
        }
    }
}

#[macro_export]
macro_rules! log {
    ($logger:expr, $($arg:tt)*) => {
        $logger.log(format!($($arg)*))
    };
}
