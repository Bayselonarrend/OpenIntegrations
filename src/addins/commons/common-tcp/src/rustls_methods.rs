use crate::tls_settings::TlsSettings;
#[cfg(feature = "rustls")]
use rustls::client::danger::{HandshakeSignatureValid, ServerCertVerified, ServerCertVerifier};
#[cfg(feature = "rustls")]
use rustls::crypto::ring;
#[cfg(feature = "rustls")]
use rustls::pki_types::{CertificateDer, PrivateKeyDer, ServerName, UnixTime};
#[cfg(feature = "rustls")]
use rustls::{ClientConfig, DigitallySignedStruct};
#[cfg(feature = "rustls")]
use std::fmt::{Debug, Formatter};

#[cfg(feature = "rustls")]
pub struct NoCertificateVerification;

#[cfg(feature = "rustls")]
impl TlsSettings {
    pub fn get_rustls_config(&self) -> Result<ClientConfig, String> {
        self.build_rustls_config(rustls::ALL_VERSIONS)
    }

    /// FTPS data connections have to resume the control session. Servers
    /// enforce that with OpenSSL SSL_session_reused(), which is set for a
    /// resumed TLS 1.2 session and stays clear for TLS 1.3.
    pub fn get_rustls_config_tls12(&self) -> Result<ClientConfig, String> {
        self.build_rustls_config(&[&rustls::version::TLS12])
    }

    fn build_rustls_config(
        &self,
        versions: &[&'static rustls::SupportedProtocolVersion],
    ) -> Result<ClientConfig, String> {
        use std::sync::Arc;

        let _ = ring::default_provider().install_default();

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

        let config_builder =
            ClientConfig::builder_with_protocol_versions(versions).with_root_certificates(root_store);

        let mut config = client_config(config_builder, &self.client_cert_chain, &self.client_key)?;

        if self.accept_invalid_certs {
            config
                .dangerous()
                .set_certificate_verifier(Arc::new(NoCertificateVerification));
        }

        config.resumption = rustls::client::Resumption::default();
        Ok(config)
    }
}

#[cfg(feature = "rustls")]
fn client_config(
    config_builder: rustls::ConfigBuilder<ClientConfig, rustls::client::WantsClientCert>,
    client_cert_chain: &[u8],
    client_key: &[u8],
) -> Result<ClientConfig, String> {
    if client_cert_chain.is_empty() && client_key.is_empty() {
        return Ok(config_builder.with_no_client_auth());
    }
    if client_cert_chain.is_empty() || client_key.is_empty() {
        return Err(
            "Client certificate chain and private key must both be provided for mTLS".to_string(),
        );
    }

    let certs = parse_client_chain(client_cert_chain)?;
    let key = parse_client_key(client_key)?;
    config_builder
        .with_client_auth_cert(certs, key)
        .map_err(|e| format!("Failed to set client certificate: {}", e))
}

#[cfg(feature = "rustls")]
fn parse_client_chain(pem: &[u8]) -> Result<Vec<CertificateDer<'static>>, String> {
    let mut cursor = std::io::Cursor::new(pem);
    let certs = rustls_pemfile::certs(&mut cursor)
        .collect::<Result<Vec<_>, _>>()
        .map_err(|e| format!("Failed to parse client certificate chain: {}", e))?;

    if certs.is_empty() {
        return Err(
            "Client certificate chain is empty: expected PEM certificates, leaf certificate first"
                .to_string(),
        );
    }

    Ok(certs)
}

#[cfg(feature = "rustls")]
fn parse_client_key(pem: &[u8]) -> Result<PrivateKeyDer<'static>, String> {
    let mut cursor = std::io::Cursor::new(pem);
    rustls_pemfile::private_key(&mut cursor)
        .map_err(|e| format!("Failed to parse client private key: {}", e))?
        .ok_or_else(|| {
            "Failed to parse client private key: expected an unencrypted PEM private key"
                .to_string()
        })
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
