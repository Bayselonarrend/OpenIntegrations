use std::io::{BufRead, BufReader, Write};
use std::net::{SocketAddr, TcpStream};
use crate::component::AddIn;
use socks::{Socks4Stream, Socks5Stream};
use base64::{Engine as _, engine::general_purpose};

pub fn create_tcp_connection(obj: &AddIn) -> Result<TcpStream, String> {
    let target_addr = (obj.domain.as_str(), obj.port);
    connect(obj, target_addr)
}

pub fn create_tcp_connection_for_passive(obj: &AddIn, addr: SocketAddr) -> Result<TcpStream, String> {

    let ip = addr.ip().to_string();
    let target_addr = (ip.as_str(), addr.port());
    connect(obj, target_addr)

}

fn connect(
    obj: &AddIn,
    target_addr: (&str, u16)
) -> Result<TcpStream, String> {

    if let (Some(proxy_server), Some(proxy_port), Some(proxy_type)) =
        (&obj.proxy_server, &obj.proxy_port, &obj.proxy_type) {

        let proxy_addr = format!("{}:{}", proxy_server, proxy_port);
        connect_via_proxy(obj, proxy_type, &proxy_addr, target_addr)

    } else {
        connect_direct(target_addr)
    }
}

fn connect_via_proxy(
    obj: &AddIn,
    proxy_type: &str,
    proxy_addr: &str,
    target_addr: (&str, u16)
) -> Result<TcpStream, String> {
    match proxy_type.to_lowercase().as_str() {
        "socks5" => connect_via_socks5(obj, proxy_addr, target_addr),
        "socks4" => connect_via_socks4(obj, proxy_addr, target_addr),
        "http" => connect_via_http_proxy(obj, proxy_addr, target_addr),
        _ => Err("Unsupported proxy type".to_string()),
    }
}


fn connect_via_socks5(obj: &AddIn, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let stream = if let (Some(user), Some(pass)) = (&obj.proxy_login, &obj.proxy_password) {
        Socks5Stream::connect_with_password(proxy_addr, target_addr, user, pass)
    } else {
        Socks5Stream::connect(proxy_addr, target_addr)
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| format!("SOCKS5 error: {}", e))
}

fn connect_via_socks4(obj: &AddIn, proxy_addr: &str, target_addr: (&str, u16)) -> Result<TcpStream, String> {

    let stream = if let Some(user) = &obj.proxy_login {
        Socks4Stream::connect(proxy_addr, target_addr, user)
    } else {
        Socks4Stream::connect(proxy_addr, target_addr, "")
    };

    stream.map(|s| s.into_inner())
        .map_err(|e| format!("SOCKS4 error: {}", e))
}

fn connect_via_http_proxy(
    obj: &AddIn,
    proxy_addr: &str,
    target_addr: (&str, u16),
) -> Result<TcpStream, String> {
    let mut stream = TcpStream::connect(proxy_addr)
        .map_err(|e| format!("Failed to connect to HTTP proxy: {}", e))?;

    let host_port = format!("{}:{}", target_addr.0, target_addr.1);
    let request = format!(
        "CONNECT {} HTTP/1.1\r\nHost: {}\r\n",
        host_port, host_port
    );

    let request = if let (Some(user), Some(pass)) = (&obj.proxy_login, &obj.proxy_password) {
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