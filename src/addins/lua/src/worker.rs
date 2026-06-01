use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_janx::JanxValue;
use common_logs::Logger;
use common_utils::utils::{janx_error, janx_success};

use crate::component::janx_convert::{parse_janx_args, parse_janx_payload};
use crate::component::lua_engine::LuaEngine;

pub enum WorkerCommand {
    ExecuteString {
        code: String,
        response: Sender<JanxValue>,
    },
    ExecuteFile {
        path: String,
        response: Sender<JanxValue>,
    },
    ExecuteBytecode {
        bytecode: Vec<u8>,
        response: Sender<JanxValue>,
    },
    ExecuteBytecodeFile {
        path: String,
        response: Sender<JanxValue>,
    },
    CompileToBytecode {
        code: String,
        response: Sender<Result<Vec<u8>, String>>,
    },
    CompileFileToBytecode {
        path: String,
        response: Sender<Result<Vec<u8>, String>>,
    },
    CallFunction {
        function_name: String,
        args_janx: Vec<u8>,
        response: Sender<JanxValue>,
    },
    SetGlobal {
        variable_name: String,
        value_janx: Vec<u8>,
        response: Sender<JanxValue>,
    },
    GetGlobal {
        variable_name: String,
        response: Sender<JanxValue>,
    },
    AddPackage {
        package_name: String,
        code: String,
        response: Sender<JanxValue>,
    },
    LoadPackageFromFile {
        package_name: String,
        file_path: String,
        response: Sender<JanxValue>,
    },
    GetPackages {
        response: Sender<JanxValue>,
    },
    Reset {
        response: Sender<JanxValue>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    Shutdown,
}

struct Session {
    engine: LuaEngine,
    logger: Option<Arc<Logger>>,
}

impl Session {
    fn new() -> Result<Self, String> {
        Ok(Self {
            engine: LuaEngine::new()?,
            logger: None,
        })
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }
}

fn wrap_data(result: Result<JanxValue, String>) -> JanxValue {
    match result {
        Ok(data) => janx_success(Some(data), Some("data")),
        Err(error) => janx_error(error),
    }
}

pub fn spawn_thread() -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_lyna_backend", move |rx| {
        let mut session = match Session::new() {
            Ok(session) => session,
            Err(error) => {
                eprintln!("Failed to initialize Lua backend: {}", error);
                return;
            }
        };

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::ExecuteString { code, response } => {
                    session.log("ExecuteString called");
                    let _ = response.send(wrap_data(session.engine.execute_string(&code)));
                }
                WorkerCommand::ExecuteFile { path, response } => {
                    session.log("ExecuteFile called");
                    let _ = response.send(wrap_data(session.engine.execute_file(&path)));
                }
                WorkerCommand::ExecuteBytecode { bytecode, response } => {
                    session.log("ExecuteBytecode called");
                    let _ = response.send(wrap_data(session.engine.execute_bytecode(&bytecode)));
                }
                WorkerCommand::ExecuteBytecodeFile { path, response } => {
                    session.log("ExecuteBytecodeFile called");
                    let _ = response.send(wrap_data(session.engine.execute_bytecode_file(&path)));
                }
                WorkerCommand::CompileToBytecode { code, response } => {
                    session.log("CompileToBytecode called");
                    let _ = response.send(session.engine.compile_to_bytecode(&code));
                }
                WorkerCommand::CompileFileToBytecode { path, response } => {
                    session.log("CompileFileToBytecode called");
                    let _ = response.send(session.engine.compile_file_to_bytecode(&path));
                }
                WorkerCommand::CallFunction {
                    function_name,
                    args_janx,
                    response,
                } => {
                    session.log("CallFunction called");
                    let result = parse_janx_args(&args_janx)
                        .and_then(|args| session.engine.call_function(&function_name, args))
                        .map(|value| janx_success(Some(value), Some("data")))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::SetGlobal {
                    variable_name,
                    value_janx,
                    response,
                } => {
                    session.log("SetGlobal called");
                    let result = parse_janx_payload(&value_janx)
                        .and_then(|value| session.engine.set_global(&variable_name, value))
                        .map(|_| janx_success(None, None))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::GetGlobal {
                    variable_name,
                    response,
                } => {
                    session.log("GetGlobal called");
                    let result = session
                        .engine
                        .get_global(&variable_name)
                        .map(|value| janx_success(Some(value), Some("data")))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::AddPackage {
                    package_name,
                    code,
                    response,
                } => {
                    session.log("AddPackage called");
                    let result = session
                        .engine
                        .add_package(package_name, code)
                        .map(|_| janx_success(None, None))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::LoadPackageFromFile {
                    package_name,
                    file_path,
                    response,
                } => {
                    session.log("LoadPackageFromFile called");
                    let result = session
                        .engine
                        .load_package_from_file(package_name, &file_path)
                        .map(|_| janx_success(None, None))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::GetPackages { response } => {
                    session.log("GetPackages called");
                    let _ = response.send(janx_success(
                        Some(session.engine.get_packages()),
                        Some("data"),
                    ));
                }
                WorkerCommand::Reset { response } => {
                    session.log("Reset called");
                    let result = session
                        .engine
                        .reset()
                        .map(|_| janx_success(None, None))
                        .unwrap_or_else(janx_error);
                    let _ = response.send(result);
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down Lua backend");
                    break;
                }
            }
        }
    })
}
