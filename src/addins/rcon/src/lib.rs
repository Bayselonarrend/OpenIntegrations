mod methods;
mod settings;

use common_utils::utils::json_error;
use rcon_client::RCONClient;
use settings::ConnectionSettings;
use common_core::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),     // 0
    name!("Command"),     // 1
    name!("GetSettings")  // 2
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 4,
        1 => 1,
        2 => 0,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {
        0 => {
            let url = params[0].get_string().unwrap_or("".to_string());
            let password = params[1].get_string().unwrap_or("".to_string());
            let read_timeout = params[2].get_i32().unwrap_or(0);
            let write_timeout = params[3].get_i32().unwrap_or(0);

            obj.settings = Some(ConnectionSettings::new(&url, &password, read_timeout, write_timeout));
            Box::new(obj.connect())
        },
        1 => {
            let command = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute_command(&command))
        },
        2 => {
            Box::new(match &obj.settings{
                Some(settings) =>  settings.get_settings(),
                None => json_error("No connection settings found")
            })
        }
        _ => Box::new(false), // Неверный номер команды
    }
}

pub const PROPS: &[&[u16]] = &[];

pub struct AddIn {
    client: Option<RCONClient>,
    settings: Option<ConnectionSettings>
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            client: None,
            settings: None
        }
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

