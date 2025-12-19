use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{mpsc, Mutex};
use tokio::task::AbortHandle;
use prost_reflect::{DynamicMessage, MessageDescriptor};
use serde_json::{json, Value};
use uuid::Uuid;

#[derive(Clone, Debug)]
pub enum StreamType {
    ServerStream,
    ClientStream,
    BidiStream,
}

pub struct StreamInfo {
    pub stream_id: String,
    pub stream_type: StreamType,
    pub sender: Option<mpsc::UnboundedSender<DynamicMessage>>,
    pub receiver: Arc<Mutex<Option<mpsc::UnboundedReceiver<DynamicMessage>>>>,
    pub is_active: bool,
    pub can_send: bool,
    pub can_receive: bool,
    pub input_descriptor: Option<MessageDescriptor>,
    pub output_descriptor: Option<MessageDescriptor>,
    pub timeout_ms: Option<u64>,
    pub task_handles: Vec<AbortHandle>,
}

impl StreamInfo {
    pub fn new_server_stream(
        receiver: mpsc::UnboundedReceiver<DynamicMessage>,
        output_descriptor: MessageDescriptor,
        timeout_ms: Option<u64>,
    ) -> Self {
        Self {
            stream_id: Uuid::new_v4().to_string(),
            stream_type: StreamType::ServerStream,
            sender: None,
            receiver: Arc::new(Mutex::new(Some(receiver))),
            is_active: true,
            can_send: false,
            can_receive: true,
            input_descriptor: None,
            output_descriptor: Some(output_descriptor),
            timeout_ms,
            task_handles: Vec::new(),
        }
    }

    pub fn new_client_stream(
        sender: mpsc::UnboundedSender<DynamicMessage>,
        receiver: mpsc::UnboundedReceiver<DynamicMessage>,
        input_descriptor: MessageDescriptor,
        output_descriptor: MessageDescriptor,
        timeout_ms: Option<u64>,
    ) -> Self {
        Self {
            stream_id: Uuid::new_v4().to_string(),
            stream_type: StreamType::ClientStream,
            sender: Some(sender),
            receiver: Arc::new(Mutex::new(Some(receiver))),
            is_active: true,
            can_send: true,
            can_receive: false,
            input_descriptor: Some(input_descriptor),
            output_descriptor: Some(output_descriptor),
            timeout_ms,
            task_handles: Vec::new(),
        }
    }

    pub fn new_bidi_stream(
        sender: mpsc::UnboundedSender<DynamicMessage>,
        receiver: mpsc::UnboundedReceiver<DynamicMessage>,
        input_descriptor: MessageDescriptor,
        output_descriptor: MessageDescriptor,
        timeout_ms: Option<u64>,
    ) -> Self {
        Self {
            stream_id: Uuid::new_v4().to_string(),
            stream_type: StreamType::BidiStream,
            sender: Some(sender),
            receiver: Arc::new(Mutex::new(Some(receiver))),
            is_active: true,
            can_send: true,
            can_receive: true,
            input_descriptor: Some(input_descriptor),
            output_descriptor: Some(output_descriptor),
            timeout_ms,
            task_handles: Vec::new(),
        }
    }

    pub fn get_status(&self) -> Value {
        json!({
            "streamId": self.stream_id,
            "streamType": format!("{:?}", self.stream_type),
            "isActive": self.is_active,
            "canSend": self.can_send,
            "canReceive": self.can_receive,
        })
    }

    pub fn add_task_handle(&mut self, handle: AbortHandle) {
        self.task_handles.push(handle);
    }
}

pub struct StreamManager {
    streams: Arc<Mutex<HashMap<String, Arc<Mutex<StreamInfo>>>>>,
}

impl StreamManager {
    pub fn new() -> Self {
        Self {
            streams: Arc::new(Mutex::new(HashMap::new())),
        }
    }

    pub async fn add_stream(&self, stream_info: StreamInfo) -> String {
        let stream_id = stream_info.stream_id.clone();
        let mut streams = self.streams.lock().await;
        streams.insert(stream_id.clone(), Arc::new(Mutex::new(stream_info)));
        stream_id
    }

    pub async fn get_stream(&self, stream_id: &str) -> Option<Arc<Mutex<StreamInfo>>> {
        let streams = self.streams.lock().await;
        streams.get(stream_id).cloned()
    }

    pub async fn remove_stream(&self, stream_id: &str) -> bool {
        let mut streams = self.streams.lock().await;
        streams.remove(stream_id).is_some()
    }

    pub async fn send_message(&self, stream_id: &str, message: DynamicMessage) -> Result<(), String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let stream_info = stream.lock().await;
        
        if !stream_info.can_send {
            return Err(format!("Stream '{}' does not support sending (can_send=false)", stream_id));
        }

        if !stream_info.is_active {
            return Err(format!("Stream '{}' is not active", stream_id));
        }

        let sender = stream_info.sender.as_ref()
            .ok_or_else(|| format!("Stream '{}' sender not available (already dropped)", stream_id))?;

        let stream_type = stream_info.stream_type.clone();
        
        // Пытаемся отправить сообщение
        let send_result = sender.send(message);
        
        // Если отправка не удалась, значит receiver закрыт (сервер закрыл поток)
        if send_result.is_err() {
            drop(stream_info);
            
            // Для client stream: если сервер закрыл поток, переключаем флаги
            if matches!(stream_type, StreamType::ClientStream) {
                let mut stream_info = stream.lock().await;
                stream_info.can_send = false;
                stream_info.can_receive = true; // Теперь можно получить финальный ответ
                drop(stream_info.sender.take());
            }
            
            return Err(format!("Failed to send message to stream '{}': server closed the stream", stream_id));
        }

        Ok(())
    }

    pub async fn receive_message(&self, stream_id: &str) -> Result<Option<DynamicMessage>, String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let (receiver_arc, timeout_ms) = {
            let stream_info = stream.lock().await;
            
            if !stream_info.can_receive {
                return Err("Stream does not support receiving".to_string());
            }
            
            (stream_info.receiver.clone(), stream_info.timeout_ms)
        };

        let mut receiver_guard = receiver_arc.lock().await;
        let receiver = receiver_guard.as_mut()
            .ok_or_else(|| "Stream receiver not available".to_string())?;

        // Единая логика для всех типов stream
        if let Some(timeout) = timeout_ms {
            let duration = std::time::Duration::from_millis(timeout);
            match tokio::time::timeout(duration, receiver.recv()).await {
                Ok(Some(message)) => Ok(Some(message)),
                Ok(None) => {
                    // Stream закрыт
                    drop(receiver_guard);
                    let mut stream_info = stream.lock().await;
                    stream_info.is_active = false;
                    stream_info.can_receive = false;
                    Ok(None)
                },
                Err(_) => {
                    // Timeout
                    Err("Timeout waiting for message".to_string())
                },
            }
        } else {
            // Без timeout
            match receiver.try_recv() {
                Ok(message) => Ok(Some(message)),
                Err(mpsc::error::TryRecvError::Empty) => Ok(None),
                Err(mpsc::error::TryRecvError::Disconnected) => {
                    drop(receiver_guard);
                    let mut stream_info = stream.lock().await;
                    stream_info.is_active = false;
                    stream_info.can_receive = false;
                    Ok(None)
                }
            }
        }
    }

    pub async fn finish_sending(&self, stream_id: &str) -> Result<(), String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let mut stream_info = stream.lock().await;

        // Удаление sender закрывает канал, что сигнализирует gRPC серверу
        // о завершении отправки сообщений от клиента
        if matches!(stream_info.stream_type, StreamType::ClientStream) {
            stream_info.can_send = false;
            stream_info.can_receive = true; // Теперь можно получить финальный ответ
            drop(stream_info.sender.take());
        } else {
            stream_info.can_send = false;
            drop(stream_info.sender.take());
        }
        
        Ok(())
    }

    pub async fn close_stream(&self, stream_id: &str) -> Result<(), String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let mut stream_info = stream.lock().await;
        stream_info.is_active = false;
        stream_info.can_send = false;
        stream_info.can_receive = false;
        drop(stream_info.sender.take());
        
        // Отменяем все фоновые задачи
        for handle in &stream_info.task_handles {
            handle.abort();
        }
        stream_info.task_handles.clear();
        
        drop(stream_info);
        self.remove_stream(stream_id).await;
        
        Ok(())
    }

    pub async fn get_status(&self, stream_id: &str) -> Result<Value, String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;

        let (stream_type, should_update_flags) = {
            let stream_info = stream.lock().await;
            
            let sender_closed = stream_info.sender
                .as_ref()
                .map(|s| s.is_closed())
                .unwrap_or(true);
            
            let should_update = stream_info.can_send && sender_closed;
            
            (stream_info.stream_type.clone(), should_update)
        };

        if should_update_flags {
            let mut stream_info = stream.lock().await;
            stream_info.can_send = false;

            if matches!(stream_type, StreamType::ClientStream) {
                stream_info.can_receive = true;
            }
        }

        let stream_info = stream.lock().await;
        Ok(stream_info.get_status())
    }

    pub async fn get_input_descriptor(&self, stream_id: &str) -> Result<MessageDescriptor, String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let stream_info = stream.lock().await;
        stream_info.input_descriptor.clone()
            .ok_or_else(|| "No input descriptor available for this stream".to_string())
    }
    #[allow(dead_code)]
    pub async fn get_output_descriptor(&self, stream_id: &str) -> Result<MessageDescriptor, String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let stream_info = stream.lock().await;
        stream_info.output_descriptor.clone()
            .ok_or_else(|| "No output descriptor available for this stream".to_string())
    }

    pub async fn close_all_streams(&self) -> Result<(), String> {
        let mut streams = self.streams.lock().await;
        
        // Закрываем все стримы
        for (_, stream_arc) in streams.iter() {
            let mut stream_info = stream_arc.lock().await;
            stream_info.is_active = false;
            stream_info.can_send = false;
            stream_info.can_receive = false;
            drop(stream_info.sender.take());
            
            // Отменяем все фоновые задачи
            for handle in &stream_info.task_handles {
                handle.abort();
            }
            stream_info.task_handles.clear();
        }
        
        // Очищаем коллекцию
        streams.clear();
        
        Ok(())
    }
}
