use std::io::Read;
use std::path::Path;
use common_tcp::tcp_establish::create_tcp_connection;
use common_utils::utils::{json_error, json_success};
use ssh2::{MethodType, Session};
use crate::AddIn;
use crate::ssh_settings::{SshAuthTypes, SshConf};
use crate::connection_response::ConnectionResponse;
use crate::keyboard_interactive::KeyboardInteractiveHandler;

impl AddIn{
    pub fn set_settings(&mut self, settings: String) -> String{

        let mut conf = self.conf.take().unwrap_or_else(|| SshConf::new());

        match conf.set_settings(settings) {
            Ok(_) => {
                self.conf = Some(conf);
                json_success()
            },
            Err(e) => json_error(&e),
        }
    }

    pub fn set_proxy(&mut self, proxy: String) -> String{

        let mut conf = self.conf.take().unwrap_or_else(|| SshConf::new());

        match conf.set_proxy(proxy) {
            Ok(_) => {
                self.conf = Some(conf);
                json_success()
            },
            Err(e) => json_error(&e),
        }

    }

    pub fn initialize(&mut self) -> String {

        let conf_data = match &self.conf{
            Some(conf_data) => conf_data,
            None => return json_error("No configuration found")
        };

        let settings = match &conf_data.set {
            Some(settings) => settings,
            None => return json_error("No settings found")
        };

        let username= &settings.username;
        let password = settings.password.as_deref().unwrap_or("");
        let passphrase = &settings.passphrase;
        let key_path = &settings.key_path;
        let pub_path = &settings.pub_path;
        let proxy = &conf_data.proxy;

        let tcp = match create_tcp_connection(&settings.host, settings.port, proxy){
            Ok(tcp) => tcp,
            Err(e) => return json_error(format!("TCP error: {}", e.to_string()))
        };

        ssh2::init();

        let mut sess = match Session::new(){
            Ok(sess) => sess,
            Err(e) => return json_error(format!("Session error: {}", e.to_string()))
        };

        sess.set_tcp_stream(tcp);
        
        // Включаем trace для отладки
        sess.trace(ssh2::TraceFlags::AUTH | ssh2::TraceFlags::CONN | ssh2::TraceFlags::ERROR);

        if let Err(e) = sess.handshake() {
            return ConnectionResponse::new(false)
                .with_error(format!("Handshake error: {}", e))
                .to_json();
        };

        let mut identities = vec![];
        let methods = sess.auth_methods(username).unwrap_or("").to_string();
        let banner = sess.banner().unwrap_or("").to_string();
        let kex = sess.methods(MethodType::Kex).unwrap_or("").to_string();

        match sess.agent(){
            Ok(agent) => {
                match agent.identities(){
                    Ok(idents) => {
                        for ident in idents{
                            identities.push(ident.comment().to_string());
                        }
                    }
                    Err(e) => identities.push(e.to_string())
                }
            }
            Err(e) => identities.push(e.to_string())
        };

        // Подготовка keyboard-interactive handler если нужен
        let mut kb_handler = if matches!(settings.auth_type, SshAuthTypes::KeyboardInteractive) {
            let responses = match &settings.keyboard_responses {
                Some(responses) => responses.clone(),
                None => return json_error("No keyboard_responses provided with keyboard_interactive auth type")
            };
            if responses.is_empty() {
                return json_error("keyboard_responses array is empty")
            }
            Some(KeyboardInteractiveHandler::new(responses))
        } else {
            None
        };

        let (auth_success, kb_info) = match settings.auth_type {

            SshAuthTypes::Password => (sess.userauth_password(username, password), None),
            SshAuthTypes::Agent => (sess.userauth_agent(username), None),
            SshAuthTypes::PrivateKey => {

                let path = match key_path{
                    Some(key_path) => key_path.as_ref(),
                    None => return json_error("No key path provided with PK auth type")
                };

                let pub_path = match pub_path{
                    Some(pub_path) => Some(Path::new(pub_path)),
                    None => None
                };

                (sess.userauth_pubkey_file(username, pub_path, path, passphrase.as_deref()), None)
            },
            SshAuthTypes::KeyboardInteractive => {
                let handler = kb_handler.as_mut().unwrap();
                let result = sess.userauth_keyboard_interactive(username, handler);
                let prompts = handler.get_prompts();
                let callback_count = handler.get_callback_count();
                let responses_count = handler.get_responses_count();
                
                (result, Some((prompts, callback_count, responses_count)))
            },

        };

        let (result, error) = if let Err(e) = auth_success {
            (false, Some(format!("Auth error: {}", e)))
        } else if !sess.authenticated() {
            (false, Some("Authentication failed with no errors".to_string()))
        } else {
            self.inner = Some(sess);
            (true, None)
        };

        let (kb_prompts, kb_callback_count, kb_responses_count) = match kb_info {
            Some((prompts, count, resp_count)) => (Some(prompts), Some(count), Some(resp_count)),
            None => (None, None, None)
        };

        let mut response = ConnectionResponse::new(result)
            .with_identities(identities)
            .with_methods(methods)
            .with_banner(banner)
            .with_kex_methods(kex);

        if let Some(err) = error {
            response = response.with_error(err);
        }

        if let (Some(prompts), Some(cb_count), Some(resp_count)) = (kb_prompts, kb_callback_count, kb_responses_count) {
            response = response.with_keyboard_info(prompts, cb_count, resp_count);
        }

        response.to_json()

    }

    pub fn execute(&self, command: &str) -> String {

        let session = match &self.inner{
            Some(sess) => sess,
            None => return json_error("No session"),
        };

        let mut channel = match session.channel_session(){
            Ok(channel) => channel,
            Err(e) => return json_error(&e)
        };

        if let Err(e) = channel.exec(command){
            return json_error(&e);
        };

        let mut stdout = String::new();
        if let Err(e) = channel.read_to_string(&mut stdout).map_err(|e| e.to_string()){
            stdout = e.to_string();
        };

        let mut stderr = String::new();
        if let Err(e) = channel.stderr().read_to_string(&mut stderr).map_err(|e| e.to_string()){
            stderr = e.to_string();
        };

        let exit_code = match channel.wait_close(){
            Ok(_) => channel.exit_status().map_err(|e| e.to_string()),
            Err(e) => Err(e.to_string())
        };

        let code = match exit_code{
            Ok(code) => code.to_string(),
            Err(e) => e.to_string()
        };

        serde_json::json!({"result": true, "exit_code": code, "stdout": stdout, "stderr": stderr}).to_string()
    }

    pub fn get_configuration(&mut self) -> String{
        let conf = match &self.conf{
            Some(conf) => conf,
            None => return json_error("No configuration found")
        };
        serde_json::json!({"result": true, "conf": conf}).to_string()
    }

    pub fn disconnect(&mut self) -> String{
        if let Some(_conn) = self.inner.take() {
            self.sftp.take();
            json_success()
        } else {
            json_error("No session")
        }
    }
}