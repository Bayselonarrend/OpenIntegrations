use common_utils::utils::{json_error, json_success};
use crate::component::AddIn;
use rcon_client::{AuthRequest, RCONClient, RCONConfig, RCONRequest};
use serde_json;
use serde_json::json;

pub fn connect(obj: &mut AddIn) -> String {

    let settings = match &obj.settings{
        Some(s) => s,
        None => return json_error("No connection settings found"),
    };

    let url = &settings.url;
    let password = &settings.password;
    let read_timeout = &settings.read_timeout;
    let write_timeout = &settings.write_timeout;

    let mut client = match RCONClient::new(RCONConfig {
        url: url.to_string(),
        read_timeout: Some(*read_timeout as u64),
        write_timeout: Some(*write_timeout as u64),
    }){
        Ok(client) => client,
        Err(e) => {return json_error(&e)}
    };

    let auth_result = match client.auth(AuthRequest::new(password.to_string())){
        Ok(auth_result) => auth_result,
        Err(e) => {return json_error(&e)}
    };

    match auth_result.is_success(){
        true => {
            obj.client = Some(client);
            json_success()
        }
        false => {
            let response_type = auth_result.response_type;
            json_error(format!("Unexpected authorisation rejection (type {})", response_type))
        }
    }
}

pub fn execute_command(obj: &mut AddIn, command: &str) -> String {
    if let Some(client) = &mut obj.client {
        match client.execute(RCONRequest::new(command.to_string())){
            Ok(response) => { process_success(response.body) }
            Err(e) => { json_error(&e) }
        }
    }else{
        json_error("No client found. Initialize connection first")
    }
}

fn process_success(data: String) -> String {
    json!({"result": true, "data": data}).to_string()
}

