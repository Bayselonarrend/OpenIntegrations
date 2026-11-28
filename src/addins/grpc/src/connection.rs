use std::collections::{BTreeMap, HashMap};
use std::time::Duration;

use common_janx::{FromJanx, JanxValue};
use common_tcp::tls_settings::TlsSettings;
use tonic::transport::{Channel, Endpoint};

const DEFAULT_CONNECT_TIMEOUT: Duration = Duration::from_secs(10);

#[derive(Clone, Debug)]
pub struct ConnectionOptions {
    pub user_agent: Option<String>,
    pub gzip: bool,
    pub max_decoding_message_size: Option<usize>,
    pub max_encoding_message_size: Option<usize>,
    pub connect_timeout: Option<Duration>,
}

impl Default for ConnectionOptions {
    fn default() -> Self {
        Self {
            user_agent: None,
            gzip: false,
            max_decoding_message_size: None,
            max_encoding_message_size: None,
            connect_timeout: Some(DEFAULT_CONNECT_TIMEOUT),
        }
    }
}

pub fn options_from_settings(
    settings: &BTreeMap<String, JanxValue>,
    metadata: &HashMap<String, String>,
) -> Result<ConnectionOptions, String> {
    let mut options = ConnectionOptions::default();

    if let Some(value) = settings.get("user_agent") {
        options.user_agent = non_empty_string(value);
    }
    if options.user_agent.is_none() {
        options.user_agent = user_agent_from_settings_metadata(settings)
            .or_else(|| user_agent_from_metadata(metadata));
    }

    if let Some(value) = settings.get("compression") {
        options.gzip = parse_gzip(value)?;
    }

    if let Some(value) = settings.get("max_decoding_message_size") {
        options.max_decoding_message_size = Some(parse_size(value, "max_decoding_message_size")?);
    }
    if let Some(value) = settings.get("max_encoding_message_size") {
        options.max_encoding_message_size = Some(parse_size(value, "max_encoding_message_size")?);
    }

    options.connect_timeout = parse_connect_timeout(settings.get("connect_timeout_ms"))?;
    Ok(options)
}

pub async fn establish_connection(
    address: &str,
    tls_settings: &Option<TlsSettings>,
    options: &ConnectionOptions,
) -> Result<Channel, String> {
    if let Some(tls) = tls_settings {
        if tls.use_tls {
            return establish_rustls_connection(address, tls, options).await;
        }
    }

    let endpoint = Channel::from_shared(address.to_string())
        .map_err(|e| format!("Invalid address: {}", e))?;

    apply_endpoint_options(endpoint, options)?
        .connect()
        .await
        .map_err(|e| format!("Connection failed: {}", format_error_chain(&e)))
}

/// tonic печатает только свой Display (`transport error`).
/// Таймаут connect лежит глубже: hyper кладёт `Elapsed` (`deadline has elapsed`)
/// внутрь `io::Error`, а первый `source()` ещё показывает `tcp connect error`.
fn format_error_chain(error: &(dyn std::error::Error + 'static)) -> String {
    let mut parts = Vec::new();
    let mut current = Some(error);
    let mut depth = 0;

    while let Some(item) = current {
        if depth >= 16 {
            break;
        }
        depth += 1;

        push_unique_error_part(&mut parts, item.to_string());
        if let Some(io_error) = item.downcast_ref::<std::io::Error>() {
            if let Some(inner) = io_error.get_ref() {
                push_unique_error_part(&mut parts, inner.to_string());
            }
        }
        current = item.source();
    }

    parts.join(": ")
}

fn push_unique_error_part(parts: &mut Vec<String>, text: String) {
    let text = text.trim();
    if text.is_empty() || parts.iter().any(|part| part == text) {
        return;
    }
    parts.push(text.to_string());
}

async fn establish_rustls_connection(
    address: &str,
    tls_settings: &TlsSettings,
    options: &ConnectionOptions,
) -> Result<Channel, String> {
    let uri = address
        .parse::<http::Uri>()
        .map_err(|e| format!("Invalid URI: {}", e))?;

    let host = uri.host().ok_or("No host in URI")?;
    let port = uri.port_u16().unwrap_or(443);

    let https_address = format!("https://{}:{}", host, port);

    let rustls_config = tls_settings
        .get_rustls_config()
        .map_err(|e| format!("Failed to create rustls config: {}", e))?;

    let connector = hyper_rustls::HttpsConnectorBuilder::new()
        .with_tls_config(rustls_config)
        .https_only()
        .enable_http1()
        .enable_http2()
        .build();

    let endpoint = Endpoint::from_shared(https_address.clone())
        .map_err(|e| format!("Invalid address: {}", e))?;

    apply_endpoint_options(endpoint, options)?
        .connect_with_connector(connector)
        .await
        .map_err(|e| {
            format!(
                "HTTPS connection failed: {}. Address: {}, Host: {}, Port: {}",
                e, https_address, host, port
            )
        })
}

/// tonic 0.13 при превышении `max_encoding_message_size` теряет `OutOfRange`
/// и возвращает обрыв HTTP/2. Длину нужно отклонить до передачи сообщения в кодек.
pub fn check_encoding_limit(encoded_len: usize, limit: Option<usize>) -> Result<(), String> {
    let Some(limit) = limit else {
        return Ok(());
    };
    if encoded_len > limit {
        return Err(format!(
            "Error, encoded message length too large: found {encoded_len} bytes, the limit is: {limit} bytes"
        ));
    }
    Ok(())
}

fn apply_endpoint_options(
    endpoint: Endpoint,
    options: &ConnectionOptions,
) -> Result<Endpoint, String> {
    let endpoint = if let Some(timeout) = options.connect_timeout {
        endpoint.connect_timeout(timeout)
    } else {
        endpoint
    };

    if let Some(user_agent) = &options.user_agent {
        endpoint
            .user_agent(user_agent)
            .map_err(|_| format!("Invalid user agent: {}", user_agent))
    } else {
        Ok(endpoint)
    }
}

fn user_agent_from_settings_metadata(
    settings: &BTreeMap<String, JanxValue>,
) -> Option<String> {
    let metadata = settings.get("metadata")?.as_object()?;
    metadata.iter().find_map(|(key, value)| {
        if key.eq_ignore_ascii_case("user-agent") {
            non_empty_string(value)
        } else {
            None
        }
    })
}

fn user_agent_from_metadata(metadata: &HashMap<String, String>) -> Option<String> {
    metadata.iter().find_map(|(key, value)| {
        if key.eq_ignore_ascii_case("user-agent") {
            let value = value.trim();
            if value.is_empty() {
                None
            } else {
                Some(value.to_string())
            }
        } else {
            None
        }
    })
}

fn non_empty_string(value: &JanxValue) -> Option<String> {
    String::from_janx(value).and_then(|text| {
        let text = text.trim();
        if text.is_empty() {
            None
        } else {
            Some(text.to_string())
        }
    })
}

fn parse_gzip(value: &JanxValue) -> Result<bool, String> {
    let text = String::from_janx(value).unwrap_or_default();
    match text.trim().to_ascii_lowercase().as_str() {
        "" | "none" | "identity" => Ok(false),
        "gzip" => Ok(true),
        other => Err(format!("Unsupported gRPC compression: {}", other)),
    }
}

fn parse_size(value: &JanxValue, name: &str) -> Result<usize, String> {
    let size = parse_i64(value).ok_or_else(|| format!("Invalid {}", name))?;
    if size < 0 {
        return Err(format!("{} must not be negative", name));
    }
    Ok(size as usize)
}

fn parse_connect_timeout(value: Option<&JanxValue>) -> Result<Option<Duration>, String> {
    let Some(value) = value else {
        return Ok(Some(DEFAULT_CONNECT_TIMEOUT));
    };

    let timeout_ms = parse_i64(value).ok_or_else(|| "Invalid connect_timeout_ms".to_string())?;
    if timeout_ms < 0 {
        return Err("connect_timeout_ms must not be negative".to_string());
    }
    if timeout_ms == 0 {
        Ok(None)
    } else {
        Ok(Some(Duration::from_millis(timeout_ms as u64)))
    }
}

fn parse_i64(value: &JanxValue) -> Option<i64> {
    if let Some(number) = i64::from_janx(value) {
        return Some(number);
    }

    let number = f64::from_janx(value)?;
    if number.is_finite() && number >= 0.0 && number <= i64::MAX as f64 {
        Some(number as i64)
    } else {
        None
    }
}

#[cfg(test)]
mod tests {
    use super::format_error_chain;
    use std::error::Error;
    use std::fmt;
    use std::io;
    use std::time::Duration;

    #[derive(Debug)]
    struct Deadline;

    impl fmt::Display for Deadline {
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            f.write_str("deadline has elapsed")
        }
    }

    impl Error for Deadline {}

    #[derive(Debug)]
    struct Connect {
        source: io::Error,
    }

    impl fmt::Display for Connect {
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            f.write_str("tcp connect error")
        }
    }

    impl Error for Connect {
        fn source(&self) -> Option<&(dyn Error + 'static)> {
            Some(&self.source)
        }
    }

    #[derive(Debug)]
    struct Transport {
        source: Connect,
    }

    impl fmt::Display for Transport {
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            f.write_str("transport error")
        }
    }

    impl Error for Transport {
        fn source(&self) -> Option<&(dyn Error + 'static)> {
            Some(&self.source)
        }
    }

    #[test]
    fn connection_timeout_chain_includes_deadline() {
        let error = Transport {
            source: Connect {
                source: io::Error::new(io::ErrorKind::TimedOut, Deadline),
            },
        };

        let text = format_error_chain(&error);
        assert!(text.contains("transport error"), "{text}");
        assert!(text.contains("tcp connect error"), "{text}");
        assert!(text.contains("deadline has elapsed"), "{text}");
    }

    #[test]
    fn tokio_elapsed_inside_io_error_is_visible() {
        let runtime = tokio::runtime::Builder::new_current_thread()
            .enable_time()
            .build()
            .expect("tokio runtime");

        runtime.block_on(async {
            let elapsed = tokio::time::timeout(
                Duration::from_millis(1),
                std::future::pending::<()>(),
            )
            .await
            .expect_err("pending future must time out");
            let io_error = io::Error::new(io::ErrorKind::TimedOut, elapsed);
            let text = format_error_chain(&io_error);
            assert!(text.contains("deadline has elapsed"), "{text}");
        });
    }
}
