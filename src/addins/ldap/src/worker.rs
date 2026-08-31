use std::sync::mpsc::Sender;
use std::sync::Arc;
use std::time::Duration;

use common_backend::SyncBackendThread;
use common_core::JanxValue;
use common_logs::Logger;
use common_tcp::tls_settings::TlsSettings;
use common_utils::utils::{janx_error, janx_success};
use ldap3::{LdapConn, LdapConnSettings, SearchEntry};

use crate::operations::{
    parse_add_params, parse_compare_params, parse_modify_params, parse_search_params,
    search_entry_to_janx,
};
use crate::settings::ConnectionSettings;

pub enum WorkerCommand {
    Connect {
        settings: ConnectionSettings,
        tls_settings: Option<TlsSettings>,
        response: Sender<Result<(), String>>,
    },
    Disconnect {
        response: Sender<Result<(), String>>,
    },
    Search {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    Add {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    Modify {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    Delete {
        dn: String,
        response: Sender<JanxValue>,
    },
    Compare {
        params: JanxValue,
        response: Sender<JanxValue>,
    },
    SetLogger {
        logger: Arc<Logger>,
        response: Sender<Result<(), String>>,
    },
    IsConnected {
        response: Sender<bool>,
    },
    Shutdown,
}

struct Session {
    logger: Option<Arc<Logger>>,
    ldap: Option<LdapConn>,
    settings: Option<ConnectionSettings>,
    tls_settings: Option<TlsSettings>,
}

impl Session {
    fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            logger,
            ldap: None,
            settings: None,
            tls_settings: None,
        }
    }

    fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            common_logs::log!(logger, "{}", message);
        }
    }

    fn require_ldap(&mut self) -> Result<&mut LdapConn, JanxValue> {
        self.ldap
            .as_mut()
            .ok_or_else(|| janx_error("Not connected to LDAP server"))
    }

    fn connect(
        &mut self,
        settings: &ConnectionSettings,
        tls_settings: Option<TlsSettings>,
    ) -> Result<(), String> {
        if self.ldap.is_some() {
            return Err("Connection already initialized".to_string());
        }

        self.log(&format!("Connecting to LDAP server {}", settings.url));

        let mut conn_settings = LdapConnSettings::new();

        if settings.timeout > 0 {
            conn_settings =
                conn_settings.set_conn_timeout(Duration::from_secs(settings.timeout as u64));
        }

        if let Some(ref tls) = tls_settings {
            if tls.accept_invalid_certs {
                conn_settings = conn_settings.set_no_tls_verify(true);
            }
            if tls.use_tls && settings.url.starts_with("ldap://") {
                conn_settings = conn_settings.set_starttls(true);
            }
        }

        let mut ldap =
            LdapConn::with_settings(conn_settings, &settings.url).map_err(|e| e.to_string())?;

        if settings.timeout > 0 {
            ldap.with_timeout(Duration::from_secs(settings.timeout as u64));
        }

        let bind_result = ldap
            .simple_bind(&settings.bind_dn, &settings.password)
            .map_err(|e| e.to_string())?;

        if bind_result.rc != 0 {
            return Err(format!(
                "LDAP bind failed with code {}: {}",
                bind_result.rc, bind_result.text
            ));
        }

        self.ldap = Some(ldap);
        self.settings = Some(settings.clone());
        self.tls_settings = tls_settings;
        self.log("Connected to LDAP server");

        Ok(())
    }

    fn disconnect(&mut self) -> Result<(), String> {
        self.log("Disconnecting from LDAP server");
        self.ldap.take();
        self.settings.take();
        self.tls_settings.take();
        Ok(())
    }

    fn search(&mut self, params: &JanxValue) -> JanxValue {
        let (base, scope, filter, attributes) = match parse_search_params(params) {
            Ok(value) => value,
            Err(e) => return janx_error(e),
        };

        self.log(&format!("Search base='{}' filter='{}'", base, filter));

        let ldap = match self.require_ldap() {
            Ok(value) => value,
            Err(e) => return e,
        };

        match ldap.search(&base, scope, &filter, attributes) {
            Ok(result) => match result.success() {
                Ok((entries, _ldap_result)) => {
                    let data = entries
                        .into_iter()
                        .map(SearchEntry::construct)
                        .map(search_entry_to_janx)
                        .collect::<Vec<_>>();
                    janx_success(Some(JanxValue::Array(data)), Some("data"))
                }
                Err(e) => janx_error(e.to_string()),
            },
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn add(&mut self, params: &JanxValue) -> JanxValue {
        let (dn, attributes) = match parse_add_params(params) {
            Ok(value) => value,
            Err(e) => return janx_error(e),
        };

        self.log(&format!("Add entry '{}'", dn));

        let ldap = match self.require_ldap() {
            Ok(value) => value,
            Err(e) => return e,
        };

        let attrs = crate::operations::to_ldap_attributes(attributes);

        match ldap.add(&dn, attrs) {
            Ok(result) if result.rc == 0 => janx_success(None, None),
            Ok(result) => {
                janx_error(format!("LDAP add failed with code {}: {}", result.rc, result.text))
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn modify(&mut self, params: &JanxValue) -> JanxValue {
        let (dn, changes) = match parse_modify_params(params) {
            Ok(value) => value,
            Err(e) => return janx_error(e),
        };

        self.log(&format!("Modify entry '{}'", dn));

        let ldap = match self.require_ldap() {
            Ok(value) => value,
            Err(e) => return e,
        };

        match ldap.modify(&dn, changes) {
            Ok(result) if result.rc == 0 => janx_success(None, None),
            Ok(result) => {
                janx_error(format!("LDAP modify failed with code {}: {}", result.rc, result.text))
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn delete(&mut self, dn: &str) -> JanxValue {
        self.log(&format!("Delete entry '{}'", dn));

        let ldap = match self.require_ldap() {
            Ok(value) => value,
            Err(e) => return e,
        };

        match ldap.delete(dn) {
            Ok(result) if result.rc == 0 => janx_success(None, None),
            Ok(result) => {
                janx_error(format!("LDAP delete failed with code {}: {}", result.rc, result.text))
            }
            Err(e) => janx_error(e.to_string()),
        }
    }

    fn compare(&mut self, params: &JanxValue) -> JanxValue {
        let (dn, attribute, value) = match parse_compare_params(params) {
            Ok(value) => value,
            Err(e) => return janx_error(e),
        };

        self.log(&format!("Compare entry '{}' attribute '{}'", dn, attribute));

        let ldap = match self.require_ldap() {
            Ok(value) => value,
            Err(e) => return e,
        };

        match ldap.compare(&dn, &attribute, &value) {
            Ok(result) => match result.equal() {
                Ok(equal) => janx_success(Some(JanxValue::Bool(equal)), Some("data")),
                Err(e) => janx_error(e.to_string()),
            },
            Err(e) => janx_error(e.to_string()),
        }
    }
}

pub fn spawn_thread(logger: Option<Arc<Logger>>) -> Result<SyncBackendThread<WorkerCommand>, String> {
    SyncBackendThread::spawn("opi_ldap_backend", move |rx| {
        let mut session = Session::new(logger);

        while let Ok(cmd) = rx.recv() {
            match cmd {
                WorkerCommand::Connect {
                    settings,
                    tls_settings,
                    response,
                } => {
                    let result = session.connect(&settings, tls_settings);
                    if let Err(ref e) = result {
                        session.log(&format!("Connect failed: {}", e));
                    }
                    let _ = response.send(result);
                }
                WorkerCommand::Disconnect { response } => {
                    let _ = response.send(session.disconnect());
                }
                WorkerCommand::Search { params, response } => {
                    let _ = response.send(session.search(&params));
                }
                WorkerCommand::Add { params, response } => {
                    let _ = response.send(session.add(&params));
                }
                WorkerCommand::Modify { params, response } => {
                    let _ = response.send(session.modify(&params));
                }
                WorkerCommand::Delete { dn, response } => {
                    let _ = response.send(session.delete(&dn));
                }
                WorkerCommand::Compare { params, response } => {
                    let _ = response.send(session.compare(&params));
                }
                WorkerCommand::SetLogger { logger, response } => {
                    session.logger = Some(logger);
                    session.log("Logger initialized");
                    let _ = response.send(Ok(()));
                }
                WorkerCommand::IsConnected { response } => {
                    let _ = response.send(session.ldap.is_some());
                }
                WorkerCommand::Shutdown => {
                    session.log("Shutting down LDAP backend");
                    let _ = session.disconnect();
                    break;
                }
            }
        }
    })
}
