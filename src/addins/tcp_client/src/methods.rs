use std::io::{Read, Write};
use std::net::{Shutdown};
use std::time::{Duration, Instant};
use crate::{AddIn, Connection};

impl AddIn {
    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> bool {
        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                self.save_error("No connection found!");
                return false
            }
        };

        if timeout_ms > 0 {
            let timeout = Duration::from_millis(timeout_ms as u64);
            let tm_result = match connection {
                Connection::Plain(tcp_stream) => tcp_stream.set_write_timeout(Some(timeout)),
                Connection::Tls(tls_stream) => tls_stream.get_ref().set_write_timeout(Some(timeout)),
            };

            match tm_result {
                Err(e) => {
                    self.save_error(&e.to_string());
                    return false
                },
                _ => true
            };
        };

        match connection {
            Connection::Plain(tcp_stream) => match tcp_stream.write(&data) {
                Ok(_) => tcp_stream.flush().is_ok(),
                Err(e) => {
                    self.save_error(&e.to_string());
                    false
                },
            },
            Connection::Tls(tls_stream) => match tls_stream.write(&data) {
                Ok(_) => tls_stream.flush().is_ok(),
                Err(e) => {
                    self.save_error(&e.to_string());
                    false
                },
            }
        }
    }

    pub fn receive(
        &mut self,
        max_data_size: i32,
        end_marker: Vec<u8>,
        timeout_ms: i32,
    ) -> Vec<u8> {
        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                return {
                    self.save_error("No connection found!");
                    vec![]
                };
            }
        };

        const BUFFER_SIZE: usize = 1024;
        const MIN_READ_TIMEOUT_MS: u64 = 200;

        let mut result = Vec::new();
        let mut buffer = vec![0u8; BUFFER_SIZE];

        let total_timeout = Duration::from_millis(timeout_ms as u64);
        let start_time = Instant::now();
        let min_read_timeout = Duration::from_millis(MIN_READ_TIMEOUT_MS);
        let marker_exists = !end_marker.is_empty();

        let connection_result = match connection {
            Connection::Plain(tcp_stream) => tcp_stream.set_read_timeout(Some(min_read_timeout)),
            Connection::Tls(tls_stream) => tls_stream.get_ref().set_read_timeout(Some(min_read_timeout))
        };

        match connection_result {
            Err(e) => {
                self.save_error(&e.to_string());
                return vec![];
            },
            _ => {}
        }

        loop {
            if start_time.elapsed() >= total_timeout {
                break;
            }

            if max_data_size > 0 && result.len() >= max_data_size as usize {
                break;
            }

            let read_result = match connection {
                Connection::Plain(tcp_stream) => tcp_stream.read(&mut buffer),
                Connection::Tls(tls_stream) => tls_stream.read(&mut buffer),
            };

            match read_result {
                Ok(0) => break,
                Ok(size) => {
                    result.extend_from_slice(&buffer[..size]);

                    if marker_exists && result.ends_with(&end_marker) {
                        break;
                    }
                }
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => continue,
                Err(e) => {
                    self.save_error(&e.to_string());
                    break
                },
            }
        }
        result
    }

    pub fn disconnect(&mut self) -> bool {
        self.connection = None;
        true
    }

    pub fn close_output(&mut self) -> bool {
        let connection = match &mut self.connection {
            Some(connection) => connection,
            None => {
                return {
                    self.save_error("No connection found!");
                    false
                };
            }
        };

        match connection {
            Connection::Plain(tcp_stream) => tcp_stream.shutdown(Shutdown::Write).is_ok(),
            Connection::Tls(tls_stream) => tls_stream.shutdown().is_ok()
        }
    }
}
