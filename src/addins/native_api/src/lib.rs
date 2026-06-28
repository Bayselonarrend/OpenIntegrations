mod addin;
mod backend;
mod host;
mod worker;

use addin::AddIn;
use common_core::*;
use common_utils::utils::version;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("OpenLibrary"),
    name!("GetClassNames"),
    name!("CreateInstance"),
    name!("DestroyInstance"),
    name!("GetMetadata"),
    name!("CallMethod"),
    name!("GetProperty"),
    name!("SetProperty"),
    name!("GetProperties"),
    name!("SetLogger"),
    name!("GetLogs"),
    name!("Version"),
];

pub const PROPS: &[&[u16]] = &[];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 4,
        6 => 2,
        7 => 3,
        8 => 1,
        9 => 1,
        10 => 1,
        11 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {
    match num {
        0 => {
            let path = params[0].get_string().unwrap_or_default();
            Box::new(obj.open_library(&path))
        }
        1 => Box::new(obj.get_class_names()),
        2 => {
            let class_name = params[0].get_string().unwrap_or_default();
            Box::new(obj.create_instance(&class_name))
        }
        3 => {
            let instance_id = params[0].get_string().unwrap_or_default();
            Box::new(obj.destroy_instance(&instance_id))
        }
        4 => {
            let instance_ref = params[0].get_string().unwrap_or_default();
            Box::new(obj.get_metadata(&instance_ref))
        }
        5 => {
            let instance_ref = params[0].get_string().unwrap_or_default();
            let method = params[1].get_string().unwrap_or_default();
            let args = params[2].get_blob().unwrap_or(&[]);
            let properties = params[3].get_blob().unwrap_or(&[]);
            Box::new(obj.call_method(&instance_ref, &method, args, properties))
        }
        6 => {
            let instance_ref = params[0].get_string().unwrap_or_default();
            let property = params[1].get_string().unwrap_or_default();
            Box::new(obj.get_property(&instance_ref, &property))
        }
        7 => {
            let instance_ref = params[0].get_string().unwrap_or_default();
            let property = params[1].get_string().unwrap_or_default();
            let value = params[2].get_blob().unwrap_or(&[]);
            Box::new(obj.set_property(&instance_ref, &property, value))
        }
        8 => {
            let instance_ref = params[0].get_string().unwrap_or_default();
            Box::new(obj.get_properties(&instance_ref))
        }
        9 => {
            let logger_config = JanxValue::from_variant(&params[0]);
            Box::new(obj.set_logger(&logger_config))
        }
        10 => {
            let count = params[0].get_i32().unwrap_or(0) as usize;
            Box::new(obj.get_logs(count))
        }
        11 => Box::new(version()),
        _ => Box::new(false),
    }
}
