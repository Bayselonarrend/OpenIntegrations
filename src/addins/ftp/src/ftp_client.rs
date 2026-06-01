use std::io::{copy, BufReader, Cursor, ErrorKind, Read, Write};
use std::net::{SocketAddr, TcpStream};
use common_core::JanxValue;
use common_janx::{janx, IntoJanx};
use suppaftp::{FtpError, FtpResult, FtpStream, Mode, RustlsConnector, RustlsFtpStream, Status};
use suppaftp::list::File;
use std::str::FromStr;
use chrono::{DateTime, Utc};
use serde::Serialize;
use std::string::String;
use std::sync::Arc;
use std::time::{Duration, Instant};
use base64::Engine;
use base64::engine::general_purpose;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_success};
use suppaftp::types::Response;
use crate::configuration::FtpSettings;
use crate::passive_establish;

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
                    Err(e) => Err(e.to_string())
                }

            }
            FtpClient::Insecure(mut stream) => {
                match stream.login(user, pass){
                    Ok(_) => Ok(FtpClient::Insecure(stream)),
                    Err(e) => Err(e.to_string())
                }
            }
        }

    }

    pub fn get_welcome_msg(&self) -> JanxValue {
        let msg = match self {
            FtpClient::Secure(stream) => stream.get_welcome_msg().unwrap_or(""),
            FtpClient::Insecure(stream) => stream.get_welcome_msg().unwrap_or(""),
        };

        janx_success(Some(msg.into_janx()), Some("data"))
    }

    pub fn make_directory(&mut self, path: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.mkdir(path),
            FtpClient::Insecure(stream) => stream.mkdir(path),
        };

        match result {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn remove_directory(&mut self, path: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.rmdir(path),
            FtpClient::Insecure(stream) => stream.rmdir(path),
        };

        match result {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn list_directory(&mut self, path: &str) -> JanxValue {

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
                let data: Vec<JanxValue> = objects.iter().map(ftp_object_value).collect();
                janx!({
                    "result": true,
                    "count": count,
                    "data": data,
                })
            },
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn upload_data(&mut self, path: &str, data: &[u8]) -> JanxValue {
        let mut cursor = Cursor::new(data);
        self.upload_from_reader(path, &mut cursor)
    }

    pub fn upload_file(&mut self, path: &str, filepath: &str) -> JanxValue {
        let file = match std::fs::File::open(filepath) {
            Ok(f) => f,
            Err(e) => return janx_error(format!("File error: {}", e))
        };

        let mut buf_reader = BufReader::with_capacity(256 * 1024, file);
        self.upload_from_reader(path, &mut buf_reader)

    }

    pub fn download_to_file(&mut self, path: &str, file_path: &str) -> JanxValue {

        let mut file =  match std::fs::File::create(file_path){
            Ok(f) => f,
            Err(e) => return janx_error(format!("File error: {}", e))
        };

        match self.download_to_writer(path, &mut file){
            Ok(b) => janx!({
                "result": true,
                "bytes": b,
                "filepath": file_path,
            }),
            Err(e) => janx_error(e)
        }
    }

    pub fn download_to_vec(&mut self, path: &str) -> Result<Vec<u8>, String> {
        let mut buffer = Vec::new();
        self.download_to_writer(path, &mut buffer)?;
        Ok(buffer)
    }

    pub fn remove_file(&mut self, path: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.rm(path),
            FtpClient::Insecure(stream) => stream.rm(path),
        };

        match result {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn object_size(&mut self, path: &str) -> JanxValue {

        match self.get_size(path) {
            Ok(b) => janx!({
                "result": true,
                "bytes": b,
            }),
            Err(e) => janx_error(e.to_string())
        }

    }

    pub fn rename_object(&mut self, path: &str, new_path: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.rename(path, new_path),
            FtpClient::Insecure(stream) => stream.rename(path, new_path),
        };

        match result {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn execute_command(&mut self, command: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.site(command),
            FtpClient::Insecure(stream) => stream.site(command),
        };

        match result {
            Ok(r) => process_ftp_response(r),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn execute_standard_command(&mut self, command: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.custom_command(command, all_status_variants().as_slice()),
            FtpClient::Insecure(stream) => stream.custom_command(command, all_status_variants().as_slice()),
        };

        match result {
            Ok(r) => process_ftp_response(r),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn ping(&mut self) -> bool {

        let result = match self {
            FtpClient::Secure(stream) => stream.noop(),
            FtpClient::Insecure(stream) => stream.noop(),
        };

        match result {
            Ok(_) => true,
            Err(_) => false
        }

    }

    pub fn get_features(&mut self) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.feat(),
            FtpClient::Insecure(stream) => stream.feat(),
        };

        match result {
            Ok(f) => janx_success(
                Some(common_utils::utils::json_value_to_janx(
                    serde_json::to_value(f).unwrap_or(serde_json::Value::Null),
                )),
                Some("data"),
            ),
            Err(e) => janx_error(e.to_string())
        }

    }

    pub fn get_current_directory(&mut self) -> JanxValue {
        let result = match self {
            FtpClient::Secure(stream) => stream.pwd(),
            FtpClient::Insecure(stream) => stream.pwd(),
        };

        match result {
            Ok(p) => janx!({
                "result": true,
                "path": p,
            }),
            Err(e) => janx_error(e.to_string())
        }
    }

    pub fn change_current_directory(&mut self, path: &str) -> JanxValue {

        let result = match self {
            FtpClient::Secure(stream) => stream.cwd(path),
            FtpClient::Insecure(stream) => stream.cwd(path),
        };

        match result {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string())
        }
    }


    fn upload_from_reader<R: Read>(
        &mut self,
        path: &str,
        reader: &mut R
    ) -> JanxValue {

        macro_rules! upload_impl {
            ($stream:expr, $path:expr, $reader:expr) => {{
                let mut data_stream = match $stream.put_with_stream($path)
                    .map_err(|e| format!("Data stream error: {}", e)){
                    Ok(stream) => stream,
                    Err(e) => return janx_error(e)
                };

                let bytes = match copy($reader, &mut data_stream) {
                    Ok(b) => {
                        match wait_for_writable(&mut data_stream, Duration::from_secs(5)){
                            Ok(_) => {},
                            Err(e) => return janx_error(e)
                        };
                        b
                    },
                    Err(e) => return janx_error(format!("Upload error: {}", &e.to_string()))
                };

                $stream.finalize_put_stream(data_stream)
                    .map(|_| bytes)
                    .map_err(|e| format!("Finalize error: {}", e))
            }};
        }

        let result = match self {
            FtpClient::Secure(stream) => upload_impl!(stream, path, reader),
            FtpClient::Insecure(stream) => upload_impl!(stream, path, reader),
        };

        match result {
            Ok(b) => janx!({
                "result": true,
                "bytes": b,
            }),
            Err(e) => janx_error(e)
        }
    }

    fn download_to_writer<W: Write>(
        &mut self,
        path: &str,
        writer: &mut W,
    ) -> Result<u64, String> {

        let result = match self {
            FtpClient::Secure(stream) => {
                stream.retr(path, |stream| {
                    copy(stream, writer).map_err(|e| FtpError::ConnectionError(e))
                })
            },
            FtpClient::Insecure(stream) => {
                stream.retr(path, |stream| {
                    copy(stream, writer).map_err(|e| FtpError::ConnectionError(e))
                })
            },
        };

        match result {
            Ok(b) => Ok(b),
            Err(e) => Err(e.to_string())
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
    tls_settings: Option<&TlsSettings>,
    proxy_settings: Option<&ProxySettings>,
    tcp_stream: TcpStream,
) -> Result<FtpClient, String> {

    let mode = if ftp_settings.passive { Mode::Passive } else { Mode::Active };
    let passive_proxy = ftp_settings.passive && proxy_settings.is_some();

    if tls_settings.is_some_and(|s| s.use_tls) {

        let tls = tls_settings.unwrap();
        let config = tls.get_rustls_config().map_err(|e| e.to_string())?;

        let tls_connector = RustlsConnector::from(Arc::new(config));

        let mut ftp_stream = RustlsFtpStream::connect_with_stream(tcp_stream)
            .map_err(|e| e.to_string())?;

        ftp_stream.set_mode(mode);
        ftp_stream.set_passive_nat_workaround(true);

        let mut secure_stream = ftp_stream
            .into_secure(tls_connector, &ftp_settings.domain)
            .map_err(|e| e.to_string())?;

        if passive_proxy {
            let ftp_settings_clone = ftp_settings.clone();
            let proxy_settings_clone = proxy_settings.cloned();

            secure_stream = secure_stream.passive_stream_builder(move |addr: SocketAddr| {
                passive_establish::make_passive_proxy_stream(&ftp_settings_clone, &proxy_settings_clone, addr)
            });
        }

        Ok(FtpClient::Secure(secure_stream))

    } else {
        let mut ftp_stream = FtpStream::connect_with_stream(tcp_stream)
            .map_err(|e| e.to_string())?;

        ftp_stream.set_mode(mode);
        ftp_stream.set_passive_nat_workaround(true);

        if passive_proxy {
            let ftp_settings_clone = ftp_settings.clone();
            let proxy_settings_clone = proxy_settings.cloned();

            ftp_stream = ftp_stream.passive_stream_builder(move |addr: SocketAddr| {
                passive_establish::make_passive_proxy_stream(&ftp_settings_clone, &proxy_settings_clone, addr)
            });
        }

        Ok(FtpClient::Insecure(ftp_stream))
    }
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

fn ftp_object_value(obj: &FtpObject) -> JanxValue {
    janx!({
        "name": obj.name.clone(),
        "is_directory": obj.is_directory,
        "is_symlink": obj.is_symlink,
        "symlink_path": obj.symlink_path.clone(),
        "size": obj.size,
        "modified": obj.modified.clone(),
        "list_string": obj.list_string.clone(),
    })
}

pub fn process_ftp_response(response: Response) -> JanxValue {
    let code = response.status.code();
    let body = response.body;

    let body_value = match String::from_utf8(body) {
        Ok(text) => JanxValue::String(text),
        Err(original_bytes) => {
            let base64 = general_purpose::STANDARD.encode(&original_bytes.into_bytes());
            janx!({ "BYTES": base64 })
        }
    };

    janx!({
        "result": true,
        "data": body_value,
        "status": code,
    })
}

pub fn all_status_variants() -> Vec<Status> {
    use Status::*;
    vec![
        RestartMarker,
        ReadyMinute,
        AlreadyOpen,
        AboutToSend,
        CommandOk,
        CommandNotImplemented,
        System,
        Directory,
        File,
        Help,
        Name,
        Ready,
        Closing,
        DataConnectionOpen,
        ClosingDataConnection,
        PassiveMode,
        LongPassiveMode,
        ExtendedPassiveMode,
        LoggedIn,
        LoggedOut,
        LogoutAck,
        AuthOk,
        RequestedFileActionOk,
        PathCreated,
        NeedPassword,
        LoginNeedAccount,
        RequestFilePending,
        NotAvailable,
        CannotOpenDataConnection,
        TransferAborted,
        InvalidCredentials,
        HostUnavailable,
        RequestFileActionIgnored,
        ActionAborted,
        RequestedActionNotTaken,
        BadCommand,
        BadArguments,
        NotImplemented,
        BadSequence,
        NotImplementedParameter,
        NotLoggedIn,
        StoringNeedAccount,
        FileUnavailable,
        PageTypeUnknown,
        ExceededStorage,
        BadFilename,
        Unknown,
    ]
}