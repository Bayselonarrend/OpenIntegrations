use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio::task::AbortHandle;
use prost_reflect::{DynamicMessage, MessageDescriptor};
use tokio::sync::mpsc::Receiver;
use uuid::Uuid;

pub struct StreamMessage {
    pub message: DynamicMessage,
    pub ack: oneshot::Sender<()>,
}

pub struct StreamInfo {
    pub stream_id: String,
    pub sender: Option<mpsc::Sender<StreamMessage>>,
    pub receiver: Arc<Mutex<Option<Receiver<Result<DynamicMessage, String>>>>>,
    pub input_descriptor: Option<MessageDescriptor>,
    pub output_descriptor: Option<MessageDescriptor>,
    pub timeout_ms: Option<u64>,
    pub task_handle: Option<AbortHandle>,
}

impl StreamInfo {
    pub fn new(
        sender: Option<mpsc::Sender<StreamMessage>>,
        receiver: Receiver<Result<DynamicMessage, String>>,
        input_descriptor: Option<MessageDescriptor>,
        output_descriptor: Option<MessageDescriptor>,
        timeout_ms: Option<u64>,
    ) -> Self {
        Self {
            stream_id: Uuid::new_v4().to_string(),
            sender,
            receiver: Arc::new(Mutex::new(Some(receiver))),
            input_descriptor,
            output_descriptor,
            timeout_ms,
            task_handle: None,
        }
    }

    pub fn add_task_handle(&mut self, handle: AbortHandle) {
        self.task_handle = Some(handle);
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
        
        let (sender, timeout_ms) = {
            let stream_info = stream.lock().await;

            let sender = stream_info.sender.as_ref()
                .ok_or_else(|| format!("Stream '{}' does not support sending", stream_id))?
                .clone();

            (sender, stream_info.timeout_ms)
        };

        if sender.is_closed() {
            return Err("Closed".to_string());
        }

        let (ack_tx, ack_rx) = oneshot::channel();
        let msg_with_ack = StreamMessage {
            message,
            ack: ack_tx,
        };

        if let Some(timeout) = timeout_ms {
            let duration = std::time::Duration::from_millis(timeout);

            tokio::time::timeout(duration, sender.reserve())
                .await
                .map_err(|_| "Timeout")?
                .map_err(|_| "Closed".to_string())?;

            tokio::time::timeout(duration, sender.send(msg_with_ack))
                .await
                .map_err(|_| "Timeout")?
                .map_err(|_| "Closed".to_string())?;

            tokio::time::timeout(duration, ack_rx)
                .await
                .map_err(|_| "Timeout")?
                .map_err(|_| "Closed".to_string())?;
        } else {

            sender.reserve().await
                .map_err(|_| "Closed".to_string())?;

            sender.send(msg_with_ack).await
                .map_err(|_| "Closed".to_string())?;

            ack_rx.await
                .map_err(|_| "Closed".to_string())?;
        }

        Ok(())
    }

    pub async fn receive_message(&self, stream_id: &str) -> Result<Option<DynamicMessage>, String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let (receiver_arc, timeout_ms) = {
            let stream_info = stream.lock().await;
            (stream_info.receiver.clone(), stream_info.timeout_ms)
        };

        let mut receiver_guard = receiver_arc.lock().await;
        let receiver = receiver_guard.as_mut()
            .ok_or_else(|| "Stream receiver not available".to_string())?;

        if let Some(timeout) = timeout_ms {
            let duration = std::time::Duration::from_millis(timeout);
            match tokio::time::timeout(duration, receiver.recv()).await {
                Ok(Some(message)) => {
                    match message {
                        Ok(m) => Ok(Some(m)),
                        Err(e) => Err(e),
                    }
                },
                Ok(None) => {
                    drop(receiver_guard);
                    Err("Closed".to_string())
                },
                Err(_) => {
                    Err("Timeout".to_string())
                },
            }
        } else {
            match receiver.try_recv() {
                Ok(message) => {
                    match message {
                        Ok(m) => Ok(Some(m)),
                        Err(e) => Err(e),
                    }
                },
                Err(mpsc::error::TryRecvError::Empty) => Ok(None),
                Err(mpsc::error::TryRecvError::Disconnected) => {
                    drop(receiver_guard);
                    Ok(None)
                }
            }
        }
    }

    pub async fn finish_sending(&self, stream_id: &str) -> Result<(), String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let mut stream_info = stream.lock().await;
        drop(stream_info.sender.take());
        
        Ok(())
    }

    pub async fn close_stream(&self, stream_id: &str) -> Result<(), String> {
        let stream = self.get_stream(stream_id).await
            .ok_or_else(|| format!("Stream '{}' not found", stream_id))?;
        
        let mut stream_info = stream.lock().await;
        drop(stream_info.sender.take());

        if let Some(handle) = &stream_info.task_handle {
            handle.abort();
        }
        
        drop(stream_info);
        self.remove_stream(stream_id).await;
        
        Ok(())
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

        for (_, stream_arc) in streams.iter() {
            let mut stream_info = stream_arc.lock().await;
            drop(stream_info.sender.take());

            if let Some(handle) = &stream_info.task_handle {
                handle.abort();
            }
        }

        streams.clear();
        
        Ok(())
    }
}
