mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use std::net::TcpStream;
use crate::component::methods::disconnect;
use native_tls::{TlsStream};
use serde_json::json;
use std::fs::File;
use std::io::Read;

pub enum Connection {
    Plain(TcpStream),
    Tls(TlsStream<TcpStream>),
}

// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),     // 0
    name!("Disconnect"),  // 1
    name!("Read"),        // 2
    name!("Send"),        // 3
    name!("CloseOutput"), // 4
    name!("SetTLS"),      // 5
    name!("GetLastError"),// 6
    name!("SetAddress"),  // 7
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 2,
        4 => 0,
        5 => 3,
        6 => 0,
        7 => 2,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

    match num {

        0 => Box::new(obj.connect()),
        1 => {
            disconnect(obj);
            Box::new(true) // Возвращаем true для обозначения успешного выполнения
        },
        2 => {

            let maxsize = params[0].get_i32().unwrap_or(0);
            let marker = params[1].get_blob().unwrap_or(&empty_array);
            let timeout = params[2].get_i32().unwrap_or(0);

            Box::new(methods::receive(obj, maxsize, marker.to_vec(), timeout))

        },
        3 => {

            let data = params[0].get_blob().unwrap_or(&empty_array);
            let timeout = params[1].get_i32().unwrap_or(0);

            Box::new(methods::send(obj, data.to_vec(), timeout))

        },
        4 => Box::new(methods::close_output(obj))
,
        5 => {

            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))

        },
        6 => Box::new(obj.last_error.clone()),

        7 => {
            let addr = params[0].get_string().unwrap_or("".to_string());
            let host = params[1].get_string().unwrap_or("".to_string());

            Box::new(obj.set_address(&addr, &host))
        }

        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("Address")
];


pub struct AddIn {
    address: String,
    host: String,
    connection: Option<Connection>,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
    last_error: String,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            address: String::new(),
            host: String::new(),
            connection: None,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
            last_error: String::new(),
        }
    }

    pub fn set_address(&mut self, address: &str, host: &str) -> bool{
        self.address = address.to_string();
        self.host = host.to_string();
        true
    }

    /// Подключается к серверу
    pub fn connect(&mut self) -> bool {
        if self.address.is_empty() {
            self.save_error("No address found!");
            return false; // Ошибка: пустой адрес
        }

        match TcpStream::connect(&self.address) {
            Ok(tcp_stream) => {
                if self.use_tls {
                    let mut builder = native_tls::TlsConnector::builder();

                    if !self.ca_cert_path.is_empty() {
                        let mut cert_data = Vec::new();
                        let mut cert_file = match File::open(&self.ca_cert_path) {
                            Ok(file) => file,
                            Err(e) => {
                                self.save_error(&e.to_string());
                                return false
                            },
                        };

                        match cert_file.read_to_end(&mut cert_data) {
                            Ok(_) => {},
                            Err(e) => {
                                self.save_error(&e.to_string());
                                return false;
                            }
                        }

                        let cert = match native_tls::Certificate::from_pem(&cert_data) {
                            Ok(cert) => cert,
                            Err(e) => {
                                self.save_error(&e.to_string());
                                return false;
                            }
                        };

                        builder.add_root_certificate(cert);
                    }

                    if self.accept_invalid_certs {
                        builder.danger_accept_invalid_certs(true);
                    }

                    let connector = match builder.build() {
                        Ok(connector) => connector,
                        Err(e) => {
                            self.save_error(&e.to_string());
                            return false;
                        }
                    };

                    match connector.connect(&self.host, tcp_stream) {
                        Ok(tls_stream) => {
                            self.connection = Some(Connection::Tls(tls_stream));
                            true
                        }
                        Err(e) => {
                            self.save_error(&e.to_string());
                            false
                        }
                    }
                } else {
                    self.connection = Some(Connection::Plain(tcp_stream));
                    true
                }
            }
            Err(e) => {
                self.save_error(&e.to_string());
                false
            }
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.connection.is_some() {
            return Self::process_error("TLS settings can only be set before the connection is established");
        }

        self.use_tls = use_tls;
        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();

        json!({"result": true}).to_string()
    }

    fn process_error(e: &str) -> String{
        json!({
            "result": false,
            "error": e
        }).to_string()
    }

    pub fn save_error(&mut self, e: &str){
        self.last_error = Self::process_error(e);
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.address as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------