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
    PackToFileFromFile {
        source_path: String,
        archive_path: String,
        settings: JanxValue,
        response: Sender<JanxValue>,
    },
    PackToBufferFromFile {
        source_path: String,
        settings: JanxValue,
        response: Sender<Result<Vec<u8>, String>>,
    },
    PackToBufferFromDescription {
        description: JanxValue,
        settings: JanxValue,
        response: Sender<Result<Vec<u8>, String>>,
    },
    PackToFileFromDescription {
        description: JanxValue,
        archive_path: String,
        settings: JanxValue,
        response: Sender<JanxValue>,
    },
    UnpackToFileFromFile {
        archive_path: String,
        destination_path: String,
        password: String,
        response: Sender<JanxValue>,
    },
    UnpackToFileFromBuffer {
        archive_data: Vec<u8>,
        destination_path: String,
        password: String,
        response: Sender<JanxValue>,
    },
    UnpackToDescriptionFromBuffer {
        archive_data: Vec<u8>,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    UnpackToDescriptionFromFile {
        archive_path: String,
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
    UnpackPartialToFileFromFile {
        archive_path: String,
        destination_path: String,
        paths: JanxValue,
        password: String,
        response: Sender<JanxValue>,
    },
    UnpackPartialToFileFromBuffer {
        archive_data: Vec<u8>,
        destination_path: String,
        paths: JanxValue,
        password: String,
        response: Sender<JanxValue>,
    },
    UnpackPartialToDescriptionFromFile {
        archive_path: String,
        paths: JanxValue,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    UnpackPartialToDescriptionFromBuffer {
        archive_data: Vec<u8>,
        paths: JanxValue,
        password: String,
        response: Sender<Result<JanxValue, String>>,
    },
    ModifyFromFile {
        archive_path: String,
        additions: JanxValue,
        deletions: JanxValue,
        settings: JanxValue,
        password: String,
        response: Sender<JanxValue>,
    },
    ModifyFromBuffer {
        archive_data: Vec<u8>,
        additions: JanxValue,
        deletions: JanxValue,
        settings: JanxValue,
        password: String,
        response: Sender<Result<Vec<u8>, String>>,
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

    fn pack_to_file_from_file(
        &self,
        source_path: &str,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.log(&format!(
            "PackToFileFromFile {} -> {}",
            source_path, archive_path
        ));

        let settings = match PackSettings::from_janx(settings) {
            Ok(settings) => settings,
            Err(error) => return janx_error(error),
        };

        match archive_ops::pack_path_to_file(source_path, archive_path, &settings) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn pack_to_buffer_from_file(
        &self,
        source_path: &str,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.log(&format!("PackToBufferFromFile {}", source_path));
        let settings = PackSettings::from_janx(settings)?;
        archive_ops::pack_path_to_buffer(source_path, &settings)
    }

    fn pack_to_buffer_from_description(
        &self,
        description: &JanxValue,
        settings: &JanxValue,
    ) -> Result<Vec<u8>, String> {
        self.log("PackToBufferFromDescription");
        let parsed = ArchiveDescription::from_janx(description)?;
        let settings = PackSettings::from_janx(settings)?;
        archive_ops::pack_description_to_buffer(&parsed, &settings)
    }

    fn pack_to_file_from_description(
        &self,
        description: &JanxValue,
        archive_path: &str,
        settings: &JanxValue,
    ) -> JanxValue {
        self.log(&format!("PackToFileFromDescription -> {}", archive_path));
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

    fn unpack_to_file_from_file(
        &self,
        archive_path: &str,
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.log(&format!(
            "UnpackToFileFromFile {} -> {}",
            archive_path, destination_path
        ));

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

    fn unpack_to_file_from_buffer(
        &self,
        archive_data: &[u8],
        destination_path: &str,
        password: &str,
    ) -> JanxValue {
        self.log(&format!("UnpackToFileFromBuffer -> {}", destination_path));
        match archive_ops::unpack_buffer_to_path(archive_data, destination_path, password) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn unpack_to_description_from_buffer(
        &self,
        archive_data: &[u8],
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log("UnpackToDescriptionFromBuffer");
        archive_ops::unpack_buffer_to_description(archive_data, password)
    }

    fn unpack_to_description_from_file(
        &self,
        archive_path: &str,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log(&format!("UnpackToDescriptionFromFile {}", archive_path));
        archive_ops::unpack_file_to_description(archive_path, password)
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

    fn unpack_partial_to_file_from_file(
        &self,
        archive_path: &str,
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        self.log(&format!(
            "UnpackPartialToFileFromFile {} -> {}",
            archive_path, destination_path
        ));
        match archive_ops::unpack_partial_file_to_path(
            archive_path,
            destination_path,
            paths,
            password,
        ) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn unpack_partial_to_file_from_buffer(
        &self,
        archive_data: &[u8],
        destination_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> JanxValue {
        self.log(&format!("UnpackPartialToFileFromBuffer -> {}", destination_path));
        match archive_ops::unpack_partial_buffer_to_path(
            archive_data,
            destination_path,
            paths,
            password,
        ) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn unpack_partial_to_description_from_file(
        &self,
        archive_path: &str,
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log(&format!("UnpackPartialToDescriptionFromFile {}", archive_path));
        archive_ops::unpack_partial_file_to_description(archive_path, paths, password)
    }

    fn unpack_partial_to_description_from_buffer(
        &self,
        archive_data: &[u8],
        paths: &JanxValue,
        password: &str,
    ) -> Result<JanxValue, String> {
        self.log("UnpackPartialToDescriptionFromBuffer");
        archive_ops::unpack_partial_buffer_to_description(archive_data, paths, password)
    }

    fn modify_from_file(
        &self,
        archive_path: &str,
        additions: &JanxValue,
        deletions: &JanxValue,
        settings: &JanxValue,
        password: &str,
    ) -> JanxValue {
        self.log(&format!("ModifyFromFile {}", archive_path));
        let settings = match PackSettings::from_janx(settings) {
            Ok(settings) => settings,
            Err(error) => return janx_error(error),
        };
        match archive_ops::modify_file_inplace(
            archive_path,
            additions,
            deletions,
            &settings,
            password,
        ) {
            Ok(()) => janx_success(None, None),
            Err(error) => janx_error(error),
        }
    }

    fn modify_from_buffer(
        &self,
        archive_data: &[u8],
        additions: &JanxValue,
        deletions: &JanxValue,
        settings: &JanxValue,
        password: &str,
    ) -> Result<Vec<u8>, String> {
        self.log("ModifyFromBuffer");
        let settings = PackSettings::from_janx(settings)?;
        archive_ops::modify_buffer(archive_data, additions, deletions, &settings, password)
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_sevenz_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::PackToFileFromFile {
                    source_path,
                    archive_path,
                    settings,
                    response,
                } => {
                    let result =
                        session.pack_to_file_from_file(&source_path, &archive_path, &settings);
                    let _ = response.send(result);
                }
                WorkerCommand::PackToBufferFromFile {
                    source_path,
                    settings,
                    response,
                } => {
                    let result = session.pack_to_buffer_from_file(&source_path, &settings);
                    let _ = response.send(result);
                }
                WorkerCommand::PackToBufferFromDescription {
                    description,
                    settings,
                    response,
                } => {
                    let result =
                        session.pack_to_buffer_from_description(&description, &settings);
                    let _ = response.send(result);
                }
                WorkerCommand::PackToFileFromDescription {
                    description,
                    archive_path,
                    settings,
                    response,
                } => {
                    let result = session.pack_to_file_from_description(
                        &description,
                        &archive_path,
                        &settings,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackToFileFromFile {
                    archive_path,
                    destination_path,
                    password,
                    response,
                } => {
                    let result = session.unpack_to_file_from_file(
                        &archive_path,
                        &destination_path,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackToFileFromBuffer {
                    archive_data,
                    destination_path,
                    password,
                    response,
                } => {
                    let result = session.unpack_to_file_from_buffer(
                        &archive_data,
                        &destination_path,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackToDescriptionFromBuffer {
                    archive_data,
                    password,
                    response,
                } => {
                    let result =
                        session.unpack_to_description_from_buffer(&archive_data, &password);
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackToDescriptionFromFile {
                    archive_path,
                    password,
                    response,
                } => {
                    let result =
                        session.unpack_to_description_from_file(&archive_path, &password);
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
                WorkerCommand::UnpackPartialToFileFromFile {
                    archive_path,
                    destination_path,
                    paths,
                    password,
                    response,
                } => {
                    let result = session.unpack_partial_to_file_from_file(
                        &archive_path,
                        &destination_path,
                        &paths,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackPartialToFileFromBuffer {
                    archive_data,
                    destination_path,
                    paths,
                    password,
                    response,
                } => {
                    let result = session.unpack_partial_to_file_from_buffer(
                        &archive_data,
                        &destination_path,
                        &paths,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackPartialToDescriptionFromFile {
                    archive_path,
                    paths,
                    password,
                    response,
                } => {
                    let result = session.unpack_partial_to_description_from_file(
                        &archive_path,
                        &paths,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::UnpackPartialToDescriptionFromBuffer {
                    archive_data,
                    paths,
                    password,
                    response,
                } => {
                    let result = session.unpack_partial_to_description_from_buffer(
                        &archive_data,
                        &paths,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::ModifyFromFile {
                    archive_path,
                    additions,
                    deletions,
                    settings,
                    password,
                    response,
                } => {
                    let result = session.modify_from_file(
                        &archive_path,
                        &additions,
                        &deletions,
                        &settings,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::ModifyFromBuffer {
                    archive_data,
                    additions,
                    deletions,
                    settings,
                    password,
                    response,
                } => {
                    let result = session.modify_from_buffer(
                        &archive_data,
                        &additions,
                        &deletions,
                        &settings,
                        &password,
                    );
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("SetLogger");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutdown");
                    break;
                }
            }
        }
    })
}
