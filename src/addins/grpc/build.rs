fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Компилируем proto файлы, если они есть в папке proto
    let proto_dir = std::path::Path::new("proto");
    if proto_dir.exists() {
        let proto_files: Vec<_> = std::fs::read_dir(proto_dir)?
            .filter_map(|entry| {
                let entry = entry.ok()?;
                let path = entry.path();
                if path.extension()? == "proto" {
                    Some(path)
                } else {
                    None
                }
            })
            .collect();

        if !proto_files.is_empty() {
            tonic_build::configure()
                .build_server(true)
                .build_client(true)
                .compile_protos(&proto_files, &["proto"])?;
        }
    }
    
    Ok(())
}