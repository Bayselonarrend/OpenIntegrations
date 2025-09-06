use std::io::{Read, Write};
use std::net::{SocketAddr, TcpStream, ToSocketAddrs};
use std::time::Duration;
use socks::{Socks4Stream, Socks5Stream};
use base64::{Engine as _, engine::general_purpose};
use suppaftp::FtpError;
use crate::component::configuration::{FtpProxySettings, FtpSettings};
use std::vec::IntoIter;
use std::fmt::Write as FmtWrite;


pub fn make_passive_proxy_stream(
    ftp_settings: &FtpSettings,
    proxy_settings: &Option<FtpProxySettings>,
    addr: SocketAddr) -> Result<TcpStream, FtpError> {

    let redirect = match ftp_settings.advanced_resolve {
        true => {
            if proxy_settings.is_some() || addr.ip().is_loopback()   {
                Some(&ftp_settings.domain)
            } else {
                None
            }
        }
        false => None,
    };

    let corrected_addr = if let Some(domain) = redirect {

        match get_socket_addr(domain, addr.port()) {
            Ok(mut addrs) => addrs.next().unwrap_or(addr),
            Err(_) => addr,
        }
    } else {
        addr
    };

    match create_tcp_connection_for_passive(&proxy_settings, corrected_addr)
        .map_err(|e| FtpError::ConnectionError(
            std::io::Error::new(std::io::ErrorKind::Other, e))){

        Ok(tcp_connection) => {

            let w_timeout = Some(Duration::from_secs(ftp_settings.write_timeout));
            let r_timeout = Some(Duration::from_secs(ftp_settings.read_timeout));

            let _ = tcp_connection.set_write_timeout(w_timeout);
            let _ = tcp_connection.set_read_timeout(r_timeout);

            Ok(tcp_connection)

        },
        Err(e) => Err(e)
    }
}

pub fn create_tcp_connection(
    ftp_settings: &FtpSettings,
    proxy_settings: &Option<FtpProxySettings>) -> Result<TcpStream, String> {

    let target_addr = (ftp_settings.domain.as_str(), ftp_settings.port);
    connect(proxy_settings, target_addr)
}

pub fn create_tcp_connection_for_passive(
    proxy_settings: &Option<FtpProxySettings>,
    addr: SocketAddr) -> Result<TcpStream, String> {

    let ip = addr.ip().to_string();
    let target_addr = (ip.as_str(), addr.port());
    connect(proxy_settings, target_addr)
}

fn connect(
    proxy_settings: &Option<FtpProxySettings>,
    target_addr: (&str, u16)
) -> Result<TcpStream, String> {

    match proxy_settings{
        Some(s) => connect_via_proxy(&s, target_addr),
        None => connect_direct(target_addr)
    }
}

fn connect_via_proxy(
    proxy_settings: &FtpProxySettings,
    target_addr: (&str, u16)
) -> Result<TcpStream, String> {

    let proxy_type = proxy_settings.proxy_type.as_str();

    match proxy_type.to_lowercase().as_str() {
        "socks5" => connect_via_socks5(proxy_settings, target_addr),
        "socks4" => connect_via_socks4(proxy_settings, target_addr),
        "http" => connect_via_http_proxy(proxy_settings, target_addr),
        _ => Err("Unsupported proxy type".to_string()),
    }
}


fn connect_via_socks5(proxy_settings: &FtpProxySettings, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let proxy_addr = format!("{}:{}", proxy_settings.server, proxy_settings.port);

    let stream = if let (Some(user), Some(pass)) = (&proxy_settings.login, &proxy_settings.password) {
        Socks5Stream::connect_with_password(proxy_addr, target_addr, user, pass)
    } else {
        Socks5Stream::connect(proxy_addr, target_addr)
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| format!("SOCKS5 error: {}", e))
}

fn connect_via_socks4(proxy_settings: &FtpProxySettings, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let proxy_addr = format!("{}:{}", proxy_settings.server, proxy_settings.port);

    let stream = if let Some(user) = &proxy_settings.login {
        Socks4Stream::connect(proxy_addr, target_addr, user)
    } else {
        Socks4Stream::connect(proxy_addr, target_addr, "")
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| format!("SOCKS4 error: {}", e))
}

pub fn connect_via_http_proxy(proxy_settings: &FtpProxySettings, target_addr: (&str, u16)) -> Result<TcpStream, String> {
    let proxy_addr = format!("{}:{}", proxy_settings.server, proxy_settings.port);
    let max_retries = 5;

    for attempt in 1..=max_retries {
        let mut stream = TcpStream::connect(
            proxy_addr.to_socket_addrs()
                .map_err(|e| format!("Failed to resolve proxy address: {}", e))?
                .next()
                .ok_or_else(|| "Proxy address resolution returned no results".to_string())?
        ).map_err(|e| format!("Failed to connect to HTTP proxy: {}", e))?;

        // Увеличиваем таймауты
        stream.set_read_timeout(Some(Duration::from_secs(30))).ok();
        stream.set_write_timeout(Some(Duration::from_secs(30))).ok();
        stream.set_nodelay(true).ok(); // Отключаем алгоритм Нейгла

        let host_port = format!("{}:{}", target_addr.0, target_addr.1);
        let mut request = format!(
            "CONNECT {} HTTP/1.1\r\nHost: {}\r\n",
            host_port, host_port
        );

        // Добавляем User-Agent и другие стандартные заголовки
        request.push_str("User-Agent: rust-ftp-proxy/1.0\r\n");
        request.push_str("Proxy-Connection: keep-alive\r\n");
        request.push_str("Connection: keep-alive\r\n");

        if let (Some(user), Some(pass)) = (&proxy_settings.login, &proxy_settings.password) {
            let auth = general_purpose::STANDARD.encode(format!("{}:{}", user, pass));
            write!(request, "Proxy-Authorization: Basic {}\r\n", auth).unwrap();
        }
        request.push_str("\r\n");

        // Пишем все данные
        stream.write_all(request.as_bytes())
            .map_err(|e| format!("Failed to send CONNECT request: {}", e))?;
        stream.flush().map_err(|e| format!("Failed to flush stream: {}", e))?;

        // Читаем ответ полностью
        let mut response = Vec::new();
        let mut buf = [0u8; 1024];
        let mut total_read = 0;
        let max_response_size = 8192;

        loop {
            let n = stream.read(&mut buf)
                .map_err(|e| format!("Failed to read proxy response: {}", e))?;

            if n == 0 {
                break;
            }

            response.extend_from_slice(&buf[..n]);
            total_read += n;

            // Проверяем, есть ли конец заголовков
            if response.windows(4).any(|window| window == b"\r\n\r\n") {
                break;
            }

            if total_read >= max_response_size {
                return Err("Proxy response too large".to_string());
            }
        }

        let response_str = String::from_utf8_lossy(&response);

        // Парсим ответ
        let mut headers = [httparse::EMPTY_HEADER; 32];
        let mut resp = httparse::Response::new(&mut headers);

        match resp.parse(&response) {
            Ok(httparse::Status::Complete(_)) => {},
            Ok(httparse::Status::Partial) => {
                // Пытаемся найти код статуса вручную
                if let Some(first_line) = response_str.lines().next() {
                    if let Some(code_str) = first_line.split_whitespace().nth(1) {
                        if let Ok(code) = code_str.parse::<u16>() {
                            match code {
                                200 => return Ok(stream),
                                407 => return Err("Proxy authentication required (HTTP 407)".to_string()),
                                500 | 502 | 503 => {
                                    if attempt < max_retries {
                                        let delay = Duration::from_millis(500 * attempt as u64);
                                        std::thread::sleep(delay);
                                        continue;
                                    }
                                }
                                _ => {}
                            }
                        }
                    }
                }
                return Err("Incomplete proxy response".to_string());
            }
            Err(e) => return Err(format!("Failed to parse proxy response: {:?}", e)),
        }

        let code = resp.code.ok_or_else(|| "Missing HTTP status code in proxy response".to_string())?;
        match code {
            200 => return Ok(stream),
            407 => return Err("Proxy authentication required (HTTP 407)".to_string()),
            500 | 502 | 503 => {
                if attempt < max_retries {
                    let delay = Duration::from_millis(500 * attempt as u64);
                    std::thread::sleep(delay);
                    continue;
                } else {
                    return Err(format!("Proxy error: HTTP {} after {} retries", code, max_retries));
                }
            }
            _ => {
                return Err(format!("Proxy error: HTTP {}", code));
            }
        }
    }

    Err("Failed to connect via proxy after all retries".to_string())
}


fn get_socket_addr(host: &str, port: u16) -> Result<IntoIter<SocketAddr>, String> {
    let host_and_port = format!("{}:{}", host, port);
    host_and_port.to_socket_addrs().map_err(|e| e.to_string())
}

fn connect_direct(addr: (&str, u16)) -> Result<TcpStream, String> {
    let target_addr = format!("{}:{}", addr.0, addr.1);
    TcpStream::connect(&target_addr).map_err(|e| format!("Direct connection error: {}", e))
}

