mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use postgres::{Client, NoTls};
use serde_json::json;
use postgres_native_tls::MakeTlsConnector;
use native_tls::{TlsConnector, Certificate};
use std::fs::File;
use std::io::Read;
use std::sync::{Arc, Mutex};
// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS")

];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 3,
        3 => 3,
        _ => 0,
    }
}

// Соответствие функций Rust функциям компоненты
// Вызовы должны быть обернуты в Box::new
pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {

        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {

            let query = params[0].get_string().unwrap_or("".to_string());
            let params_json = params[1].get_string().unwrap_or("".to_string());
            let force_result = params[2].get_bool().unwrap_or(false);

            Box::new(methods::execute_query(obj, query, params_json, force_result))
        },
        3 => {

            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            Box::new(obj.set_tls(use_tls, accept_invalid_certs, &ca_cert_path))

        }
        _ => Box::new(false), // Неверный номер команды
    }

}

// -------------------------------------------------------------------------------------------------

// ПОЛЯ КОМПОНЕНТЫ ---------------------------------------------------------------------------------

// Синонимы
pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString"),
];


pub struct AddIn {
    connection_string: String,
    client: Option<Arc<Mutex<Client>>>,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            client: None,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
        }
    }

    pub fn initialize(&mut self) -> String {

        let result = if self.use_tls {

            let mut builder = TlsConnector::builder();

            if !self.ca_cert_path.is_empty() {

                let mut cert_data = Vec::new();
                let mut cert_file = match File::open(&self.ca_cert_path){
                    Ok(file) => file,
                    Err(e) => return Self::process_error(e.to_string())
                };

                match cert_file.read_to_end(&mut cert_data){
                    Ok(_) => {},
                    Err(e) => return Self::process_error(e.to_string())
                };

                let cert_data = match Certificate::from_pem(&cert_data){
                    Ok(cert) => cert,
                    Err(e) => return Self::process_error(e.to_string())
                };

                builder.add_root_certificate(cert_data);

            };

            // Если нужно отключить проверку сертификатов
            if self.accept_invalid_certs {
                builder.danger_accept_invalid_certs(true);
            }

            let tls_connector = match builder.build(){
                Ok(connector) => connector,
                Err(e) => return Self::process_error(e.to_string())
            };

            let tls_connector = MakeTlsConnector::new(tls_connector);
            Client::connect(&self.connection_string, tls_connector)

        } else {

            Client::connect(&self.connection_string, NoTls)

        };

        // Обрабатываем результат с помощью вспомогательной функции
        let result_string = match result {
            Ok(client) => {
                self.client = Some(Arc::new(Mutex::new(client)));
                json!({"result": true}).to_string()
            }
            Err(e) => Self::process_error(e.to_string()),
        };
        result_string
    }

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.get_connection().is_some(){
            return Self::process_error("TLS settings can only be set before the connection is established".to_string());
        };

        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();
        self.use_tls = use_tls;

        json!({"result": true}).to_string()
    }

    pub fn get_connection(&mut self) -> Option<Arc<Mutex<Client>>> {
        self.client.clone()
    }

    pub fn close_connection(&mut self) -> String {
        if self.client.take().is_some() {
            json!({"result": true}).to_string()
        } else {
            json!({
                "result": false,
                "error": "Connection already closed"
            })
                .to_string()
        }
    }

    fn process_error(e: String) -> String{
        json!({
            "result": false,
            "error": e
        }).to_string()
    }

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}
// -------------------------------------------------------------------------------------------------

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}