use serde_json::Value;
use std::collections::HashMap;
use std::time::Duration;
use tonic::transport::Channel;
use tonic::{Request, Streaming};
use prost_reflect::{DescriptorPool, DynamicMessage, MethodDescriptor};
use prost::Message;
use tokio::sync::mpsc;
use tonic::codegen::tokio_stream;
use common_binary::vault::BinaryVault;
use crate::message_converter::{json_to_dynamic_message, dynamic_message_to_json};
use crate::grpc_caller::{apply_metadata, create_request_message};
use futures::StreamExt;
use crate::stream_manager::{StreamInfo, StreamManager};

#[derive(serde::Deserialize)]
pub struct StreamCallParams {
    pub service: String,
    pub method: String,
    pub request: Option<Value>,
    pub timeout_ms: Option<u64>,
}

pub async fn start_server_stream(
    binary_vault: &BinaryVault,
    channel: &Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    stream_manager: &StreamManager,
    params: &StreamCallParams,
) -> Result<String, String> {

    let method_desc = get_method_descriptor(descriptor_pool, &params.service, &params.method)?;
    let request_message = create_request_message(binary_vault, &params.request, &method_desc.input())?;
    let request_bytes = request_message.encode_to_vec();

    let mut grpc_request = Request::new(request_bytes);

    apply_metadata(&mut grpc_request, metadata)?;
    
    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!("/{}/{}", method_desc.parent_service().full_name(), method_desc.name());
    
    let mut client = tonic::client::Grpc::new(channel.clone());

    client.ready().await
        .map_err(|e| format!("Failed to ready client: {}", e))?;
    
    let response: Streaming<Vec<u8>> = client
        .server_streaming(grpc_request, path.parse().unwrap(), tonic::codec::ProstCodec::default())
        .await
        .map_err(|e| format!("gRPC server stream failed: {}", e))?
        .into_inner();

    let (tx, rx) = mpsc::unbounded_channel();
    
    let handler_abort_handle = spawn_response_handler(response, method_desc.output(), tx);

    let mut stream_info = StreamInfo::new_server_stream(rx, method_desc.output(), params.timeout_ms);
    stream_info.add_task_handle(handler_abort_handle);
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

pub async fn start_client_stream(
    _binary_vault: &BinaryVault,
    channel: &Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    stream_manager: &StreamManager,
    params: &StreamCallParams,
) -> Result<String, String> {
    let method_desc = get_method_descriptor(descriptor_pool, &params.service, &params.method)?;

    let (tx, rx) = mpsc::unbounded_channel::<DynamicMessage>();

    let byte_stream = tokio_stream::wrappers::UnboundedReceiverStream::new(rx)
        .map(|msg| msg.encode_to_vec());
    
    let mut grpc_request = Request::new(byte_stream);
    apply_metadata(&mut grpc_request, metadata)?;
    
    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!("/{}/{}", method_desc.parent_service().full_name(), method_desc.name());
    
    let mut client = tonic::client::Grpc::new(channel.clone());

    client.ready().await
        .map_err(|e| format!("Failed to ready client: {}", e))?;

    let (response_tx, response_rx) = mpsc::unbounded_channel();
    let output_desc = method_desc.output();

    let task = tokio::spawn(async move {
        let result: Result<tonic::Response<Vec<u8>>, tonic::Status> = client
            .client_streaming(
                grpc_request,
                path.parse().unwrap(),
                tonic::codec::ProstCodec::default(),
            )
            .await;

        match result {
            Ok(response) => {
                let bytes = response.into_inner();
                match DynamicMessage::decode(output_desc, bytes.as_ref()) {
                    Ok(message) => {
                        let _ = response_tx.send(message);
                    }
                    Err(e) => {
                        eprintln!("Failed to decode client stream response: {}", e);
                    }
                }
            }
            Err(e) => {
                eprintln!("Client stream error: {}", e);
            }
        }
    });

    let mut stream_info = StreamInfo::new_client_stream(
        tx,
        response_rx,
        method_desc.input(),
        method_desc.output(),
        params.timeout_ms
    );
    stream_info.add_task_handle(task.abort_handle());
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

pub async fn start_bidi_stream(
    _binary_vault: &BinaryVault,
    channel: &Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    stream_manager: &StreamManager,
    params: &StreamCallParams,
) -> Result<String, String> {
    let method_desc = get_method_descriptor(descriptor_pool, &params.service, &params.method)?;

    let (tx_send, rx_send) = mpsc::unbounded_channel::<DynamicMessage>();
    let (tx_recv, rx_recv) = mpsc::unbounded_channel();

    let byte_stream = tokio_stream::wrappers::UnboundedReceiverStream::new(rx_send)
        .map(|msg| msg.encode_to_vec());
    
    let mut grpc_request = Request::new(byte_stream);
    apply_metadata(&mut grpc_request, metadata)?;
    
    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!("/{}/{}", method_desc.parent_service().full_name(), method_desc.name());
    
    let mut client = tonic::client::Grpc::new(channel.clone());

    client.ready().await
        .map_err(|e| format!("Failed to ready client: {}", e))?;

    let response: Streaming<Vec<u8>> = client
        .streaming(
            grpc_request,
            path.parse().unwrap(),
            tonic::codec::ProstCodec::default()
        )
        .await
        .map_err(|e| format!("gRPC bidi stream failed: {}", e))?
        .into_inner();

    let handler_abort_handle = spawn_response_handler(response, method_desc.output(), tx_recv);

    let mut stream_info = StreamInfo::new_bidi_stream(
        tx_send,
        rx_recv,
        method_desc.input(),
        method_desc.output(),
        params.timeout_ms
    );
    stream_info.add_task_handle(handler_abort_handle);
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

fn spawn_response_handler(
    mut response: Streaming<Vec<u8>>,
    output_descriptor: prost_reflect::MessageDescriptor,
    sender: mpsc::UnboundedSender<DynamicMessage>,
) -> tokio::task::AbortHandle {
    let task = tokio::spawn(async move {
        while let Ok(Some(bytes)) = response.message().await {
            if let Ok(message) = DynamicMessage::decode(output_descriptor.clone(), bytes.as_ref()) {
                if sender.send(message).is_err() {
                    break;
                }
            }
        }
    });
    task.abort_handle()
}

pub async fn send_stream_message(
    binary_vault: &BinaryVault,
    stream_manager: &StreamManager,
    stream_id: &str,
    message_json: &Value,
) -> Result<(), String> {
    let input_descriptor = stream_manager.get_input_descriptor(stream_id).await?;
    let message = json_to_dynamic_message(binary_vault, message_json, &input_descriptor)?;
    stream_manager.send_message(stream_id, message).await
}

pub async fn get_next_message(
    binary_vault: &BinaryVault,
    stream_manager: &StreamManager,
    stream_id: &str,
) -> Result<Value, String> {
    match stream_manager.receive_message(stream_id).await? {
        Some(message) => {
            let json_message = dynamic_message_to_json(binary_vault, &message)?;

            Ok(serde_json::json!({
                "result": true,
                "message": json_message
            }))
        }
        None => {
            Ok(serde_json::json!({
                "result": true,
                "message": null
            }))
        }
    }
}

pub async fn finish_client_stream_and_get_response(
    binary_vault: &BinaryVault,
    stream_manager: &StreamManager,
    stream_id: &str,
) -> Result<Value, String> {

    stream_manager.finish_sending(stream_id).await?;

    match stream_manager.receive_message(stream_id).await? {
        Some(message) => {
            let json_message = dynamic_message_to_json(binary_vault, &message)?;
            Ok(json_message)
        }
        None => Err("No final response received".to_string()),
    }
}

fn get_method_descriptor<'a>(
    descriptor_pool: &'a DescriptorPool,
    service_name: &str,
    method_name: &str,
) -> Result<MethodDescriptor, String> {
    let service = descriptor_pool
        .get_service_by_name(service_name)
        .ok_or_else(|| format!("Service '{}' not found", service_name))?;

    let method = service
        .methods()
        .find(|m| m.name() == method_name)
        .ok_or_else(|| format!("Method '{}' not found in service '{}'", method_name, service_name))?;
    
    Ok(method)
}


