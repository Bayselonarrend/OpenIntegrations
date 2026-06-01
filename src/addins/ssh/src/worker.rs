use std::io::{BufReader, Cursor, Read};
use std::path::PathBuf;
use std::str::FromStr;
use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_core::JanxValue;
use common_janx::janx;
use common_utils::utils::{janx_error, janx_result_ok, janx_success};
use ssh2::{RenameFlags, Session, Sftp};

use crate::connection;
use crate::sftp_ops::{self, oct, upload_from_reader};
use crate::ssh_settings::SshConf;

pub enum WorkerCommand {
    Connect {
        conf: SshConf,
        response: Sender<JanxValue>,
    },
    Disconnect {
        response: Sender<Result<(), String>>,
    },
    Execute {
        command: String,
        response: Sender<JanxValue>,
    },
    ToSftp {
        response: Sender<JanxValue>,
    },
    MakeDirectory {
        path: String,
        mode: i32,
        response: Sender<JanxValue>,
    },
    RemoveDirectory {
        path: String,
        response: Sender<JanxValue>,
    },
    ListDirectory {
        path: String,
        response: Sender<JanxValue>,
    },
    UploadFile {
        file: String,
        path: String,
        response: Sender<JanxValue>,
    },
    UploadData {
        data: Vec<u8>,
        path: String,
        response: Sender<JanxValue>,
    },
    RemoveFile {
        path: String,
        response: Sender<JanxValue>,
    },
    IsSftp {
        response: Sender<bool>,
    },
    DownloadToFile {
        path: String,
        filepath: String,
        response: Sender<JanxValue>,
    },
    DownloadToBuffer {
        path: String,
        response: Sender<Result<Vec<u8>, String>>,
    },
    RenameObject {
        path: String,
        new_path: String,
        overwrite: bool,
        response: Sender<JanxValue>,
    },
    GetFileInfo {
        path: String,
        response: Sender<JanxValue>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    IsConnected {
        response: Sender<bool>,
    },
    Shutdown,
}

struct SessionState {
    logger: Option<Arc<Logger>>,
    session: Option<Session>,
    sftp: Option<Sftp>,
}

impl SessionState {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            session: None,
            sftp: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn connect(&mut self, conf: &SshConf) -> JanxValue {
        self.log("Connecting to SSH server");
        let (session, response) = connection::establish(conf);
        if let Some(sess) = session {
            self.session = Some(sess);
            self.sftp = None;
            self.log("Connected to SSH server");
        } else if !janx_result_ok(&response) {
            if let JanxValue::Object(map) = &response {
                if let Some(JanxValue::String(err)) = map.get("error") {
                    self.log(&format!("Connect failed: {}", err));
                }
            }
        }
        response
    }

    fn disconnect(&mut self) -> Result<(), String> {
        self.log("Disconnecting from SSH server");
        self.session.take();
        self.sftp.take();
        Ok(())
    }

    fn execute(&self, command: &str) -> JanxValue {
        self.log(&format!("Execute command: {}", command));

        let session = match sftp_ops::require_session(&self.session) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let mut channel = match session.channel_session() {
            Ok(channel) => channel,
            Err(e) => return janx_error(e.to_string()),
        };

        if let Err(e) = channel.exec(command) {
            return janx_error(e.to_string());
        }

        let mut stdout = String::new();
        if let Err(e) = channel.read_to_string(&mut stdout) {
            stdout = e.to_string();
        }

        let mut stderr = String::new();
        if let Err(e) = channel.stderr().read_to_string(&mut stderr) {
            stderr = e.to_string();
        }

        let exit_code = match channel.wait_close() {
            Ok(_) => channel.exit_status().map_err(|e| e.to_string()),
            Err(e) => Err(e.to_string()),
        };

        let code = match exit_code {
            Ok(code) => code.to_string(),
            Err(e) => e,
        };

        janx!({
            "result": true,
            "exit_code": code,
            "stdout": stdout,
            "stderr": stderr,
        })
    }

    fn make_sftp(&mut self) -> JanxValue {
        let session = match sftp_ops::require_session(&self.session) {
            Ok(s) => s,
            Err(e) => return e,
        };

        match session.sftp() {
            Ok(sftp) => {
                self.sftp = Some(sftp);
                janx_success(None, None)
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn make_directory(&self, path: &str, mode: i32) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let mode_oct = match oct(mode) {
            Ok(mode) => mode,
            Err(e) => return janx_error(e),
        };

        match sftp.mkdir(path.as_ref(), mode_oct) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn remove_directory(&self, path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        match sftp.rmdir(path.as_ref()) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn list_directory(&self, path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let mut data = vec![];

        match sftp.readdir(path) {
            Ok(contents) => {
                for item in contents {
                    data.push(sftp_ops::form_file_info(&item.0, &item.1));
                }
                janx_success(Some(JanxValue::Array(data)), Some("data"))
            }
            Err(err) => janx_error(err.to_string()),
        }
    }

    fn get_file_info(&self, path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let pb = match PathBuf::from_str(path) {
            Ok(pb) => pb,
            Err(err) => return janx_error(err.to_string()),
        };

        match sftp.stat(pb.as_path()) {
            Ok(stat) => janx_success(Some(sftp_ops::form_file_info(&pb, &stat)), Some("data")),
            Err(err) => janx_error(err.to_string()),
        }
    }

    fn upload_file(&self, file: &str, path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let file = match std::fs::File::open(file) {
            Ok(f) => f,
            Err(e) => return janx_error(format!("File error: {}", e)),
        };

        let mut buf_reader = BufReader::with_capacity(256 * 1024, file);
        match upload_from_reader(sftp, path, &mut buf_reader) {
            Ok(d) => janx!({
                "result": true,
                "bytes": d,
            }),
            Err(e) => janx_error(e),
        }
    }

    fn upload_data(&self, data: &[u8], path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let mut cursor = Cursor::new(data);
        match upload_from_reader(sftp, path, &mut cursor) {
            Ok(d) => janx!({
                "result": true,
                "bytes": d,
            }),
            Err(e) => janx_error(e),
        }
    }

    fn delete_file(&self, path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        match sftp.unlink(path.as_ref()) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn download_to_file(&self, path: &str, file_path: &str) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let mut file = match std::fs::File::create(file_path) {
            Ok(f) => f,
            Err(e) => return janx_error(format!("File error: {}", e)),
        };

        match sftp_ops::download_to_writer(sftp, path, &mut file) {
            Ok(b) => janx!({
                "result": true,
                "bytes": b,
                "filepath": file_path,
            }),
            Err(e) => janx_error(e),
        }
    }

    fn download_to_vec(&self, path: &str) -> Result<Vec<u8>, String> {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => {
                return Err(match e {
                    JanxValue::Object(map) => map
                        .get("error")
                        .and_then(|v| match v {
                            JanxValue::String(s) => Some(s.clone()),
                            _ => None,
                        })
                        .unwrap_or_else(|| "Init SFTP first".to_string()),
                    _ => "Init SFTP first".to_string(),
                })
            }
        };

        let mut buffer = Vec::new();
        match sftp_ops::download_to_writer(sftp, path, &mut buffer) {
            Ok(_) => Ok(buffer),
            Err(e) => Err(e),
        }
    }

    fn rename_object(&self, path: &str, new_path: &str, overwrite: bool) -> JanxValue {
        let sftp = match sftp_ops::require_sftp(&self.sftp) {
            Ok(s) => s,
            Err(e) => return e,
        };

        let flags = match overwrite {
            true => Some(RenameFlags::OVERWRITE),
            false => None,
        };

        match sftp.rename(path.as_ref(), new_path.as_ref(), flags) {
            Ok(_) => janx_success(None, None),
            Err(e) => janx_error(e.to_string()),
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_ssh_backend", move |rx| {
        let mut session = SessionState::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect { conf, response } => {
                    let result = session.connect(&conf);
                    let _ = response.send(result);
                }
                WorkerCommand::Disconnect { response } => {
                    let _ = response.send(session.disconnect());
                }
                WorkerCommand::Execute { command, response } => {
                    let _ = response.send(session.execute(&command));
                }
                WorkerCommand::ToSftp { response } => {
                    let _ = response.send(session.make_sftp());
                }
                WorkerCommand::MakeDirectory { path, mode, response } => {
                    let _ = response.send(session.make_directory(&path, mode));
                }
                WorkerCommand::RemoveDirectory { path, response } => {
                    let _ = response.send(session.remove_directory(&path));
                }
                WorkerCommand::ListDirectory { path, response } => {
                    let _ = response.send(session.list_directory(&path));
                }
                WorkerCommand::UploadFile { file, path, response } => {
                    let _ = response.send(session.upload_file(&file, &path));
                }
                WorkerCommand::UploadData { data, path, response } => {
                    let _ = response.send(session.upload_data(&data, &path));
                }
                WorkerCommand::RemoveFile { path, response } => {
                    let _ = response.send(session.delete_file(&path));
                }
                WorkerCommand::IsSftp { response } => {
                    let _ = response.send(session.sftp.is_some());
                }
                WorkerCommand::DownloadToFile { path, filepath, response } => {
                    let _ = response.send(session.download_to_file(&path, &filepath));
                }
                WorkerCommand::DownloadToBuffer { path, response } => {
                    let _ = response.send(session.download_to_vec(&path));
                }
                WorkerCommand::RenameObject {
                    path,
                    new_path,
                    overwrite,
                    response,
                } => {
                    let _ = response.send(session.rename_object(&path, &new_path, overwrite));
                }
                WorkerCommand::GetFileInfo { path, response } => {
                    let _ = response.send(session.get_file_info(&path));
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.session.is_some());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down SSH backend");
                    let _ = session.disconnect();
                    break;
                }
            }
        }
    })
}
