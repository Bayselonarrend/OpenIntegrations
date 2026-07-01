use std::collections::BTreeMap;
use common_core::{JanxValue, janx};

use crate::archive_info::EntryInfo;

pub use common_archives::ArchiveDescription;

pub fn build_list_description(entries: &[EntryInfo]) -> JanxValue {
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
    files: BTreeMap<String, ListFileMeta>,
}

#[derive(Clone)]
struct ListFileMeta {
    size: u64,
}

impl TreeListDir {
    fn insert(&mut self, entry: &EntryInfo) {
        let path = entry.path.trim_matches('/').replace('\\', "/");
        if path.is_empty() {
            return;
        }

        let parts: Vec<&str> = path.split('/').collect();
        self.insert_parts(&parts, entry);
    }

    fn insert_parts(&mut self, parts: &[&str], entry: &EntryInfo) {
        if parts.len() == 1 {
            if entry.is_directory {
                self.subdirs.entry(parts[0].to_string()).or_default();
            } else {
                self.files.insert(
                    parts[0].to_string(),
                    ListFileMeta {
                        size: entry.size,
                    },
                );
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

        for (name, meta) in self.files {
            nodes.push(janx!({
                "name": name,
                "directory": false,
                "size": meta.size,
            }));
        }

        JanxValue::Array(nodes)
    }
}
