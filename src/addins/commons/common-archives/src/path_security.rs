use std::path::{Component, Path, PathBuf};

const MAX_SYMLINK_DEPTH: usize = 8;

pub fn validate_archive_entry_path(entry_name: &str, destination: &Path) -> Result<PathBuf, String> {
    let normalized = normalize_archive_path(entry_name);
    
    if normalized.is_empty() {
        return Err("Archive entry path is empty".to_string());
    }

    let path = Path::new(&normalized);
    
    for component in path.components() {
        match component {
            Component::Prefix(_) | Component::RootDir => {
                return Err(format!(
                    "Archive entry '{}' contains absolute path component",
                    entry_name
                ));
            }
            Component::ParentDir => {
                return Err(format!(
                    "Archive entry '{}' contains parent directory reference (path traversal)",
                    entry_name
                ));
            }
            _ => {}
        }
    }

    let resolved = destination.join(&normalized);
    
    let canonical_dest = destination
        .canonicalize()
        .unwrap_or_else(|_| destination.to_path_buf());

    let canonical_resolved = canonicalize_safe(Path::new(&normalized), &canonical_dest)?;
    
    if !canonical_resolved.starts_with(&canonical_dest) {
        return Err(format!(
            "Archive entry '{}' resolves outside destination directory",
            entry_name
        ));
    }

    Ok(resolved)
}

pub fn check_symlink_escape(path: &Path, destination: &Path) -> Result<(), String> {
    let canonical_dest = destination
        .canonicalize()
        .unwrap_or_else(|_| destination.to_path_buf());

    let relative = path
        .strip_prefix(destination)
        .or_else(|_| path.strip_prefix(&canonical_dest))
        .map_err(|_| {
            format!(
                "Path '{}' is outside destination directory",
                path.display()
            )
        })?;

    let canonical_path = if relative.as_os_str().is_empty() {
        canonical_dest.clone()
    } else {
        canonicalize_safe(relative, &canonical_dest)?
    };
    
    if !canonical_path.starts_with(&canonical_dest) {
        return Err(format!(
            "Path '{}' resolves outside destination directory via symlink",
            path.display()
        ));
    }

    Ok(())
}

fn canonicalize_safe(path: &Path, base: &Path) -> Result<PathBuf, String> {
    let mut result = base.to_path_buf();
    let mut symlink_depth = 0;

    for component in path.components() {
        match component {
            Component::CurDir => continue,
            Component::ParentDir => {
                if !result.pop() {
                    return Err(format!(
                        "Path '{}' escapes base directory",
                        path.display()
                    ));
                }
            }
            Component::Normal(name) => {
                result.push(name);
                
                if result.exists() {
                    let metadata = std::fs::symlink_metadata(&result).map_err(|e| {
                        format!("Failed to read metadata for '{}': {}", result.display(), e)
                    })?;
                    
                    if metadata.file_type().is_symlink() {
                        symlink_depth += 1;
                        if symlink_depth > MAX_SYMLINK_DEPTH {
                            return Err(format!(
                                "Too many symlinks (>{}) while resolving '{}'",
                                MAX_SYMLINK_DEPTH, path.display()
                            ));
                        }
                        
                        let target = std::fs::read_link(&result).map_err(|e| {
                            format!("Failed to read symlink '{}': {}", result.display(), e)
                        })?;
                        
                        let resolved = if target.is_absolute() {
                            return Err(format!(
                                "Symlink '{}' points to absolute path '{}'",
                                result.display(), target.display()
                            ));
                        } else {
                            result.parent()
                                .unwrap_or(base)
                                .join(&target)
                        };
                        
                        result = resolved;
                    }
                }
            }
            Component::Prefix(_) | Component::RootDir => {
                return Err(format!(
                    "Unexpected absolute path component in '{}'",
                    path.display()
                ));
            }
        }
    }

    Ok(result)
}

pub fn normalize_archive_path(path: &str) -> String {
    path.replace('\\', "/").trim_matches('/').to_string()
}

pub fn should_skip_unsafe_entry(entry_name: &str) -> bool {
    let normalized = normalize_archive_path(entry_name);
    
    normalized.contains("..") || 
    normalized.starts_with('/') ||
    normalized.starts_with('\\') ||
    (normalized.len() > 1 && normalized.chars().nth(1) == Some(':'))
}

pub fn is_safe_path_component(name: &str) -> bool {
    !name.is_empty()
        && !name.contains('\0')
        && name != "."
        && name != ".."
        && !name.starts_with('/')
        && !name.starts_with('\\')
        && !name.contains("://")
        && !(name.len() > 1 && name.chars().nth(1) == Some(':'))
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs;
    use std::time::{SystemTime, UNIX_EPOCH};

    fn temp_destination_dir() -> PathBuf {
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("time")
            .as_nanos();
        let path = std::env::temp_dir().join(format!("common-archives-test-{}", nanos));
        fs::create_dir_all(&path).expect("create temp dir");
        path
    }

    #[test]
    fn validate_entry_path_allows_nested_relative_entries() {
        let destination = temp_destination_dir();

        let resolved = validate_archive_entry_path("docs/note.txt", &destination)
            .expect("nested entry should be accepted");

        assert_eq!(resolved, destination.join("docs/note.txt"));
    }

    #[test]
    fn validate_entry_path_rejects_parent_traversal() {
        let destination = temp_destination_dir();

        let error = validate_archive_entry_path("../escape.txt", &destination)
            .expect_err("parent traversal must be rejected");

        assert!(error.contains("path traversal"), "unexpected error: {error}");
    }

    #[test]
    fn check_symlink_escape_accepts_path_under_destination() {
        let destination = temp_destination_dir();
        let file_path = destination.join("readme.txt");
        fs::write(&file_path, b"ok").expect("write file");

        check_symlink_escape(&file_path, &destination).expect("file under destination");
    }
}
