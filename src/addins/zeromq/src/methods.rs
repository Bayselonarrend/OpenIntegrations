use common_core::JanxValue;
use common_janx::janx;
use common_utils::utils::{janx_error, janx_success};

use crate::backend::ExchangeScheme;
use crate::AddIn;

impl AddIn {
    pub(crate) fn connect(&mut self, scheme: ExchangeScheme, endpoint: &str) -> JanxValue {
        let ep = endpoint.trim().to_owned();
        match self.lock_backend().and_then(|g| g.connect(scheme, &ep)) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub(crate) fn bind(&mut self, scheme: ExchangeScheme, port: i32) -> JanxValue {
        let ep = format!("tcp://0.0.0.0:{}", port);
        match self.lock_backend().and_then(|g| g.bind(scheme, &ep)) {
            Ok(bound) => janx!({
                "result": true,
                "endpoint": bound,
            }),
            Err(e) => janx_error(e),
        }
    }

    pub fn subscribe(&mut self, prefix: &str) -> JanxValue {
        match self.lock_backend().and_then(|g| g.subscribe(prefix)) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn send(&mut self, data: Vec<u8>, timeout_ms: i32) -> JanxValue {
        match self
            .lock_backend()
            .and_then(|g| g.send_payload(data, timeout_ms))
        {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }

    pub fn recv(&mut self, timeout_ms: i32) -> JanxValue {
        match self.lock_backend().and_then(|g| g.recv_payload(timeout_ms)) {
            Ok(buf) => {
                let len = buf.len();
                janx!({
                    "result": true,
                    "data": buf,
                    "size": len as i64,
                })
            }
            Err(e) => janx_error(e),
        }
    }

    pub fn close(&mut self) -> JanxValue {
        match self.lock_backend().and_then(|g| g.close_socket()) {
            Ok(()) => janx_success(None, None),
            Err(e) => janx_error(e),
        }
    }
}
