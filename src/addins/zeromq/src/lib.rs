mod addin;
mod backend;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;
use crate::backend::ExchangeScheme;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("ConnectReq"),
    name!("ConnectSub"),
    name!("ConnectPush"),
    name!("ConnectPull"),
    name!("BindRep"),
    name!("BindPub"),
    name!("BindPush"),
    name!("BindPull"),
    name!("Subscribe"),
    name!("Send"),
    name!("Recv"),
    name!("Close"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0..=7 => 1, // Connect*/Bind*(endpoint)
        8 => 1,     // Subscribe(prefix)
        9 => 2,     // Send(data, timeout_ms)
        10 => 1,    // Recv(timeout_ms)
        11 => 0,    // Close
        12 => 1,    // SetLogger(logger_config)
        13 => 1,    // GetLogs(count)
        14 => 0,    // Version
        _ => 0,
    }
}

pub fn cal_func(
    obj: &mut AddIn,
    num: usize,
    params: &mut [Variant],
) -> Box<dyn getset::ValueType> {

    let empty: [u8; 0] = [];

    match num {
        0 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(ExchangeScheme::ReqRep, &ep))
        }
        1 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(ExchangeScheme::PubSub, &ep))
        }
        2 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(ExchangeScheme::Push, &ep))
        }
        3 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.connect(ExchangeScheme::Pull, &ep))
        }
        4 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(ExchangeScheme::ReqRep, port))
        }
        5 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(ExchangeScheme::PubSub, port))
        }
        6 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(ExchangeScheme::Push, port))
        }
        7 => {
            let port = params[0].get_i32().unwrap_or(0);
            Box::new(obj.bind(ExchangeScheme::Pull, port))
        }
        8 => {
            let prefix = params[0].get_string().unwrap_or_default();
            Box::new(obj.subscribe(&prefix))
        }
        9 => {
            let data = params[0].get_blob().unwrap_or(&empty).to_vec();
            let timeout_ms = params[1].get_i32().unwrap_or(-1);
            Box::new(obj.send(data, timeout_ms))
        }
        10 => {
            let timeout_ms = params[0].get_i32().unwrap_or(-1);
            Box::new(obj.recv(timeout_ms))
        }
        11 => Box::new(obj.close()),
        12 => {
            let logger_config = JanxValue::from_variant(&params[0]);
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
