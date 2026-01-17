use std::collections::HashMap;
use std::fs;
use std::io;
use std::path::Path;
use std::sync::{Arc, Mutex};

pub type VaultKey = String;

#[derive(Debug)]
pub enum VaultError {
    IoError(io::Error),
    KeyNotFound(VaultKey),
}

impl From<io::Error> for VaultError {
    fn from(error: io::Error) -> Self {
        VaultError::IoError(error)
    }
}

impl std::fmt::Display for VaultError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            VaultError::IoError(err) => write!(f, "IO error: {}", err),
            VaultError::KeyNotFound(key) => write!(f, "Key not found: {}", key),
        }
    }
}

#[derive(Debug, Clone)]
pub struct BinaryVault {
    storage: Arc<Mutex<HashMap<VaultKey, Vec<u8>>>>,
    counter: Arc<Mutex<u64>>,
}

impl Default for BinaryVault {
    fn default() -> Self {
        Self::new()
    }
}

impl BinaryVault {

    pub fn new() -> Self {
        Self {
            storage: Arc::new(Mutex::new(HashMap::new())),
            counter: Arc::new(Mutex::new(0)),
        }
    }

    pub fn store(&self, input: BinaryInput) -> Result<VaultKey, VaultError> {
        match input {
            BinaryInput::Bytes(data) => Ok(self.store_bytes(data)),
            BinaryInput::FilePath(path) => self.store_file(path),
            BinaryInput::Base64(base64_str) => self.store_base64(&base64_str),
        }
    }

    pub fn retrieve(&self, key: &VaultKey) -> Result<Vec<u8>, VaultError> {
        let mut storage = self.storage.lock().unwrap();
        storage
            .remove(key)
            .ok_or_else(|| VaultError::KeyNotFound(key.clone()))
    }

    fn store_bytes(&self, data: Vec<u8>) -> VaultKey {
        let key = self.generate_key();
        let mut storage = self.storage.lock().unwrap();
        storage.insert(key.clone(), data);
        key
    }

    fn store_file<P: AsRef<Path>>(&self, file_path: P) -> Result<VaultKey, VaultError> {
        let data = fs::read(file_path)?;
        Ok(self.store_bytes(data))
    }

    pub fn store_base64(&self, base64_str: &str) -> Result<VaultKey, VaultError> {
        use base64::prelude::*;

        let cleaned_base64 = base64_str.replace(&['\n', '\r', ' '][..], "");

        let data = BASE64_STANDARD.decode(cleaned_base64)
            .map_err(|e| VaultError::IoError(io::Error::new(io::ErrorKind::InvalidData, e)))?;
        Ok(self.store_bytes(data))
    }

    fn generate_key(&self) -> VaultKey {
        let mut counter = self.counter.lock().unwrap();
        *counter += 1;
        format!("vault_key_{}", *counter)
    }

}

#[derive(Debug)]
pub enum BinaryInput {
    Bytes(Vec<u8>),
    FilePath(String),
    Base64(String),
}

impl From<Vec<u8>> for BinaryInput {
    fn from(data: Vec<u8>) -> Self {
        BinaryInput::Bytes(data)
    }
}

impl From<&[u8]> for BinaryInput {
    fn from(data: &[u8]) -> Self {
        BinaryInput::Bytes(data.to_vec())
    }
}

impl From<String> for BinaryInput {
    fn from(path: String) -> Self {
        BinaryInput::FilePath(path)
    }
}

impl From<&str> for BinaryInput {
    fn from(path: &str) -> Self {
        BinaryInput::FilePath(path.to_string())
    }
}

impl Drop for BinaryVault {
    fn drop(&mut self) {
        if let Ok(mut storage) = self.storage.lock() {
            storage.clear();
        }
    }
}
