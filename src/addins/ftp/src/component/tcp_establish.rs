use std::io::{BufRead, BufReader, Write};
use std::net::{SocketAddr, TcpStream};
use std::time::Duration;
use socks::{Socks4Stream, Socks5Stream};
use base64::{Engine as _, engine::general_purpose};
use socket2::Socket;
use suppaftp::FtpError;
use crate::component::configuration::{FtpProxySettings, FtpSettings};

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

            let socket = Socket::from(tcp_connection);
            match socket.set_linger(Some(Duration::from_secs(10))){
                Ok(_) => {},
                Err(e) => return Err(FtpError::ConnectionError(
                    std::io::Error::new(std::io::ErrorKind::Unsupported, e)))
            };

            let tcp_connection = TcpStream::from(socket);

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

fn connect_via_http_proxy(proxy_settings: &FtpProxySettings, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let proxy_addr = format!("{}:{}", proxy_settings.server, proxy_settings.port);

    let mut stream = TcpStream::connect(proxy_addr)
        .map_err(|e| format!("Failed to connect to HTTP proxy: {}", e))?;

    let host_port = format!("{}:{}", target_addr.0, target_addr.1);
    let request = format!(
        "CONNECT {} HTTP/1.1\r\nHost: {}\r\n",
        host_port, host_port
    );

    let request = if let (Some(user), Some(pass)) = (&proxy_settings.login, &proxy_settings.password) {
        let auth = general_purpose::STANDARD.encode(&format!("{}:{}", user, pass));
        format!("{}Proxy-Authorization: Basic {}\r\n\r\n", request, auth)
    } else {
        request + "\r\n"
    };

    stream.write_all(request.as_bytes())
        .map_err(|e| format!("Failed to send CONNECT request: {}", e))?;

    let mut reader = BufReader::new(stream);

    let mut status_line = String::new();
    reader.read_line(&mut status_line)
        .map_err(|e| format!("Failed to read status line: {}", e))?;

    if !status_line.starts_with("HTTP/") {
        return Err(format!("Invalid response: {}", status_line));
    }

    let status_code = status_line.split_whitespace().nth(1)
        .ok_or_else(|| "Malformed status line")?;

    match status_code {
        "200" => {}
        "407" => return Err("Proxy authentication required".to_string()),
        code => return Err(format!("Proxy error: {}", code)),
    }

    // Пропускаем заголовки
    let mut header_line = String::new();
    loop {
        header_line.clear();
        reader.read_line(&mut header_line)
            .map_err(|e| format!("Failed to read header: {}", e))?;

        if header_line.trim().is_empty() {
            break;
        }
    }

    let stream = reader.into_inner();
    Ok(stream)
}

fn connect_direct(addr: (&str, u16)) -> Result<TcpStream, String> {
    let target_addr = format!("{}:{}", addr.0, addr.1);
    TcpStream::connect(&target_addr).map_err(|e| format!("Direct connection error: {}", e))
}

