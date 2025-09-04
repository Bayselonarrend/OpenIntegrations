mod methods;
mod dataset;

use addin1c::{name, Variant};
use crate::core::getset;
use postgres::{Client, NoTls};
use serde_json::json;
use postgres_native_tls::MakeTlsConnector;
use native_tls::{TlsConnector, Certificate};
use std::fs::File;
use std::io::Read;
use std::sync::{Arc, Mutex};
use crate::component::dataset::Datasets;
// МЕТОДЫ КОМПОНЕНТЫ -------------------------------------------------------------------------------

// Синонимы
pub const METHODS: &[&[u16]] = &[
    name!("Connect"),
    name!("Close"),
    name!("Execute"),
    name!("SetTLS"),
    name!("InitQuery"),
    name!("GetResultAsFile"),
    name!("GetResultAsString"),
    name!("SetParamsFromFile"),
    name!("SetParamsFromString"),
    name!("RemoveQueryDataset"),
    name!("BatchQuery"),
    name!("GetTLSSettings")
];

// Число параметров функций компоненты
pub fn get_params_amount(num: usize) -> usize {
    match num {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 3,
        4 => 3,
        5 => 2,
        6 => 1,
        7 => 2,
        8 => 2,
        9 => 1,
        10 => 2,
        11 => 0,
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

            let key = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::execute_query(obj, &key))
        },
        3 => {

            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            if obj.get_connection().is_some(){
                return  Box::new(format_json_error("TLS settings can only be set before the connection is established"));
            };

            obj.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, &ca_cert_path));

            Box::new(json!({"result": true}).to_string())

        },
       4 => {

            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);
            let from_file = params[2].get_bool().unwrap_or(false);

            let result = match obj.datasets.init_query(&text, force, from_file){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => format_json_error(&e)
            };

            Box::new(result)
        },

        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.result_as_file(&key, &filepath){
                Ok(_) => json!({"result": true}).to_string(),
                Err(e) => format_json_error(&e)
            };

            Box::new(result)
        },

        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());

            let result = obj.datasets.result_as_string(&key)
                .unwrap_or_else(|e| format_json_error(&e));

            Box::new(result)

        },

        7 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.params_from_file(&key, &filepath){
                Ok(_) => json!({"result": true}).to_string(),
                Err(e) => format_json_error(&e)
            };

            Box::new(result)
        },

        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let json = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.params_from_string(&key, &json){
                Ok(_) => json!({"result": true}).to_string(),
                Err(e) => format_json_error(&e)
            };

            Box::new(result)

        },

        9 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(json!({"result": true}).to_string())
        },

        10 => {
            let input = params[0].get_string().unwrap_or("".to_string());
            let output = params[1].get_string().unwrap_or("".to_string());

            let result = match obj.datasets.batch_query_init(&input, &output){
                Ok(_) => json!({"result": true}).to_string(),
                Err(e) => format_json_error(&e)
            };

            Box::new(result)
        },
        11 => {

            let result = match &obj.tls{
                Some(tls) => tls.get_settings(),
                None => "".to_string()
            };

            Box::new(result)
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
    tls: Option<TlsSettings>,
    datasets: Datasets,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            client: None,
            tls: None,
            datasets: Datasets::new(),
        }
    }

    pub fn initialize(&mut self) -> String {

        let tls = match &self.tls {
            Some(tls) => Some(tls),
            None => None,
        };

        let use_tls = match tls{
            Some(tls) => tls.use_tls,
            None => false,
        };

        let result = if use_tls {

            let tls_connector = match tls.unwrap().get_connector(){
                Ok(connector) => connector,
                Err(e) => return e
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
            Err(e) => format_json_error(&e.to_string()),
        };
        result_string
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

    pub fn get_field_ptr(&self, index: usize) -> *const dyn getset::ValueType {
        match index {
            0 => &self.connection_string as &dyn getset::ValueType as *const _,
            _ => panic!("Index out of bounds"),
        }
    }
    pub fn get_field_ptr_mut(&mut self, index: usize) -> *mut dyn getset::ValueType { self.get_field_ptr(index) as *mut _ }
}

pub fn format_json_error(error: &str) -> String {
    json!({"result": false, "error": error}).to_string()
}

struct TlsSettings{
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl TlsSettings {
    fn new(use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> Self {
        TlsSettings{
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
        }
    }

    pub fn get_connector(&self) -> Result<TlsConnector, String> {

        let mut builder = TlsConnector::builder();

        if !self.ca_cert_path.is_empty() {

            let mut cert_data = Vec::new();
            let mut cert_file = match File::open(&self.ca_cert_path){
                Ok(file) => file,
                Err(e) => return Err(format_json_error(&e.to_string()))
            };

            match cert_file.read_to_end(&mut cert_data){
                Ok(_) => {},
                Err(e) => return Err(format_json_error(&e.to_string()))
            };

            let cert_data = match Certificate::from_pem(&cert_data){
                Ok(cert) => cert,
                Err(e) => return Err(format_json_error(&e.to_string()))
            };

            builder.add_root_certificate(cert_data);

        };

        // Если нужно отключить проверку сертификатов
        if self.accept_invalid_certs {
            builder.danger_accept_invalid_certs(true);
        }

        match builder.build(){
            Ok(connector) => Ok(connector),
            Err(e) => Err(format_json_error(&e.to_string()))
        }
    }

    pub fn get_settings(&self) -> String{
        json!({"use_tls": self.use_tls, "ca_cert_path": self.ca_cert_path, "accept_invalid_certs": self.accept_invalid_certs}).to_string()
    }
}
// -------------------------------------------------------------------------------------------------

// УНИЧТОЖЕНИЕ ОБЪЕКТА -----------------------------------------------------------------------------

// Обработка удаления объекта
impl Drop for AddIn {
    fn drop(&mut self) {}
}