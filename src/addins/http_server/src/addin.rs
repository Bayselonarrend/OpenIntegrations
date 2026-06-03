use common_core::{getset, JanxValue};

use crate::wrapper::HttpServer;

pub struct AddIn {
    pub(crate) server: HttpServer,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server: HttpServer::new(),
        }
    }

    pub fn init_logger(&mut self, logger_config: &JanxValue) -> Result<(), String> {
        self.server.init_logger(logger_config)
    }

    pub fn get_logs(&self, count: usize) -> JanxValue {
        self.server.get_logs(count)
    }

    pub fn get_field_ptr(&self, _index: usize) -> *const dyn getset::ValueType {
        panic!("Index out of bounds")
    }

    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType {
        self.get_field_ptr(index) as *mut _
    }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        if self.server.is_started() {
            let _ = self.server.stop();
        }
    }
}
