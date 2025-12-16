use serde_json::{json, Value};
use prost_reflect::{DescriptorPool, MessageDescriptor};

pub fn list_services(descriptor_pool: &DescriptorPool) -> Result<Vec<String>, String> {
    let services: Vec<String> = descriptor_pool
        .services()
        .map(|service| service.full_name().to_string())
        .collect();

    Ok(services)
}

pub fn list_methods(descriptor_pool: &DescriptorPool, service_name: &str) -> Result<Vec<String>, String> {
    let service = descriptor_pool
        .get_service_by_name(service_name)
        .ok_or_else(|| format!("Service '{}' not found", service_name))?;

    let methods: Vec<String> = service
        .methods()
        .map(|method| method.name().to_string())
        .collect();

    Ok(methods)
}

pub fn get_method_info(
    descriptor_pool: &DescriptorPool,
    service_name: &str,
    method_name: &str,
) -> Result<Value, String> {
    let service = descriptor_pool
        .get_service_by_name(service_name)
        .ok_or_else(|| format!("Service '{}' not found", service_name))?;

    let method = service
        .methods()
        .find(|m| m.name() == method_name)
        .ok_or_else(|| format!("Method '{}' not found in service '{}'", method_name, service_name))?;

    let input_desc = method.input();
    let output_desc = method.output();
    let input_type = input_desc.full_name();
    let output_type = output_desc.full_name();

    let input_schema = message_to_json_schema(&input_desc);
    let output_schema = message_to_json_schema(&output_desc);

    Ok(json!({
        "request_type": input_type,
        "response_type": output_type,
        "request_schema": input_schema,
        "response_schema": output_schema,
        "is_client_streaming": method.is_client_streaming(),
        "is_server_streaming": method.is_server_streaming()
    }))
}

fn message_to_json_schema(message_desc: &MessageDescriptor) -> Value {
    let mut fields = serde_json::Map::new();
    
    for field in message_desc.fields() {
        let field_name = field.name().to_string();
        let field_type = match field.kind() {
            prost_reflect::Kind::Double => "double",
            prost_reflect::Kind::Float => "float",
            prost_reflect::Kind::Int32 => "int32",
            prost_reflect::Kind::Int64 => "int64",
            prost_reflect::Kind::Uint32 => "uint32",
            prost_reflect::Kind::Uint64 => "uint64",
            prost_reflect::Kind::Sint32 => "sint32",
            prost_reflect::Kind::Sint64 => "sint64",
            prost_reflect::Kind::Fixed32 => "fixed32",
            prost_reflect::Kind::Fixed64 => "fixed64",
            prost_reflect::Kind::Sfixed32 => "sfixed32",
            prost_reflect::Kind::Sfixed64 => "sfixed64",
            prost_reflect::Kind::Bool => "bool",
            prost_reflect::Kind::String => "string",
            prost_reflect::Kind::Bytes => "bytes",
            prost_reflect::Kind::Message(_) => "message",
            prost_reflect::Kind::Enum(_) => "enum",
        };
        
        fields.insert(field_name, json!({
            "type": field_type,
            "number": field.number(),
            "required": !field.supports_presence()
        }));
    }
    
    json!({
        "type": "object",
        "fields": fields
    })
}