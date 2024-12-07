use addin1c::{name, ParamValue, RawAddin, Tm, Variant};
use std::io::{self, Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;
use native_tls::{TlsConnector, TlsStream};

// Свойства объекта
const PROPS: &[&[u16]] = &[
    name!("Адрес"),
    name!("Порт"),
    name!("SSL")

];

// Объявление методов
const METHODS: &[&[u16]] = &[
    name!("ОтправитьСообщение")
];

// Определение типов свойств
pub struct OpiTcp {
    address: String,
    port: i32,
    ssl: bool
}

// Конструктор
impl OpiTcp {
    pub fn new() -> OpiTcp {
        OpiTcp {
            address: String::from(""),
            port: 0,
            ssl: false
        }
    }
}

// Обработка удаления объекта
impl Drop for OpiTcp {
    fn drop(&mut self) {}
}

// Определение класса
impl RawAddin for OpiTcp {
    fn register_extension_as(&mut self) -> &'static [u16] {
        name!("Client")
    }

    fn get_n_props(&mut self) -> usize {
        PROPS.len()
    }

    fn find_prop(&mut self, name: &[u16]) -> Option<usize> {
        PROPS.iter().position(|&x| x == name)
    }

    fn get_prop_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> {
        PROPS.get(num).copied()
    }

    // Геттеры
    fn get_prop_val(&mut self, num: usize, val: &mut Variant) -> bool {
        match num {
            0 => {
                let s: Vec<u16> = self.address.encode_utf16().collect();
                return val.set_str(s.as_slice());
            }
            1 => val.set_i32(self.port),
            2 => val.set_bool(self.ssl),
            _ => return false,
        };
        true
    }

    // Сеттеры
    fn set_prop_val(&mut self, num: usize, val: &ParamValue) -> bool {
        match num {
            0 => match val {
                ParamValue::Str(x) => {
                    self.address = String::from_utf16(x).unwrap();
                    true
                }
                _ => false,
            },
            1 => match val {
                ParamValue::I32(x) => {
                    self.port = *x;
                    true
                }
                _ => false,
            },
            2 => match val {
                ParamValue::Bool(x) =>{
                    self.ssl = *x;
                    true
                }
                _ => false,
            }
            _ => false,
        }
    }

    fn is_prop_readable(&mut self, _num: usize) -> bool {
        true
    }

    fn is_prop_writable(&mut self, num: usize) -> bool {
        match num {
            0 => true,
            1 => true,
            2 => true,
            _ => false,
        }
    }

    fn get_n_methods(&mut self) -> usize {
        METHODS.len()
    }

    fn find_method(&mut self, name: &[u16]) -> Option<usize> {
        METHODS.iter().position(|&x| x == name)
    }

    fn get_method_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> {
        METHODS.get(num).copied()
    }

    fn get_n_params(&mut self, num: usize) -> usize {
        match num {
            0 => 2,
            _ => 0,
        }
    }

    fn get_param_def_value(
        &mut self,
        _method_num: usize,
        _param_num: usize,
        _value: Variant,
    ) -> bool {
        true
    }

    fn has_ret_val(&mut self, num: usize) -> bool {
        match num {
            0 => true,
            _ => false,
        }
    }

    fn call_as_proc(&mut self, _num: usize, _params: &mut [Variant]) -> bool {
        false
    }

    fn call_as_func(
        &mut self,
        num: usize,
        params: &mut [Variant],
        ret_value: &mut Variant,
    ) -> bool {
        match num {
            0 => {
                // Проверяем, является ли первый параметр строкой или бинарными данными
                let message: Vec<u8> = match params.get(0).map(|p| p.get()) {
                    Some(ParamValue::Str(str_message)) => {
                        // Преобразуем строку из &[u16] в Vec<u8>
                        String::from_utf16(str_message)
                            .unwrap_or_default()
                            .into_bytes()
                    },
                    Some(ParamValue::Blob(blob_message)) => {
                        // Просто передаем бинарные данные
                        blob_message.to_vec()
                    },
                    _ => return false, // Неверный тип данных
                };

                // Извлекаем таймаут из второго параметра
                let ParamValue::I32(timeout) = params.get(1).map(|p| p.get()).unwrap_or(ParamValue::I32(0)) else {
                    return false; // Неверный тип для таймаута
                };

                // Вызываем send_message с address, port, извлечённым message и timeout
                send_message(&self.address, self.port, &message, timeout as u64, self.ssl, ret_value)
            },
            _ => false,
        }
    }
}

fn to_utf16(input: &str) -> Vec<u16> {
    input.encode_utf16().collect()
}

pub fn send_message(
    address: &str,
    port: i32,
    message: &dyn AsRef<[u8]>,
    timeout_secs: u64,
    use_ssl: bool,
    ret_value: &mut Variant,
) -> bool {
    let addr = format!("{}:{}", address, port);

    // Устанавливаем таймаут
    let timeout = Duration::from_secs(timeout_secs);

    // Создаем TCP соединение
    let stream = TcpStream::connect_timeout(&addr.to_socket_addrs().unwrap().next().unwrap(), timeout);
    let stream = match stream {
        Ok(s) => s,
        Err(e) => {
            ret_value.set_str(&to_utf16(&format!("Failed to connect: {}", e)));
            return true;
        }
    };

    // Применяем таймауты к потокам чтения и записи
    if let Err(e) = stream.set_read_timeout(Some(timeout)) {
        ret_value.set_str(&to_utf16(&format!("Failed to set read timeout: {}", e)));
        return true;
    }
    if let Err(e) = stream.set_write_timeout(Some(timeout)) {
        ret_value.set_str(&to_utf16(&format!("Failed to set write timeout: {}", e)));
        return true;
    }

    // Обрабатываем SSL при необходимости
    let mut stream = if use_ssl {
        let connector = match TlsConnector::new() {
            Ok(c) => c,
            Err(e) => {
                ret_value.set_str(&to_utf16(&format!("Failed to create TLS connector: {}", e)));
                return true;
            }
        };
        match connector.connect(address, stream) {
            Ok(s) => StreamWrapper::Secure(s),
            Err(e) => {
                ret_value.set_str(&to_utf16(&format!("Failed to establish SSL connection: {}", e)));
                return true;
            }
        }
    } else {
        StreamWrapper::Plain(stream)
    };

    // Отправляем сообщение
    if let Err(e) = stream.write_all(message.as_ref()) {
        ret_value.set_str(&to_utf16(&format!("Failed to send message: {}", e)));
        return true;
    }

    // Читаем ответ
    let mut response = Vec::new();
    match stream.read_to_end(&mut response) {
        Ok(_) => {
            match String::from_utf8(response) {
                Ok(s) => {
                    let _ = ret_value.set_str(&to_utf16(&s));
                }
                Err(e) => {
                    let _ = ret_value.set_str(&to_utf16(&format!("Failed to decode response: {}", e)));
                }
            }
            true
        }
        Err(e) => {
            ret_value.set_str(&to_utf16(&format!("Failed to read response: {}", e)));
            true
        }
    }
}

enum StreamWrapper {
    Plain(TcpStream),
    Secure(TlsStream<TcpStream>),
}

impl Read for StreamWrapper {
    fn read(&mut self, buf: &mut [u8]) -> io::Result<usize> {
        match self {
            StreamWrapper::Plain(stream) => stream.read(buf),
            StreamWrapper::Secure(stream) => stream.read(buf),
        }
    }
}

impl Write for StreamWrapper {
    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
        match self {
            StreamWrapper::Plain(stream) => stream.write(buf),
            StreamWrapper::Secure(stream) => stream.write(buf),
        }
    }

    fn flush(&mut self) -> io::Result<()> {
        match self {
            StreamWrapper::Plain(stream) => stream.flush(),
            StreamWrapper::Secure(stream) => stream.flush(),
        }
    }
}