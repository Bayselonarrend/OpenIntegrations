use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::{janx, JanxValue};
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};

use crate::host::HostState;

pub enum WorkerCommand {
    OpenLibrary {
        path: String,
        response: Sender<JanxValue>,
    },
    GetClassNames {
        response: Sender<JanxValue>,
    },
    CreateInstance {
        class_name: String,
        response: Sender<JanxValue>,
    },
    DestroyInstance {
        instance_id: String,
        response: Sender<JanxValue>,
    },
    GetMetadata {
        instance_ref: String,
        response: Sender<JanxValue>,
    },
    CallMethod {
        instance_ref: String,
        method: String,
        params: Vec<u8>,
        properties: Vec<u8>,
        response: Sender<JanxValue>,
    },
    GetProperty {
        instance_ref: String,
        property: String,
        response: Sender<JanxValue>,
    },
    SetProperty {
        instance_ref: String,
        property: String,
        value: Vec<u8>,
        response: Sender<JanxValue>,
    },
    GetProperties {
        instance_ref: String,
        response: Sender<JanxValue>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}

struct Session {
    host: HostState,
    logger: Option<Arc<Logger>>,
}

impl Session {
    fn new() -> Self {
        Self {
            host: HostState::new(),
            logger: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }
}

pub fn spawn_thread() -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_native_api_backend", move |rx| {
        let mut session = Session::new();

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::OpenLibrary { path, response } => {
                    session.log("OpenLibrary called");
                    let result = session.host.open_library(&path);
                    let _ = response.send(match result {
                        Ok(()) => janx_success(None, None),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::GetClassNames { response } => {
                    session.log("GetClassNames called");
                    let result = session.host.get_class_names();
                    let _ = response.send(match result {
                        Ok(classes) => janx!({
                            "result": true,
                            "classes": classes,
                        }),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::CreateInstance {
                    class_name,
                    response,
                } => {
                    session.log("CreateInstance called");
                    let result = session.host.create_instance(&class_name);
                    let _ = response.send(match result {
                        Ok(instance_id) => janx!({
                            "result": true,
                            "instance_id": instance_id,
                        }),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::DestroyInstance {
                    instance_id,
                    response,
                } => {
                    session.log("DestroyInstance called");
                    let result = session.host.destroy_instance(&instance_id);
                    let _ = response.send(match result {
                        Ok(()) => janx_success(None, None),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::GetMetadata {
                    instance_ref,
                    response,
                } => {
                    session.log("GetMetadata called");
                    let result = session.host.get_metadata(&instance_ref);
                    let _ = response.send(match result {
                        Ok(metadata) => janx_success(Some(metadata), Some("metadata")),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::CallMethod {
                    instance_ref,
                    method,
                    params,
                    properties,
                    response,
                } => {
                    session.log("CallMethod called");
                    let result =
                        session
                            .host
                            .call_method(&instance_ref, &method, &params, &properties);
                    let _ = response.send(match result {
                        Ok(data) => janx_success(Some(data), Some("data")),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::GetProperty {
                    instance_ref,
                    property,
                    response,
                } => {
                    session.log("GetProperty called");
                    let result = session.host.get_property(&instance_ref, &property);
                    let _ = response.send(match result {
                        Ok(value) => janx_success(Some(value), Some("value")),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::SetProperty {
                    instance_ref,
                    property,
                    value,
                    response,
                } => {
                    session.log("SetProperty called");
                    let result = session.host.set_property(&instance_ref, &property, &value);
                    let _ = response.send(match result {
                        Ok(()) => janx_success(None, None),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::GetProperties {
                    instance_ref,
                    response,
                } => {
                    session.log("GetProperties called");
                    let result = session.host.get_properties(&instance_ref);
                    let _ = response.send(match result {
                        Ok(properties) => janx_success(Some(properties), Some("properties")),
                        Err(error) => janx_error(error),
                    });
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::Shutdown => break,
            }
        }
    })
}
