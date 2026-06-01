mod addin;
mod backend;
mod query;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::{janx_error, janx_success, version};

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS"),
    name!("InitQuery"),
    name!("GetResultAsFile"),
    name!("GetResultAsString"),
    name!("SetParamsFromFile"),
    name!("SetParamsFromString"),
    name!("RemoveQueryDataset"),
    name!("BatchQuery"),
    name!("GetTLSSettings"),
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
        3 => 3,
        4 => 3,
        5 => 2,
        6 => 1,
        7 => 2,
        8 => 2,
        9 => 1,
        10 => 2,
        11 => 0,
        12 => 1,
        13 => 1,
        14 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let key = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_query(&key))
        }
        3 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        4 => {
            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);
            let from_file = params[2].get_bool().unwrap_or(false);

            let result = match obj.datasets.init_query(&text, force, from_file) {
                Ok(key) => janx!({"result": true, "key": key}),
                Err(e) => janx_error(&e),
            };
            Box::new(result)
        }
        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.result_as_file(&key, &filepath) {
                Ok(_) => janx_success(None, None),
                Err(e) => janx_error(&e),
            };
            Box::new(result)
        }
        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.get_result(&key))
        }
        7 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.params_from_file(&key, &filepath) {
                Ok(_) => janx_success(None, None),
                Err(e) => janx_error(&e),
            };
            Box::new(result)
        }
        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let janx_params = JanxValue::from_variant(&params[1]);
            let result = match obj.datasets.set_params(&key, janx_params) {
                Ok(_) => janx_success(None, None),
                Err(e) => janx_error(&e),
            };
            Box::new(result)
        }
        9 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(janx_success(None, None))
        }
        10 => {
            let input = params[0].get_string().unwrap_or("".to_string());
            let output = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.batch_query_init(&input, &output) {
                Ok(_) => janx_success(None, None),
                Err(e) => janx_error(&e),
            };
            Box::new(result)
        }
        11 => Box::new(obj.get_tls_settings()),
        12 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        13 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        14 => Box::new(version()),
        _ => Box::new(false),
    }
}
