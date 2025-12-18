mod methods;

use serde_json::json;
use mysql::*;
use std::path::PathBuf;
use common_dataset::dataset::Datasets;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{json_error, json_success};
use common_binary::vault::{BinaryInput, BinaryVault};
use common_core::*;

impl_addin_exports!(AddIn);
impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);

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
    name!("GetTLSSettings"),
    name!("LoadBinaryToVault"),
    name!("LoadFileToVault"),
    name!("LoadBase64ToVault"),
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
        12 => 1,
        13 => 1,
        14 => 1,
        _ => 0,
    }
}

pub fn cal_func(obj: &mut AddIn, num: usize, params: &mut [Variant]) -> Box<dyn getset::ValueType> {

    let empty_array: [u8; 0] = [];

    match num {

        0 => Box::new(obj.initialize()),
        1 => Box::new(obj.close_connection()),
        2 => {
            let key = params[0].get_string().unwrap_or("".to_string());
            Box::new(obj.execute_query(&key))
        },
        3 => {
            let use_tls = params[0].get_bool().unwrap_or(false);
            let accept_invalid_certs = params[1].get_bool().unwrap_or(false);
            let ca_cert_path = params[2].get_string().unwrap_or("".to_string());
            if obj.connections.is_some(){
                return  Box::new(json_error("TLS settings can only be set before the connection is established"));
            };

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
        },
        12 => {
            let binary = params[0].get_blob().unwrap_or(&empty_array);
            let result = match obj.binary_vault.store(BinaryInput::Bytes(Vec::from(binary))){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        13 => {
            let file = params[0].get_string().unwrap_or("".to_string());
            let result = match obj.binary_vault.store(BinaryInput::FilePath(file)){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        },
        14 => {
            let base64 = params[0].get_string().unwrap_or("".to_string());
            let result = match obj.binary_vault.store(BinaryInput::Base64(base64)){
                Ok(key) => json!({"result": true, "key": key}).to_string(),
                Err(e) => json_error(&e)
            };
            Box::new(result)
        }
        _ => Box::new(false),
    }
}

pub const PROPS: &[&[u16]] = &[
    name!("ConnectionString")
];

pub struct AddIn {
    connection_string: String,
    connections: Option<Pool>,
    tls: Option<TlsSettings>,
    connection: Option<PooledConn>,
    datasets: Datasets,
    binary_vault: BinaryVault
}

impl AddIn {
    pub fn new() -> Self {
        AddIn {
            connection_string: String::new(),
            connections: None,
            tls: None,
            connection: None,
            datasets: Datasets::new(),
            binary_vault: BinaryVault::new()
        }
    }
    pub fn initialize(&mut self) -> String {

        let connection_string = if self.connection_string.is_empty() {
            return json_error("Empty connection string!")
        } else {
            &self.connection_string
        };

        let opts = match Opts::from_url(connection_string){
            Ok(opts) => opts,
            Err(e) => return json_error(e.to_string().as_str())
        };

        let mut opts_builder = OptsBuilder::from_opts(opts);

        if let Some(tls) = &self.tls {
            if tls.enabled(){
                let mut ssl_opts = SslOpts::default()
                    .with_danger_accept_invalid_certs(tls.accept_invalid_certs);

                if !tls.ca_cert_path.is_empty() {
                    let cert_path: PathBuf = tls.ca_cert_path.clone().into();
                    ssl_opts = ssl_opts.with_root_cert_path(Some(cert_path));
                };

                opts_builder = opts_builder.ssl_opts(ssl_opts);
            }
        }

        match Pool::new(opts_builder){
            Ok(p) => {

                self.connections = Some(p);
                self.connection = match self.get_connection(){
                    Ok(p) => Some(p),
                    Err(e) => return json_error(&e)
                };
                json_success()
            },
            Err(e) => json_error(&e)
        }
    }

    pub fn close_connection(&mut self) -> String {
        let mut closed = false;

        if self.connection.take().is_some() {
            closed = true;
        }

        if self.connections.take().is_some() {
            closed = true;
        }

        if closed {
            json!({"result": true}).to_string()
        } else {
            json_error("All connections are already closed")
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
            None => return Err(json_error("No connections pool!"))
        };

        match pool.get_conn(){
            Ok(conn) => Ok(conn),
            Err(e) => Err(json_error(&e))
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