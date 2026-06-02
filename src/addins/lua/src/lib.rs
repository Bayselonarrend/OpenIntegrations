mod addin;
mod backend;
mod component;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("ExecuteString"),
    name!("ExecuteFile"),
    name!("ExecuteBytecode"),
    name!("ExecuteBytecodeFile"),
    name!("CompileToBytecode"),
    name!("CompileFileToBytecode"),
    name!("CallFunction"),
    name!("SetGlobal"),
    name!("GetGlobal"),
    name!("AddPackage"),
    name!("LoadPackageFromFile"),
    name!("GetPackages"),
    name!("Reset"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 2,
        7 => 2,
        8 => 1,
        9 => 2,
        10 => 2,
        11 => 0,
        12 => 0,
        13 => 1,
        14 => 1,
        15 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => {
            let code = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_string(&code))
        }
        1 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_file(&path))
        }
        2 => {
            let bytecode = params[0].get_blob().unwrap_or(&[]).to_vec();
            Box::new(obj.execute_bytecode(bytecode))
        }
        3 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_bytecode_file(&path))
        }
        4 => {
            let code = params[0].get_string().unwrap_or_default();
            match obj.compile_to_bytecode(&code) {
                Ok(bytecode) => Box::new(bytecode),
                Err(error) => Box::new(error),
            }
        }
        5 => {
            let path = params[0].get_string().unwrap_or_default();
            match obj.compile_file_to_bytecode(&path) {
                Ok(bytecode) => Box::new(bytecode),
                Err(error) => Box::new(error),
            }
        }
        6 => {
            let function_name = params[0].get_string().unwrap_or_default();
            let args = params[1].get_blob().unwrap_or(&[]).to_vec();
            Box::new(obj.call_function(&function_name, args))
        }
        7 => {
            let variable_name = params[0].get_string().unwrap_or_default();
            let value = params[1].get_blob().unwrap_or(&[]).to_vec();
            Box::new(obj.set_global(&variable_name, value))
        }
        8 => {
            let variable_name = params[0].get_string().unwrap_or_default();
            Box::new(obj.get_global(&variable_name))
        }
        9 => {
            let package_name = params[0].get_string().unwrap_or_default();
            let code = params[1].get_string().unwrap_or_default();
            Box::new(obj.add_package(package_name, code))
        }
        10 => {
            let package_name = params[0].get_string().unwrap_or_default();
            let file_path = params[1].get_string().unwrap_or_default();
            Box::new(obj.load_package_from_file(package_name, file_path))
        }
        11 => Box::new(obj.get_packages()),
        12 => Box::new(obj.reset()),
        13 => {
            let logger_config = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_logger(&logger_config))
        }
        14 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        15 => Box::new(version()),
        _ => Box::new(false),
    }
}
