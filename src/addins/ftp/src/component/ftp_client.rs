use std::io::{copy, BufReader, Cursor, ErrorKind, Write};
use std::net::{SocketAddr, TcpStream};
use serde_json::json;
use suppaftp::{FtpResult, FtpStream, Mode, RustlsConnector, RustlsFtpStream};
use suppaftp::list::File;
use std::str::FromStr;
use chrono::{DateTime, Utc};
use serde::Serialize;
use std::string::String;
use std::time::{Duration, Instant};
use crate::component::configuration::{FtpProxySettings, FtpSettings, FtpTlsSettings};
use crate::component::tls_establish;
use crate::component::tcp_establish;

pub enum FtpClient {
    Secure(RustlsFtpStream),
    Insecure(FtpStream),
}

#[derive(Serialize)]
struct FtpObject{
    name: String,
    is_directory: bool,
    is_symlink: bool,
    symlink_path: String,
    size: usize,
    modified: String,
    list_string: String
}

impl FtpObject {
     fn from_file_object(file: &File, list_string: &str) -> FtpObject {

         let symlink = match file.symlink(){
             Some(p) => p.to_str().unwrap_or(""),
             None => ""
         };

         let modified_date: DateTime<Utc> = file.modified().into();
         let modified_string = modified_date.to_rfc3339();

         FtpObject{
             name: file.name().to_string(),
             is_directory: file.is_directory(),
             is_symlink: file.is_symlink(),
             symlink_path: symlink.to_string(),
             size: file.size(),
             modified: modified_string,
             list_string: list_string.to_string()
         }
     }

    fn from_list_string(list_string: &str) -> FtpObject {

        FtpObject{
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

                let mut objects = Vec::new();
                let count = d.len();

                for path in d {
                    objects.push(
                        match File::from_str(&path){
                            Ok (f) => FtpObject::from_file_object(&f, &path),
                            Err(_) => FtpObject::from_list_string(&path)
                        }
                    )
                }
                json!({"result": true, "count": count, "data": objects}).to_string()
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

    pub fn object_size(&mut self, path: &str) -> String {

        match self.get_size(path) {
            Ok(b) => json!({"result": true, "bytes": b}).to_string(),
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

                let bytes = match copy(reader, &mut data_stream) {
                    Ok(b) => {
                        match wait_for_writable(&mut data_stream, Duration::from_secs(5)){
                            Ok(_) => {},
                            Err(e) => return Err(e)
                        };
                        b
                    },
                    Err(e) => return Err(format!("Upload error: {}", &e.to_string()))
                };

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

    fn get_size(&mut self, path: &str) -> FtpResult<usize> {
        match self {
            FtpClient::Secure(stream) => stream.size(path),
            FtpClient::Insecure(stream) => stream.size(path),
        }
    }

}

pub fn configure_ftp_client(
    ftp_settings: &FtpSettings,
    tls_settings: Option<&FtpTlsSettings>,
    proxy_settings: Option<&FtpProxySettings>,
    tcp_stream: TcpStream,
) -> Result<FtpClient, String> {

    let mode = if ftp_settings.passive { Mode::Passive } else { Mode::Active };
    let passive_proxy = ftp_settings.passive && proxy_settings.is_some();

    if tls_settings.is_some_and(|s| s.use_tls) {
        let tls = tls_settings.unwrap();
        let tls_connector = tls_establish::get_tls_connector(tls)
            .map_err(|e| format_json_error(&e.to_string()))?;

        let mut ftp_stream = RustlsFtpStream::connect_with_stream(tcp_stream)
            .map_err(|e| format_json_error(&e.to_string()))?;

        ftp_stream.set_mode(mode);
        ftp_stream.set_passive_nat_workaround(true);

        let mut secure_stream = ftp_stream
            .into_secure(RustlsConnector::from(tls_connector), &ftp_settings.domain)
            .map_err(|e| format_json_error(&e.to_string()))?;

        if passive_proxy {
            let ftp_settings_clone = ftp_settings.clone();
            let proxy_settings_clone = proxy_settings.cloned();

            secure_stream = secure_stream.passive_stream_builder(move |addr: SocketAddr| {
                tcp_establish::make_passive_proxy_stream(&ftp_settings_clone, &proxy_settings_clone, addr)
            });
        }

        Ok(FtpClient::Secure(secure_stream))
    } else {
        let mut ftp_stream = FtpStream::connect_with_stream(tcp_stream)
            .map_err(|e| format_json_error(&e.to_string()))?;

        ftp_stream.set_mode(mode);
        ftp_stream.set_passive_nat_workaround(true);

        if passive_proxy {
            let ftp_settings_clone = ftp_settings.clone();
            let proxy_settings_clone = proxy_settings.cloned();

            ftp_stream = ftp_stream.passive_stream_builder(move |addr: SocketAddr| {
                tcp_establish::make_passive_proxy_stream(&ftp_settings_clone, &proxy_settings_clone, addr)
            });
        }

        Ok(FtpClient::Insecure(ftp_stream))
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

fn wait_for_writable<S>(stream: &mut S, timeout: Duration) -> Result<(), String>
where
    S: Write
{
    let start = Instant::now();

    loop {
        match stream.write(&[]) {
            Ok(_) => return Ok(()),
            Err(e) if e.kind() == ErrorKind::WouldBlock => {
                if start.elapsed() > timeout {
                    return Err("Check error: Write timed out".to_string());
                }
                std::thread::yield_now();
            }
            Err(e) => return Err(format!("Check error: {}", e.to_string())),
        }
    }
}