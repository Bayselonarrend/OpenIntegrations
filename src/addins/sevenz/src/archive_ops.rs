use std::collections::BTreeMap;
use std::fs::{self, File};
use std::io::{Cursor, Read, Seek, Write};
use std::path::{Path, PathBuf};

use common_archives::{
    build_selected_paths_set, ensure_parent_dir, join_archive_path, lookup_archive_entry_names,
    normalize_archive_path, parse_nonempty_path_list, require_archive_file, require_nonempty_buffer,
    require_source_path, should_skip_unsafe_entry, validate_archive_entry_path,
    check_symlink_escape, ArchiveDescription, ArchiveNode,
};

use common_core::JanxValue;
use sevenz_rust2::{
    decompress_with_extract_fn, decompress_with_extract_fn_and_password, default_entry_extract_fn,
    ArchiveEntry, ArchiveReader, ArchiveWriter,
};

use crate::archive_settings::PackSettings;

pub fn pack_path_to_buffer(source_path: &str, settings: &PackSettings) -> Result<Vec<u8>, String> {
    require_source_path(source_path)?;

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
    require_source_path(source_path)?;

    ensure_parent_dir(archive_path)?;

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
    require_nonempty_buffer(archive_data)?;

    let dest_path = Path::new(destination_path);
    fs::create_dir_all(dest_path)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    let reader = Cursor::new(archive_data.to_vec());
    unpack_reader_to_path_full(reader, destination_path, password)
}

pub fn unpack_file_to_path(
    archive_path: &str,
    destination_path: &str,
    password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;

    let dest_path = Path::new(destination_path);
    fs::create_dir_all(dest_path)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    let file = File::open(archive_path)
        .map_err(|error| format!("Failed to open archive '{}': {}", archive_path, error))?;
    unpack_reader_to_path_full(file, destination_path, password)
}

fn unpack_reader_to_path_full<R: Read + Seek>(
    reader: R,
    destination_path: &str,
    password: &str,
) -> Result<(), String> {
    let dest_path = Path::new(destination_path);
    let dest_for_closure = dest_path.to_path_buf();
    let extract = |entry: &ArchiveEntry, reader: &mut dyn Read, dest: &PathBuf| {
        let entry_name = entry.name();

        if should_skip_unsafe_entry(entry_name) {
            return Ok(false);
        }

        match validate_archive_entry_path(entry_name, &dest_for_closure) {
            Ok(resolved_dest) => {
                if dest.exists() {
                    if let Err(e) = check_symlink_escape(dest, &dest_for_closure) {
                        eprintln!("Skipping symlink that escapes destination: {}", e);
                        return Ok(false);
                    }
                }

                let adjusted_dest = PathBuf::from(resolved_dest);
                default_entry_extract_fn(entry, reader, &adjusted_dest)
            }
            Err(e) => {
                eprintln!("Skipping unsafe entry '{}': {}", entry_name, e);
                Ok(false)
            }
        }
    };

    if password.is_empty() {
        decompress_with_extract_fn(reader, destination_path, extract)
            .map_err(|error| error.to_string())
    } else {
        decompress_with_extract_fn_and_password(
            reader,
            destination_path,
            password.into(),
            extract,
        )
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

    ensure_parent_dir(archive_path)?;

    fs::write(archive_path, archive_data)
        .map_err(|error| format!("Failed to write archive file: {}", error))
}

pub fn unpack_buffer_to_description(
    archive_data: &[u8],
    password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let mut reader = ArchiveReader::new(Cursor::new(archive_data.to_vec()), password.into())
        .map_err(|error| error.to_string())?;

    unpack_reader_to_description(&mut reader)
}

pub fn unpack_file_to_description(
    archive_path: &str,
    password: &str,
) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

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

pub fn unpack_partial_file_to_path(
    archive_path: &str,
    destination_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;

    let selected = parse_nonempty_path_list(paths)?;

    let file = File::open(archive_path)
        .map_err(|error| format!("Failed to open archive '{}': {}", archive_path, error))?;

    unpack_reader_to_path(file, destination_path, &selected, password)
}

pub fn unpack_partial_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<(), String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_nonempty_path_list(paths)?;

    unpack_reader_to_path(
        Cursor::new(archive_data.to_vec()),
        destination_path,
        &selected,
        password,
    )
}

pub fn unpack_partial_file_to_description(
    archive_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let selected = parse_nonempty_path_list(paths)?;

    let mut reader = ArchiveReader::open(archive_path, password.into())
        .map_err(|error| error.to_string())?;

    unpack_reader_to_partial_description(&mut reader, &selected)
}

pub fn unpack_partial_buffer_to_description(
    archive_data: &[u8],
    paths: &JanxValue,
    password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_nonempty_path_list(paths)?;

    let mut reader = ArchiveReader::new(Cursor::new(archive_data.to_vec()), password.into())
        .map_err(|error| error.to_string())?;

    unpack_reader_to_partial_description(&mut reader, &selected)
}

fn unpack_reader_to_path<R: Read + Seek>(
    reader: R,
    destination_path: &str,
    selected_paths: &[String],
    password: &str,
) -> Result<(), String> {
    let dest_path = Path::new(destination_path);
    fs::create_dir_all(dest_path)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    let selected = build_selected_paths_set(selected_paths);

    let dest_for_closure = dest_path.to_path_buf();
    let extract = |entry: &ArchiveEntry, reader: &mut dyn Read, dest: &PathBuf| {
        let entry_path = normalize_archive_path(entry.name());
        
        if !selected.contains(&entry_path) {
            return Ok(false);
        }
        
        if should_skip_unsafe_entry(entry.name()) {
            return Ok(false);
        }
        
        match validate_archive_entry_path(entry.name(), &dest_for_closure) {
            Ok(resolved_dest) => {
                if dest.exists() {
                    if let Err(e) = check_symlink_escape(dest, &dest_for_closure) {
                        eprintln!("Skipping symlink that escapes destination: {}", e);
                        return Ok(false);
                    }
                }
                
                let adjusted_dest = PathBuf::from(resolved_dest);
                default_entry_extract_fn(entry, reader, &adjusted_dest)
            }
            Err(e) => {
                eprintln!("Skipping unsafe entry '{}': {}", entry.name(), e);
                Ok(false)
            }
        }
    };

    if password.is_empty() {
        decompress_with_extract_fn(reader, destination_path, extract)
            .map_err(|error| error.to_string())
    } else {
        decompress_with_extract_fn_and_password(
            reader,
            destination_path,
            password.into(),
            extract,
        )
        .map_err(|error| error.to_string())
    }
}

fn unpack_reader_to_partial_description<R: Read + Seek>(
    reader: &mut ArchiveReader<R>,
    selected_paths: &[String],
) -> Result<JanxValue, String> {
    let resolved = resolve_archive_entry_names(reader, selected_paths)?;
    let mut collected = Vec::with_capacity(resolved.len());

    for name in resolved {
        let data = reader
            .read_file(&name)
            .map_err(|error| error.to_string())?;
        collected.push((normalize_archive_path(&name), false, Some(data)));
    }

    Ok(ArchiveDescription::from_flat_entries(&collected).to_janx())
}

fn resolve_archive_entry_names<R: Read + Seek>(
    reader: &ArchiveReader<R>,
    selected_paths: &[String],
) -> Result<Vec<String>, String> {
    let mut name_map = BTreeMap::new();

    for entry in &reader.archive().files {
        if !entry.is_directory() {
            name_map.insert(normalize_archive_path(entry.name()), entry.name().to_string());
        }
    }

    lookup_archive_entry_names(selected_paths, &name_map)
}
