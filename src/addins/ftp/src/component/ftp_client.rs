use std::io::{copy, BufReader, Cursor};
use serde_json::json;
use suppaftp::{FtpStream, RustlsFtpStream};
use suppaftp::list::File;
use std::str::FromStr;
use chrono::{DateTime, Utc};
use serde::Serialize;
use std::string::String;

pub enum FtpClient {
    Secure(RustlsFtpStream),
    Insecure(FtpStream),
}

#[derive(Serialize)]
struct FtpElement{
    name: String,
    is_directory: bool,
    is_symlink: bool,
    symlink_path: String,
    size: usize,
    modified: String,
    list_string: String
}

impl FtpElement {
     fn from_file_object(file: &File, list_string: &str) -> FtpElement {

         let symlink = match file.symlink(){
             Some(p) => p.to_str().unwrap_or(""),
             None => ""
         };

         let modified_date: DateTime<Utc> = file.modified().into();
         let modified_string = modified_date.to_rfc3339();

         FtpElement{
             name: file.name().to_string(),
             is_directory: file.is_directory(),
             is_symlink: file.is_symlink(),
             symlink_path: symlink.to_string(),
             size: file.size(),
             modified: modified_string,
             list_string: list_string.to_string()
         }
     }

    fn from_list_string(list_string: &str) -> FtpElement {

        FtpElement{
            name: "".to_string(),
            is_directory: false,
            is_symlink: false,
            symlink_path: "".to_string(),
            size: 0,
            modified: "".to_string(),
            list_string: list_string.to_string()
        }

    }
}

impl FtpClient {

    pub fn login(self, user: Option<&str>, pass: Option<&str>) -> Result<FtpClient, String> {

        let user = match user {
            Some(u) => u,
            None => return Ok(self),
        };

        let pass = pass.unwrap_or_else(|| "");

        match self {
            FtpClient::Secure(mut stream) => {

                match stream.login(user, pass){
                    Ok(_) => Ok(FtpClient::Secure(stream)),
                    Err(e) => Err(format_json_error(&e.to_string()))
                }

            }
            FtpClient::Insecure(mut stream) => {
                match stream.login(user, pass){
                    Ok(_) => Ok(FtpClient::Insecure(stream)),
                    Err(e) => Err(format_json_error(&e.to_string()))
                }
            }
        }

    }

    pub fn get_welcome_msg(&self) -> String {
        let msg = match self {
            FtpClient::Secure(stream) => stream.get_welcome_msg().unwrap_or(""),
            FtpClient::Insecure(stream) => stream.get_welcome_msg().unwrap_or(""),
        };

        json!({"result": true, "data": msg}).to_string()
    }

    pub fn make_directory(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.mkdir(path),
            FtpClient::Insecure(stream) => stream.mkdir(path),
        };

        match result {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn remove_directory(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.rmdir(path),
            FtpClient::Insecure(stream) => stream.rmdir(path),
        };

        match result {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn list_directory(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.list(Some(path)),
            FtpClient::Insecure(stream) => stream.list(Some(path)),
        };

        match result {
            Ok(d) => {

                let mut elements = Vec::new();

                for path in d {
                    elements.push(
                        match File::from_str(&path){
                            Ok (f) => FtpElement::from_file_object(&f, &path),
                            Err(_) => FtpElement::from_list_string(&path)
                        }
                    )
                }
                json!({"result": true, "data": elements}).to_string()
            },
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn upload_data(&mut self, path: &str, data: &[u8]) -> String {
        let mut cursor = Cursor::new(data);
        match self.upload_from_reader(path, &mut cursor) {
            Ok(bytes) => json!({"result": true, "bytes": bytes}).to_string(),
            Err(e) => format_json_error(e)
        }
    }

    pub fn upload_file(&mut self, path: &str, filepath: &str) -> String {
        let file = match std::fs::File::open(filepath) {
            Ok(f) => f,
            Err(e) => return format_json_error(format!("File error: {}", e))
        };

        let mut buf_reader = BufReader::new(file);
        match self.upload_from_reader(path, &mut buf_reader) {
            Ok(bytes) => json!({"result": true, "bytes": bytes}).to_string(),
            Err(e) => format_json_error(e)
        }
    }

    pub fn remove_file(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.rm(path),
            FtpClient::Insecure(stream) => stream.rm(path),
        };

        match result {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string())
        }
    }

    fn upload_from_reader<R: std::io::Read>(
        &mut self,
        path: &str,
        reader: &mut R
    ) -> Result<u64, String> {
        match self {
            FtpClient::Secure(stream) => {

                let mut data_stream = stream.put_with_stream(path)
                    .map_err(|e| format!("Data stream error: {}", e))?;

                let bytes = copy(reader, &mut data_stream)
                    .map_err(|e| format!("Upload error: {}", e))?;

                let _ = std::io::Write::flush(&mut data_stream);
                std::thread::sleep(std::time::Duration::from_millis(150));

                stream.finalize_put_stream(data_stream)
                    .map(|_| bytes)
                    .map_err(|e| format!("Finalize error: {}", e))
            },
            FtpClient::Insecure(stream) => {
                stream.put_file(path, reader)
                    .map_err(|e| format!("File error: {}", e))
            }
        }
    }

}

fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}