use std::sync::Arc;
use common_logs::{log, Logger};
use zeromq::Socket;
use crate::backend::ExchangeScheme;
use crate::backend::socket::OpenSocket;

pub(crate) struct BackendState {
    pub(crate) socket: OpenSocket,
    pub(crate) logger: Option<Arc<Logger>>,
}

impl BackendState {
    pub(crate) fn new(logger: Option<Arc<Logger>>) -> Self {
        Self {
            socket: OpenSocket::None,
            logger,
        }
    }

    pub(crate) fn log(&self, message: &str) {
        if let Some(ref logger) = self.logger {
            log!(logger, "{}", message);
        }
    }

    pub(crate) fn scheme_label(scheme: ExchangeScheme) -> &'static str {
        match scheme {
            ExchangeScheme::ReqRep => "REQ/REP",
            ExchangeScheme::PubSub => "PUB/SUB",
            ExchangeScheme::Push => "PUSH",
            ExchangeScheme::Pull => "PULL",
        }
    }

    pub(crate) fn is_busy(&self) -> bool {
        !matches!(self.socket, OpenSocket::None)
    }

    pub(crate) fn close_async(&mut self, rt: &tokio::runtime::Runtime) {
        self.log("Closing socket");
        match std::mem::replace(&mut self.socket, OpenSocket::None) {
            OpenSocket::None => {}
            OpenSocket::Req(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Rep(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Pub(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Sub(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Push(s) => {
                let _ = rt.block_on(s.close());
            }
            OpenSocket::Pull(s) => {
                let _ = rt.block_on(s.close());
            }
        }
    }
}
