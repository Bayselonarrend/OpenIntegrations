use std::fs::File;
use std::io::{Cursor, Read};

use common_core::{janx, JanxValue};
use common_archives::{build_list_description, ListEntry, require_archive_file, require_nonempty_buffer};
use tar::{Archive, Entry, EntryType};

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
where
    R: Read,
{
    fn from(entry: &Entry<'_, R>) -> Self {
        Self {
            path: entry
                .path()
                .unwrap_or_default()
                .to_string_lossy()
                .to_string(),
            is_directory: entry.header().entry_type() == EntryType::Directory,
            size: entry.header().entry_size().unwrap_or(entry.size()),
            modified_date: entry.header().mtime().ok(),
            uid: entry.header().uid().ok(),
            gid: entry.header().gid().ok(),
        }
    }
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

pub fn list_from_buffer(archive_data: &[u8]) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let mut archive = open_archive_from_bytes(archive_data)?;
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_list_description(&entries))
}

pub fn list_from_file(archive_path: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let mut archive = open_archive_from_file(archive_path)?;
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_list_description(&entries))
}

pub fn metadata_from_buffer(archive_data: &[u8]) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let mut archive = open_archive_from_bytes(archive_data)?;
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_metadata(
        archive_data.len() as u64,
        &entries,
    ))
}

pub fn metadata_from_file(archive_path: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let archive_size = fs_metadata_len(archive_path)?;
    let mut archive = open_archive_from_file(archive_path)?;
    let entries = collect_entry_infos(&mut archive)?;

    Ok(build_metadata(archive_size, &entries))
}

fn collect_entry_infos<R>(archive: &mut Archive<R>) -> Result<Vec<EntryInfo>, String>
where
    R: Read,
{
    match archive.entries() {
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
    let mut object = janx!({
        "name": entry.path.clone(),
        "directory": entry.is_directory,
        "size": entry.size,
    });

    if let JanxValue::Object(ref mut fields) = object {
        if let Some(timestamp) = entry.modified_date {
            fields.insert("modified_time".to_string(), JanxValue::Number(timestamp.into()));
        }
        if let Some(uid) = entry.uid {
            fields.insert("uid".to_string(), JanxValue::Number(uid.into()));
        }
        if let Some(gid) = entry.gid {
            fields.insert("gid".to_string(), JanxValue::Number(gid.into()));
        }
    }

    object
}

fn is_gzip(data: &[u8]) -> bool {
    data.len() >= 2 && data[0] == 0x1f && data[1] == 0x8b
}

fn looks_gzip_path(path: &str) -> bool {
    let lower = path.to_ascii_lowercase();
    lower.ends_with(".tar.gz") || lower.ends_with(".tgz") || lower.ends_with(".gz")
}

fn open_archive_from_bytes(data: &[u8]) -> Result<Archive<Box<dyn Read>>, String> {
    if is_gzip(data) {
        Ok(Archive::new(Box::new(flate2::read::GzDecoder::new(Cursor::new(
            data.to_vec(),
        ))) as Box<dyn Read>))
    } else {
        Ok(Archive::new(Box::new(Cursor::new(data.to_vec())) as Box<dyn Read>))
    }
}

fn open_archive_from_file(archive_path: &str) -> Result<Archive<Box<dyn Read>>, String> {
    let file = File::open(archive_path)
        .map_err(|error| format!("Failed to open archive '{}': {}", archive_path, error))?;

    if looks_gzip_path(archive_path) {
        Ok(Archive::new(
            Box::new(flate2::read::GzDecoder::new(file)) as Box<dyn Read>,
        ))
    } else {
        Ok(Archive::new(Box::new(file) as Box<dyn Read>))
    }
}
