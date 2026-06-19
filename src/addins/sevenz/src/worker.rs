use std::path::Path;
use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};
use sevenz_rust2::{decompress_file, decompress_file_with_password};

use crate::archive_description::ArchiveDescription;
use crate::archive_info;
use crate::archive_ops;
use crate::archive_settings::PackSettings;

pub enum WorkerCommand {
    Pack {
        source_path: String,
        archive_path: String,
        settings: JanxValue,
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
        settings: JanxValue,
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
        settings: JanxValue,
        response: Sender<Result<Vec<u8>, String>>,
    },
    PackFromDescriptionToFile {
        description: JanxValue,
        archive_path: String,
        settings: JanxValue,
        response: Sender<JanxValue>,
    },
    UnpackToDescription {
        archive_data: Vec<u8>,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    ListToDescriptionFromBuffer {
        archive_data: Vec<u8>,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    ListToDescriptionFromFile {
        archive_path: String,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    GetMetadataFromBuffer {
        archive_data: Vec<u8>,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    GetMetadataFromFile {
        archive_path: String,
        password: String,
        response: Sender<Result<JanxValue, String>>,
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

    fn pack(
        &self,
        source_path: &str,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.log(&format!("Pack {} -> {}", source_path, archive_path));

        let settings = match PackSettings::from_janx(settings) {
            Ok(settings) => settings,
            Err(error) => return janx_error(error),
        };

        match archive_ops::pack_path_to_file(source_path, archive_path, &settings) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
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

    fn pack_to_buffer(&self, source_path: &str, settings: &JanxValue) -> Result<Vec<u8>, String> {
        self.log(&format!("PackToBuffer {}", source_path));
        let settings = PackSettings::from_janx(settings)?;
        archive_ops::pack_path_to_buffer(source_path, &settings)
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

    fn pack_from_description(
        &self,
        description: &JanxValue,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.log("PackFromDescription");
        let parsed = ArchiveDescription::from_janx(description)?;
        let settings = PackSettings::from_janx(settings)?;
        archive_ops::pack_description_to_buffer(&parsed, &settings)
    }

    fn pack_from_description_to_file(
        &self,
        description: &JanxValue,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.log(&format!("PackFromDescriptionToFile -> {}", archive_path));
        match ArchiveDescription::from_janx(description) {
            Ok(parsed) => match PackSettings::from_janx(settings) {
                Ok(settings) => {
                    match archive_ops::pack_description_to_file(&parsed, archive_path, &settings) {
                        Ok(()) => janx_success(None, None),
                        Err(error) => janx_error(error),
                    }
                }
                Err(error) => janx_error(error),
            },
            Err(error) => janx_error(error),
        }
    }

    fn unpack_to_description(
        &self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log("UnpackToDescription");
        archive_ops::unpack_buffer_to_description(archive_data, password)
    }

    fn list_to_description_from_buffer(
        &self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log("ListToDescriptionFromBuffer");
        archive_info::list_from_buffer(archive_data, password)
    }

    fn list_to_description_from_file(
        &self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log(&format!("ListToDescriptionFromFile {}", archive_path));
        archive_info::list_from_file(archive_path, password)
    }

    fn get_metadata_from_buffer(
        &self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log("GetMetadataFromBuffer");
        archive_info::metadata_from_buffer(archive_data, password)
    }

    fn get_metadata_from_file(
        &self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log(&format!("GetMetadataFromFile {}", archive_path));
        archive_info::metadata_from_file(archive_path, password)
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
                    settings,
                    response,
                } => {
                    let result = session.pack(&source_path, &archive_path, &settings);
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
                    settings,
                    response,
                } => {
                    let result = session.pack_to_buffer(&source_path, &settings);
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
                WorkerCommand::PackFromDescription {
                    description,
                    settings,
                    response,
                } => {
                    let result = session.pack_from_description(&description, &settings);
                    let _ = response.send(result);
                }
                WorkerCommand::PackFromDescriptionToFile {
                    description,
                    archive_path,
                    settings,
                    response,
                } => {
                    let result =
                        session.pack_from_description_to_file(&description, &archive_path, &settings);
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackToDescription {
                    archive_data,
                    password,
                    response,
                } => {
                    let result = session.unpack_to_description(&archive_data, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::ListToDescriptionFromBuffer {
                    archive_data,
                    password,
                    response,
                } => {
                    let result = session.list_to_description_from_buffer(&archive_data, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::ListToDescriptionFromFile {
                    archive_path,
                    password,
                    response,
                } => {
                    let result = session.list_to_description_from_file(&archive_path, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::GetMetadataFromBuffer {
                    archive_data,
                    password,
                    response,
                } => {
                    let result = session.get_metadata_from_buffer(&archive_data, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::GetMetadataFromFile {
                    archive_path,
                    password,
                    response,
                } => {
                    let result = session.get_metadata_from_file(&archive_path, &password);
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
