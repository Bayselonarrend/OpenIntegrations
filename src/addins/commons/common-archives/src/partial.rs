use std::collections::{BTreeMap, HashSet};
use std::fs;
use std::path::Path;

use common_core::JanxValue;

use crate::{normalize_archive_path, parse_path_list};

pub fn build_selected_paths_set(selected_paths: &[String]) -> HashSet<String> {
    selected_paths
        .iter()
        .map(|path| normalize_archive_path(path))
        .collect()
}

pub fn parse_nonempty_path_list(value: &JanxValue) -> Result<Vec<String>, String> {
    let paths = parse_path_list(value)?;
    if paths.is_empty() {
        return Err("Paths list must not be empty".to_string());
    }
    Ok(paths)
}

pub fn parse_selected_paths_set(value: &JanxValue) -> Result<HashSet<String>, String> {
    Ok(build_selected_paths_set(&parse_nonempty_path_list(value)?))
}

pub fn lookup_archive_entry_names(
    selected_paths: &[String],
    name_map: &BTreeMap<String, String>,
) -> Result<Vec<String>, String> {
    selected_paths
        .iter()
        .map(|path| {
            let normalized = normalize_archive_path(path);
            name_map.get(&normalized).cloned().ok_or_else(|| {
                format!("Archive entry not found: {}", path)
            })
        })
        .collect()
}

pub fn ensure_selected_entries_exist(
    selected_paths: &HashSet<String>,
    available_paths: &HashSet<String>,
) -> Result<(), String> {
    for path in selected_paths {
        if !available_paths.contains(path) {
            return Err(format!("Archive entry not found: {}", path));
        }
    }

    Ok(())
}

pub fn require_archive_file(archive_path: &str) -> Result<(), String> {
    if !Path::new(archive_path).exists() {
        return Err(format!("Archive not found: {}", archive_path));
    }
    Ok(())
}

pub fn require_nonempty_buffer(archive_data: &[u8]) -> Result<(), String> {
    if archive_data.is_empty() {
        return Err("Archive data is empty".to_string());
    }
    Ok(())
}

pub fn require_source_path(source_path: &str) -> Result<(), String> {
    if !Path::new(source_path).exists() {
        return Err(format!("Source path not found: {}", source_path));
    }
    Ok(())
}

pub fn ensure_parent_dir(file_path: &str) -> Result<(), String> {
    if let Some(parent) = Path::new(file_path).parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent)
                .map_err(|error| format!("Failed to create archive directory: {}", error))?;
        }
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use common_core::janx;

    #[test]
    fn parse_selected_paths_set_normalizes_entries() {
        let paths = janx!(["docs/note.txt", "readme.txt"]);
        let selected = parse_selected_paths_set(&paths).expect("paths");

        assert!(selected.contains("docs/note.txt"));
        assert!(selected.contains("readme.txt"));
    }

    #[test]
    fn parse_selected_paths_set_rejects_empty_list() {
        let paths = janx!([]);
        let error = parse_selected_paths_set(&paths).expect_err("empty list");
        assert!(error.contains("must not be empty"));
    }
}
