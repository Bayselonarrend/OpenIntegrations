use tonic::transport::{Channel, ClientTlsConfig};
use tonic::Request;
use tonic::metadata::{MetadataValue, MetadataKey, Ascii};
use std::collections::HashMap;
use serde_json::Value;

pub struct GrpcClient {
    channel: Option<Channel>,
    metadata: HashMap<String, String>,
}

impl GrpcClient {
    pub fn new() -> Self {
        Self {
            channel: None,
            metadata: HashMap::new(),
        }
    }

    pub async fn connect(&mut self, address: &str, use_tls: bool) -> Result<(), String> {
        let channel = if use_tls {
            Channel::from_shared(address.to_string())
                .map_err(|e| format!("Invalid address: {}", e))?
                .tls_config(ClientTlsConfig::new())
                .map_err(|e| format!("TLS config error: {}", e))?
                .connect()
                .await
                .map_err(|e| format!("Connection failed: {}", e))?
        } else {
            Channel::from_shared(address.to_string())
                .map_err(|e| format!("Invalid address: {}", e))?
                .connect()
                .await
                .map_err(|e| format!("Connection failed: {}", e))?
        };

        self.channel = Some(channel);
        Ok(())
    }

    pub fn disconnect(&mut self) {
        self.channel = None;
        self.metadata.clear();
    }

    pub fn set_metadata(&mut self, metadata: HashMap<String, String>) {
        self.metadata = metadata;
    }

    pub fn is_connected(&self) -> bool {
        self.channel.is_some()
    }

    // Метод для создания запроса с метаданными
    fn create_request<T>(&self, message: T) -> Request<T> {
        let mut request = Request::new(message);
        
        // Добавляем метаданные к запросу
        for (key, value) in &self.metadata {
            if let (Ok(metadata_key), Ok(metadata_value)) = (
                MetadataKey::<Ascii>::from_bytes(key.as_bytes()),
                MetadataValue::try_from(value.as_str())
            ) {
                request.metadata_mut().insert(metadata_key, metadata_value);
            }
        }

        request
    }

    // TODO: Здесь будут методы для вызова конкретных gRPC сервисов
    // Пока что заглушка для демонстрации структуры
    pub async fn call_generic(&self, service: &str, method: &str, _request_data: &Value) -> Result<Value, String> {
        if self.channel.is_none() {
            return Err("Not connected".to_string());
        }

        // TODO: Реализовать динамический вызов gRPC методов
        // Это сложная задача, требующая парсинга proto файлов во время выполнения
        
        Err(format!("Generic gRPC calls not implemented yet. Service: {}, Method: {}", service, method))
    }
}