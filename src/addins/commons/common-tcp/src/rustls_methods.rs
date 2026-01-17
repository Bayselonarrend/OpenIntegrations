#[cfg(feature = "rustls")]
use std::fmt::{Debug, Formatter};
#[cfg(feature = "rustls")]
use rustls::crypto::ring;
#[cfg(feature = "rustls")]
use rustls::client::danger::{HandshakeSignatureValid, ServerCertVerified, ServerCertVerifier};
#[cfg(feature = "rustls")]
use rustls::pki_types::{CertificateDer, ServerName, UnixTime};
#[cfg(feature = "rustls")]
use rustls::{ClientConfig, DigitallySignedStruct};
use crate::tls_settings::TlsSettings;

#[cfg(feature = "rustls")]
pub struct NoCertificateVerification;

#[cfg(feature = "rustls")]
impl TlsSettings {
    pub fn get_rustls_config(&self) -> Result<ClientConfig, String> {

        use std::sync::Arc;

        let _ = ring::default_provider()
            .install_default();

        let mut root_store = rustls::RootCertStore::empty();
        
        // Добавляем webpki корневые сертификаты
        root_store.extend(webpki_roots::TLS_SERVER_ROOTS.iter().cloned());
        
        // Добавляем нативные системные корневые сертификаты
        let native_certs = rustls_native_certs::load_native_certs();
        for cert in native_certs.certs {
            let _ = root_store.add(cert);
        }

        if !self.ca_cert_path.is_empty() {
            let cert_data = std::fs::read(&self.ca_cert_path)
                .map_err(|e| format!("Failed to read CA cert file: {}", e))?;

            let mut cursor = std::io::Cursor::new(cert_data);
            let certs = rustls_pemfile::certs(&mut cursor)
                .collect::<Result<Vec<_>, _>>()
                .map_err(|e| format!("Failed to parse PEM certificates: {}", e))?;

            for cert in certs {
                root_store
                    .add(cert)
                    .map_err(|e| format!("Failed to add CA cert: {}", e))?;
            }
        }

        let config_builder = ClientConfig::builder()
            .with_root_certificates(root_store);

        let mut config = config_builder.with_no_client_auth();

        if self.accept_invalid_certs {
            config.dangerous().set_certificate_verifier(Arc::new(NoCertificateVerification));
        }

        config.resumption = rustls::client::Resumption::default();
        Ok(config)
    }
}

impl Debug for NoCertificateVerification {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        f.write_str("NoCertificateVerification")
    }
}

impl ServerCertVerifier for NoCertificateVerification {
    fn verify_server_cert(
        &self,
        _end_entity: &CertificateDer<'_>,
        _intermediates: &[CertificateDer<'_>],
        _server_name: &ServerName<'_>,
        _ocsp_response: &[u8],
        _now: UnixTime,
    ) -> Result<ServerCertVerified, rustls::Error> {
        Ok(ServerCertVerified::assertion())
    }

    fn verify_tls12_signature(
        &self,
        _message: &[u8],
        _cert: &CertificateDer<'_>,
        _dss: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, rustls::Error> {
        Ok(HandshakeSignatureValid::assertion())
    }

    fn verify_tls13_signature(
        &self,
        _message: &[u8],
        _cert: &CertificateDer<'_>,
        _dss: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, rustls::Error> {
        Ok(HandshakeSignatureValid::assertion())
    }

    fn supported_verify_schemes(&self) -> Vec<rustls::SignatureScheme> {
        ring::default_provider()
            .signature_verification_algorithms
            .supported_schemes()
            .to_vec()
    }
}