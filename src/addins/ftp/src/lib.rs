mod addin;
mod backend;
mod configuration;
mod ftp_client;
mod passive_establish;
mod worker;

use std::thread::sleep;
use std::time::Duration;

use addin::AddIn;
use common_core::*;
use common_utils::utils::{janx_error, version};

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("UpdateSettings"),
    name!("UpdateProxy"),
    name!("SetTLS"),
    name!("GetWelcomeMsg"),
    name!("MakeDirectory"),
    name!("RemoveDirectory"),
    name!("ListDirectory"),
    name!("UploadData"),
    name!("UploadFile"),
    name!("RemoveFile"),
    name!("GetConfiguration"),
    name!("IsTls"),
    name!("GetObjectSize"),
    name!("RenameObject"),
    name!("DownloadToFile"),
    name!("DownloadToBuffer"),
    name!("Ping"),
    name!("ExecuteCommand"),
    name!("GetCurrentDirectory"),
    name!("ChangeCurrentDirectory"),
    name!("GetFeatures"),
    name!("ExecuteStandardCommand"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 3,
        5 => 0,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 2,
        10 => 2,
        11 => 1,
        12 => 0,
        13 => 0,
        14 => 1,
        15 => 2,
        16 => 2,
        17 => 1,
        18 => 0,
        19 => 1,
        20 => 0,
        21 => 1,
        22 => 0,
        23 => 1,
        24 => 1,
        25 => 1,
        26 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let result: Box<dyn getset::ValueType> = match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let json_string = params[0].get_string().unwrap_or_default();
            Box::new(obj.update_settings(&json_string))
        }
        3 => {
            let json_string = params[0].get_string().unwrap_or_default();
            Box::new(obj.update_proxy(&json_string))
        }
        4 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or_default();
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        }
        5 => Box::new(obj.get_welcome_msg()),
        6 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.make_directory(&path))
        }
        7 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.remove_directory(&path))
        }
        8 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.list_directory(&path))
        }
        9 => {
            let data = match params[0].get_blob() {
                Ok(b) => b,
                Err(e) => {
                    return Box::new(janx_error(format!("Blob error: {}", e)));
                }
            };
            let path = params[1].get_string().unwrap_or_default();
            Box::new(obj.upload_data(&path, data.to_vec()))
        }
        10 => {
            let filepath = params[0].get_string().unwrap_or_default();
            let path = params[1].get_string().unwrap_or_default();
            Box::new(obj.upload_file(&path, &filepath))
        }
        11 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.remove_file(&path))
        }
        12 => Box::new(obj.get_configurations()),
        13 => Box::new(obj.is_tls()),
        14 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.object_size(&path))
        }
        15 => {
            let path = params[0].get_string().unwrap_or_default();
            let new_path = params[1].get_string().unwrap_or_default();
            Box::new(obj.rename_object(&path, &new_path))
        }
        16 => {
            let path = params[0].get_string().unwrap_or_default();
            let filepath = params[1].get_string().unwrap_or_default();
            Box::new(obj.download_to_file(&path, &filepath))
        }
        17 => {
            let path = params[0].get_string().unwrap_or_default();
            match obj.download_to_buffer(&path) {
                Ok(v) => Box::new(v),
                Err(e) => Box::new(e),
            }
        }
        18 => Box::new(obj.ping()),
        19 => {
            let command = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_command(&command))
        }
        20 => Box::new(obj.get_current_directory()),
        21 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.change_current_directory(&path))
        }
        22 => Box::new(obj.get_features()),
        23 => {
            let command = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute_standard_command(&command))
        }
        24 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        25 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        26 => Box::new(version()),
        _ => Box::new(false),
    };

    sleep(Duration::from_millis(150));
    result
}

pub const PROPS: &[&[u16]] = &[];
