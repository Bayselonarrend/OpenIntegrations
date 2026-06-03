mod addin;
mod backend;
mod listener;

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
    name!("ShutdownRead"),               // 6
    name!("ShutdownWrite"),              // 7
    name!("ListConnections"),            // 8
    name!("GetLogs"),                    // 9
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,  // Start(port, queue_size, logger_config)
        1 => 0,  // Stop()
        2 => 2,  // GetNextMessage(timeout_ms, max_message_size)
        3 => 3,  // GetMessage(connection_id, timeout_ms, max_message_size)
        4 => 2,  // SendMessage(connection_id, message)
        5 => 1,  // CloseConnection(connection_id)
        6 => 1,  // ShutdownRead(connection_id)
        7 => 1,  // ShutdownWrite(connection_id)
        8 => 0,  // ListConnections()
        9 => 1,  // GetLogs(count)
        10 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let port = params[0].get_i32().unwrap_or(0) as u16;
            let queue_size = params[1].get_i32().unwrap_or(10) as usize;
            let logger_config = JanxValue::from_variant(&params[2]);
            Box::new(obj.start_server(port, queue_size, &logger_config))
        }
        1 => Box::new(obj.stop_server()),
        2 => {
            let timeout_ms = params[0].get_i32().unwrap_or(1000) as u64;
            let max_message_size = params[1].get_i32().unwrap_or(8192) as usize;
            Box::new(obj.get_next_message(timeout_ms, max_message_size))
        }
        3 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let timeout_ms = params[1].get_i32().unwrap_or(1000) as u64;
            let max_message_size = params[2].get_i32().unwrap_or(8192) as usize;
            Box::new(obj.get_message_from_connection(
                &connection_id,
                timeout_ms,
                max_message_size,
            ))
        }
        4 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            let message = params[1].get_blob().unwrap_or(&empty_array);
            Box::new(obj.send_message(&connection_id, message.to_vec()))
        }
        5 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.close_connection(&connection_id))
        }
        6 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_read(&connection_id))
        }
        7 => {
            let connection_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.shutdown_write(&connection_id))
        }
        8 => Box::new(obj.get_connections_list()),
        9 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        10 => Box::new(version()),
        _ => Box::new(false),
    }
}
