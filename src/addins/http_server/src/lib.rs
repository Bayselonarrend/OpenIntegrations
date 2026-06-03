mod addin;
mod backend;
mod server;
mod wrapper;

use addin::AddIn;
use common_core::*;
use common_utils::utils::{janx_error, version};

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                      // 0
    name!("Stop"),                       // 1
    name!("GetNextMessage"),             // 2
    name!("GetMessage"),                 // 3
    name!("SendMessage"),                // 4
    name!("ListConnections"),            // 5
    name!("GetLogs"),                    // 6
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, config, logger_config)
        1 => 0,  // Stop()
        2 => 1,  // GetNextMessage(timeout_ms)
        3 => 1,  // GetMessage(request_id)
        4 => 3,  // SendMessage(request_id, status_code, body)
        5 => 0,  // ListConnections()
        6 => 1,  // GetLogs(count)
        7 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let port = params[0].get_i32().unwrap_or(8080) as u16;
            let config = JanxValue::from_variant(&params[1]);
            let logger_config = JanxValue::from_variant(&params[2]);

            if let Err(e) = obj.init_logger(&logger_config) {
                return Box::new(janx_error(e));
            }
            Box::new(obj.server.start(port, &config))
        }
        1 => Box::new(obj.server.stop()),
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.server.handle_request(timeout_ms))
        }
        3 => {
            let request_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.server.handle_request_by_id(&request_id))
        }
        4 => {
            let request_id = params[0].get_string().unwrap_or_default();
            let status_code = params[1].get_i32().unwrap_or(200) as u16;
            let body = params[2].get_blob().unwrap_or(&empty_array);
            Box::new(obj.server.send_response(&request_id, status_code, body.to_vec()))
        }
        5 => Box::new(obj.server.get_pending_requests()),
        6 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        7 => Box::new(version()),
        _ => Box::new(false),
    }
}
