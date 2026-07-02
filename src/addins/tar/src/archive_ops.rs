use std::collections::HashSet;
use std::fs::{self, File};
use std::io::{Cursor, Read, Write};
use std::path::Path;

use common_archives::{
    ensure_parent_dir, ensure_selected_entries_exist, join_archive_path, normalize_archive_path,
    parse_selected_paths_set, require_archive_file, require_nonempty_buffer, require_source_path,
    should_skip_unsafe_entry, validate_archive_entry_path, ArchiveDescription, ArchiveNode,
};
use common_core::JanxValue;
use flate2::read::GzDecoder;
use flate2::write::GzEncoder;
use tar::{Archive, Builder, EntryType};

use crate::archive_settings::PackSettings;

pub fn pack_path_to_buffer(source_path: &str, settings: &PackSettings) -> Result<Vec<u8>, String> {
    require_source_path(source_path)?;

    let buffer = Vec::new();

    if settings.gzip {
        let encoder = GzEncoder::new(buffer, settings.gzip_compression());
        let mut builder = Builder::new(encoder);
        append_source_path(&mut builder, source_path)?;
        let encoder = builder
            .into_inner()
            .map_err(|error| error.to_string())?;
        encoder.finish().map_err(|error| error.to_string())
    } else {
        let mut builder = Builder::new(buffer);
        append_source_path(&mut builder, source_path)?;
        Ok(builder
            .into_inner()
            .map_err(|error| error.to_string())?)
    }
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

    if settings.gzip {
        let encoder = GzEncoder::new(file, settings.gzip_compression());
        let mut builder = Builder::new(encoder);
        append_source_path(&mut builder, source_path)?;
        builder
            .into_inner()
            .map_err(|error| error.to_string())?
            .finish()
            .map_err(|error| error.to_string())?;
    } else {
        let mut builder = Builder::new(file);
        append_source_path(&mut builder, source_path)?;
        builder
            .into_inner()
            .map_err(|error| error.to_string())?;
    }

    Ok(())
}

pub fn pack_description_to_buffer(
    description: &ArchiveDescription,
    settings: &PackSettings,
) -> Result<Vec<u8>, String> {
    let buffer = Vec::new();

    if settings.gzip {
        let encoder = GzEncoder::new(buffer, settings.gzip_compression());
        let mut builder = Builder::new(encoder);
        push_nodes(&description.entries, "", &mut builder)?;
        let encoder = builder
            .into_inner()
            .map_err(|error| error.to_string())?;
        encoder.finish().map_err(|error| error.to_string())
    } else {
        let mut builder = Builder::new(buffer);
        push_nodes(&description.entries, "", &mut builder)?;
        Ok(builder
            .into_inner()
            .map_err(|error| error.to_string())?)
    }
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

pub fn unpack_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    _password: &str,
) -> Result<(), String> {
    require_nonempty_buffer(archive_data)?;

    let archive = open_archive_from_bytes(archive_data.to_vec())?;
    extract_archive_to_path(archive, destination_path, None)
}

pub fn unpack_file_to_path(
    archive_path: &str,
    destination_path: &str,
    _password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;

    let archive = open_archive_from_file(archive_path)?;
    extract_archive_to_path(archive, destination_path, None)
}

pub fn unpack_buffer_to_description(
    archive_data: &[u8],
    _password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let archive = open_archive_from_bytes(archive_data.to_vec())?;
    collect_description(archive, None)
}

pub fn unpack_file_to_description(
    archive_path: &str,
    _password: &str,
) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let archive = open_archive_from_file(archive_path)?;
    collect_description(archive, None)
}

pub fn unpack_partial_file_to_path(
    archive_path: &str,
    destination_path: &str,
    paths: &JanxValue,
    _password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;

    let selected = parse_selected_paths_set(paths)?;

    let archive = open_archive_from_file(archive_path)?;
    extract_archive_to_path(archive, destination_path, Some(&selected))
}

pub fn unpack_partial_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    paths: &JanxValue,
    _password: &str,
) -> Result<(), String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_selected_paths_set(paths)?;

    let archive = open_archive_from_bytes(archive_data.to_vec())?;
    extract_archive_to_path(archive, destination_path, Some(&selected))
}

pub fn unpack_partial_file_to_description(
    archive_path: &str,
    paths: &JanxValue,
    _password: &str,
) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let selected = parse_selected_paths_set(paths)?;

    let resolved = resolve_archive_entry_names_from_file(archive_path, &selected)?;
    let archive = open_archive_from_file(archive_path)?;
    collect_description(archive, Some(&resolved))
}

pub fn unpack_partial_buffer_to_description(
    archive_data: &[u8],
    paths: &JanxValue,
    _password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_selected_paths_set(paths)?;

    let resolved = resolve_archive_entry_names_from_bytes(archive_data, &selected)?;
    let archive = open_archive_from_bytes(archive_data.to_vec())?;
    collect_description(archive, Some(&resolved))
}

fn is_gzip(data: &[u8]) -> bool {
    data.len() >= 2 && data[0] == 0x1f && data[1] == 0x8b
}

fn looks_gzip_path(path: &str) -> bool {
    let lower = path.to_ascii_lowercase();
    lower.ends_with(".tar.gz") || lower.ends_with(".tgz") || lower.ends_with(".gz")
}

fn open_archive_from_bytes(data: Vec<u8>) -> Result<Archive<Box<dyn Read>>, String> {
    if is_gzip(&data) {
        Ok(Archive::new(Box::new(GzDecoder::new(Cursor::new(data))) as Box<dyn Read>))
    } else {
        Ok(Archive::new(Box::new(Cursor::new(data)) as Box<dyn Read>))
    }
}

fn open_archive_from_file(archive_path: &str) -> Result<Archive<Box<dyn Read>>, String> {
    let file = File::open(archive_path)
        .map_err(|error| format!("Failed to open archive '{}': {}", archive_path, error))?;

    if looks_gzip_path(archive_path) {
        Ok(Archive::new(
            Box::new(GzDecoder::new(file)) as Box<dyn Read>
        ))
    } else {
        Ok(Archive::new(Box::new(file) as Box<dyn Read>))
    }
}

fn append_source_path<W: Write>(builder: &mut Builder<W>, source_path: &str) -> Result<(), String> {
    let source = Path::new(source_path);

    if source.is_file() {
        let name = source
            .file_name()
            .ok_or_else(|| format!("Invalid source file path: {}", source_path))?
            .to_string_lossy();
        builder
            .append_path_with_name(source, name.as_ref())
            .map_err(|error| error.to_string())?;
        return Ok(());
    }

    if source.is_dir() {
        for entry in fs::read_dir(source).map_err(|error| error.to_string())? {
            let entry = entry.map_err(|error| error.to_string())?;
            let path = entry.path();
            let name = entry.file_name().to_string_lossy().to_string();
            append_fs_entry(builder, &path, &name)?;
        }
        return Ok(());
    }

    Err(format!("Source path not found: {}", source_path))
}

fn append_fs_entry<W: Write>(
    builder: &mut Builder<W>,
    path: &Path,
    archive_name: &str,
) -> Result<(), String> {
    if path.is_dir() {
        for entry in fs::read_dir(path).map_err(|error| error.to_string())? {
            let entry = entry.map_err(|error| error.to_string())?;
            let child_path = entry.path();
            let child_name = join_archive_path(
                archive_name,
                &entry.file_name().to_string_lossy(),
            );
            append_fs_entry(builder, &child_path, &child_name)?;
        }
        Ok(())
    } else if path.is_file() {
        builder
            .append_path_with_name(path, archive_name)
            .map_err(|error| error.to_string())
    } else {
        Ok(())
    }
}

fn push_nodes<W: Write>(
    nodes: &[ArchiveNode],
    prefix: &str,
    builder: &mut Builder<W>,
) -> Result<(), String> {
    for node in nodes {
        push_node(node, prefix, builder)?;
    }
    Ok(())
}

fn push_node<W: Write>(
    node: &ArchiveNode,
    prefix: &str,
    builder: &mut Builder<W>,
) -> Result<(), String> {
    match node {
        ArchiveNode::Directory { name, entries } => {
            let archive_name = join_archive_path(prefix, name);
            if entries.is_empty() {
                let mut header = tar::Header::new_gnu();
                header.set_entry_type(EntryType::Directory);
                header.set_size(0);
                header.set_mode(0o755);
                header.set_cksum();
                builder
                    .append_data(&mut header, archive_name, &[][..])
                    .map_err(|error| error.to_string())?;
            } else {
                push_nodes(entries, &archive_name, builder)?;
            }
            Ok(())
        }
        ArchiveNode::FileFromPath { name, path } => {
            let archive_name = join_archive_path(prefix, name);
            builder
                .append_path_with_name(path, archive_name)
                .map_err(|error| error.to_string())
        }
        ArchiveNode::FileFromData { name, data } => {
            let archive_name = join_archive_path(prefix, name);
            let mut header = tar::Header::new_gnu();
            header.set_size(data.len() as u64);
            header.set_mode(0o644);
            header.set_cksum();
            builder
                .append_data(&mut header, archive_name, &data[..])
                .map_err(|error| error.to_string())
        }
    }
}

fn extract_archive_to_path<R: Read>(
    mut archive: Archive<R>,
    destination_path: &str,
    selected: Option<&HashSet<String>>,
) -> Result<(), String> {
    let dest = Path::new(destination_path);
    fs::create_dir_all(dest)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    for entry_result in archive.entries().map_err(|error| error.to_string())? {
        let mut entry = entry_result.map_err(|error| error.to_string())?;
        let entry_path = entry.path().map_err(|error| error.to_string())?;
        let normalized = normalize_archive_path(&entry_path.to_string_lossy());

        if normalized.is_empty() || should_skip_unsafe_entry(&normalized) {
            continue;
        }

        if let Some(selected_paths) = selected {
            if !selected_paths.contains(&normalized) {
                continue;
            }
        }

        validate_archive_entry_path(&normalized, dest)?;

        if matches!(
            entry.header().entry_type(),
            EntryType::Symlink | EntryType::Link
        ) {
            continue;
        }

        entry
            .unpack_in(dest)
            .map_err(|error| format!("Failed to unpack entry '{}': {}", normalized, error))?;
    }

    Ok(())
}

fn collect_description<R: Read>(
    mut archive: Archive<R>,
    selected: Option<&HashSet<String>>,
) -> Result<JanxValue, String> {
    let mut collected = Vec::new();

    for entry_result in archive.entries().map_err(|error| error.to_string())? {
        let mut entry = entry_result.map_err(|error| error.to_string())?;
        let entry_path = entry.path().map_err(|error| error.to_string())?;
        let normalized = normalize_archive_path(&entry_path.to_string_lossy());

        if normalized.is_empty() || should_skip_unsafe_entry(&normalized) {
            continue;
        }

        if let Some(selected_paths) = selected {
            if !selected_paths.contains(&normalized) {
                continue;
            }
        }

        let entry_type = entry.header().entry_type();
        if entry_type.is_dir() {
            collected.push((normalized, true, None));
        } else if entry_type.is_file() {
            let mut data = Vec::new();
            entry
                .read_to_end(&mut data)
                .map_err(|error| error.to_string())?;
            collected.push((normalized, false, Some(data)));
        }
    }

    Ok(ArchiveDescription::from_flat_entries(&collected).to_janx())
}

fn resolve_archive_entry_names_from_file(
    archive_path: &str,
    selected_paths: &HashSet<String>,
) -> Result<HashSet<String>, String> {
    let archive = open_archive_from_file(archive_path)?;
    resolve_archive_entry_names(archive, selected_paths)
}

fn resolve_archive_entry_names_from_bytes(
    archive_data: &[u8],
    selected_paths: &HashSet<String>,
) -> Result<HashSet<String>, String> {
    let archive = open_archive_from_bytes(archive_data.to_vec())?;
    resolve_archive_entry_names(archive, selected_paths)
}

fn resolve_archive_entry_names<R: Read>(
    mut archive: Archive<R>,
    selected_paths: &HashSet<String>,
) -> Result<HashSet<String>, String> {
    let mut name_map = HashSet::new();

    for entry_result in archive.entries().map_err(|error| error.to_string())? {
        let entry = entry_result.map_err(|error| error.to_string())?;
        if entry.header().entry_type().is_file() {
            let path = entry.path().map_err(|error| error.to_string())?;
            let normalized = normalize_archive_path(&path.to_string_lossy());
            name_map.insert(normalized);
        }
    }

    ensure_selected_entries_exist(selected_paths, &name_map)?;

    Ok(selected_paths.clone())
}
