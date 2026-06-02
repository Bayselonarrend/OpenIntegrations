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
        5 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let execute_params = JanxValue::from_variant(&params[0]);
            Box::new(obj.execute(execute_params))
        }
        3 => {
            let logger_config = JanxValue::from_variant(&params[0]);
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
