use std::io::Cursor;
use std::time::{SystemTime, UNIX_EPOCH};

use common_core::{janx, JanxValue};
use common_archives::{build_list_description, ListEntry, require_archive_file, require_nonempty_buffer};
use sevenz_rust2::{Archive, ArchiveEntry, ArchiveReader, NtTime};

#[derive(Debug, Clone)]
pub struct EntryInfo {
    pub path: String,
    pub is_directory: bool,
    pub has_stream: bool,
    pub size: u64,
    pub compressed_size: u64,
    pub has_crc: bool,
    pub crc: u64,
    pub has_creation_date: bool,
    pub creation_date: NtTime,
    pub has_modified_date: bool,
    pub modified_date: NtTime,
    pub has_access_date: bool,
    pub access_date: NtTime,
    pub has_windows_attributes: bool,
    pub windows_attributes: u32,
}

impl From<&ArchiveEntry> for EntryInfo {
    fn from(entry: &ArchiveEntry) -> Self {
        Self {
            path: entry.name().to_string(),
            is_directory: entry.is_directory(),
            has_stream: entry.has_stream(),
            size: entry.size(),
            compressed_size: entry.compressed_size,
            has_crc: entry.has_crc,
            crc: entry.crc,
            has_creation_date: entry.has_creation_date,
            creation_date: entry.creation_date(),
            has_modified_date: entry.has_last_modified_date,
            modified_date: entry.last_modified_date(),
            has_access_date: entry.has_access_date,
            access_date: entry.access_date(),
            has_windows_attributes: entry.has_windows_attributes,
            windows_attributes: entry.windows_attributes(),
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
            "compressed_size": self.compressed_size,
        })
    }
}

pub fn list_from_buffer(archive_data: &[u8], password: &str) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let reader = ArchiveReader::new(Cursor::new(archive_data.to_vec()), password.into())
        .map_err(|error| error.to_string())?;
    let entries = collect_entry_infos(reader.archive());

    Ok(build_list_description(&entries))
}

pub fn list_from_file(archive_path: &str, password: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let reader = ArchiveReader::open(archive_path, password.into())
        .map_err(|error| error.to_string())?;
    let entries = collect_entry_infos(reader.archive());

    Ok(build_list_description(&entries))
}

pub fn metadata_from_buffer(archive_data: &[u8], password: &str) -> Result<JanxValue, String> {
    require_nonempty_buffer(archive_data)?;

    let reader = ArchiveReader::new(Cursor::new(archive_data.to_vec()), password.into())
        .map_err(|error| error.to_string())?;

    Ok(build_metadata(
        archive_data.len() as u64,
        reader.archive(),
        &collect_entry_infos(reader.archive()),
    ))
}

pub fn metadata_from_file(archive_path: &str, password: &str) -> Result<JanxValue, String> {
    require_archive_file(archive_path)?;

    let archive_size = fs_metadata_len(archive_path)?;
    let reader = ArchiveReader::open(archive_path, password.into())
        .map_err(|error| error.to_string())?;
    let entries = collect_entry_infos(reader.archive());

    Ok(build_metadata(
        archive_size,
        reader.archive(),
        &entries,
    ))
}

fn collect_entry_infos(archive: &Archive) -> Vec<EntryInfo> {
    archive.files.iter().map(EntryInfo::from).collect()
}

fn fs_metadata_len(path: &str) -> Result<u64, String> {
    std::fs::metadata(path)
        .map(|meta| meta.len())
        .map_err(|error| format!("Failed to read archive metadata: {}", error))
}

fn build_metadata(
    archive_size: u64,
    archive: &Archive,
    entries: &[EntryInfo],
) -> JanxValue {
    let file_count = entries.iter().filter(|entry| !entry.is_directory).count() as u64;
    let directory_count = entries.iter().filter(|entry| entry.is_directory).count() as u64;
    let unpacked_size = entries
        .iter()
        .filter(|entry| !entry.is_directory)
        .map(|entry| entry.size)
        .sum::<u64>();
    let packed_size = archive.pack_sizes().iter().sum::<u64>();

    janx!({
        "archive_size": archive_size,
        "solid": archive.is_solid,
        "block_count": archive.blocks.len() as u64,
        "file_count": file_count,
        "directory_count": directory_count,
        "entry_count": entries.len() as u64,
        "unpacked_size": unpacked_size,
        "packed_size": packed_size,
        "entries": entries.iter().map(entry_info_to_janx).collect::<Vec<_>>(),
    })
}

fn entry_info_to_janx(entry: &EntryInfo) -> JanxValue {
    let mut object = janx!({
        "name": entry.path.clone(),
        "directory": entry.is_directory,
        "has_stream": entry.has_stream,
        "size": entry.size,
        "compressed_size": entry.compressed_size,
    });

    if let JanxValue::Object(ref mut fields) = object {
        if entry.has_crc {
            fields.insert("crc".to_string(), JanxValue::Number(entry.crc.into()));
        }
        if entry.has_windows_attributes {
            fields.insert(
                "windows_attributes".to_string(),
                JanxValue::Number((entry.windows_attributes as u64).into()),
            );
        }
        if let Some(timestamp) = nt_time_to_unix(entry.creation_date, entry.has_creation_date) {
            fields.insert("creation_time".to_string(), JanxValue::Number(timestamp.into()));
        }
        if let Some(timestamp) = nt_time_to_unix(entry.modified_date, entry.has_modified_date) {
            fields.insert("modified_time".to_string(), JanxValue::Number(timestamp.into()));
        }
        if let Some(timestamp) = nt_time_to_unix(entry.access_date, entry.has_access_date) {
            fields.insert("access_time".to_string(), JanxValue::Number(timestamp.into()));
        }
    }

    object
}

fn nt_time_to_unix(time: NtTime, present: bool) -> Option<i64> {
    if !present {
        return None;
    }

    let system_time: SystemTime = time.into();
    system_time
        .duration_since(UNIX_EPOCH)
        .ok()
        .map(|duration| duration.as_secs() as i64)
}
