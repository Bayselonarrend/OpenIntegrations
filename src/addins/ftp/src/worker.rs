use std::sync::mpsc::Sender;
use std::sync::Arc;
use std::time::Duration;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::json_error;

use crate::configuration::FtpSettings;
use crate::ftp_client::{self, FtpClient};

pub enum WorkerCommand {
    Connect {
        ftp_settings: FtpSettings,
        tls_settings: Option<TlsSettings>,
        proxy_settings: Option<ProxySettings>,
        response: Sender<Result<(), String>>,
    },
    Close {
        response: Sender<Result<(), String>>,
    },
    GetWelcomeMsg {
        response: Sender<String>,
    },
    MakeDirectory {
        path: String,
        response: Sender<String>,
    },
    RemoveDirectory {
        path: String,
        response: Sender<String>,
    },
    ListDirectory {
        path: String,
        response: Sender<String>,
    },
    UploadData {
        path: String,
        data: Vec<u8>,
        response: Sender<String>,
    },
    UploadFile {
        path: String,
        filepath: String,
        response: Sender<String>,
    },
    RemoveFile {
        path: String,
        response: Sender<String>,
    },
    ObjectSize {
        path: String,
        response: Sender<String>,
    },
    RenameObject {
        path: String,
        new_path: String,
        response: Sender<String>,
    },
    DownloadToFile {
        path: String,
        filepath: String,
        response: Sender<String>,
    },
    DownloadToBuffer {
        path: String,
        response: Sender<Result<Vec<u8>, String>>,
    },
    Ping {
        response: Sender<bool>,
    },
    ExecuteCommand {
        command: String,
        response: Sender<String>,
    },
    GetCurrentDirectory {
        response: Sender<String>,
    },
    ChangeCurrentDirectory {
        path: String,
        response: Sender<String>,
    },
    GetFeatures {
        response: Sender<String>,
    },
    ExecuteStandardCommand {
        command: String,
        response: Sender<String>,
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

struct Session {
    logger: Option<Arc<Logger>>,
    client: Option<FtpClient>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self { logger, client: None }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn require_client(&mut self) -> Result<&mut FtpClient, String> {
        self.client
            .as_mut()
            .ok_or_else(|| json_error("FTP client is not initialized"))
    }

    fn connect(
        &mut self,
        ftp_settings: FtpSettings,
        tls_settings: Option<TlsSettings>,
        proxy_settings: Option<ProxySettings>,
    ) -> Result<(), String> {
        if self.client.is_some() {
            return Err("Client already initialized".to_string());
        }

        self.log("Connecting to FTP...");

        let tls_ref = tls_settings.as_ref();
        let host = &ftp_settings.domain;
        let port = ftp_settings.port;

        let tcp_stream = tcp_establish::create_tcp_connection(host, port, &proxy_settings)
            .map_err(|e| e.to_string())?;

        let w_timeout = Some(Duration::from_secs(ftp_settings.write_timeout));
        let r_timeout = Some(Duration::from_secs(ftp_settings.read_timeout));

        tcp_stream
            .set_write_timeout(w_timeout)
            .map_err(|e| e.to_string())?;
        tcp_stream
            .set_read_timeout(r_timeout)
            .map_err(|e| e.to_string())?;

        let client = ftp_client::configure_ftp_client(
            &ftp_settings,
            tls_ref,
            proxy_settings.as_ref(),
            tcp_stream,
        )?;

        let login = ftp_settings.login.as_deref();
        let password = ftp_settings.password.as_deref();

        let auth = client.login(login, password)?;

        self.client = Some(auth);
        self.log("Connected to FTP");
        Ok(())
    }

    fn close(&mut self) {
        if let Some(mut client) = self.client.take() {
            self.log("Closing FTP connection");
            match &mut client {
                FtpClient::Secure(stream) => {
                    let _ = stream.quit();
                }
                FtpClient::Insecure(stream) => {
                    let _ = stream.quit();
                }
            }
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_ftp_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    ftp_settings,
                    tls_settings,
                    proxy_settings,
                    response,
                } => {
                    let result = session.connect(ftp_settings, tls_settings, proxy_settings);
                    let _ = response.send(result);
                }
                WorkerCommand::Close { response } => {
                    session.close();
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::GetWelcomeMsg { response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.get_welcome_msg(),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::MakeDirectory { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.make_directory(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::RemoveDirectory { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.remove_directory(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::ListDirectory { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.list_directory(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::UploadData {
                    path,
                    data,
                    response,
                } => {
                    let result = match session.require_client() {
                        Ok(c) => c.upload_data(&path, &data),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::UploadFile {
                    path,
                    filepath,
                    response,
                } => {
                    let result = match session.require_client() {
                        Ok(c) => c.upload_file(&path, &filepath),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::RemoveFile { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.remove_file(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::ObjectSize { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.object_size(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::RenameObject {
                    path,
                    new_path,
                    response,
                } => {
                    let result = match session.require_client() {
                        Ok(c) => c.rename_object(&path, &new_path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::DownloadToFile {
                    path,
                    filepath,
                    response,
                } => {
                    let result = match session.require_client() {
                        Ok(c) => c.download_to_file(&path, &filepath),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::DownloadToBuffer { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.download_to_vec(&path),
                        Err(e) => Err(e),
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::Ping { response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.ping(),
                        Err(_) => false,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::ExecuteCommand { command, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.execute_command(&command),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::GetCurrentDirectory { response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.get_current_directory(),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::ChangeCurrentDirectory { path, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.change_current_directory(&path),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::GetFeatures { response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.get_features(),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::ExecuteStandardCommand { command, response } => {
                    let result = match session.require_client() {
                        Ok(c) => c.execute_standard_command(&command),
                        Err(e) => e,
                    };
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.client.is_some());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down FTP backend");
                    session.close();
                    break;
                }
            }
        }
    })
}
