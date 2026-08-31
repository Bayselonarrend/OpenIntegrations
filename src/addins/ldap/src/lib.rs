mod addin;
mod backend;
mod operations;
mod settings;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("SetTLS"),
    name!("Connect"),
    name!("Disconnect"),
    name!("Search"),
    name!("Add"),
    name!("Modify"),
    name!("Delete"),
    name!("Compare"),
    name!("GetConfiguration"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,
        1 => 4,
        2 => 0,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 1,
        7 => 1,
        8 => 0,
        9 => 1,
        10 => 1,
        11 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        1 => {
            let url = params[0].get_string().unwrap_or_default();
            let bind_dn = params[1].get_string().unwrap_or_default();
            let password = params[2].get_string().unwrap_or_default();
            let timeout = params[3].get_i32().unwrap_or(0);
            Box::new(obj.connect(&url, &bind_dn, &password, timeout))
        }
        2 => Box::new(obj.disconnect()),
        3 => {
            let search_params = JanxValue::from_variant(&params[0]);
            Box::new(obj.search(&search_params))
        }
        4 => {
            let add_params = JanxValue::from_variant(&params[0]);
            Box::new(obj.add(&add_params))
        }
        5 => {
            let modify_params = JanxValue::from_variant(&params[0]);
            Box::new(obj.modify(&modify_params))
        }
        6 => {
            let dn = params[0].get_string().unwrap_or_default();
            Box::new(obj.delete(&dn))
        }
        7 => {
            let compare_params = JanxValue::from_variant(&params[0]);
            Box::new(obj.compare(&compare_params))
        }
        8 => Box::new(obj.get_configuration()),
        9 => {
            let logger_config = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_logger(&logger_config))
        }
        10 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        11 => Box::new(version()),
        _ => Box::new(false),
    }
}
