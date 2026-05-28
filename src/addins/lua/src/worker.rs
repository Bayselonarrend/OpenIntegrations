use std::sync::mpsc::Sender;
use std::sync::Arc;

use common_backend::SyncBackendThread;
use common_logs::Logger;
use common_utils::utils::json_error;
use serde_json::{json, Value as JsonValue};

use crate::component::lua_engine::LuaEngine;

pub enum WorkerCommand {
    ExecuteString {
        code: String,
        response: Sender<String>,
    },
    ExecuteFile {
        path: String,
        response: Sender<String>,
    },
    ExecuteBytecode {
        bytecode: Vec<u8>,
        response: Sender<String>,
    },
    ExecuteBytecodeFile {
        path: String,
        response: Sender<String>,
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
        args_json: String,
        response: Sender<String>,
    },
    SetGlobal {
        variable_name: String,
        value_json: String,
        response: Sender<String>,
    },
    GetGlobal {
        variable_name: String,
        response: Sender<String>,
    },
    AddPackage {
        package_name: String,
        code: String,
        response: Sender<String>,
    },
    LoadPackageFromFile {
        package_name: String,
        file_path: String,
        response: Sender<String>,
    },
    GetPackages {
        response: Sender<String>,
    },
    Reset {
        response: Sender<Result<(), String>>,
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

pub fn spawn_thread() -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_lyna_backend", move |rx| {
        let mut session = match Session::new() {
            Ok(session) => session,
            Err(_) => return,
        };

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::ExecuteString { code, response } => {
                    session.log("ExecuteString called");
                    let result = session
                        .engine
                        .execute_string(&code)
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::ExecuteFile { path, response } => {
                    session.log("ExecuteFile called");
                    let result = session
                        .engine
                        .execute_file(&path)
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::ExecuteBytecode { bytecode, response } => {
                    session.log("ExecuteBytecode called");
                    let result = session
                        .engine
                        .execute_bytecode(&bytecode)
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::ExecuteBytecodeFile { path, response } => {
                    session.log("ExecuteBytecodeFile called");
                    let result = session
                        .engine
                        .execute_bytecode_file(&path)
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::CompileToBytecode { code, response } => {
                    session.log("CompileToBytecode called");
                    let result = session.engine.compile_to_bytecode(&code);
                    let _ = response.send(result);
                }
                WorkerCommand::CompileFileToBytecode { path, response } => {
                    session.log("CompileFileToBytecode called");
                    let result = session.engine.compile_file_to_bytecode(&path);
                    let _ = response.send(result);
                }
                WorkerCommand::CallFunction {
                    function_name,
                    args_json,
                    response,
                } => {
                    session.log("CallFunction called");
                    let result = parse_json_array(&args_json)
                        .and_then(|args| session.engine.call_function(&function_name, args))
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::SetGlobal {
                    variable_name,
                    value_json,
                    response,
                } => {
                    session.log("SetGlobal called");
                    let result = parse_data_wrapper(&value_json)
                        .and_then(|value| session.engine.set_global(&variable_name, value))
                        .map(|_| json!({"result": true}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
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
                        .map(|value| json!({"result": true, "data": value}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
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
                        .map(|_| json!({"result": true}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
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
                        .map(|_| json!({"result": true}).to_string())
                        .unwrap_or_else(|e| json_error(&e));
                    let _ = response.send(result);
                }
                WorkerCommand::GetPackages { response } => {
                    session.log("GetPackages called");
                    let result =
                        json!({"result": true, "data": session.engine.get_packages()}).to_string();
                    let _ = response.send(result);
                }
                WorkerCommand::Reset { response } => {
                    session.log("Reset called");
                    let _ = response.send(session.engine.reset());
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

fn parse_json_array(args_json: &str) -> Result<Vec<JsonValue>, String> {
    serde_json::from_str(args_json).map_err(|e| format!("Invalid JSON arguments: {}", e))
}

fn parse_data_wrapper(value_json: &str) -> Result<JsonValue, String> {
    let value: JsonValue =
        serde_json::from_str(value_json).map_err(|e| format!("Invalid JSON value: {}", e))?;
    match value {
        JsonValue::Object(mut object) => object
            .remove("data")
            .ok_or_else(|| "Missing 'data' key in value object".to_string()),
        _ => Err("Value must be an object with 'data' key".to_string()),
    }
}
