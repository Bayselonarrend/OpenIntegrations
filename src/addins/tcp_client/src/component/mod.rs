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
    name!("Connect"),    // 0
    name!("Disconnect"), // 1
    name!("Read"),       // 2
    name!("Send"),       // 3
    name!("CloseOutput") // 4
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 2,
        4 => 0,
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

            if let Some(ref mut connection) = obj.connection {
                Box::new(methods::receive(connection, maxsize, marker.to_vec(), timeout))
            } else {
                Box::new("OPI: Connection closed".as_bytes().to_vec())
            }
        },
        3 => {

            let data = params[0].get_blob().unwrap_or(&empty_array);
            let timeout = params[1].get_i32().unwrap_or(0);

            if let Some(ref mut connection) = obj.connection {
                Box::new(methods::send(connection, data.to_vec(), timeout))
            } else {
                Box::new(false) // Если соединения нет, возвращаем false
            }
        },
        4 =>{
            if let Some(ref mut connection) = obj.connection {
                Box::new(methods::close_output(connection))
            } else {
                Box::new(false)
            }
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
    pub address: String,
    connection: Option<Connection>,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            address: String::new(),
            connection: None,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
        }
    }

    /// Подключается к серверу
    pub fn connect(&mut self) -> bool {
        if self.address.is_empty() {
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
                            Err(_) => return false,
                        };

                        if cert_file.read_to_end(&mut cert_data).is_err() {
                            return false;
                        }

                        let cert = match native_tls::Certificate::from_pem(&cert_data) {
                            Ok(cert) => cert,
                            Err(_) => return false,
                        };

                        builder.add_root_certificate(cert);
                    }

                    if self.accept_invalid_certs {
                        builder.danger_accept_invalid_certs(true);
                    }

                    let connector = match builder.build() {
                        Ok(connector) => connector,
                        Err(_) => return false,
                    };

                    match connector.connect(&self.address, tcp_stream) {
                        Ok(tls_stream) => {
                            self.connection = Some(Connection::Tls(tls_stream));
                            true
                        }
                        Err(_) => false,
                    }
                } else {
                    self.connection = Some(Connection::Plain(tcp_stream));
                    true
                }
            }
            Err(_) => false, // Ошибка при подключении
        }
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.connection.is_some() {
            return Self::process_error("TLS settings can only be set before the connection is established".to_string());
        }

        self.use_tls = use_tls;
        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();

        json!({"result": true}).to_string()
    }

    fn process_error(e: String) -> String{
        json!({
            "result": false,
            "error": e
        }).to_string()
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