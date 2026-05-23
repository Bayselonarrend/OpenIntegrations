mod addin;
mod backend;
mod bson;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Disconnect"),
    name!("Execute"),
    name!("LoadBinaryToVault"),
    name!("LoadFileToVault"),
    name!("LoadBase64ToVault"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[name!("ConnectionString")];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 1,
        7 => 1,
        8 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let json_string = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute(&json_string))
        }
        3 => {
            let binary = params[0].get_blob().unwrap_or(&empty_array);
            Box::new(obj.load_binary_to_vault(Vec::from(binary)))
        }
        4 => {
            let file = params[0].get_string().unwrap_or_default();
            Box::new(obj.load_file_to_vault(file))
        }
        5 => {
            let base64 = params[0].get_string().unwrap_or_default();
            Box::new(obj.load_base64_to_vault(base64))
        }
        6 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        7 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        8 => Box::new(version()),
        _ => Box::new(false),
    }
}
