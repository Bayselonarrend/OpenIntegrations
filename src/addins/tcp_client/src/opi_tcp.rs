use addin1c::{name, ParamValue, RawAddin, Tm, Variant};
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

// Свойства объекта
const PROPS: &[&[u16]] = &[
    name!("Адрес"),
    name!("Порт")

];

// Объявление методов
const METHODS: &[&[u16]] = &[
    name!("ОтправитьСообщение")
];

// Определение типов свойств
pub struct OpiTcp {
    address: String,
    port: i32,
}

// Конструктор
impl OpiTcp {
    pub fn new() -> OpiTcp {
        OpiTcp {
            address: String::from(""),
            port: 0,
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
            1 => true,
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
                send_message(&self.address, self.port, &message, timeout as u64, ret_value)
            },
            _ => false,
        }
    }
}

fn send_message(
    address: &str,
    port: i32,
    message: &dyn AsRef<[u8]>, // Используем trait, чтобы поддерживать как строку, так и бинарные данные
    timeout_secs: u64,
    ret_value: &mut Variant
) -> bool {
    let server_addr = format!("{}:{}", address, port);

    // Устанавливаем таймауты для подключения и операций чтения/записи
    let timeout = Duration::new(timeout_secs, 0); // Таймаут в секундах

    // Проверка доступности порта на сервере с таймаутом
    match TcpStream::connect_timeout(&server_addr.to_socket_addrs().unwrap().next().unwrap(), timeout) {
        Ok(mut stream) => {
            // Устанавливаем таймауты на операции с соединением
            stream.set_read_timeout(Some(timeout)).unwrap();
            stream.set_write_timeout(Some(timeout)).unwrap();

            // Отправляем сообщение с таймаутом
            match stream.write_all(message.as_ref()) {
                Ok(_) => {
                    let mut buffer = Vec::new();
                    match stream.read_to_end(&mut buffer) {
                        Ok(_) => {
                            // Ответ получен
                            match String::from_utf8(buffer) {
                                Ok(response) => {
                                    ret_value.set_str(response.encode_utf16().collect::<Vec<u16>>().as_slice());
                                    true
                                }
                                Err(_) => {
                                    ret_value.set_str("Неко UTF-8 response".encode_utf16().collect::<Vec<u16>>().as_slice());
                                    true
                                }
                            }
                        }
                        Err(_) => {
                            // Ошибка чтения ответа (таймаут или другая ошибка)
                            ret_value.set_str("Server did not respond in time".encode_utf16().collect::<Vec<u16>>().as_slice());
                            true
                        }
                    }
                }
                Err(_) => {
                    ret_value.set_str("Failed to send message".encode_utf16().collect::<Vec<u16>>().as_slice());
                    true
                }
            }
        }
        Err(_) => {
            // Ошибка подключения (таймаут или сервер не доступен)
            ret_value.set_str("Server is unreachable or connection timeout".encode_utf16().collect::<Vec<u16>>().as_slice());
            true
        }
    }
}