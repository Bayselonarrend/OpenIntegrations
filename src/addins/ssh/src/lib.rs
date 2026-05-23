mod addin;
mod backend;
mod connection;
mod connection_response;
mod keyboard_interactive;
mod sftp_ops;
mod ssh_settings;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("SetSettings"),
    name!("SetProxy"),
    name!("Connect"),
    name!("Execute"),
    name!("Disconnect"),
    name!("GetConfiguration"),
    name!("ToSFTP"),
    name!("MakeDirectory"),
    name!("RemoveDirectory"),
    name!("ListDirectory"),
    name!("UploadFile"),
    name!("UploadData"),
    name!("RemoveFile"),
    name!("IsSFTP"),
    name!("DownloadToFile"),
    name!("DownloadToBuffer"),
    name!("RenameObject"),
    name!("GetFileInfo"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 1,
        2 => 0,
        3 => 1,
        4 => 0,
        5 => 0,
        6 => 0,
        7 => 2,
        8 => 1,
        9 => 1,
        10 => 2,
        11 => 2,
        12 => 1,
        13 => 0,
        14 => 2,
        15 => 1,
        16 => 3,
        17 => 1,
        18 => 1,
        19 => 1,
        20 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    let empty_array: [u8; 0] = [];

    match num {
        0 => {
            let json_string = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_settings(json_string))
        }
        1 => {
            let json_string = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_proxy(json_string))
        }
        2 => Box::new(obj.initialize()),
        3 => {
            let command = params[0].get_string().unwrap_or_default();
            Box::new(obj.execute(&command))
        }
        4 => Box::new(obj.disconnect()),
        5 => Box::new(obj.get_configuration()),
        6 => Box::new(obj.make_sftp()),
        7 => {
            let path = params[0].get_string().unwrap_or_default();
            let mode = params[1].get_i32().unwrap_or(0);
            Box::new(obj.make_directory(&path, mode))
        }
        8 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.remove_directory(&path))
        }
        9 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.list_directory(&path))
        }
        10 => {
            let file = params[0].get_string().unwrap_or_default();
            let path = params[1].get_string().unwrap_or_default();
            Box::new(obj.upload_file(&file, &path))
        }
        11 => {
            let data = params[0].get_blob().unwrap_or(&empty_array);
            let path = params[1].get_string().unwrap_or_default();
            Box::new(obj.upload_data(Vec::from(data), &path))
        }
        12 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.delete_file(&path))
        }
        13 => Box::new(obj.is_sftp()),
        14 => {
            let path = params[0].get_string().unwrap_or_default();
            let filepath = params[1].get_string().unwrap_or_default();
            Box::new(obj.download_to_file(&path, &filepath))
        }
        15 => {
            let path = params[0].get_string().unwrap_or_default();
            match obj.download_to_vec(&path) {
                Ok(v) => Box::new(v),
                Err(e) => Box::new(e),
            }
        }
        16 => {
            let path = params[0].get_string().unwrap_or_default();
            let new_path = params[1].get_string().unwrap_or_default();
            let overwrite = params[2].get_bool().unwrap_or(false);
            Box::new(obj.rename_object(&path, &new_path, overwrite))
        }
        17 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.get_file_info(&path))
        }
        18 => {
            let logger_config = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_logger(&logger_config))
        }
        19 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        20 => Box::new(version()),
        _ => Box::new(false),
    }
}
