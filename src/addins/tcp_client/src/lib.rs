mod methods;

use std::net::{SocketAddr};
use serde_json::json;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish::{create_connection, resolve_to_socket_addr, Connection};
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};
use common_core::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

pub const METHODS: &[&[u16]] = &[
    name!("Connect"),          // 0
    name!("Disconnect"),       // 1
    name!("Read"),             // 2
    name!("Send"),             // 3
    name!("CloseOutput"),      // 4
    name!("SetTLS"),           // 5
    name!("GetLastError"),     // 6
    name!("SetAddress"),       // 7
    name!("SetProxySettings"), // 8
];

pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 2,
        4 => 0,
        5 => 3,
        6 => 0,
        7 => 1,
        8 => 1,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

    match num {
        0 => Box::new(obj.connect()),
        1 => Box::new(obj.disconnect()),
        2 => {
            let maxsize = params[0].get_i32().unwrap_or(0);
            let marker = params[1].get_blob().unwrap_or(&empty_array);
            let timeout = params[2].get_i32().unwrap_or(0);
            Box::new(obj.receive(maxsize, marker.to_vec(), timeout))
        },
        3 => {
            let data = params[0].get_blob().unwrap_or(&empty_array);
            let timeout = params[1].get_i32().unwrap_or(0);
            Box::new(obj.send(data.to_vec(), timeout))
        },
        4 => Box::new(obj.close_output()),
        5 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());
            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))
        },
        6 => Box::new(obj.last_error.clone()),

        7 => {
            let addr = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_address(&addr))
        },
        8 => {
            let json = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.set_proxy(&json))
        }
        _ => Box::new(false),
    }

}

pub const PROPS: &[&[u16]] = &[
    name!("Address")
];

pub struct AddIn {
    address_str: String,
    address: Option<SocketAddr>,
    connection: Option<Connection>,
    tls: Option<TlsSettings>,
    proxy: Option<ProxySettings>,
    last_error: String,
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            address_str: String::new(),
            address: None,
            connection: None,
            tls: None,
            proxy: None,
            last_error: String::new(),
        }
    }

    pub fn set_address(&mut self, address: &str) -> String{
        match resolve_to_socket_addr(address){
            Ok(a) => {
                self.address = Some(a);
                self.address_str = a.to_string();
                json_success()
            },
            Err(e) => {
                json_error(&e)
            }
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {
        if self.connection.is_some() {
            return json_error("TLS settings can only be set before the connection is established");
        };
        self.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, ca_cert_path));
        json!({"result": true}).to_string()
    }

    pub fn set_proxy(&mut self, data: &str) -> String{
        if self.connection.is_some() {
            return json_error("Proxy settings can only be set before the connection is established");
        };
        self.proxy = match ProxySettings::from_json(data){
            Ok(p) => Some(p),
            Err(e) => return json_error(&e)
        };

        json!({"result": true}).to_string()
    }

    pub fn connect(&mut self) -> bool {

        let addr = match self.address{
            Some(a) => a,
            None => {
                self.save_error("No address found!");
                return false;
            }
        };

        let host = addr.ip().to_string();
        let port = addr.port();

        match create_connection(&host, port, &self.proxy, &self.tls) {
            Ok(conn) => {
                self.connection = Some(conn);
                true
            },
            Err(e) => {
                self.save_error(&e.to_string());
                false
            }
        }
    }

    pub fn save_error(&mut self, e: &str){
        self.last_error = json_error(e);
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.address_str as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

impl Drop for AddIn {
    fn drop(&mut self) {
        self.disconnect();
    }
}