use prost_reflect::DescriptorPool;

pub fn load_proto_content(content: &str) -> Result<DescriptorPool, String> {

    let temp_dir = std::env::temp_dir();
    let proto_path = temp_dir.join("temp_input.proto");
    
    std::fs::write(&proto_path, content)
        .map_err(|e| format!("Failed to write temp proto file: {}", e))?;
    
    let file_descriptor_set = protox::compile([&proto_path], [&temp_dir])
        .map_err(|e| format!("Failed to compile proto: {}", e))?;

    DescriptorPool::from_file_descriptor_set(file_descriptor_set)
        .map_err(|e| format!("Failed to create descriptor pool: {}", e))
}