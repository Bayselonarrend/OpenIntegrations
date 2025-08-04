use std::io::{Read, Write};
use std::net::{SocketAddr, TcpStream, ToSocketAddrs};
use std::time::Duration;
use socks::{Socks4Stream, Socks5Stream};
use base64::{Engine as _, engine::general_purpose};
use suppaftp::FtpError;
use crate::component::configuration::{FtpProxySettings, FtpSettings};
use std::fmt::Write as FmtWrite;

pub fn make_passive_proxy_stream(
    ftp_settings: &FtpSettings,
    proxy_settings: &Option<FtpProxySettings>,
    addr: SocketAddr) -> Result<TcpStream, FtpError> {

    let redirect = match ftp_settings.advanced_resolve{
        true => {
            if proxy_settings.is_some() || addr.ip().is_loopback() {
                Some(&ftp_settings.domain)
            }else { None }
        },
        false => None
    };

    let corrected_addr = if redirect.is_some() {
        match redirect.unwrap().parse::<std::net::IpAddr>() {
            Ok(ftp_ip) => {
                SocketAddr::new(ftp_ip, addr.port())
            },
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

    let mut stream = TcpStream::connect(
        proxy_addr.to_socket_addrs()
            .map_err(|e| format!("Failed to resolve proxy address: {}", e))?
            .next()
            .ok_or_else(|| "Proxy address resolution returned no results".to_string())?
    ).map_err(|e| format!("Failed to connect to HTTP proxy: {}", e))?;

    // Установим таймауты для стабильности
    stream.set_read_timeout(Some(Duration::from_secs(10))).ok();
    stream.set_write_timeout(Some(Duration::from_secs(10))).ok();

    // Формируем CONNECT-запрос
    let host_port = format!("{}:{}", target_addr.0, target_addr.1);
    let mut request = format!(
        "CONNECT {} HTTP/1.1\r\nHost: {}\r\nConnection: keep-alive\r\n",
        host_port, host_port
    );

    // Добавляем Proxy-Authorization при необходимости
    if let (Some(user), Some(pass)) = (&proxy_settings.login, &proxy_settings.password) {
        let auth = general_purpose::STANDARD.encode(format!("{}:{}", user, pass));
        write!(request, "Proxy-Authorization: Basic {}\r\n", auth).unwrap();
    }
    request.push_str("\r\n");

    // Отправляем запрос
    stream.write_all(request.as_bytes())
        .map_err(|e| format!("Failed to send CONNECT request: {}", e))?;

    // Читаем ответ прокси
    let mut buf = [0u8; 4096];
    let n = stream.read(&mut buf)
        .map_err(|e| format!("Failed to read proxy response: {}", e))?;

    let mut headers = [httparse::EMPTY_HEADER; 16];
    let mut response = httparse::Response::new(&mut headers);
    match response.parse(&buf[..n]) {
        Ok(httparse::Status::Complete(_)) => {},
        Ok(httparse::Status::Partial) => return Err("Incomplete proxy response".to_string()),
        Err(e) => return Err(format!("Failed to parse proxy response: {:?}", e)),
    }

    let code = response.code.ok_or_else(|| "Missing HTTP status code in proxy response".to_string())?;
    match code {
        200 => Ok(stream),
        407 => Err("Proxy authentication required (HTTP 407)".to_string()),
        _ => {
            let resp_str = String::from_utf8_lossy(&buf[..n]);
            Err(format!("Proxy error: HTTP {}\nFull response:\n{}", code, resp_str))
        }
    }
}

fn connect_direct(addr: (&str, u16)) -> Result<TcpStream, String> {
    let target_addr = format!("{}:{}", addr.0, addr.1);
    TcpStream::connect(&target_addr).map_err(|e| format!("Direct connection error: {}", e))
}

