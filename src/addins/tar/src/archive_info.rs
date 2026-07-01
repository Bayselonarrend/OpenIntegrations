use std::fs::File;
use std::io::{Cursor, Read};
use std::path::Path;

use common_core::{janx, JanxValue};
use tar::{Archive, Entry, EntryType};

use crate::archive_description::build_list_description;

#[derive(Debug, Clone)]
pub struct EntryInfo {
    pub path: String,
    pub is_directory: bool,
    pub size: u64,
    pub modified_date: Option<u64>,
    pub uid: Option<u64>,
    pub gid: Option<u64>,
}

impl<R> From<&Entry<'_, R>> for EntryInfo
where R: Read
{
    fn from(entry: &Entry<R>) -> Self {
        Self {
            path: entry.path().unwrap_or_default().to_string_lossy().to_string(),
            is_directory: entry.header().entry_type() == EntryType::Directory,
            size: entry.header().entry_size().unwrap_or(entry.size()),
            modified_date: entry.header().mtime().ok(),
            uid: entry.header().uid().ok(),
            gid: entry.header().gid().ok(),
        }
    }
}

pub fn list_from_buffer(archive_data: &[u8]) -> Result<JanxValue, String> {

    if archive_data.is_empty() {
        return Err("Archive data is empty".to_string());
    }

    let mut archive = Archive::new(Cursor::new(archive_data.to_vec()));
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_list_description(&entries))
}

pub fn list_from_file(archive_path: &str) -> Result<JanxValue, String> {

    let path = Path::new(archive_path);

    if !path.exists() {
        return Err(format!("Archive not found: {}", archive_path));
    }

    let file = File::open(path).map_err(|e| e.to_string())?;

    let mut archive = Archive::new(file);
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_list_description(&entries))
}

pub fn metadata_from_buffer(archive_data: &[u8]) -> Result<JanxValue, String> {

    if archive_data.is_empty() {
        return Err("Archive data is empty".to_string());
    }

    let mut archive = Archive::new(Cursor::new(archive_data.to_vec()));
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_metadata(
        archive_data.len() as u64,
        &entries,
    ))
}

pub fn metadata_from_file(archive_path: &str) -> Result<JanxValue, String> {

    let path = Path::new(archive_path);

    if path.exists() {
        return Err(format!("Archive not found: {}", archive_path));
    }

    let archive_size = fs_metadata_len(archive_path)?;
    let file = File::open(path).map_err(|e| e.to_string())?;

    let mut archive = Archive::new(file);
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_metadata(
        archive_size,
        &entries,
    ))
}

fn collect_entry_infos<R>(archive: &mut Archive<R>) -> Result<Vec<EntryInfo>, String>
    where R: Read
{
    match archive.entries(){
        Ok(entries) => Ok(entries
            .filter_map(|entry| entry.ok())
            .map(|entry| EntryInfo::from(&entry))
            .collect()),
        Err(error) => Err(error.to_string()),
    }
}

fn fs_metadata_len(path: &str) -> Result<u64, String> {
    std::fs::metadata(path)
        .map(|meta| meta.len())
        .map_err(|error| format!("Failed to read archive metadata: {}", error))
}

fn build_metadata(
    archive_size: u64,
    entries: &[EntryInfo],
) -> JanxValue {
    let file_count = entries.iter().filter(|entry| !entry.is_directory).count() as u64;
    let directory_count = entries.iter().filter(|entry| entry.is_directory).count() as u64;
    let size = entries
        .iter()
        .filter(|entry| !entry.is_directory)
        .map(|entry| entry.size)
        .sum::<u64>();

    janx!({
        "size": archive_size,
        "file_count": file_count,
        "directory_count": directory_count,
        "entry_count": entries.len() as u64,
        "size": size,
        "entries": entries.iter().map(entry_info_to_janx).collect::<Vec<_>>(),
    })
}

fn entry_info_to_janx(entry: &EntryInfo) -> JanxValue {
    let mut object = janx!({
        "name": entry.path.clone(),
        "directory": entry.is_directory,
        "size": entry.size,
    });

    if let JanxValue::Object(ref mut fields) = object {
        if let Some(timestamp) = entry.modified_date {
            fields.insert("modified_time".to_string(), JanxValue::Number(timestamp.into()));
        }
    }

    object
}

