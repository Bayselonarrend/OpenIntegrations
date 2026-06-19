use std::path::Path;

use common_core::{FromJanx, JanxValue};

#[derive(Debug, Clone)]
pub struct ArchiveDescription {
    pub password: String,
    pub entries: Vec<ArchiveNode>,
}

#[derive(Debug, Clone)]
pub enum ArchiveNode {
    Directory {
        name: String,
        entries: Vec<ArchiveNode>,
    },
    FileFromPath {
        name: String,
        path: String,
    },
    FileFromData {
        name: String,
        data: Vec<u8>,
    },
}

impl ArchiveDescription {
    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        let object = value
            .as_object()
            .ok_or_else(|| "Archive description must be a Janx object".to_string())?;

        let password = object
            .get("password")
            .and_then(String::from_janx)
            .unwrap_or_default();

        let entries_value = object
            .get("entries")
            .ok_or_else(|| "Archive description must contain 'entries'".to_string())?;

        let entries = parse_entries(entries_value)?;

        Ok(Self { password, entries })
    }
}

fn parse_entries(value: &JanxValue) -> Result<Vec<ArchiveNode>, String> {
    let items = Vec::<JanxValue>::from_janx(value)
        .ok_or_else(|| "'entries' must be an array".to_string())?;

    items.iter().map(parse_entry).collect()
}

fn parse_entry(value: &JanxValue) -> Result<ArchiveNode, String> {
    let object = value
        .as_object()
        .ok_or_else(|| "Each archive entry must be a Janx object".to_string())?;

    let name = object
        .get("name")
        .and_then(String::from_janx)
        .filter(|value| !value.is_empty())
        .ok_or_else(|| "Archive entry must contain non-empty 'name'".to_string())?;

    let is_directory = object
        .get("directory")
        .and_then(bool::from_janx)
        .ok_or_else(|| format!("Archive entry '{}' must contain 'directory' flag", name))?;

    if is_directory {
        let entries_value = object
            .get("entries")
            .ok_or_else(|| format!("Directory '{}' must contain 'entries'", name))?;

        Ok(ArchiveNode::Directory {
            name,
            entries: parse_entries(entries_value)?,
        })
    } else {
        let from_path = object
            .get("from_path")
            .and_then(bool::from_janx)
            .ok_or_else(|| format!("File '{}' must contain 'from_path' flag", name))?;

        if from_path {
            let path = object
                .get("path")
                .and_then(String::from_janx)
                .filter(|value| !value.is_empty())
                .ok_or_else(|| format!("File '{}' with from_path=true must contain 'path'", name))?;

            if !Path::new(&path).exists() {
                return Err(format!("Source file not found: {}", path));
            }

            Ok(ArchiveNode::FileFromPath { name, path })
        } else {
            let data = object
                .get("data")
                .and_then(Vec::<u8>::from_janx)
                .ok_or_else(|| {
                    format!(
                        "File '{}' with from_path=false must contain binary 'data'",
                        name
                    )
                })?;

            Ok(ArchiveNode::FileFromData { name, data })
        }
    }
}

pub fn join_archive_path(prefix: &str, name: &str) -> String {
    let name = name.trim_matches('/').replace('\\', "/");
    if prefix.is_empty() {
        name
    } else {
        format!("{}/{}", prefix.trim_end_matches('/'), name)
    }
}
