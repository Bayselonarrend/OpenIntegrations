use std::collections::HashSet;
use std::fs;
use std::path::Path;

use common_archives::{
    ensure_selected_entries_exist, normalize_archive_path, parse_selected_paths_set,
    require_archive_file, require_nonempty_buffer, should_skip_unsafe_entry,
    validate_archive_entry_path, ArchiveDescription, ListEntry,
};
use common_core::{janx, JanxValue};
use unrar::Archive;

use crate::archive_settings::PackSettings;

const PACK_UNSUPPORTED: &str = "RAR archive creation is not supported";

#[derive(Debug, Clone)]
pub struct EntryInfo {
    pub path: String,
    pub is_directory: bool,
    pub size: u64,
}

impl ListEntry for EntryInfo {
    fn path(&self) -> &str {
        &self.path
    }

    fn is_directory(&self) -> bool {
        self.is_directory
    }

    fn list_file_fields(&self) -> JanxValue {
        janx!({
            "size": self.size,
        })
    }
}

pub fn pack_path_to_buffer(_source_path: &str, _settings: &PackSettings) -> Result<Vec<u8>, String> {
    Err(PACK_UNSUPPORTED.to_string())
}

pub fn pack_path_to_file(
    _source_path: &str,
    _archive_path: &str,
    _settings: &PackSettings,
) -> Result<(), String> {
    Err(PACK_UNSUPPORTED.to_string())
}

pub fn pack_description_to_buffer(
    _description: &ArchiveDescription,
    _settings: &PackSettings,
) -> Result<Vec<u8>, String> {
    Err(PACK_UNSUPPORTED.to_string())
}

pub fn pack_description_to_file(
    _description: &ArchiveDescription,
    _archive_path: &str,
    _settings: &PackSettings,
) -> Result<(), String> {
    Err(PACK_UNSUPPORTED.to_string())
}

pub fn unpack_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    password: &str,
) -> Result<(), String> {
    require_nonempty_buffer(archive_data)?;

    with_temp_archive(archive_data, |archive_path| {
        unpack_file_to_path(archive_path, destination_path, password)
    })
}

pub fn unpack_file_to_path(
    archive_path: &str,
    destination_path: &str,
    password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;
    extract_archive_to_path(archive_path, destination_path, password, None)
}

pub fn unpack_buffer_to_description(
    archive_data: &[u8],
    password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    with_temp_archive(archive_data, |archive_path| {
        unpack_file_to_description(archive_path, password)
    })
}

pub fn unpack_file_to_description(archive_path: &str, password: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;
    collect_description(archive_path, password, None)
}

pub fn unpack_partial_file_to_path(
    archive_path: &str,
    destination_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<(), String> {
    require_archive_file(archive_path)?;

    let selected = parse_selected_paths_set(paths)?;
    extract_archive_to_path(archive_path, destination_path, password, Some(&selected))
}

pub fn unpack_partial_buffer_to_path(
    archive_data: &[u8],
    destination_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<(), String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_selected_paths_set(paths)?;

    with_temp_archive(archive_data, |archive_path| {
        extract_archive_to_path(archive_path, destination_path, password, Some(&selected))
    })
}

pub fn unpack_partial_file_to_description(
    archive_path: &str,
    paths: &JanxValue,
    password: &str,
) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let selected = parse_selected_paths_set(paths)?;
    let resolved = resolve_archive_entry_names(archive_path, password, &selected)?;
    collect_description(archive_path, password, Some(&resolved))
}

pub fn unpack_partial_buffer_to_description(
    archive_data: &[u8],
    paths: &JanxValue,
    password: &str,
) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let selected = parse_selected_paths_set(paths)?;

    with_temp_archive(archive_data, |archive_path| {
        let resolved = resolve_archive_entry_names(archive_path, password, &selected)?;
        collect_description(archive_path, password, Some(&resolved))
    })
}

pub(crate) fn with_temp_archive<T, F>(archive_data: &[u8], action: F) -> Result<T, String>
where
    F: FnOnce(&str) -> Result<T, String>,
{
    let temp_dir = std::env::temp_dir();
    let temp_path = temp_dir.join(format!(
        "opi_rar_{}.rar",
        std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .map(|duration| duration.as_nanos())
            .unwrap_or(0)
    ));

    fs::write(&temp_path, archive_data)
        .map_err(|error| format!("Failed to write temporary archive: {}", error))?;

    let path_string = temp_path
        .to_str()
        .ok_or_else(|| "Invalid temporary archive path".to_string())?
        .to_string();

    let result = action(&path_string);
    let _ = fs::remove_file(&temp_path);
    result
}

fn extract_archive_to_path(
    archive_path: &str,
    destination_path: &str,
    password: &str,
    selected: Option<&HashSet<String>>,
) -> Result<(), String> {
    let dest = Path::new(destination_path);
    fs::create_dir_all(dest)
        .map_err(|error| format!("Failed to create destination directory: {}", error))?;

    let mut archive = open_archive_for_processing(archive_path, password)?;

    while let Some(header) = archive
        .read_header()
        .map_err(|error| error.to_string())?
    {
        let entry = header.entry();
        let normalized = normalize_entry_path(&entry.filename);

        if normalized.is_empty() || should_skip_unsafe_entry(&normalized) {
            archive = skip_header(header)?;
            continue;
        }

        if let Some(selected_paths) = selected {
            if !entry_matches_selection(&normalized, entry.is_directory(), selected_paths) {
                archive = skip_header(header)?;
                continue;
            }
        }

        if entry.is_directory() {
            let target = dest.join(normalized.replace('/', std::path::MAIN_SEPARATOR_STR));
            fs::create_dir_all(&target)
                .map_err(|error| format!("Failed to create directory '{}': {}", normalized, error))?;
            archive = skip_header(header)?;
            continue;
        }

        validate_archive_entry_path(&normalized, dest)?;

        archive = header
            .extract_with_base(dest)
            .map_err(|error| format!("Failed to unpack entry '{}': {}", normalized, error))?;
    }

    Ok(())
}

fn collect_description(
    archive_path: &str,
    password: &str,
    selected: Option<&HashSet<String>>,
) -> Result<JanxValue, String> {
    let mut archive = open_archive_for_processing(archive_path, password)?;
    let mut collected = Vec::new();

    while let Some(header) = archive
        .read_header()
        .map_err(|error| error.to_string())?
    {
        let entry = header.entry();
        let normalized = normalize_entry_path(&entry.filename);

        if normalized.is_empty() || should_skip_unsafe_entry(&normalized) {
            archive = skip_header(header)?;
            continue;
        }

        if let Some(selected_paths) = selected {
            if !entry_matches_selection(&normalized, entry.is_directory(), selected_paths) {
                archive = skip_header(header)?;
                continue;
            }
        }

        if entry.is_directory() {
            collected.push((normalized, true, None));
            archive = skip_header(header)?;
            continue;
        }

        let (data, rest) = header
            .read()
            .map_err(|error| format!("Failed to read entry '{}': {}", normalized, error))?;
        collected.push((normalized, false, Some(data)));
        archive = rest;
    }

    Ok(ArchiveDescription::from_flat_entries(&collected).to_janx())
}

fn resolve_archive_entry_names(
    archive_path: &str,
    password: &str,
    selected_paths: &HashSet<String>,
) -> Result<HashSet<String>, String> {
    let entries = collect_entry_infos_from_path(archive_path, password)?;
    let mut name_map = HashSet::new();

    for entry in entries {
        if !entry.is_directory {
            name_map.insert(entry.path);
        }
    }

    ensure_selected_entries_exist(selected_paths, &name_map)?;

    Ok(selected_paths.clone())
}

fn entry_matches_selection(
    normalized: &str,
    is_directory: bool,
    selected_paths: &HashSet<String>,
) -> bool {
    if selected_paths.contains(normalized) {
        return true;
    }

    if is_directory {
        return selected_paths.iter().any(|path| {
            path.starts_with(normalized)
                && path.chars().nth(normalized.len()) == Some('/')
        });
    }

    false
}

fn skip_header(
    header: unrar::OpenArchive<unrar::Process, unrar::CursorBeforeFile>,
) -> Result<unrar::OpenArchive<unrar::Process, unrar::CursorBeforeHeader>, String> {
    header
        .skip()
        .map_err(|error| error.to_string())
}

pub(crate) fn open_archive(
    archive_path: &str,
    password: &str,
) -> Result<unrar::OpenArchive<unrar::List, unrar::CursorBeforeHeader>, String> {
    let archive = if password.is_empty() {
        Archive::new(archive_path)
    } else {
        Archive::with_password(archive_path, password)
    };

    archive
        .open_for_listing()
        .map_err(|error| error.to_string())
}

pub(crate) fn open_archive_for_processing(
    archive_path: &str,
    password: &str,
) -> Result<unrar::OpenArchive<unrar::Process, unrar::CursorBeforeHeader>, String> {
    let archive = if password.is_empty() {
        Archive::new(archive_path)
    } else {
        Archive::with_password(archive_path, password)
    };

    archive
        .open_for_processing()
        .map_err(|error| error.to_string())
}

pub(crate) fn collect_entry_infos_from_path(
    archive_path: &str,
    password: &str,
) -> Result<Vec<EntryInfo>, String> {
    let mut archive = open_archive(archive_path, password)?;
    let mut entries = Vec::new();

    while let Some(header) = archive
        .read_header()
        .map_err(|error| error.to_string())?
    {
        let entry = header.entry();
        let path = normalize_entry_path(&entry.filename);
        let is_directory = entry.is_directory();
        let size = if is_directory {
            0
        } else {
            entry.unpacked_size
        };

        entries.push(EntryInfo {
            path,
            is_directory,
            size,
        });

        archive = header
            .skip()
            .map_err(|error| error.to_string())?;
    }

    Ok(entries)
}

pub(crate) fn normalize_entry_path(path: &Path) -> String {
    normalize_archive_path(&path.to_string_lossy())
}
