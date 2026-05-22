//! Запуск worker-потоков addin с tokio и перехватом panic.
//!
//! - [`spawn_tokio_backend_thread`] оборачивает **весь** цикл обработки команд.
//! - [`run_worker_command`] (и макрос [`guard_worker_command!`]) — **одну** итерацию `match`,
//!   чтобы поток продолжал работу после panic в отдельной команде.

use std::sync::mpsc::{self, Receiver, Sender};
use std::thread::{self, JoinHandle};

use crate::catch_panic;

/// Создаёт канал команд и именованный поток с tokio `Runtime`.
///
/// При ошибке создания runtime или panic в `handler` поток завершается с записью в stderr;
/// процесс 1С не затрагивается (panic не пробрасывается за пределы потока).
///
/// Возвращает `(Sender, Option<JoinHandle>)`. `None` у handle — поток не был запущен.
pub fn spawn_tokio_backend_thread<C, F>(
    thread_name: impl AsRef<str>,
    handler: F,
) -> (Sender<C>, Option<JoinHandle<()>>)
where
    C: Send + 'static,
    F: FnOnce(tokio::runtime::Runtime, Receiver<C>) + Send + 'static,
{
    let (tx, rx) = mpsc::channel();
    let name = thread_name.as_ref().to_string();

    let thread_handle = thread::Builder::new().name(name.clone()).spawn(move || {
        let rt = match tokio::runtime::Runtime::new() {
            Ok(rt) => rt,
            Err(e) => {
                eprintln!(
                    "Failed to create tokio runtime for {}: {}",
                    name, e
                );
                return;
            }
        };

        if let Err(message) = catch_panic(|| handler(rt, rx)) {
            eprintln!(
                "Backend thread {} terminated after panic: {}",
                name, message
            );
        }
    });

    match thread_handle {
        Ok(handle) => (tx, Some(handle)),
        Err(e) => {
            eprintln!(
                "Failed to spawn backend thread {}: {}",
                thread_name.as_ref(),
                e
            );
            (tx, None)
        }
    }
}

/// Одна итерация обработки команды внутри `while let Ok(cmd) = rx.recv()`.
///
/// При panic возвращает `Err` с текстом `Internal error (panic): ...` — вызывающий код
/// должен отправить ответ в `response` канал команды.
pub fn run_worker_command<F, R>(f: F) -> Result<R, String>
where
    F: FnOnce() -> R,
{
    catch_panic(f)
}

/// Запускает именованный tokio worker-поток (см. [`spawn_tokio_backend_thread`]).
///
/// # Пример
///
/// ```ignore
/// let (tx, thread_handle) = spawn_tokio_backend_thread!("opi_mssql_backend", |rt, rx| {
///     while let Ok(cmd) = rx.recv() {
///         match cmd { /* ... */ }
///     }
/// });
/// ```
#[macro_export]
macro_rules! spawn_tokio_backend_thread {
    ($name:expr, |$rt:ident, $rx:ident| $body:expr) => {
        $crate::spawn_tokio_backend_thread($name, |$rt, $rx| $body)
    };
}

/// Выполняет тело одной команды внутри [`run_worker_command`].
///
/// При panic пишет в stderr и раскрывается в `Err(message)` — удобно с `if let Err(message) = ...`
/// и отправкой ошибки в канал ответа команды.
///
/// # Пример
///
/// ```ignore
/// BackendCommand::Connect { response, .. } => {
///     if let Err(message) = guard_worker_command!(|| {
///         // ...
///         let _ = response.send(ok_or_err);
///     }) {
///         let _ = response.send(json_error(&message));
///     }
/// }
/// ```
#[macro_export]
macro_rules! guard_worker_command {
    ($body:expr) => {
        $crate::run_worker_command(|| $body)
    };
}
