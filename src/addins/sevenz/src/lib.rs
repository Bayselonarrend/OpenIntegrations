mod addin;
mod archive_description;
mod archive_info;
mod archive_ops;
mod archive_settings;
mod backend;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Pack"),
    name!("Unpack"),
    name!("PackToBuffer"),
    name!("UnpackFromBuffer"),
    name!("PackFromDescription"),
    name!("PackFromDescriptionToFile"),
    name!("UnpackToDescription"),
    name!("ListToDescriptionFromBuffer"),
    name!("ListToDescriptionFromFile"),
    name!("GetMetadataFromBuffer"),
    name!("GetMetadataFromFile"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,
        1 => 3,
        2 => 2,
        3 => 3,
        4 => 2,
        5 => 3,
        6 => 2,
        7 => 2,
        8 => 2,
        9 => 2,
        10 => 2,
        11 => 1,
        12 => 1,
        13 => 0,
        _ => 0,
    }
}

fn box_blob_result(result: Result<Vec<u8>, String>) -> Box<dyn getset::ValueType> {
    match result {
        Ok(data) => Box::new(data),
        Err(error) => Box::new(error),
    }
}

fn box_janx_result(result: Result<JanxValue, String>) -> Box<dyn getset::ValueType> {
    match result {
        Ok(value) => Box::new(value),
        Err(error) => Box::new(error),
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => {
            let source_path = params[0].get_string().unwrap_or_default();
            let archive_path = params[1].get_string().unwrap_or_default();
            let settings = JanxValue::from_variant(&params[2]);
            Box::new(obj.pack(&source_path, &archive_path, &settings))
        }
        1 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let destination_path = params[1].get_string().unwrap_or_default();
            let password = params[2].get_string().unwrap_or_default();
            Box::new(obj.unpack(&archive_path, &destination_path, &password))
        }
        2 => {
            let source_path = params[0].get_string().unwrap_or_default();
            let settings = JanxValue::from_variant(&params[1]);
            box_blob_result(obj.pack_to_buffer(&source_path, &settings))
        }
        3 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let destination_path = params[1].get_string().unwrap_or_default();
            let password = params[2].get_string().unwrap_or_default();
            Box::new(obj.unpack_from_buffer(&archive_data, &destination_path, &password))
        }
        4 => {
            let description = JanxValue::from_variant(&params[0]);
            let settings = JanxValue::from_variant(&params[1]);
            box_blob_result(obj.pack_from_description(&description, &settings))
        }
        5 => {
            let description = JanxValue::from_variant(&params[0]);
            let archive_path = params[1].get_string().unwrap_or_default();
            let settings = JanxValue::from_variant(&params[2]);
            Box::new(obj.pack_from_description_to_file(
                &description,
                &archive_path,
                &settings,
            ))
        }
        6 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.unpack_to_description(&archive_data, &password))
        }
        7 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.list_to_description_from_buffer(&archive_data, &password))
        }
        8 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.list_to_description_from_file(&archive_path, &password))
        }
        9 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.get_metadata_from_buffer(&archive_data, &password))
        }
        10 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.get_metadata_from_file(&archive_path, &password))
        }
        11 => {
            let logger_config = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_logger(&logger_config))
        }
        12 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        13 => Box::new(version()),
        _ => Box::new(false),
    }
}
