mod addin;
mod backend;
mod server;
mod wrapper;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Start"),                      // 0
    name!("Stop"),                       // 1
    name!("GetNextMessage"),             // 2
    name!("GetMessage"),                 // 3
    name!("SendMessage"),                // 4
    name!("CloseConnection"),            // 5
    name!("ListConnections"),            // 6
    name!("GetLogs"),                    // 7
    name!("SendText"),                   // 8
    name!("SendPing"),                   // 9
    name!("SendPong"),                   // 10
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, config_json, logger_config)
        1 => 0,  // Stop()
        2 => 1,  // GetNextMessage(timeout_ms)
        3 => 2,  // GetMessage(connection_id, timeout_ms)
        4 => 2,  // SendMessage(connection_id, message)
        5 => 2,  // CloseConnection(connection_id, remove_from_list)
        6 => 0,  // ListConnections()
        7 => 1,  // GetLogs(count)
        8 => 2,  // SendText(connection_id, text)
        9 => 2,  // SendPing(connection_id, payload)
        10 => 2, // SendPong(connection_id, payload)
        11 => 0,
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
            Box::new(obj.server.start(port, &config, &logger_config))
        }
        1 => Box::new(obj.server.stop()),
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.server.get_next_message(timeout_ms))
        }
        3 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let timeout_ms = params[1].get_i32().unwrap_or(1000) as u64;
            Box::new(obj.server.get_message(&connection_id, timeout_ms))
        }
        4 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.server.send_message(&connection_id, message.to_vec()))
        }
        5 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let remove_from_list = params[1].get_bool().unwrap_or(false);
            Box::new(obj.server.close_connection(&connection_id, remove_from_list))
        }
        6 => Box::new(obj.server.get_connections_list()),
        7 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        8 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let text = params[1].get_string().unwrap_or_default();
            Box::new(obj.server.send_text(&connection_id, &text))
        }
        9 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let payload = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.server.send_ping(&connection_id, payload.to_vec()))
        }
        10 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let payload = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.server.send_pong(&connection_id, payload.to_vec()))
        }
        11 => Box::new(version()),
        _ => Box::new(false),
    }
}
