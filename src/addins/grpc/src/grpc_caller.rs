use std::collections::HashMap;
use std::time::Duration;

use common_janx::{FromJanx, JanxValue};
use prost::Message;
use prost_reflect::{DescriptorPool, DynamicMessage};
use tonic::metadata::{Ascii, MetadataKey, MetadataValue};
use tonic::transport::Channel;
use tonic::Request;

use crate::identity_codec::IdentityCodec;
use crate::message_converter::{dynamic_message_to_janx, janx_to_dynamic_message};

#[derive(Debug)]
pub struct CallParams {
    pub service: String,
    pub method: String,
    pub request: Option<JanxValue>,
    pub timeout_ms: Option<u64>,
}

impl CallParams {
    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        let map = value
            .as_object()
            .ok_or_else(|| "Expected call params object".to_string())?;

        let service = map
            .get("service")
            .and_then(String::from_janx)
            .ok_or_else(|| "Missing or invalid 'service'".to_string())?;
        let method = map
            .get("method")
            .and_then(String::from_janx)
            .ok_or_else(|| "Missing or invalid 'method'".to_string())?;
        let timeout_ms = map
            .get("timeout_ms")
            .and_then(i64::from_janx)
            .map(|n| n as u64);
        let request = map.get("request").cloned();

        Ok(Self {
            service,
            method,
            request,
            timeout_ms,
        })
    }
}

pub fn apply_metadata<T>(
    request: &mut Request<T>,
    metadata: &HashMap<String, String>,
) -> Result<(), String> {
    for (key, value) in metadata {
        if let (Ok(metadata_key), Ok(metadata_value)) = (
            MetadataKey::<Ascii>::from_bytes(key.as_bytes()),
            MetadataValue::try_from(value.as_str()),
        ) {
            request.metadata_mut().insert(metadata_key, metadata_value);
        }
    }
    Ok(())
}

pub fn create_request_message(
    request_data: &Option<JanxValue>,
    message_descriptor: &prost_reflect::MessageDescriptor,
) -> Result<DynamicMessage, String> {
    if let Some(data) = request_data {
        janx_to_dynamic_message(data, message_descriptor)
    } else {
        Ok(DynamicMessage::new(message_descriptor.clone()))
    }
}

pub async fn execute_grpc_call(
    channel: &mut Channel,
    descriptor_pool: &DescriptorPool,
    metadata: &HashMap<String, String>,
    params: &CallParams,
) -> Result<JanxValue, String> {
    let service = descriptor_pool
        .get_service_by_name(&params.service)
        .ok_or_else(|| format!("Service '{}' not found", params.service))?;

    let method = service
        .methods()
        .find(|m| m.name() == params.method)
        .ok_or_else(|| {
            format!(
                "Method '{}' not found in service '{}'",
                params.method, params.service
            )
        })?;

    let request_message =
        create_request_message(&params.request, &method.input())?;

    let request_bytes = request_message.encode_to_vec();

    let mut grpc_request = Request::new(request_bytes);

    apply_metadata(&mut grpc_request, metadata)?;

    if let Some(timeout_ms) = params.timeout_ms {
        grpc_request.set_timeout(Duration::from_millis(timeout_ms));
    }

    let path = format!("/{}/{}", service.full_name(), method.name());

    use tower::ServiceExt;
    let ready_channel = channel
        .ready()
        .await
        .map_err(|e| format!("Failed to ready channel: {}", e))?;

    let mut client = tonic::client::Grpc::new(ready_channel);
    let response = client
        .unary(grpc_request, path.parse().unwrap(), IdentityCodec)
        .await
        .map_err(|e| format!("gRPC call failed: {}", e))?;

    let response_bytes: Vec<u8> = response.into_inner();
    let response_message = DynamicMessage::decode(method.output(), response_bytes.as_ref())
        .map_err(|e| format!("Failed to decode response: {}", e))?;

    dynamic_message_to_janx(&response_message)
}
