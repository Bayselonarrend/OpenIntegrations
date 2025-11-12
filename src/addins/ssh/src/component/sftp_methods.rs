use std::io::{BufReader, Cursor, Read, copy, Write};
use std::path::{Path, PathBuf};
use std::str::FromStr;
use common_utils::utils::{json_error, json_success};
use serde_json::{json, Value};
use ssh2::{FileStat, RenameFlags, Sftp};
use crate::component::{AddIn};

impl AddIn{

    pub fn make_sftp(&mut self) -> String {
        match &self.inner{
            Some(sess) => {

                let result = sess.sftp().map_err( |err| err.to_string() );

                self.sftp = match result{
                    Ok(sftp) => Some(sftp),
                    Err(e) => return e.to_string()
                };
                json!({"result": true}).to_string()
            },
            None => json!({"result": false, "error": "Init SSH connection first"}).to_string()
        }
    }

    pub fn make_directory(&mut self, path: &str, mode: i32) -> String {
        match &self.sftp{
            Some(s) => {

                let mode_oct = match oct(mode){
                    Ok(mode) => mode,
                    Err(e) => return json_error(&e)
                };

                let result = s.mkdir(path.as_ref(), mode_oct).map_err(|err| err.to_string());

                match result{
                    Ok(_) => json_success(),
                    Err(e) => json_error(&e)
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn remove_directory(&mut self, path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match s.rmdir(path.as_ref()) {
                    Ok(_) => json_success(),
                    Err(e) => json_error(&e)
                }
            },
            None => json!({"result": false, "error": "Init SFTP first"}).to_string()
        }
    }

    pub fn list_directory(&mut self, path: &str) -> String {

        let sftp = match &self.sftp {
            Some(s) => s,
            None => return json!({"result": false, "error": "Init SFTP first"}).to_string()
        };

        let mut data = vec![];

        match sftp.readdir(path) {
            Ok(contents) => {
                for item in contents {
                    let object_pb = item.0;
                    let object_info = &item.1;
                    data.push(form_file_info(&object_pb, object_info));
                }

                json!({"result": true, "data": data}).to_string()
            },
            Err(err) =>  json_error(&err),
        }
    }

    pub fn get_file_info(&mut self, path: &str) -> String {

        let sftp = match &self.sftp {
            Some(s) => s,
            None => return json!({"result": false, "error": "Init SFTP first"}).to_string()
        };

        let pb = match PathBuf::from_str(path){
            Ok(pb) => pb,
            Err(err) => return json_error(&err),
        };

        match sftp.stat(pb.as_path()) {
            Ok(stat) => {
                json!({
                    "result": true,
                    "data": form_file_info(&pb, &stat)
                }).to_string()
            },
            Err(err) => json_error(&err),
        }
    }

    pub fn upload_file(&mut self, file: &str, path: &str) -> String {

        match &self.sftp{
            Some(s) => {

                let file = match std::fs::File::open(file) {
                    Ok(f) => f,
                    Err(e) => return json_error(format!("File error: {}", e))
                };

                let mut buf_reader = BufReader::new(file);
                let result = upload_from_reader(s, path, &mut buf_reader);

                match result{
                    Ok(d) => json!({"result": true, "bytes": d}).to_string(),
                    Err(e) => json_error(&e)
                }
            },
            None => json_error("Init SFTP first")
        }
    }

    pub fn upload_data(&mut self, data: &[u8], path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                let mut cursor = Cursor::new(data);
                let result = upload_from_reader(s, path, &mut cursor);

                match result{
                    Ok(d) => json!({"result": true, "bytes": d}).to_string(),
                    Err(e) => json_error(&e)
                }
            },
            None => json_error("Init SFTP first")
        }
    }

    pub fn delete_file(&mut self, path: &str) -> String {
        match &self.sftp{
            Some(s) => {
                match s.unlink(path.as_ref()){
                    Ok(_) => json_success(),
                    Err(e) => json_error(&e)
                }
            },
            None => json_error("Init SFTP first")
        }
    }

    pub fn download_to_file(&mut self, path: &str, file_path: &str) -> String {

        let sftp = match &self.sftp {
            Some(s) => s,
            None => return json_error("Init SFTP first")
        };

        let mut file =  match std::fs::File::create(file_path){
            Ok(f) => f,
            Err(e) => return json_error(format!("File error: {}", e))
        };

        match download_to_writer(sftp, path, &mut file){
            Ok(b) => json!({"result": true, "bytes": b, "filepath": file_path}).to_string(),
            Err(e) => json_error(&e)
        }
    }

    pub fn download_to_vec(&mut self, path: &str) -> Result<Vec<u8>, String> {
        match &self.sftp{
            Some(s) => {

                let mut buffer = Vec::new();

                match download_to_writer(s, path, &mut buffer){
                    Ok(_) => Ok(buffer),
                    Err(e) => Err(json_error(&e))
                }
            },
            None => Err(json_error("Init SFTP first"))
        }
    }

    pub fn rename_object(&mut self, path: &str, new_path: &str, overwrite: bool) -> String {
        match &self.sftp{
            Some(s) => {

                let flags = match overwrite {
                    true => Some(RenameFlags::OVERWRITE),
                    false => None,
                };

                match s.rename(path.as_ref(), new_path.as_ref(), flags) {
                    Ok(_) => json_success(),
                    Err(e) => json_error(&e)
                }
            },
            None => json_error("Init SFTP first")
        }
    }

}

fn is_directory(mode: u32) -> bool {
    const S_IFMT: u32 = 0o170000;
    const S_IFDIR: u32 = 0o040000;
    (mode & S_IFMT) == S_IFDIR
}

fn oct(o: i32) -> Result<i32, String> {
    i32::from_str_radix(&o.to_string(), 8).map_err(|err| err.to_string())
}

fn upload_from_reader<R: Read>(sftp: &Sftp, path: &str, reader: &mut R) -> Result<u64, String> {

    let mut remote = match sftp.create(path.as_ref()) {
        Ok(remote) => remote,
        Err(e) => return Err(format!("Remote file access error: {}", e))
    };

    match copy(reader, &mut remote) {
        Ok(b) => Ok(b),
        Err(e) => Err(format!("Upload error: {}", &e.to_string()))
    }

}

fn download_to_writer<W: Write>(sftp: &Sftp, path: &str, writer: &mut W, ) -> Result<u64, String> {

    let mut remote = match sftp.open(Path::new(path)) {
        Ok(remote) => remote,
        Err(e) => return Err(format!("Remote file access error: {}", e))
    };

    match copy(&mut remote, writer) {
        Ok(b) => Ok(b),
        Err(e) => Err(format!("Upload error: {}", &e.to_string()))
    }
}

fn form_file_info(path: &PathBuf, data: &FileStat) -> Value{

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

    json!({
        "uid": data.uid,
        "gid": data.gid,
        "is_directory": is_directory(object_perm),
        "is_symlink": path.is_symlink(),
        "modified": data.mtime,
        "accessed": data.atime,
        "name": object_filename,
        "size": data.size,
        "path": object_path,
        "permissions":  format!("{:o}", object_perm),
        "extension": object_ext,
    })

}