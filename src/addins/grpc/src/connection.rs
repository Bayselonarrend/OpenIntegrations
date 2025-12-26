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
    let uri = address.parse::<http::Uri>()
        .map_err(|e| format!("Invalid URI: {}", e))?;

    let host = uri.host().ok_or("No host in URI")?;
    let port = uri.port_u16().unwrap_or(443);

    // Force https scheme when TLS is enabled
    let https_address = format!("https://{}:{}", host, port);

    let rustls_config = tls_settings.get_rustls_config()
        .map_err(|e| format!("Failed to create rustls config: {}", e))?;

    let connector = hyper_rustls::HttpsConnectorBuilder::new()
        .with_tls_config(rustls_config)
        .https_only()
        .enable_http1()
        .enable_http2()
        .build();

    let endpoint = Endpoint::from_shared(https_address.clone())
        .map_err(|e| format!("Invalid address: {}", e))?;

    endpoint
        .connect_with_connector(connector)
        .await
        .map_err(|e| format!("HTTPS connection failed: {}. Address: {}, Host: {}, Port: {}", e, https_address, host, port))
}
