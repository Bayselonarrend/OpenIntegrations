use serde_json::json;

pub struct ConnectionSettings{
    pub url: String,
    pub password: String,
    pub read_timeout: i32,
    pub write_timeout: i32,
}

impl ConnectionSettings{
    pub fn new(url: &str, password: &str, read_timeout: i32, write_timeout: i32) -> ConnectionSettings{
        ConnectionSettings{
            url: url.to_string(),
            password: password.to_string(),
            read_timeout,
            write_timeout,
        }
    }

    pub fn get_settings(&self) -> String{
        json!({
            "url": &self.url,
            "password": &self.password,
            "read_timeout": &self.read_timeout,
            "write_timeout": &self.write_timeout
        }).to_string()
    }
}