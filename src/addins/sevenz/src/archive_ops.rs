use std::fs::{self, File};
use std::io::{Cursor, Seek, Write};
use std::path::Path;

use common_core::JanxValue;
use sevenz_rust2::{
    compress, compress_encrypted, decompress, decompress_with_password, encoder_options::AesEncoderOptions,
    ArchiveEntry, ArchiveReader, ArchiveWriter, EncoderMethod, Password,
};

use crate::archive_description::{join_archive_path, ArchiveDescription, ArchiveNode};

pub fn pack_path_to_buffer(source_path: &str, password: &str) -> Result<Vec<u8>, String> {
    if !Path::new(source_path).exists() {
        return Err(format!("Source path not found: {}", source_path));
    }

    let writer = Cursor::new(Vec::new());
    let writer = if password.is_empty() {
        compress(source_path, writer).map_err(|error| error.to_string())?
    } else {
        compress_encrypted(source_path, writer, password.into())
            .map_err(|error| error.to_string())?
    };

    Ok(writer.into_inner())
}

pub fn unpack_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    password: &str,
) -> Result<(), String> {
    if archive_data.is_empty() {
        return Err("Archive data is empty".to_string());
    }

    fs::create_dir_all(destination_path)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    let reader = Cursor::new(archive_data.to_vec());
    if password.is_empty() {
        decompress(reader, destination_path).map_err(|error| error.to_string())
    } else {
        decompress_with_password(reader, destination_path, password.into())
            .map_err(|error| error.to_string())
    }
}

pub fn pack_description_to_buffer(description: &ArchiveDescription) -> Result<Vec<u8>, String> {
    let writer = Cursor::new(Vec::new());
    let mut archive_writer = ArchiveWriter::new(writer).map_err(|error| error.to_string())?;

    if !description.password.is_empty() {
        archive_writer.set_content_methods(vec![
            AesEncoderOptions::new(Password::new(&description.password)).into(),
            EncoderMethod::LZMA2.into(),
        ]);
    }

    push_nodes(&description.entries, "", &mut archive_writer)?;

    archive_writer
        .finish()
        .map(|writer| writer.into_inner())
        .map_err(|error| error.to_string())
}

pub fn pack_description_to_file(
    description: &ArchiveDescription,
    archive_path: &str,
) -> Result<(), String> {
    let archive_data = pack_description_to_buffer(description)?;

    if let Some(parent) = Path::new(archive_path).parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent)
                .map_err(|error| format!("Failed to create archive directory: {}", error))?;
        }
    }

    fs::write(archive_path, archive_data)
        .map_err(|error| format!("Failed to write archive file: {}", error))
}

pub fn unpack_buffer_to_description(
    archive_data: &[u8],
    password: &str,
) -> Result<JanxValue, String> {
    if archive_data.is_empty() {
        return Err("Archive data is empty".to_string());
    }

    let mut reader = ArchiveReader::new(Cursor::new(archive_data.to_vec()), password.into())
        .map_err(|error| error.to_string())?;

    let file_list: Vec<(String, bool)> = reader
        .archive()
        .files
        .iter()
        .map(|entry| (entry.name().to_string(), entry.is_directory()))
        .collect();

    let mut collected = Vec::with_capacity(file_list.len());
    for (name, is_directory) in file_list {
        if is_directory {
            collected.push((name, true, None));
        } else {
            let data = reader
                .read_file(&name)
                .map_err(|error| error.to_string())?;
            collected.push((name, false, Some(data)));
        }
    }

    Ok(ArchiveDescription::from_flat_entries(password.to_string(), &collected).to_janx())
}

fn push_nodes<W: Write + Seek>(
    nodes: &[ArchiveNode],
    prefix: &str,
    archive_writer: &mut ArchiveWriter<W>,
) -> Result<(), String> {
    for node in nodes {
        push_node(node, prefix, archive_writer)?;
    }
    Ok(())
}

fn push_node<W: Write + Seek>(
    node: &ArchiveNode,
    prefix: &str,
    archive_writer: &mut ArchiveWriter<W>,
) -> Result<(), String> {
    match node {
        ArchiveNode::Directory { name, entries } => {
            let archive_name = join_archive_path(prefix, name);
            let entry = ArchiveEntry::new_directory(&archive_name);
            archive_writer
                .push_archive_entry::<&[u8]>(entry, None)
                .map_err(|error| error.to_string())?;
            push_nodes(entries, &archive_name, archive_writer)
        }
        ArchiveNode::FileFromPath { name, path } => {
            let archive_name = join_archive_path(prefix, name);
            let entry = ArchiveEntry::from_path(path, archive_name);
            let file = File::open(path).map_err(|error| {
                format!("Failed to open source file '{}': {}", path, error)
            })?;
            archive_writer
                .push_archive_entry(entry, Some(file))
                .map_err(|error| error.to_string())?;
            Ok(())
        }
        ArchiveNode::FileFromData { name, data } => {
            let archive_name = join_archive_path(prefix, name);
            let entry = ArchiveEntry::new_file(&archive_name);
            archive_writer
                .push_archive_entry(entry, Some(Cursor::new(data.clone())))
                .map_err(|error| error.to_string())?;
            Ok(())
        }
    }
}
