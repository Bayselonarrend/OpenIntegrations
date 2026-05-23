//! Именованные worker-потоки с каналом команд.
//!
//! - [`BackendThread`] — с tokio runtime (async-драйверы).
//! - [`SyncBackendThread`] — обычный поток без runtime (синхронные клиенты).
//!
//! Panic в handler и «мёртвый» поток обрабатываются внутри крейта
//! (`send` / `call` / `shutdown` возвращают `Err`).

mod panic;
mod sync_thread;
mod thread;

pub use sync_thread::SyncBackendThread;
pub use thread::BackendThread;
