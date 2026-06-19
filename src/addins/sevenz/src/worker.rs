use std::path::Path;
use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};
use sevenz_rust2::{
    compress_to_path, compress_to_path_encrypted, decompress_file, decompress_file_with_password,
};

use crate::archive_description::ArchiveDescription;
use crate::archive_ops;

pub enum WorkerCommand {
    Pack {
        source_path: String,
        archive_path: String,
        password: String,
        response: Sender<JanxValue>,
    },
    Unpack {
        archive_path: String,
        destination_path: String,
        password: String,
        response: Sender<JanxValue>,
    },
    PackToBuffer {
        source_path: String,
        password: String,
        response: Sender<Result<Vec<u8>, String>>,
    },
    UnpackFromBuffer {
        archive_data: Vec<u8>,
        destination_path: String,
        password: String,
        response: Sender<JanxValue>,
    },
    PackFromDescription {
        description: JanxValue,
        response: Sender<Result<Vec<u8>, String>>,
    },
    PackFromDescriptionToFile {
        description: JanxValue,
        archive_path: String,
        response: Sender<JanxValue>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}

struct Session {
    logger: Option<Arc<Logger>>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self { logger }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn pack(&self, source_path: &str, archive_path: &str, password: &str) -> JanxValue {
        self.log(&format!("Pack {} -> {}", source_path, archive_path));

        if !Path::new(source_path).exists() {
            return janx_error(format!("Source path not found: {}", source_path));
        }

        let result = if password.is_empty() {
            compress_to_path(source_path, archive_path)
        } else {
            compress_to_path_encrypted(source_path, archive_path, password.into())
        };

        match result {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error.to_string()),
        }
    }

    fn unpack(&self, archive_path: &str, destination_path: &str, password: &str) -> JanxValue {
        self.log(&format!("Unpack {} -> {}", archive_path, destination_path));

        if !Path::new(archive_path).exists() {
            return janx_error(format!("Archive not found: {}", archive_path));
        }

        let result = if password.is_empty() {
            decompress_file(archive_path, destination_path)
        } else {
            decompress_file_with_password(archive_path, destination_path, password.into())
        };

        match result {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error.to_string()),
        }
    }

    fn pack_to_buffer(&self, source_path: &str, password: &str) -> Result<Vec<u8>, String> {
        self.log(&format!("PackToBuffer {}", source_path));
        archive_ops::pack_path_to_buffer(source_path, password)
    }

    fn unpack_from_buffer(
        &self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.log(&format!("UnpackFromBuffer -> {}", destination_path));
        match archive_ops::unpack_buffer_to_path(archive_data, destination_path, password) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn pack_from_description(&self, description: &JanxValue) -> Result<Vec<u8>, String> {
        self.log("PackFromDescription");
        let parsed = ArchiveDescription::from_janx(description)?;
        archive_ops::pack_description_to_buffer(&parsed)
    }

    fn pack_from_description_to_file(
        &self,
        description: &JanxValue,
        archive_path: &str,
    ) -> JanxValue {
        self.log(&format!("PackFromDescriptionToFile -> {}", archive_path));
        match ArchiveDescription::from_janx(description) {
            Ok(parsed) => match archive_ops::pack_description_to_file(&parsed, archive_path) {
                Ok(()) => janx_success(None, None),
                Err(error) => janx_error(error),
            },
            Err(error) => janx_error(error),
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_sevenz_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Pack {
                    source_path,
                    archive_path,
                    password,
                    response,
                } => {
                    let result = session.pack(&source_path, &archive_path, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::Unpack {
                    archive_path,
                    destination_path,
                    password,
                    response,
                } => {
                    let result = session.unpack(&archive_path, &destination_path, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::PackToBuffer {
                    source_path,
                    password,
                    response,
                } => {
                    let result = session.pack_to_buffer(&source_path, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackFromBuffer {
                    archive_data,
                    destination_path,
                    password,
                    response,
                } => {
                    let result =
                        session.unpack_from_buffer(&archive_data, &destination_path, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::PackFromDescription { description, response } => {
                    let result = session.pack_from_description(&description);
                    let _ = response.send(result);
                }
                WorkerCommand::PackFromDescriptionToFile {
                    description,
                    archive_path,
                    response,
                } => {
                    let result = session.pack_from_description_to_file(&description, &archive_path);
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down SevenZ backend");
                    break;
                }
            }
        }
    })
}
