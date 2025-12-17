use serde_json::Value;
use std::collections::HashMap;
use std::time::Duration;
use tonic::transport::Channel;
use tonic::{Request, Streaming};
use prost_reflect::{DescriptorPool, DynamicMessage, MethodDescriptor};
use prost::Message;
use tokio::sync::mpsc;
use tonic::codegen::tokio_stream;
use crate::component::message_converter::{json_to_dynamic_message, dynamic_message_to_json};
use crate::component::grpc_caller::{apply_metadata, create_request_message};
use futures::StreamExt;
use crate::component::stream_manager::{StreamInfo, StreamManager};

#[derive(serde::Deserialize)]
pub struct StreamCallParams {
    pub service: String,
    pub method: String,
    pub request: Option<Value>,
    pub timeout_ms: Option<u64>,
}

pub async fn start_server_stream(
    channel: &Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    stream_manager: &StreamManager,
    params: &StreamCallParams,
) -> Result<String, String> {

    let method_desc = get_method_descriptor(descriptor_pool, &params.service, &params.method)?;
    let request_message = create_request_message(&params.request, &method_desc.input())?;
    let request_bytes = request_message.encode_to_vec();

    let mut grpc_request = Request::new(request_bytes);

    apply_metadata(&mut grpc_request, metadata)?;
    
    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!("/{}/{}", method_desc.parent_service().full_name(), method_desc.name());
    let mut client = tonic::client::Grpc::new(channel.clone());
    
    let response: Streaming<Vec<u8>> = client
        .server_streaming(grpc_request, path.parse().unwrap(), tonic::codec::ProstCodec::default())
        .await
        .map_err(|e| format!("gRPC server stream failed: {}", e))?
        .into_inner();

    let (tx, rx) = mpsc::unbounded_channel();
    
    spawn_response_handler(response, method_desc.output(), tx);

    let stream_info = StreamInfo::new_server_stream(rx, method_desc.output(), params.timeout_ms);
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

pub async fn start_client_stream(
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

    let (response_tx, response_rx) = tokio::sync::oneshot::channel();
    let output_desc = method_desc.output();

    tokio::spawn(async move {
        let result: Result<tonic::Response<Vec<u8>>, tonic::Status> = client.client_streaming(
            grpc_request,
            path.parse().unwrap(),
            tonic::codec::ProstCodec::default()
        ).await;

        let final_result = match result {
            Ok(response) => {
                let bytes = response.into_inner();
                match DynamicMessage::decode(output_desc, bytes.as_ref()) {
                    Ok(message) => Ok(message),
                    Err(e) => Err(format!("Failed to decode response: {}", e)),
                }
            },
            Err(e) => Err(format!("Client stream error: {}", e)),
        };
        
        let _ = response_tx.send(final_result);
    });

    let stream_info = StreamInfo::new_client_stream(
        tx,
        method_desc.input(),
        method_desc.output(),
        response_rx,
        params.timeout_ms
    );
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

pub async fn start_bidi_stream(
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

    let response: Streaming<Vec<u8>> = client
        .streaming(
            grpc_request,
            path.parse().unwrap(),
            tonic::codec::ProstCodec::default()
        )
        .await
        .map_err(|e| format!("gRPC bidi stream failed: {}", e))?
        .into_inner();

    spawn_response_handler(response, method_desc.output(), tx_recv);

    let stream_info = StreamInfo::new_bidi_stream(
        tx_send,
        rx_recv,
        method_desc.input(),
        method_desc.output(),
        params.timeout_ms
    );
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

fn spawn_response_handler(
    mut response: Streaming<Vec<u8>>,
    output_descriptor: prost_reflect::MessageDescriptor,
    sender: mpsc::UnboundedSender<DynamicMessage>,
) {
    tokio::spawn(async move {
        while let Ok(Some(bytes)) = response.message().await {
            if let Ok(message) = DynamicMessage::decode(output_descriptor.clone(), bytes.as_ref()) {
                if sender.send(message).is_err() {
                    break;
                }
            }
        }
    });
}

pub async fn send_stream_message(
    stream_manager: &StreamManager,
    stream_id: &str,
    message_json: &Value,
) -> Result<(), String> {
    let input_descriptor = stream_manager.get_input_descriptor(stream_id).await?;
    let message = json_to_dynamic_message(message_json, &input_descriptor)?;
    stream_manager.send_message(stream_id, message).await
}

pub async fn get_next_message(
    stream_manager: &StreamManager,
    stream_id: &str,
) -> Result<Value, String> {
    match stream_manager.receive_message(stream_id).await? {
        Some(message) => {
            let json_message = dynamic_message_to_json(&message)?;
            Ok(serde_json::json!({
                "hasMore": true,
                "message": json_message
            }))
        }
        None => {
            Ok(serde_json::json!({
                "hasMore": false,
                "message": null
            }))
        }
    }
}

pub async fn finish_client_stream_and_get_response(
    stream_manager: &StreamManager,
    stream_id: &str,
) -> Result<Value, String> {

    stream_manager.finish_sending(stream_id).await?;

    match stream_manager.get_final_response(stream_id).await? {
        Some(message) => {
            let json_message = dynamic_message_to_json(&message)?;
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


