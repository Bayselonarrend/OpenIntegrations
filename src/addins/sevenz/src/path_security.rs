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

    let canonical_resolved = canonicalize_safe(&resolved, &canonical_dest)?;
    
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

    let canonical_path = canonicalize_safe(path, &canonical_dest)?;
    
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

pub fn should_skip_symlink_entry(entry_name: &str) -> bool {
    let normalized = normalize_archive_path(entry_name);
    
    normalized.contains("..") || 
    normalized.starts_with('/') ||
    normalized.starts_with('\\') ||
    (normalized.len() > 1 && normalized.chars().nth(1) == Some(':'))
}
