use crate::component::AddIn;
use rcon_client::{AuthRequest, RCONClient, RCONConfig, RCONRequest};
use serde_json;
use serde_json::json;

pub fn connect(obj: &mut AddIn, url: &str, password: &str, read_timeout: i32, write_timeout: i32) -> String {

    let mut client = match RCONClient::new(RCONConfig {

        url: url.to_string(),
        read_timeout: Some(read_timeout as u64),
        write_timeout: Some(write_timeout as u64),

    }){
        Ok(client) => client,
        Err(e) => {return process_error(e.to_string())}
    };

    let auth_result = match client.auth(AuthRequest::new(password.to_string())){
        Ok(auth_result) => auth_result,
        Err(e) => {return process_error(e.to_string())}
    };

    match auth_result.is_success(){
        true => {
            obj.client = Some(client);
            json!({"result": true}).to_string()
        }
        false => {
            let response_type = auth_result.response_type;
            process_error(format!("Unexpected authorisation rejection (type {})", response_type))
        }
    }
}

pub fn execute_command(obj: &mut AddIn, command: &str) -> String {

    if let Some(client) = &mut obj.client {

        match client.execute(RCONRequest::new(command.to_string())){
            Ok(response) => { process_success(response.body) }
            Err(e) => { process_error(e.to_string()) }
        }
    }else{
        process_error("No client found. Initialize connection first".to_string())
    }
}

fn process_error(e: String) -> String {
    json!({"result": false, "error": e}).to_string()
}

fn process_success(data: String) -> String {
    json!({"result": true, "data": data}).to_string()
}

