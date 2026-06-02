mod addin;
mod backend;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Disconnect"),
    name!("Read"),
    name!("Send"),
    name!("CloseOutput"),
    name!("SetTLS"),
    name!("GetLastError"),
    name!("SetAddress"),
    name!("SetProxySettings"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[name!("Address")];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 2,
        4 => 0,
        5 => 3,
        6 => 0,
        7 => 1,
        8 => 1,
        9 => 1,
        10 => 1,
        11 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let maxsize = params[0].get_i32().unwrap_or(0);
            let marker = params[1].get_blob().unwrap_or(&empty_array);
            let timeout = params[2].get_i32().unwrap_or(0);
            Box::new(obj.receive(maxsize, marker.to_vec(), timeout))
        }
        3 => {
            let data = params[0].get_blob().unwrap_or(&empty_array);
            let timeout = params[1].get_i32().unwrap_or(0);
            Box::new(obj.send(data.to_vec(), timeout))
        }
        4 => Box::new(obj.close_output()),
        5 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        6 => Box::new(obj.last_error()),
        7 => {
            let addr = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_address(&addr))
        }
        8 => {
            let proxy = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_proxy(&proxy))
        }
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
