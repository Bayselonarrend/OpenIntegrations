use std::fs::{self, File};
use std::io::{Cursor, Read, Seek, Write};
use std::path::Path;

use common_core::JanxValue;
use sevenz_rust2::{decompress, decompress_with_password, ArchiveEntry, ArchiveReader, ArchiveWriter};

use crate::archive_description::{join_archive_path, ArchiveDescription, ArchiveNode};
use crate::archive_settings::PackSettings;

pub fn pack_path_to_buffer(source_path: &str, settings: &PackSettings) -> Result<Vec<u8>, String> {
    if !Path::new(source_path).exists() {
        return Err(format!("Source path not found: {}", source_path));
    }

    let mut archive_writer =
        ArchiveWriter::new(Cursor::new(Vec::new())).map_err(|error| error.to_string())?;
    settings.apply_to_writer(&mut archive_writer);
    pack_source_path(&mut archive_writer, source_path, settings.solid)?;

    archive_writer
        .finish()
        .map(|writer| writer.into_inner())
        .map_err(|error| error.to_string())
}

pub fn pack_path_to_file(
    source_path: &str,
    archive_path: &str,
    settings: &PackSettings,
) -> Result<(), String> {
    if !Path::new(source_path).exists() {
        return Err(format!("Source path not found: {}", source_path));
    }

    if let Some(parent) = Path::new(archive_path).parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent)
                .map_err(|error| format!("Failed to create archive directory: {}", error))?;
        }
    }

    let file = File::create(archive_path)
        .map_err(|error| format!("Failed to create archive file: {}", error))?;
    let mut archive_writer = ArchiveWriter::new(file).map_err(|error| error.to_string())?;
    settings.apply_to_writer(&mut archive_writer);
    pack_source_path(&mut archive_writer, source_path, settings.solid)?;
    archive_writer.finish().map_err(|error| error.to_string())?;
    Ok(())
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

pub fn pack_description_to_buffer(
    description: &ArchiveDescription,
    settings: &PackSettings,
) -> Result<Vec<u8>, String> {
    let mut archive_writer =
        ArchiveWriter::new(Cursor::new(Vec::new())).map_err(|error| error.to_string())?;
    settings.apply_to_writer(&mut archive_writer);
    push_nodes(&description.entries, "", &mut archive_writer)?;
    archive_writer
        .finish()
        .map(|writer| writer.into_inner())
        .map_err(|error| error.to_string())
}

pub fn pack_description_to_file(
    description: &ArchiveDescription,
    archive_path: &str,
    settings: &PackSettings,
) -> Result<(), String> {
    let archive_data = pack_description_to_buffer(description, settings)?;

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

    unpack_reader_to_description(&mut reader)
}

pub fn unpack_file_to_description(
    archive_path: &str,
    password: &str,
) -> Result<JanxValue, String> {
    if !Path::new(archive_path).exists() {
        return Err(format!("Archive not found: {}", archive_path));
    }

    let mut reader = ArchiveReader::open(archive_path, password.into())
        .map_err(|error| error.to_string())?;

    unpack_reader_to_description(&mut reader)
}

fn unpack_reader_to_description<R: Read + Seek>(
    reader: &mut ArchiveReader<R>,
) -> Result<JanxValue, String> {
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

    Ok(ArchiveDescription::from_flat_entries(&collected).to_janx())
}

fn pack_source_path<W: Write + Seek>(
    archive_writer: &mut ArchiveWriter<W>,
    source_path: &str,
    solid: bool,
) -> Result<(), String> {
    if solid {
        archive_writer
            .push_source_path(source_path, |_| true)
            .map_err(|error| error.to_string())?;
    } else {
        archive_writer
            .push_source_path_non_solid(source_path, |_| true)
            .map_err(|error| error.to_string())?;
    }

    Ok(())
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
