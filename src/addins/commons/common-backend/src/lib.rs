//! Именованный worker-поток с tokio и каналом команд.
//!
//! Panic в handler, ошибки runtime и «мёртвый» поток обрабатываются внутри крейта
//! (`send` / `call` / `shutdown` возвращают `Err`).

mod panic;
mod thread;

pub use thread::BackendThread;
