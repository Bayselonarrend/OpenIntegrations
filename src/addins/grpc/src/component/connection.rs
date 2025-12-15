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

    let scheme = uri.scheme_str().unwrap_or("https");
    let host = uri.host().ok_or("No host in URI")?;
    let port = uri.port_u16().unwrap_or(if scheme == "https" { 443 } else { 80 });

    if scheme == "http" {
        let endpoint = Endpoint::from_shared(address.to_string())
            .map_err(|e| format!("Invalid address: {}", e))?;

        return endpoint
            .connect()
            .await
            .map_err(|e| format!("HTTP connection failed: {}. Address: {}, Host: {}, Port: {}", e, address, host, port));
    }

    // Создаем rustls конфигурацию
    let rustls_config = tls_settings.get_rustls_config()
        .map_err(|e| format!("Failed to create rustls config: {}", e))?;

    // Создаем hyper-rustls коннектор
    let connector = hyper_rustls::HttpsConnectorBuilder::new()
        .with_tls_config(rustls_config)
        .https_or_http()
        .enable_http1()
        .enable_http2()
        .build();

    let endpoint = Endpoint::from_shared(address.to_string())
        .map_err(|e| format!("Invalid address: {}", e))?;

    endpoint
        .connect_with_connector(connector)
        .await
        .map_err(|e| format!("HTTPS connection failed: transport error: {}. Address: {}, Host: {}, Port: {}", e, address, host, port))
}
