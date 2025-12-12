use tonic::transport::{Channel, Endpoint};
use common_tcp::tls_settings::TlsSettings;

pub async fn establish_connection(
    address: &str,
    tls_settings: &Option<TlsSettings>,
) -> Result<Channel, String> {

    if let Some(tls) = tls_settings {
        if tls.use_tls {
            return establish_rustls_connection(address, tls).await;
        }
    }

    let endpoint = Channel::from_shared(address.to_string())
        .map_err(|e| format!("Invalid address: {}", e))?;

    endpoint
        .connect()
        .await
        .map_err(|e| format!("Connection failed: {}", e))
}

async fn establish_rustls_connection(
    address: &str,
    tls_settings: &TlsSettings,
) -> Result<Channel, String> {

    let rustls_config = tls_settings.get_rustls_config()?;

    let connector = hyper_rustls::HttpsConnectorBuilder::new()
        .with_tls_config(rustls_config)
        .https_or_http()
        .enable_http1()
        .enable_http2()
        .build();

    Endpoint::from_shared(address.to_string())
        .map_err(|e| format!("Invalid address: {}", e))?
        .connect_with_connector(connector)
        .await
        .map_err(|e| format!("Connection failed: {}", e))
}
