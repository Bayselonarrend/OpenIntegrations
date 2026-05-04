mod methods;

use common_core::*;
use common_utils::utils::json_success;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("SetSocketType"), // 0
    name!("Connect"),      // 1
    name!("Bind"),         // 2
    name!("Subscribe"),    // 3
    name!("Send"),         // 4
    name!("Recv"),         // 5
    name!("Close"),        // 6
    name!("GetLastError"), // 7
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 1,
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 2,
        5 => 1,
        6 => 0,
        7 => 0,
        _ => 0,
    }
}

pub fn cal_func(
    obj: &mut AddIn,
    num: usize,
    params: &mut [Variant],
) -> Box<dyn getset::ValueType> {
    let empty: [u8; 0] = [];

    match num {
        0 => {
            let t = params[0].get_string().unwrap_or_default();
            Box::new(obj.set_socket_type(&t))
        }
        1 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.stub_connect(&ep))
        }
        2 => {
            let ep = params[0].get_string().unwrap_or_default();
            Box::new(obj.stub_bind(&ep))
        }
        3 => {
            let prefix = params[0].get_string().unwrap_or_default();
            Box::new(obj.stub_subscribe(&prefix))
        }
        4 => {
            let data = params[0].get_blob().unwrap_or(&empty).to_vec();
            let flags = params[1].get_i32().unwrap_or(0);
            Box::new(obj.stub_send(data, flags))
        }
        5 => {
            let timeout_ms = params[0].get_i32().unwrap_or(0);
            Box::new(obj.stub_recv(timeout_ms))
        }
        6 => Box::new(obj.close()),
        7 => Box::new(obj.last_error.clone()),
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[
    name!("SocketType"),
    name!("Endpoint"),
];

pub struct AddIn {
    pub socket_type: String,
    pub endpoint: String,
    pub last_error: String,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            socket_type: String::new(),
            endpoint: String::new(),
            last_error: String::new(),
        }
    }

    pub fn clear_error_on_success(&mut self) {
        self.last_error.clear();
    }

    pub fn save_error_str(&mut self, msg: &str) {
        self.last_error = common_utils::utils::json_error(msg);
    }

    pub fn set_socket_type(&mut self, socket_type: &str) -> String {
        self.socket_type = socket_type.to_owned();
        self.clear_error_on_success();
        json_success()
    }

    pub fn close(&mut self) -> bool {
        self.endpoint.clear();
        self.clear_error_on_success();
        true
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.socket_type as &dyn getset::ValueType as *const _,
            1 => &self.endpoint as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        let _ = self.close();
    }
}
