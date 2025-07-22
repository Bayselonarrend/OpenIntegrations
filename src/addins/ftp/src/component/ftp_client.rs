use serde_json::json;
use suppaftp::{FtpStream, NativeTlsFtpStream};

pub enum FtpClient {
    Secure(NativeTlsFtpStream),
    Insecure(FtpStream),
}

impl FtpClient {

    pub fn login(self, user: Option<&str>, pass: Option<&str>) -> Result<FtpClient, String> {

        let user = match user {
            Some(u) => u,
            None => return Ok(self),
        };

        let pass = pass.unwrap_or_else(|| "");

        match self {
            FtpClient::Secure(mut stream) => {

                match stream.login(user, pass){
                    Ok(_) => Ok(FtpClient::Secure(stream)),
                    Err(e) => Err(format_json_error(&e.to_string()))
                }

            }
            FtpClient::Insecure(mut stream) => {
                match stream.login(user, pass){
                    Ok(_) => Ok(FtpClient::Insecure(stream)),
                    Err(e) => Err(format_json_error(&e.to_string()))
                }
            }
        }

    }

    pub fn get_welcome_msg(&self) -> String {
        let msg = match self {
            FtpClient::Secure(stream) => stream.get_welcome_msg().unwrap_or(""),
            FtpClient::Insecure(stream) => stream.get_welcome_msg().unwrap_or(""),
        };

        json!({"result": true, "data": msg}).to_string()
    }

    pub fn make_directory(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.mkdir(path),
            FtpClient::Insecure(stream) => stream.mkdir(path),
        };

        match result {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string())
        }
    }

    pub fn remove_directory(&mut self, path: &str) -> String {

        let result = match self {
            FtpClient::Secure(stream) => stream.rmdir(path),
            FtpClient::Insecure(stream) => stream.rmdir(path),
        };

        match result {
            Ok(_) => json!({"result": true}).to_string(),
            Err(e) => format_json_error(&e.to_string())
        }
    }
}

fn format_json_error<E: ToString>(error: E) -> String {
    let error_message = error.to_string();
    let json_obj = json!({
        "result": false,
        "error": error_message,
    });
    json_obj.to_string()
}