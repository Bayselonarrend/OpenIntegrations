use std::fs;

use common_archives::{build_list_description, require_archive_file, require_nonempty_buffer};
use common_core::{janx, JanxValue};

use crate::archive_ops::{collect_entry_infos_from_path, with_temp_archive, EntryInfo};

pub fn list_from_buffer(archive_data: &[u8], password: &str) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    with_temp_archive(archive_data, |archive_path| {
        let entries = collect_entry_infos_from_path(archive_path, password)?;
        Ok(build_list_description(&entries))
    })
}

pub fn list_from_file(archive_path: &str, password: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let entries = collect_entry_infos_from_path(archive_path, password)?;
    Ok(build_list_description(&entries))
}

pub fn metadata_from_buffer(archive_data: &[u8], password: &str) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    with_temp_archive(archive_data, |archive_path| {
        let archive_size = archive_data.len() as u64;
        let entries = collect_entry_infos_from_path(archive_path, password)?;
        Ok(build_metadata(archive_size, &entries))
    })
}

pub fn metadata_from_file(archive_path: &str, password: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let archive_size = fs_metadata_len(archive_path)?;
    let entries = collect_entry_infos_from_path(archive_path, password)?;
    Ok(build_metadata(archive_size, &entries))
}

fn fs_metadata_len(path: &str) -> Result<u64, String> {
    fs::metadata(path)
        .map(|meta| meta.len())
        .map_err(|error| format!("Failed to read archive metadata: {}", error))
}

fn build_metadata(archive_size: u64, entries: &[EntryInfo]) -> JanxValue {
    let file_count = entries.iter().filter(|entry| !entry.is_directory).count() as u64;
    let directory_count = entries.iter().filter(|entry| entry.is_directory).count() as u64;
    let unpacked_size = entries
        .iter()
        .filter(|entry| !entry.is_directory)
        .map(|entry| entry.size)
        .sum::<u64>();

    janx!({
        "archive_size": archive_size,
        "file_count": file_count,
        "directory_count": directory_count,
        "entry_count": entries.len() as u64,
        "unpacked_size": unpacked_size,
        "entries": entries.iter().map(entry_info_to_janx).collect::<Vec<_>>(),
    })
}

fn entry_info_to_janx(entry: &EntryInfo) -> JanxValue {
    janx!({
        "name": entry.path.clone(),
        "directory": entry.is_directory,
        "size": entry.size,
    })
}
