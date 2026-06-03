use common_core::{getset, JanxValue};

use crate::wrapper::WebSocketServer;

pub struct AddIn {
    pub(crate) server: WebSocketServer,
}

impl AddIn {
    pub fn new() -> Self {
        Self {
            server: WebSocketServer::new(),
        }
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
