use std::io::{BufReader, Cursor, Read, copy};
use serde_json::{json, Value};
use ssh2::{Session, Sftp};

pub fn make_sftp(session: &Session) -> Result<Sftp, String> {
    session.sftp().map_err( |err| err.to_string() )
}

pub fn make_directory(sftp: &Sftp, path: &str, mode: i32) -> Result<(), String> {
    let mode_oct = oct(mode)?;
    sftp.mkdir(path.as_ref(), mode_oct).map_err(|err| err.to_string())
}

pub fn remove_directory(sftp: &Sftp, path: &str) -> Result<(), String> {
    sftp.rmdir(path.as_ref()).map_err(|err| err.to_string())
}

pub fn list_directory(sftp: &Sftp, path: &str) -> Result<Vec<Value>, String> {

    let mut data = vec![];

    match sftp.readdir(path) {
        Ok(contents) => {
            for item in contents {

                let object_pb = item.0;
                let object_path = object_pb.to_str().unwrap_or("").to_string();
                let object_info = &item.1;
                let object_perm = object_info.perm.unwrap_or(0);

                let object_filename = object_pb
                    .file_name()
                    .unwrap_or("".as_ref())
                    .to_str()
                    .unwrap_or("")
                    .to_string();

                let object_ext = object_pb
                    .extension()
                    .unwrap_or("".as_ref())
                    .to_str()
                    .unwrap_or("")
                    .to_string();

                data.push(json!({
                    "uid": object_info.uid,
                    "gid": object_info.gid,
                    "is_directory": is_directory(object_perm),
                    "is_symlink": object_pb.is_symlink(),
                    "modified": object_info.mtime,
                    "accessed": object_info.atime,
                    "name": object_filename,
                    "size": object_info.size,
                    "path": object_path,
                    "permissions":  format!("{:o}", object_perm),
                    "extension": object_ext,
                }));
            }

            Ok(data)
        },
        Err(err) =>  Err(err.to_string()),
    }
}

pub fn upload_data(sftp: &Sftp, data: &[u8], path: &str) -> Result<u64, String> {
    let mut cursor = Cursor::new(data);
    upload_from_reader(sftp, path, &mut cursor)
}

pub fn upload_file(sftp: &Sftp, filepath: &str, path: &str) -> Result<u64, String> {

    let file = match std::fs::File::open(filepath) {
        Ok(f) => f,
        Err(e) => return Err(format!("File error: {}", e))
    };

    let mut buf_reader = BufReader::new(file);

    upload_from_reader(sftp, path, &mut buf_reader)

}

pub fn remove_file(sftp: &Sftp, path: &str) -> Result<(), String> {
    sftp.unlink(path.as_ref()).map_err(|err| err.to_string())
}

fn is_directory(mode: u32) -> bool {
    const S_IFMT: u32 = 0o170000; // маска типа файла
    const S_IFDIR: u32 = 0o040000; // биты для каталога
    (mode & S_IFMT) == S_IFDIR
}

fn oct(o: i32) -> Result<i32, String> {
    i32::from_str_radix(&o.to_string(), 8).map_err(|err| err.to_string())
}

fn upload_from_reader<R: Read>(sftp: &Sftp, path: &str, reader: &mut R) -> Result<u64, String> {

    let mut remote = match sftp.create(path.as_ref()) {
        Ok(remote) => remote,
        Err(e) => return Err(format!("File access error: {}", e))
    };

    match copy(reader, &mut remote) {
        Ok(b) => Ok(b),
        Err(e) => Err(format!("Upload error: {}", &e.to_string()))
    }

}