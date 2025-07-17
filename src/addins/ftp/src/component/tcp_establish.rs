use std::io::{BufRead, BufReader, Write};
use std::net::TcpStream;
use crate::component::AddIn;
use crate::component::process_error;
use socks::{Socks4Stream, Socks5Stream};
use base64::{Engine as _, engine::general_purpose};

pub fn create_tcp_connection(obj: &AddIn) -> Result<TcpStream, String> {

    if let (Some(proxy_server), Some(proxy_port), Some(proxy_type)) =
        (&obj.proxy_server, &obj.proxy_port, &obj.proxy_type)
    {

        let target_addr = (obj.domain.as_str(), obj.port);
        let proxy_addr = format!("{}:{}", proxy_server, proxy_port);

        match proxy_type.to_lowercase().as_str() {
            "socks5" => connect_via_socks5(obj, &proxy_addr, target_addr),
            "socks4" => connect_via_socks4(obj, &proxy_addr, target_addr),
            "http" => connect_via_http_proxy(obj, &proxy_addr, target_addr),
            _ => Err(process_error("Unsupported proxy type")),
        }
    } else {
        connect_direct(obj)
    }
}

fn connect_via_socks5(obj: &AddIn, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let stream = if let (Some(user), Some(pass)) = (&obj.proxy_login, &obj.proxy_password) {
        Socks5Stream::connect_with_password(proxy_addr, target_addr, user, pass)
    } else {
        Socks5Stream::connect(proxy_addr, target_addr)
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| process_error(&format!("SOCKS5 error: {}", e)))
}

fn connect_via_socks4(obj: &AddIn, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let stream = if let Some(user) = &obj.proxy_login {
        Socks4Stream::connect(proxy_addr, target_addr, user)
    } else {
        Socks4Stream::connect(proxy_addr, target_addr, "")
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| process_error(&format!("SOCKS4 error: {}", e)))
}

fn connect_via_http_proxy(
    obj: &AddIn,
    proxy_addr: &str,
    target_addr: (&str, u16),
) -> Result<TcpStream, String> {

    let mut stream = TcpStream::connect(proxy_addr)
        .map_err(|e| process_error(&format!("Failed to connect to HTTP proxy: {}", e)))?;

    // CONNECT
    let host_port = format!("{}:{}", target_addr.0, target_addr.1);
    let request = format!(
        "CONNECT {} HTTP/1.1\r\nHost: {}\r\n",
        host_port, host_port
    );

    // Auth
    if let (Some(user), Some(pass)) = (&obj.proxy_login, &obj.proxy_password) {

        let auth = general_purpose::STANDARD.encode(&format!("{}:{}", user, pass));
        let auth_line = format!("Proxy-Authorization: Basic {}\r\n", auth);
        let request = request + &auth_line + "\r\n";

        stream.write_all(request.as_bytes())
            .map_err(|e| process_error(&format!("Failed to send CONNECT request: {}", e)))?;
    } else {

        stream.write_all(request.as_bytes())
            .map_err(|e| process_error(&format!("Failed to send CONNECT request: {}", e)))?;
        stream.write_all(b"\r\n")
            .map_err(|e| process_error(&format!("Failed to send CONNECT end: {}", e)))?;
    }

    // Response
    let reader = BufReader::new(&stream);
    let mut lines = reader.lines();

    // Первая строка: статус
    let status_line = match lines.next() {
        Some(Ok(line)) => line,
        _ => return Err(process_error("Empty or invalid response from proxy")),
    };

    if !status_line.starts_with("HTTP/") {
        return Err(process_error(&format!("Invalid HTTP response: {}", status_line)));
    }

    let parts: Vec<&str> = status_line.split_whitespace().collect();
    if parts.len() < 2 {
        return Err(process_error("Malformed HTTP status line"));
    }

    match parts[1] {
        "200" => {}
        "407" => return Err(process_error("Proxy authentication required")),
        code => return Err(process_error(&format!("Unexpected HTTP proxy response code: {}", code))),
    }

    for line in lines {
        let line = line.map_err(|e| process_error(&format!("Error reading header: {}", e)))?;
        if line.is_empty() {
            break;
        }
    }

    Ok(stream)
}

fn connect_direct(obj: &AddIn) -> Result<TcpStream, String> {
    let addr = format!("{}:{}", &obj.domain, &obj.port);
    TcpStream::connect(&addr).map_err(|e| process_error(&format!("Direct connection error: {}", e)))
}