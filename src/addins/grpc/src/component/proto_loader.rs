use prost_reflect::DescriptorPool;

pub fn load_proto_files(files: std::collections::HashMap<String, String>) -> Result<DescriptorPool, String> {

    let pid = std::process::id();
    let timestamp = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let random = uuid::Uuid::new_v4().to_string();
    
    let temp_dir = std::env::temp_dir()
        .join(format!("opi_grpc_protos_{}_{}_{}",pid, timestamp, random));

    std::fs::create_dir_all(&temp_dir)
        .map_err(|e| format!("Failed to create temp directory: {}", e))?;
    
    let mut proto_paths = Vec::new();

    for (filename, content) in files {
        let proto_path = temp_dir.join(&filename);

        if let Some(parent) = proto_path.parent() {
            std::fs::create_dir_all(parent)
                .map_err(|e| format!("Failed to create directory for {}: {}", filename, e))?;
        }
        
        std::fs::write(&proto_path, content)
            .map_err(|e| format!("Failed to write proto file {}: {}", filename, e))?;
        
        proto_paths.push(proto_path);
    }
    
    if proto_paths.is_empty() {
        return Err("No proto files provided".to_string());
    }

    let file_descriptor_set = protox::compile(&proto_paths, [&temp_dir])
        .map_err(|e| format!("Failed to compile protos: {}", e))?;

    let _ = std::fs::remove_dir_all(&temp_dir);

    DescriptorPool::from_file_descriptor_set(file_descriptor_set)
        .map_err(|e| format!("Failed to create descriptor pool: {}", e))
}