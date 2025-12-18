mod ssh_settings;
mod sftp_methods;
mod ssh_methods;

use common_utils::utils::json_error;
use ssh2::{Session, Sftp};
use ssh_settings::SshConf;
use common_core::*;

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
];

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
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {
        0 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_settings(json_string))
        },
        1 => {
            let json_string = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_proxy(json_string))
        },
        2 => {
            Box::new(obj.initialize())
        }
        3 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute(&command))
        },
        4 => {
            Box::new(obj.disconnect())
        },
        5 => {
            Box::new(obj.get_configuration())
        },
        6 => {
            Box::new(obj.make_sftp())
        },
        7 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let mode = params[1].get_i32().unwrap_or(0);
            Box::new(obj.make_directory(&path, mode))
        },
        8 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.remove_directory(&path))
        },
        9 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.list_directory(&path))
        },
        10 => {
            let file = params[0].get_string().unwrap_or("".to_string());
            let path = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.upload_file(&file, &path))
        },
        11 => {
            let data = match params[0].get_blob(){
                Ok(b) => b,
                Err(e) => return Box::new(
                    json_error(format!("Blob error: {}", e.to_string())))
            };
            let path = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.upload_data(data, &path))
        },
        12 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.delete_file(&path))
        },
        13 => {
            Box::new(obj.sftp.is_some())
        },
        14 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            Box::new(obj.download_to_file(&path, &filepath))
        },
        15 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            match obj.download_to_vec(&path) {
                Ok(v) => Box::new(v),
                Err(e) => Box::new(e)
            }
        },
        16 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            let new_path = params[1].get_string().unwrap_or("".to_string());
            let overwrite = params[2].get_bool().unwrap_or(false);
            Box::new(obj.rename_object(&path, &new_path, overwrite))
        },
        17 => {
            let path = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.get_file_info(&path))
        }
        _ => Box::new(false),
    }

}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    inner: Option<Session>,
    conf: Option<SshConf>,
    sftp: Option<Sftp>
}

impl AddIn {

    pub fn new() -> Self {
        AddIn {
            inner: None,
            conf: None,
            sftp: None,
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

impl Drop for AddIn {
    fn drop(&mut self) {}
}