#[cfg(feature = "native-tls")]
use native_tls::{Certificate, TlsConnector};
use crate::tls_settings::TlsSettings;

#[cfg(feature = "native-tls")]
impl TlsSettings {

    pub fn get_connector(&self) -> Result<TlsConnector, String> {

        use std::fs::File;
        use std::io::Read;

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

        if self.accept_invalid_certs {
            builder.danger_accept_invalid_certs(true);
        }

        match builder.build(){
            Ok(connector) => Ok(connector),
            Err(e) => Err(e.to_string())
        }
    }
}
