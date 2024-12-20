use std::net::{TcpListener, TcpStream};
use std::io::{Read, Write};
use std::time::Instant;
use serde_json::json;
use crate::component::AddIn;

pub enum ServerEvent {
    NewConnection(String),
    MessageReceived(String, Vec<u8>),
}

pub fn start_server(addin: &mut AddIn) -> String {

    let addr = format!("0.0.0.0:{}", addin.port);
    let listener = TcpListener::bind(&addr);

    match listener {
        Ok(listener) => {

            let sender = addin.sender.clone();

            std::thread::spawn(move || {
                for stream in listener.incoming() {
                    if let Ok(mut stream) = stream {

                        let addr = stream.peer_addr().unwrap().to_string();
                        sender.send(ServerEvent::NewConnection(addr.clone())).unwrap();
                        let sender = sender.clone();
                        std::thread::spawn(move || {
                            let mut buffer = [0; 1024];
                            while let Ok(bytes_read) = stream.read(&mut buffer) {
                                if bytes_read == 0 {
                                    break;
                                }
                                sender
                                    .send(ServerEvent::MessageReceived(
                                        addr.clone(),
                                        buffer[..bytes_read].to_vec(),
                                    ))
                                    .unwrap();
                            }
                        });
                    }
                }
            });
            "Success".to_string()
        }
        Err(e) => e.to_string(),
    }
}

pub fn await_connections(addin: &mut AddIn, timeout: i32) -> String {
    let start_time = Instant::now();
    let mut active_connections = Vec::new();

    while start_time.elapsed().as_secs() < timeout as u64 {
        if let Ok(event) = addin.receiver.try_recv() {
            match event {
                ServerEvent::NewConnection(addr) => {
                    active_connections.push(addr.clone());
                    addin.connections.insert(addr, TcpStream::connect("127.0.0.1:0").unwrap());
                }
                ServerEvent::MessageReceived(addr, _data) => {
                    if !active_connections.contains(&addr) {
                        active_connections.push(addr);
                    }
                }
            }
        } else {
            std::thread::sleep(std::time::Duration::from_millis(100));
        }
    }

    json!(active_connections).to_string()
}

pub fn receive_message(addin: &mut AddIn, addr: &str) -> Vec<u8> {
    if let Some(stream) = addin.connections.get_mut(addr) {
        let mut buffer = [0; 1024];
        if let Ok(bytes_read) = stream.read(&mut buffer) {
            if bytes_read > 0 {
                return buffer[..bytes_read].to_vec();
            }
        }
    }
    vec![]
}

pub fn send_response(addin: &mut AddIn, addr: &str, data: &[u8]) -> String {
    if let Some(stream) = addin.connections.get_mut(addr) {
        if stream.write_all(data).is_ok() {
            return "Success".to_string();
        }
    }
    "Failed to send response".to_string()
}

pub fn stop(addin: &mut AddIn) -> String {
    addin.connections.clear();
    "Success".to_string()
}