use std::path::Path;

use common_tcp::tcp_establish::create_tcp_connection;
use common_utils::utils::json_error;
use ssh2::{MethodType, Session};

use crate::connection_response::ConnectionResponse;
use crate::keyboard_interactive::KeyboardInteractiveHandler;
use crate::ssh_settings::{SshAuthTypes, SshConf};

pub fn establish(conf: &SshConf) -> (Option<Session>, String) {
    let settings = match &conf.set {
        Some(settings) => settings,
        None => return (None, json_error("No settings found")),
    };

    let username = &settings.username;
    let password = settings.password.as_deref().unwrap_or("");
    let passphrase = &settings.passphrase;
    let key_path = &settings.key_path;
    let pub_path = &settings.pub_path;
    let proxy = &conf.proxy;

    let tcp = match create_tcp_connection(&settings.host, settings.port, proxy) {
        Ok(tcp) => tcp,
        Err(e) => return (None, json_error(format!("TCP error: {}", e))),
    };

    ssh2::init();

    let mut sess = match Session::new() {
        Ok(sess) => sess,
        Err(e) => return (None, json_error(format!("Session error: {}", e))),
    };

    sess.set_tcp_stream(tcp);
    sess.trace(ssh2::TraceFlags::AUTH | ssh2::TraceFlags::CONN | ssh2::TraceFlags::ERROR);

    if let Err(e) = sess.handshake() {
        return (
            None,
            ConnectionResponse::new(false)
                .with_error(format!("Handshake error: {}", e))
                .to_json(),
        );
    }

    let mut identities = vec![];
    let methods = sess.auth_methods(username).unwrap_or("").to_string();
    let banner = sess.banner().unwrap_or("").to_string();
    let kex = sess.methods(MethodType::Kex).unwrap_or("").to_string();

    match sess.agent() {
        Ok(agent) => match agent.identities() {
            Ok(idents) => {
                for ident in idents {
                    identities.push(ident.comment().to_string());
                }
            }
            Err(e) => identities.push(e.to_string()),
        },
        Err(e) => identities.push(e.to_string()),
    }

    let mut kb_handler = if matches!(settings.auth_type, SshAuthTypes::KeyboardInteractive) {
        let responses = match &settings.keyboard_responses {
            Some(responses) => responses.clone(),
            None => {
                return (
                    None,
                    json_error(
                        "No keyboard_responses provided with keyboard_interactive auth type",
                    ),
                )
            }
        };
        if responses.is_empty() {
            return (None, json_error("keyboard_responses array is empty"));
        }
        Some(KeyboardInteractiveHandler::new(responses))
    } else {
        None
    };

    let (auth_success, kb_info) = match settings.auth_type {
        SshAuthTypes::Password => (sess.userauth_password(username, password), None),
        SshAuthTypes::Agent => (sess.userauth_agent(username), None),
        SshAuthTypes::PrivateKey => {
            let path = match key_path {
                Some(key_path) => key_path.as_ref(),
                None => return (None, json_error("No key path provided with PK auth type")),
            };

            let pub_path = match pub_path {
                Some(pub_path) => Some(Path::new(pub_path)),
                None => None,
            };

            (
                sess.userauth_pubkey_file(username, pub_path, path, passphrase.as_deref()),
                None,
            )
        }
        SshAuthTypes::KeyboardInteractive => {
            let handler = kb_handler.as_mut().unwrap();
            let result = sess.userauth_keyboard_interactive(username, handler);
            let prompts = handler.get_prompts();
            let callback_count = handler.get_callback_count();
            let responses_count = handler.get_responses_count();
            (
                result,
                Some((prompts, callback_count, responses_count)),
            )
        }
    };

    let (result, error, session) = if let Err(e) = auth_success {
        (false, Some(format!("Auth error: {}", e)), None)
    } else if !sess.authenticated() {
        (
            false,
            Some("Authentication failed with no errors".to_string()),
            None,
        )
    } else {
        (true, None, Some(sess))
    };

    let (kb_prompts, kb_callback_count, kb_responses_count) = match kb_info {
        Some((prompts, count, resp_count)) => (Some(prompts), Some(count), Some(resp_count)),
        None => (None, None, None),
    };

    let mut response = ConnectionResponse::new(result)
        .with_identities(identities)
        .with_methods(methods)
        .with_banner(banner)
        .with_kex_methods(kex);

    if let Some(err) = error {
        response = response.with_error(err);
    }

    if let (Some(prompts), Some(cb_count), Some(resp_count)) =
        (kb_prompts, kb_callback_count, kb_responses_count)
    {
        response = response.with_keyboard_info(prompts, cb_count, resp_count);
    }

    (session, response.to_json())
}
