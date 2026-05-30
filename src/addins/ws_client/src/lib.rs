mod addin;
mod backend;
mod client;
mod connection;
mod receiving;
mod sending;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("SendText"),
    name!("SendBinary"),
    name!("ReceiveMessage"),
    name!("SendPing"),
    name!("SendPong"),
    name!("Close"),
    name!("SetHeaders"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("SetTLS"),
    name!("SetProxySettings"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 0,
        5 => 0,
        6 => 2,
        7 => 1,
        8 => 1,
        9 => 1,
        10 => 3,
        11 => 1,
        12 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let url = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(&url))
        }
        1 => {
            let text = params[0].get_string().unwrap_or_default();
            Box::new(obj.send_text(&text))
        }
        2 => {
            let data = params[0].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_binary(data.to_vec()))
        }
        3 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.receive_message(timeout_ms))
        }
        4 => Box::new(obj.send_ping()),
        5 => Box::new(obj.send_pong()),
        6 => {
            let code = params[0].get_i32().unwrap_or(1000) as u16;
            let reason = params[1].get_string().unwrap_or_default();
            Box::new(obj.close(code, &reason))
        }
        7 => {
            let headers_json = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_headers(&headers_json))
        }
        8 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        9 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        10 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        11 => {
            let proxy_json = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_proxy(&proxy_json))
        }
        12 => Box::new(version()),
        _ => Box::new(false),
    }
}
