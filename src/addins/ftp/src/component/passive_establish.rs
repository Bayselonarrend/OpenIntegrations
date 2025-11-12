use std::net::{SocketAddr, TcpStream, ToSocketAddrs};
use std::time::Duration;
use suppaftp::FtpError;
use crate::component::configuration::FtpSettings;
use std::vec::IntoIter;
use common_tcp::proxy_settings::ProxySettings;
use common_tcp::tcp_establish::create_tcp_connection;

pub fn make_passive_proxy_stream(
    ftp_settings: &FtpSettings,
    proxy_settings: &Option<ProxySettings>,
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

pub fn create_tcp_connection_for_passive(proxy_settings: &Option<ProxySettings>, addr: SocketAddr) -> Result<TcpStream, String> {
    let ip = addr.ip().to_string();
    create_tcp_connection(ip.as_str(), addr.port(), proxy_settings)
}

fn get_socket_addr(host: &str, port: u16) -> Result<IntoIter<SocketAddr>, String> {
    let host_and_port = format!("{}:{}", host, port);
    host_and_port.to_socket_addrs().map_err(|e| e.to_string())
}

