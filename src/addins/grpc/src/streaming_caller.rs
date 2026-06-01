use std::collections::HashMap;
use std::time::Duration;

use common_janx::{janx, JanxValue};
use prost::Message;
use prost_reflect::{DescriptorPool, DynamicMessage, MethodDescriptor};
use tokio::sync::mpsc;
use tonic::transport::Channel;
use tonic::{Request, Streaming};

use crate::ack_stream::AckStream;
use crate::grpc_caller::{apply_metadata, create_request_message, CallParams};
use crate::identity_codec::IdentityCodec;
use crate::message_converter::{dynamic_message_to_value, value_to_dynamic_message};
use crate::stream_manager::{StreamInfo, StreamManager, StreamMessage};

#[derive(Debug)]
pub struct StreamCallParams {
    pub service: String,
    pub method: String,
    pub request: Option<JanxValue>,
    pub timeout_ms: Option<u64>,
}

impl StreamCallParams {
    pub fn from_value(value: &JanxValue) -> Result<Self, String> {
        CallParams::from_value(value).map(|p| Self {
            service: p.service,
            method: p.method,
            request: p.request,
            timeout_ms: p.timeout_ms,
        })
    }
}

pub async fn start_server_stream(
    channel: &Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    stream_manager: &StreamManager,
    params: &StreamCallParams,
) -> Result<String, String> {
    let method_desc = get_method_descriptor(descriptor_pool, &params.service, &params.method)?;
    let request_message =
        create_request_message(&params.request, &method_desc.input())?;
    let request_bytes = request_message.encode_to_vec();

    let mut grpc_request = Request::new(request_bytes);

    apply_metadata(&mut grpc_request, metadata)?;

    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!(
        "/{}/{}",
        method_desc.parent_service().full_name(),
        method_desc.name()
    );

    let mut client = tonic::client::Grpc::new(channel.clone());

    client
        .ready()
        .await
        .map_err(|e| format!("Failed to ready client: {}", e))?;

    let response: Streaming<Vec<u8>> = client
        .server_streaming(grpc_request, path.parse().unwrap(), IdentityCodec)
        .await
        .map_err(|e| format!("gRPC server stream failed: {}", e))?
        .into_inner();

    let (tx, rx) = mpsc::channel(1);

    let handler_abort_handle = spawn_response_handler(response, method_desc.output(), tx);

    let mut stream_info = StreamInfo::new(
        None,
        rx,
        None,
        Some(method_desc.output()),
        params.timeout_ms,
    );
    stream_info.add_task_handle(handler_abort_handle);
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
    let (ack_tx, ack_rx) = mpsc::channel::<StreamMessage>(1);
    let ack_stream = AckStream::new(ack_rx);
    let mut grpc_request = Request::new(ack_stream);

    apply_metadata(&mut grpc_request, metadata)?;

    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!(
        "/{}/{}",
        method_desc.parent_service().full_name(),
        method_desc.name()
    );

    let mut client = tonic::client::Grpc::new(channel.clone());

    client
        .ready()
        .await
        .map_err(|e| format!("Failed to ready client: {}", e))?;

    let (response_tx, response_rx) = mpsc::channel(1);
    let output_desc = method_desc.output();

    let task = tokio::spawn(async move {
        let result: Result<tonic::Response<Vec<u8>>, tonic::Status> = client
            .client_streaming(grpc_request, path.parse().unwrap(), IdentityCodec)
            .await;

        match result {
            Ok(response) => {
                let bytes = response.into_inner();
                match DynamicMessage::decode(output_desc, bytes.as_ref()) {
                    Ok(message) => {
                        let _ = response_tx.send(Ok(message)).await;
                    }
                    Err(e) => {
                        let _ = response_tx
                            .send(Err(format!(
                                "Failed to decode client stream response: {}",
                                e
                            )))
                            .await;
                    }
                }
            }
            Err(e) => {
                let _ = response_tx
                    .send(Err(format!("Client stream error: {}", e)))
                    .await;
            }
        }
    });

    let mut stream_info = StreamInfo::new(
        Some(ack_tx),
        response_rx,
        Some(method_desc.input()),
        Some(method_desc.output()),
        params.timeout_ms,
    );
    stream_info.add_task_handle(task.abort_handle());
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

    let (ack_tx, ack_rx) = mpsc::channel::<StreamMessage>(1);
    let (tx_recv, rx_recv) = mpsc::channel(1);

    let ack_stream = AckStream::new(ack_rx);

    let mut grpc_request = Request::new(ack_stream);
    apply_metadata(&mut grpc_request, metadata)?;

    let path_str = format!(
        "/{}/{}",
        method_desc.parent_service().full_name(),
        method_desc.name()
    );
    let path = path_str.parse().unwrap();

    let mut client = tonic::client::Grpc::new(channel.clone());

    client
        .ready()
        .await
        .map_err(|e| format!("Failed to ready client: {}", e))?;

    let output_desc = method_desc.output();

    let task = tokio::spawn(async move {
        let result: Result<tonic::Response<Streaming<Vec<u8>>>, tonic::Status> =
            client.streaming(grpc_request, path, IdentityCodec).await;

        match result {
            Ok(response) => {
                let mut stream = response.into_inner();
                loop {
                    match stream.message().await {
                        Ok(Some(bytes)) => {
                            let sending = match DynamicMessage::decode(
                                output_desc.clone(),
                                bytes.as_ref(),
                            ) {
                                Ok(message) => tx_recv.send(Ok(message)).await,
                                Err(e) => {
                                    tx_recv
                                        .send(Err(format!(
                                            "Failed to decode bidi stream response: {}",
                                            e
                                        )))
                                        .await
                                }
                            };
                            if sending.is_err() {
                                break;
                            }
                        }
                        Ok(None) => break,
                        Err(status) => {
                            let _ = tx_recv
                                .send(Err(format!("gRPC error: {}", status)))
                                .await;
                            break;
                        }
                    }
                }
            }
            Err(e) => {
                let _ = tx_recv
                    .send(Err(format!("gRPC bidi stream failed: {}", e)))
                    .await;
            }
        }
    });

    let mut stream_info = StreamInfo::new(
        Some(ack_tx),
        rx_recv,
        Some(method_desc.input()),
        Some(method_desc.output()),
        params.timeout_ms,
    );
    stream_info.add_task_handle(task.abort_handle());
    let stream_id = stream_manager.add_stream(stream_info).await;

    Ok(stream_id)
}

fn spawn_response_handler(
    mut response: Streaming<Vec<u8>>,
    output_descriptor: prost_reflect::MessageDescriptor,
    sender: mpsc::Sender<Result<DynamicMessage, String>>,
) -> tokio::task::AbortHandle {
    let task = tokio::spawn(async move {
        loop {
            match response.message().await {
                Ok(Some(bytes)) => {
                    let sending = match DynamicMessage::decode(output_descriptor.clone(), bytes.as_ref())
                    {
                        Ok(message) => sender.send(Ok(message)).await,
                        Err(e) => sender
                            .send(Err(format!("Failed to decode response: {}", e)))
                            .await,
                    };
                    if sending.is_err() {
                        break;
                    }
                }
                Ok(None) => break,
                Err(status) => {
                    let _ = sender
                        .send(Err(format!("gRPC error: {}", status)))
                        .await;
                    break;
                }
            }
        }
    });
    task.abort_handle()
}

pub async fn send_stream_message(
    stream_manager: &StreamManager,
    stream_id: &str,
    message: &JanxValue,
) -> Result<(), String> {
    let input_descriptor = stream_manager.get_input_descriptor(stream_id).await?;
    let dynamic_message = value_to_dynamic_message(message, &input_descriptor)?;
    stream_manager
        .send_message(stream_id, dynamic_message)
        .await
}

pub async fn get_next_message(
    stream_manager: &StreamManager,
    stream_id: &str,
) -> Result<JanxValue, String> {
    match stream_manager.receive_message(stream_id).await? {
        Some(message) => {
            let janx_message = dynamic_message_to_value(&message)?;
            Ok(janx!({
                "result": true,
                "message": janx_message,
            }))
        }
        None => Ok(janx!({
            "result": true,
            "message": JanxValue::Null,
        })),
    }
}

fn get_method_descriptor(
    descriptor_pool: &DescriptorPool,
    service_name: &str,
    method_name: &str,
) -> Result<MethodDescriptor, String> {
    let service = descriptor_pool
        .get_service_by_name(service_name)
        .ok_or_else(|| format!("Service '{}' not found", service_name))?;

    let method = service
        .methods()
        .find(|m| m.name() == method_name)
        .ok_or_else(|| {
            format!(
                "Method '{}' not found in service '{}'",
                method_name, service_name
            )
        })?;

    Ok(method)
}
