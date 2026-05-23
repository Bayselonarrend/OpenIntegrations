mod addin;
mod backend;
mod settings;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Command"),
    name!("GetSettings"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 4,
        1 => 1,
        2 => 0,
        3 => 1,
        4 => 1,
        5 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => {
            let url = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            let read_timeout = params[2].get_i32().unwrap_or(0);
            let write_timeout = params[3].get_i32().unwrap_or(0);
            Box::new(obj.connect(&url, &password, read_timeout, write_timeout))
        }
        1 => {
            let command = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_command(&command))
        }
        2 => Box::new(obj.get_settings()),
        3 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        4 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        5 => Box::new(version()),
        _ => Box::new(false),
    }
}
