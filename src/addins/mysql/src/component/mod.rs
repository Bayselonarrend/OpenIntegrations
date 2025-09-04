mod methods;
mod dataset;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use mysql::*;
use std::path::PathBuf;
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

            if obj.connections.is_some(){
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
    name!("ConnectionString")
];


pub struct AddIn {
    connection_string: String,
    connections: Option<Pool>,
    tls: Option<TlsSettings>,
    connection: Option<PooledConn>,
    datasets: Datasets,
}

impl AddIn {

    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connections: None,
            tls: None,
            connection: None,
            datasets: Datasets::new(),
        }
    }

    pub fn initialize(&mut self) -> String {

        let connection_string = if self.connection_string.is_empty() {
            return Self::process_error("Empty connection string!")
        } else {
            &self.connection_string
        };

        let opts = match Opts::from_url(connection_string){
            Ok(opts) => opts,
            Err(e) => return Self::process_error(e.to_string().as_str())
        };

        let mut opts_builder = OptsBuilder::from_opts(opts);

        let tls = match &self.tls {
            Some(tls) => Some(tls),
            None => None,
        };

        let use_tls = match tls{
            Some(tls) => tls.use_tls,
            None => false,
        };

        if use_tls {

            let tls = tls.unwrap();

            let mut ssl_opts = SslOpts::default()
                .with_danger_accept_invalid_certs(tls.accept_invalid_certs);

            if !tls.ca_cert_path.is_empty() {
                let cert_path: PathBuf = tls.ca_cert_path.clone().into();
                ssl_opts = ssl_opts.with_root_cert_path(Some(cert_path));
            };

            opts_builder = opts_builder.ssl_opts(ssl_opts);

        }

        match Pool::new(opts_builder){
            Ok(p) => {

                self.connections = Some(p);
                self.connection = match self.get_connection(){
                    Ok(p) => Some(p),
                    Err(e) => return Self::process_error(e.to_string().as_str())
                };

                json!({"result": true}).to_string()

            },
            Err(e) => Self::process_error(e.to_string().as_str())
        }
    }

    pub fn close_connection(&mut self) -> String {
        let mut closed = false;

        // Закрываем активное соединение
        if self.connection.take().is_some() {
            closed = true;
        }

        // Закрываем пул соединений
        if self.connections.take().is_some() {
            closed = true;
        }

        if closed {
            json!({"result": true}).to_string()
        } else {
            Self::process_error("All connections are already closed")
        }
    }

    fn get_connection(&mut self) -> Result<PooledConn, String>{

        if let Some(mut conn) = self.connection.take() {
            if conn.as_mut().ping().is_ok() {
                return Ok(conn);
            } else {
                drop(conn);
            }
        }

        let pool = match self.connections {
            Some(ref mut conns) => conns,
            None => return Err(format_json_error("No connections pool!"))
        };

        match pool.get_conn(){
            Ok(conn) => Ok(conn),
            Err(e) => Err(format_json_error(e))
        }

    }

    fn process_error(e: &str) -> String{
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

    pub fn get_settings(&self) -> String{
        json!({"use_tls": self.use_tls, "ca_cert_path": self.ca_cert_path, "accept_invalid_certs": self.accept_invalid_certs}).to_string()
    }
}

pub fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}