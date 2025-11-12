use std::fs::File;
use std::io::Read;
use native_tls::{Certificate, TlsConnector};
use serde::{Deserialize, Serialize};
use serde_json::json;

#[derive(Deserialize,Serialize,Clone)]
pub struct TlsSettings{
    pub use_tls: bool,
    pub accept_invalid_certs: bool,
    pub ca_cert_path: String,
}

impl TlsSettings {
    pub fn new(use_tls: bool, accept_invalid_certs: bool, ca_cert_path: &str) -> Self {
        TlsSettings{
            use_tls,
            accept_invalid_certs,
            ca_cert_path: ca_cert_path.to_string(),
        }
    }

    pub fn from_json(json_str: &str) -> Result<Self, String> {
        serde_json::from_str(json_str)
            .map_err(|e| format!("Failed to parse TLS setting: {}", e))
    }

    pub fn enabled(&self) -> bool {
        self.use_tls
    }

    pub fn get_connector(&self) -> Result<TlsConnector, String> {

        let mut builder = TlsConnector::builder();

        if !self.ca_cert_path.is_empty() {

            let mut cert_data = Vec::new();
            let mut cert_file = match File::open(&self.ca_cert_path){
                Ok(file) => file,
                Err(e) => return Err(e.to_string())
            };

            match cert_file.read_to_end(&mut cert_data){
                Ok(_) => {},
                Err(e) => return Err(e.to_string())
            };

            let cert_data = match Certificate::from_pem(&cert_data){
                Ok(cert) => cert,
                Err(e) => return Err(e.to_string())
            };

            builder.add_root_certificate(cert_data);

        };

        // Если нужно отключить проверку сертификатов
        if self.accept_invalid_certs {
            builder.danger_accept_invalid_certs(true);
        }

        match builder.build(){
            Ok(connector) => Ok(connector),
            Err(e) => Err(e.to_string())
        }
    }

    pub fn get_settings(&self) -> String{
        json!({"use_tls": self.use_tls, "ca_cert_path": self.ca_cert_path, "accept_invalid_certs": self.accept_invalid_certs}).to_string()
    }

}