mod methods;

use addin1c::{name, Variant};
use crate::core::getset;
use postgres::{Client, NoTls};
use serde_json::json;
use postgres_native_tls::MakeTlsConnector;
use std::sync::{Arc, Mutex};
use common_dataset::dataset::Datasets;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};

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

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    match num {
        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            Box::new(methods::execute_query(obj, &key))
        },
        3 => {
            if obj.get_connection().is_some(){
                return  Box::new(json_error("TLS settings can only be set before the connection is established"));
            };
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());

            obj.tls = Some(TlsSettings::new(use_tls, accept_invalid_certs, &ca_cert_path));
            Box::new(json_success())
        },
       4 => {
            let text = params[0].get_string().unwrap_or("".to_string());
            let force = params[1].get_bool().unwrap_or(false);
            let from_file = params[2].get_bool().unwrap_or(false);
            let result = match obj.datasets.init_query(&text, force, from_file){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        5 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.result_as_file(&key, &filepath){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        6 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let result = obj.datasets.result_as_string(&key)
                .unwrap_or_else(|e| json_error(&e));
            Box::new(result)
        },
        7 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let filepath = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.params_from_file(&key, &filepath){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        8 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            let json = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.params_from_string(&key, &json){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        9 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            obj.datasets.remove(&key);
            Box::new(json_success())
        },
        10 => {
            let input = params[0].get_string().unwrap_or("".to_string());
            let output = params[1].get_string().unwrap_or("".to_string());
            let result = match obj.datasets.batch_query_init(&input, &output){
                Ok(_) => json_success(),
                Err(e) => json_error(&e)
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
        _ => Box::new(false),
    }

}

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

        let tls_conn = if let Some(tls) = &self.tls {
            if tls.enabled(){
                let tls_connector = match tls.get_connector(){
                    Ok(connector) => connector,
                    Err(e) => return json_error(&e)
                };
                Some(MakeTlsConnector::new(tls_connector))
            }else{
                None
            }
        }else{
            None
        };

        let result = match tls_conn{
            Some(t) => Client::connect(&self.connection_string, t),
            None => Client::connect(&self.connection_string, NoTls),
        };

        let result_string = match result {
            Ok(client) => {
                self.client = Some(Arc::new(Mutex::new(client)));
                json_success()
            }
            Err(e) => json_error(&e),
        };
        result_string
    }

    pub fn get_connection(&mut self) -> Option<Arc<Mutex<Client>>> {
        self.client.clone()
    }

    pub fn close_connection(&mut self) -> String {
        if self.client.take().is_some() {
            json_success()
        } else {
            json_error("Connection closed")
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

impl Drop for AddIn {
    fn drop(&mut self) {}
}