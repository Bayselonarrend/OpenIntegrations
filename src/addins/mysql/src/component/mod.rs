mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use serde_json::json;
use mysql::*;
use std::path::PathBuf;

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

            match obj.get_connection(){
                Ok(mut conn) => {

                    let result = Box::new(methods::execute_query(&mut conn, query, params_json, force_result));

                    match conn.as_mut().ping(){
                        Ok(_) => obj.connection = Some(conn),
                        Err(_) => drop(conn)
                    }

                    result
                },
                Err(e) => Box::new(e),
            }
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
    name!("ConnectionString")
];


pub struct AddIn {
    connection_string: String,
    connections: Option<Pool>,
    connection: Option<PooledConn>,
    use_tls: bool,
    accept_invalid_certs: bool,
    ca_cert_path: String,
}

impl AddIn {
    /// Создает новый объект
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connections: None,
            connection: None,
            use_tls: false,
            accept_invalid_certs: false,
            ca_cert_path: String::new(),
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

        if self.use_tls {

            let mut ssl_opts = SslOpts::default()
                .with_danger_accept_invalid_certs(self.accept_invalid_certs);

            if !self.ca_cert_path.is_empty() {
                let cert_path: PathBuf = self.ca_cert_path.clone().into();
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

    pub fn set_tls(&mut self, use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> String {

        if self.connections.is_some(){
            return Self::process_error("TLS settings can only be set before the connection is established");
        };

        self.accept_invalid_certs = accept_invalid_certs;
        self.ca_cert_path = ca_cert_path.to_string();
        self.use_tls = use_tls;

        json!({"result": true}).to_string()
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

pub fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}