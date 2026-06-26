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
    name!("PackToFileFromFile"),
    name!("PackToBufferFromFile"),
    name!("PackToBufferFromDescription"),
    name!("PackToFileFromDescription"),
    name!("UnpackToFileFromFile"),
    name!("UnpackToFileFromBuffer"),
    name!("UnpackToDescriptionFromBuffer"),
    name!("UnpackToDescriptionFromFile"),
    name!("ListToDescriptionFromBuffer"),
    name!("ListToDescriptionFromFile"),
    name!("GetMetadataFromBuffer"),
    name!("GetMetadataFromFile"),
    name!("UnpackPartialToFileFromFile"),
    name!("UnpackPartialToFileFromBuffer"),
    name!("UnpackPartialToDescriptionFromFile"),
    name!("UnpackPartialToDescriptionFromBuffer"),
    name!("ModifyFromFile"),
    name!("ModifyFromBuffer"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 3,
        1 => 2,
        2 => 2,
        3 => 3,
        4 => 3,
        5 => 3,
        6 => 2,
        7 => 2,
        8 => 2,
        9 => 2,
        10 => 2,
        11 => 2,
        12 => 4,
        13 => 4,
        14 => 3,
        15 => 3,
        16 => 5,
        17 => 5,
        18 => 1,
        19 => 1,
        20 => 0,
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
            Box::new(obj.pack_to_file_from_file(
                &source_path,
                &archive_path,
                &settings,
            ))
        }
        1 => {
            let source_path = params[0].get_string().unwrap_or_default();
            let settings = JanxValue::from_variant(&params[1]);
            box_blob_result(obj.pack_to_buffer_from_file(&source_path, &settings))
        }
        2 => {
            let description = JanxValue::from_variant(&params[0]);
            let settings = JanxValue::from_variant(&params[1]);
            box_blob_result(obj.pack_to_buffer_from_description(&description, &settings))
        }
        3 => {
            let description = JanxValue::from_variant(&params[0]);
            let archive_path = params[1].get_string().unwrap_or_default();
            let settings = JanxValue::from_variant(&params[2]);
            Box::new(obj.pack_to_file_from_description(
                &description,
                &archive_path,
                &settings,
            ))
        }
        4 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let destination_path = params[1].get_string().unwrap_or_default();
            let password = params[2].get_string().unwrap_or_default();
            Box::new(obj.unpack_to_file_from_file(
                &archive_path,
                &destination_path,
                &password,
            ))
        }
        5 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let destination_path = params[1].get_string().unwrap_or_default();
            let password = params[2].get_string().unwrap_or_default();
            Box::new(obj.unpack_to_file_from_buffer(
                &archive_data,
                &destination_path,
                &password,
            ))
        }
        6 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.unpack_to_description_from_buffer(&archive_data, &password))
        }
        7 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.unpack_to_description_from_file(&archive_path, &password))
        }
        8 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.list_to_description_from_buffer(&archive_data, &password))
        }
        9 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.list_to_description_from_file(&archive_path, &password))
        }
        10 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.get_metadata_from_buffer(&archive_data, &password))
        }
        11 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let password = params[1].get_string().unwrap_or_default();
            box_janx_result(obj.get_metadata_from_file(&archive_path, &password))
        }
        12 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let destination_path = params[1].get_string().unwrap_or_default();
            let paths = JanxValue::from_variant(&params[2]);
            let password = params[3].get_string().unwrap_or_default();
            Box::new(obj.unpack_partial_to_file_from_file(
                &archive_path,
                &destination_path,
                &paths,
                &password,
            ))
        }
        13 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let destination_path = params[1].get_string().unwrap_or_default();
            let paths = JanxValue::from_variant(&params[2]);
            let password = params[3].get_string().unwrap_or_default();
            Box::new(obj.unpack_partial_to_file_from_buffer(
                &archive_data,
                &destination_path,
                &paths,
                &password,
            ))
        }
        14 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let paths = JanxValue::from_variant(&params[1]);
            let password = params[2].get_string().unwrap_or_default();
            box_janx_result(obj.unpack_partial_to_description_from_file(
                &archive_path,
                &paths,
                &password,
            ))
        }
        15 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let paths = JanxValue::from_variant(&params[1]);
            let password = params[2].get_string().unwrap_or_default();
            box_janx_result(obj.unpack_partial_to_description_from_buffer(
                &archive_data,
                &paths,
                &password,
            ))
        }
        16 => {
            let archive_path = params[0].get_string().unwrap_or_default();
            let additions = JanxValue::from_variant(&params[1]);
            let deletions = JanxValue::from_variant(&params[2]);
            let settings = JanxValue::from_variant(&params[3]);
            let password = params[4].get_string().unwrap_or_default();
            Box::new(obj.modify_from_file(
                &archive_path,
                &additions,
                &deletions,
                &settings,
                &password,
            ))
        }
        17 => {
            let archive_data = params[0].get_blob().unwrap_or_default().to_vec();
            let additions = JanxValue::from_variant(&params[1]);
            let deletions = JanxValue::from_variant(&params[2]);
            let settings = JanxValue::from_variant(&params[3]);
            let password = params[4].get_string().unwrap_or_default();
            box_blob_result(obj.modify_from_buffer(
                &archive_data,
                &additions,
                &deletions,
                &settings,
                &password,
            ))
        }
        18 => {
            let logger_config = JanxValue::from_variant(&params[0]);
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
