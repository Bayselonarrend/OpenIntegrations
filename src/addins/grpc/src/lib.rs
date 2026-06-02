mod addin;
mod ack_stream;
mod backend;
mod client_state;
mod connection;
mod grpc_caller;
mod identity_codec;
mod introspection;
mod message_converter;
mod proto_loader;
mod stream_manager;
mod streaming_caller;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Disconnect"),
    name!("Call"),
    name!("LoadProto"),
    name!("SetMetadata"),
    name!("SetTLS"),
    name!("ListServices"),
    name!("ListMethods"),
    name!("GetMethodInfo"),
    name!("StartServerStream"),
    name!("StartClientStream"),
    name!("StartBidiStream"),
    name!("SendMessage"),
    name!("GetNextMessage"),
    name!("FinishSending"),
    name!("CloseStream"),
    name!("CompileProtos"),
    name!("GetSettings"),
    name!("StoreSettings"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[name!("ServerAddress")];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,  // Connect
        1 => 0,  // Disconnect
        2 => 1,  // Call
        3 => 2,  // LoadProto
        4 => 1,  // SetMetadata
        5 => 3,  // SetTLS
        6 => 0,  // ListServices
        7 => 1,  // ListMethods
        8 => 2,  // GetMethodInfo
        9 => 1,  // StartServerStream
        10 => 1, // StartClientStream
        11 => 1, // StartBidiStream
        12 => 2, // SendMessage
        13 => 1, // GetNextMessage
        14 => 1, // FinishSending
        15 => 1, // CloseStream
        16 => 0, // CompileProtos
        17 => 0, // GetSettings
        18 => 1, // StoreSettings
        19 => 1, // SetLogger
        20 => 1, // GetLogs
        21 => 0, // Version
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => Box::new(obj.call(&JanxValue::from_variant(&params[0]))),
        3 => {
            let filename = params[0].get_string().unwrap_or("main.proto".to_string());
            let proto_content = params[1].get_string().unwrap_or_default();
            Box::new(obj.load_proto(&filename, &proto_content))
        }
        4 => {
            let metadata = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_metadata(&metadata))
        }
        5 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        6 => Box::new(obj.list_services()),
        7 => {
            let service_name = params[0].get_string().unwrap_or_default();
            Box::new(obj.list_methods(&service_name))
        }
        8 => {
            let service_name = params[0].get_string().unwrap_or_default();
            let method_name = params[1].get_string().unwrap_or_default();
            Box::new(obj.get_method_info(&service_name, &method_name))
        }
        9 => Box::new(obj.call_server_stream(&JanxValue::from_variant(&params[0]))),
        10 => Box::new(obj.start_client_stream(&JanxValue::from_variant(&params[0]))),
        11 => Box::new(obj.start_bidi_stream(&JanxValue::from_variant(&params[0]))),
        12 => {
            let stream_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.send_message(
                &stream_id,
                &JanxValue::from_variant(&params[1]),
            ))
        }
        13 => {
            let stream_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.get_next_message(&stream_id))
        }
        14 => {
            let stream_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.finish_sending(&stream_id))
        }
        15 => {
            let stream_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.close_stream(&stream_id))
        }
        16 => Box::new(obj.compile_protos()),
        17 => Box::new(obj.get_settings()),
        18 => {
            let settings = JanxValue::from_variant(&params[0]);
            Box::new(obj.store_settings(&settings))
        }
        19 => {
            let logger_config = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_logger(&logger_config))
        }
        20 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        21 => Box::new(version()),
        _ => Box::new(false),
    }
}
