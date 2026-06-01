use std::io::{Read, Write};
use std::path::{Path, PathBuf};

use common_core::JanxValue;
use common_janx::janx;
use common_utils::utils::janx_error;
use ssh2::{FileStat, Sftp};

pub fn oct(o: i32) -> Result<i32, String> {
    i32::from_str_radix(&o.to_string(), 8).map_err(|err| err.to_string())
}

pub fn upload_from_reader<R: Read>(sftp: &Sftp, path: &str, reader: &mut R) -> Result<u64, String> {
    let mut remote = sftp
        .create(path.as_ref())
        .map_err(|e| format!("Remote file access error: {}", e))?;

    let mut buffer = vec![0u8; 256 * 1024];
    let mut total_bytes = 0u64;

    loop {
        let bytes_read = match reader.read(&mut buffer) {
            Ok(0) => break,
            Ok(n) => n,
            Err(e) => return Err(format!("Read error: {}", e)),
        };

        remote
            .write_all(&buffer[..bytes_read])
            .map_err(|e| format!("Upload error: {}", e))?;
        total_bytes += bytes_read as u64;
    }

    Ok(total_bytes)
}

pub fn download_to_writer<W: Write>(sftp: &Sftp, path: &str, writer: &mut W) -> Result<u64, String> {
    let mut remote = sftp
        .open(Path::new(path))
        .map_err(|e| format!("Remote file access error: {}", e))?;

    let mut buffer = vec![0u8; 256 * 1024];
    let mut total_bytes = 0u64;

    loop {
        let bytes_read = match remote.read(&mut buffer) {
            Ok(0) => break,
            Ok(n) => n,
            Err(e) => return Err(format!("Read error: {}", e)),
        };

        writer
            .write_all(&buffer[..bytes_read])
            .map_err(|e| format!("Write error: {}", e))?;
        total_bytes += bytes_read as u64;
    }

    Ok(total_bytes)
}

pub fn form_file_info(path: &PathBuf, data: &FileStat) -> JanxValue {
    let object_path = path.to_str().unwrap_or("").to_string();
    let object_perm = data.perm.unwrap_or(0);

    let object_filename = path
        .file_name()
        .unwrap_or("".as_ref())
        .to_str()
        .unwrap_or("")
        .to_string();

    let object_ext = path
        .extension()
        .unwrap_or("".as_ref())
        .to_str()
        .unwrap_or("")
        .to_string();

    janx!({
        "uid": data.uid,
        "gid": data.gid,
        "is_directory": is_directory(object_perm),
        "is_symlink": path.is_symlink(),
        "modified": data.mtime,
        "accessed": data.atime,
        "name": object_filename,
        "size": data.size,
        "path": object_path,
        "permissions": format!("{:o}", object_perm),
        "extension": object_ext,
    })
}

fn is_directory(mode: u32) -> bool {
    const S_IFMT: u32 = 0o170000;
    const S_IFDIR: u32 = 0o040000;
    (mode & S_IFMT) == S_IFDIR
}

pub fn require_sftp<'a>(sftp: &'a Option<Sftp>) -> Result<&'a Sftp, JanxValue> {
    sftp.as_ref().ok_or_else(|| janx_error("Init SFTP first"))
}

pub fn require_session<'a>(session: &'a Option<ssh2::Session>) -> Result<&'a ssh2::Session, JanxValue> {
    session
        .as_ref()
        .ok_or_else(|| janx_error("Init SSH connection first"))
}
