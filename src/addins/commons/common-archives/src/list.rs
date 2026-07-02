use std::collections::BTreeMap;

use common_core::{janx, JanxValue};

use crate::normalize_archive_path;

/// Entry metadata for building a nested `entries` tree in list responses.
///
/// Format-specific add-ins implement this for their `EntryInfo` type so
/// `build_list_description` stays shared across tar, 7z, zip, rar, etc.
pub trait ListEntry {
    fn path(&self) -> &str;
    fn is_directory(&self) -> bool;
    /// Extra Janx fields for a file leaf (for example `size`, `compressed_size`).
    fn list_file_fields(&self) -> JanxValue;
}

pub fn build_list_description<E: ListEntry>(entries: &[E]) -> JanxValue {
    let mut tree = TreeListDir::default();

    for entry in entries {
        tree.insert(entry);
    }

    janx!({
        "entries": tree.into_janx(),
    })
}

#[derive(Default)]
struct TreeListDir {
    subdirs: BTreeMap<String, TreeListDir>,
    files: BTreeMap<String, JanxValue>,
}

impl TreeListDir {
    fn insert<E: ListEntry>(&mut self, entry: &E) {
        let path = normalize_archive_path(entry.path());
        if path.is_empty() {
            return;
        }

        let parts: Vec<&str> = path.split('/').collect();
        self.insert_parts(&parts, entry);
    }

    fn insert_parts<E: ListEntry>(&mut self, parts: &[&str], entry: &E) {
        if parts.len() == 1 {
            if entry.is_directory() {
                self.subdirs.entry(parts[0].to_string()).or_default();
            } else {
                self.files
                    .insert(parts[0].to_string(), entry.list_file_fields());
            }
            return;
        }

        self.subdirs
            .entry(parts[0].to_string())
            .or_default()
            .insert_parts(&parts[1..], entry);
    }

    fn into_janx(self) -> JanxValue {
        let mut nodes = Vec::new();

        for (name, subdir) in self.subdirs {
            nodes.push(janx!({
                "name": name,
                "directory": true,
                "entries": subdir.into_janx(),
            }));
        }

        for (name, fields) in self.files {
            let mut node = janx!({
                "name": name,
                "directory": false,
            });
            merge_object_fields(&mut node, fields);
            nodes.push(node);
        }

        JanxValue::Array(nodes)
    }
}

fn merge_object_fields(target: &mut JanxValue, fields: JanxValue) {
    let JanxValue::Object(source) = fields else {
        return;
    };

    if let JanxValue::Object(ref mut target_object) = target {
        for (key, value) in source {
            target_object.insert(key, value);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    struct TestEntry {
        path: String,
        is_directory: bool,
        size: u64,
        compressed_size: Option<u64>,
    }

    impl ListEntry for TestEntry {
        fn path(&self) -> &str {
            &self.path
        }

        fn is_directory(&self) -> bool {
            self.is_directory
        }

        fn list_file_fields(&self) -> JanxValue {
            match self.compressed_size {
                Some(compressed_size) => janx!({
                    "size": self.size,
                    "compressed_size": compressed_size,
                }),
                None => janx!({
                    "size": self.size,
                }),
            }
        }
    }

    #[test]
    fn build_list_description_nests_paths_and_merges_file_fields() {
        let entries = vec![
            TestEntry {
                path: "docs/note.txt".to_string(),
                is_directory: false,
                size: 11,
                compressed_size: None,
            },
            TestEntry {
                path: "readme.txt".to_string(),
                is_directory: false,
                size: 17,
                compressed_size: Some(9),
            },
        ];

        let description = build_list_description(&entries);
        let object = description.as_object().expect("object");
        let root_entries = object
            .get("entries")
            .and_then(JanxValue::as_array)
            .expect("entries array");

        assert_eq!(root_entries.len(), 2);
    }
}
