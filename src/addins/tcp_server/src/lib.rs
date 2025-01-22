pub mod server;
pub mod handler;
pub mod commons;


use std::{
    ffi::{c_int, c_long, c_void},
    sync::atomic::{AtomicI32, Ordering},
};
use widestring::U16CStr;


use addin1c::{create_component, destroy_component, name, AttachType};

pub static mut PLATFORM_CAPABILITIES: AtomicI32 = AtomicI32::new(-1);

#[allow(non_snake_case)]
#[no_mangle]
pub unsafe extern "C" fn GetClassObject(name: *const u16, component: *mut *mut c_void) -> c_long {

    let u16_name = U16CStr::from_ptr_str(name);
    let rust_name = u16_name.to_string().expect("Invalid UTF-16 string");


    match rust_name.as_str() {
        "Server" => {
            let addin = server::AddIn::new();
            create_component(component, addin)
        },
        "Handler" => {
            let addin = handler::AddIn::new();
            create_component(component, addin)
        },
        _ => 0,
    }

}

#[allow(non_snake_case)]
#[no_mangle]
pub unsafe extern "C" fn DestroyObject(component: *mut *mut c_void) -> c_long {
    destroy_component(component)
}

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn GetClassNames() -> *const u16 {
    name!("Server|Handler").as_ptr()
}

#[allow(non_snake_case)]
#[allow(static_mut_refs)]
#[no_mangle]
pub unsafe extern "C" fn SetPlatformCapabilities(capabilities: c_int) -> c_int {
    PLATFORM_CAPABILITIES.store(capabilities, Ordering::Relaxed);
    3
}

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn GetAttachType() -> AttachType {
    AttachType::Any
}
