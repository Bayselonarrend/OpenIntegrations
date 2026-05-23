pub(crate) fn extract_panic_message(panic_info: &Box<dyn std::any::Any + Send>) -> String {
    if let Some(s) = panic_info.downcast_ref::<&str>() {
        s.to_string()
    } else if let Some(s) = panic_info.downcast_ref::<String>() {
        s.clone()
    } else {
        "Unknown panic occurred".to_string()
    }
}

pub(crate) fn catch_panic<F, R>(f: F) -> Result<R, String>
where
    F: FnOnce() -> R,
{
    match std::panic::catch_unwind(std::panic::AssertUnwindSafe(f)) {
        Ok(value) => Ok(value),
        Err(panic_info) => Err(format!(
            "Internal error (panic): {}",
            extract_panic_message(&panic_info)
        )),
    }
}
