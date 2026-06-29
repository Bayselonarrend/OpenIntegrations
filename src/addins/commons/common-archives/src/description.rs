use std::collections::BTreeMap;

use common_core::{FromJanx, JanxValue, janx};

use crate::{normalize_archive_path, is_safe_path_component};

#[derive(Debug, Clone)]
pub struct ArchiveDescription {
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

        let entries_value = object
            .get("entries")
            .ok_or_else(|| "Archive description must contain 'entries'".to_string())?;

        let entries = parse_entries(entries_value)?;

        Ok(Self { entries })
    }

    pub fn from_flat_entries(entries: &[(String, bool, Option<Vec<u8>>)]) -> Self {
        let mut tree = TreeDir::default();

        for (path, is_directory, data) in entries {
            tree.insert(path, *is_directory, data.clone());
        }

        Self {
            entries: tree.into_nodes(),
        }
    }

    pub fn to_janx(&self) -> JanxValue {
        janx!({
            "entries": nodes_to_janx(&self.entries),
        })
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

pub fn parse_path_list(value: &JanxValue) -> Result<Vec<String>, String> {
    if value.is_empty() {
        return Ok(Vec::new());
    }

    let items = Vec::<JanxValue>::from_janx(value)
        .ok_or_else(|| "Paths must be a Janx array".to_string())?;

    items
        .iter()
        .map(|item| {
            String::from_janx(item)
                .filter(|value| !value.is_empty())
                .map(|value| normalize_archive_path(&value))
                .ok_or_else(|| "Each path must be a non-empty string".to_string())
        })
        .collect()
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

    if !is_safe_path_component(&name) {
        return Err(format!("Archive entry name '{}' contains unsafe path characters", name));
    }

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

            let canonical_path = std::fs::canonicalize(&path)
                .map_err(|error| format!("Failed to resolve path '{}': {}", path, error))?;
            
            if !canonical_path.exists() {
                return Err(format!("Source file not found: {}", path));
            }

            Ok(ArchiveNode::FileFromPath { name, path: canonical_path.to_string_lossy().to_string() })
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

fn nodes_to_janx(nodes: &[ArchiveNode]) -> JanxValue {
    JanxValue::Array(nodes.iter().map(node_to_janx).collect())
}

fn node_to_janx(node: &ArchiveNode) -> JanxValue {
    match node {
        ArchiveNode::Directory { name, entries } => janx!({
            "name": name.clone(),
            "directory": true,
            "entries": nodes_to_janx(entries),
        }),
        ArchiveNode::FileFromPath { name, .. } => janx!({
            "name": name.clone(),
            "directory": false,
            "from_path": true,
            "path": String::new(),
        }),
        ArchiveNode::FileFromData { name, data } => janx!({
            "name": name.clone(),
            "directory": false,
            "from_path": false,
            "data": JanxValue::binary(data.clone()),
        }),
    }
}

#[derive(Default)]
struct TreeDir {
    subdirs: BTreeMap<String, TreeDir>,
    files: BTreeMap<String, Vec<u8>>,
}

impl TreeDir {
    fn insert(&mut self, path: &str, is_directory: bool, data: Option<Vec<u8>>) {
        let path = path.trim_matches('/').replace('\\', "/");
        if path.is_empty() {
            return;
        }

        let parts: Vec<&str> = path.split('/').collect();
        self.insert_parts(&parts, is_directory, data);
    }

    fn insert_parts(&mut self, parts: &[&str], is_directory: bool, data: Option<Vec<u8>>) {
        if parts.len() == 1 {
            if is_directory {
                self.subdirs.entry(parts[0].to_string()).or_default();
            } else {
                self.files
                    .insert(parts[0].to_string(), data.unwrap_or_default());
            }
            return;
        }

        self.subdirs
            .entry(parts[0].to_string())
            .or_default()
            .insert_parts(&parts[1..], is_directory, data);
    }

    fn into_nodes(self) -> Vec<ArchiveNode> {
        let mut nodes = Vec::new();

        for (name, subdir) in self.subdirs {
            nodes.push(ArchiveNode::Directory {
                name,
                entries: subdir.into_nodes(),
            });
        }

        for (name, data) in self.files {
            nodes.push(ArchiveNode::FileFromData { name, data });
        }

        nodes
    }
}
