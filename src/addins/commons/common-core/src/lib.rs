pub mod from_variant;
pub mod getset;

pub use addin1c;
pub use from_variant::FromVariant;

pub const CREATE_COMPONENT_SUCCESS: i32 = 1;

pub const CREATE_COMPONENT_ERROR: i32 = 0;

pub fn extract_panic_message(panic_info: &Box<dyn std::any::Any + Send>) -> String {
    if let Some(s) = panic_info.downcast_ref::<&str>() {
        s.to_string()
    } else if let Some(s) = panic_info.downcast_ref::<String>() {
        s.clone()
    } else {
        "Unknown panic occurred".to_string()
    }
}

pub fn catch_panic<F, R>(f: F) -> Result<R, String>
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

pub fn set_variant_error(val: &mut addin1c::Variant, message: &str) -> bool {
    let s: Vec<u16> = message.encode_utf16().collect();
    val.set_str1c(s.as_slice()).is_ok()
}

pub fn lock_mutex<T>(mutex: &std::sync::Mutex<T>) -> std::sync::MutexGuard<'_, T> {
    mutex
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
}

#[macro_export]
macro_rules! impl_addin_exports {
    ($addin_type:ty) => {
        use std::{
            ffi::{c_int, c_long, c_void},
            sync::atomic::{AtomicI32, Ordering},
        };
        use $crate::addin1c::{create_component, destroy_component, name, AttachType, Variant};

        pub static mut PLATFORM_CAPABILITIES: AtomicI32 = AtomicI32::new(-1);

        #[allow(non_snake_case)]
        #[no_mangle]
        pub unsafe extern "C" fn GetClassObject(
            _name: *const u16,
            component: *mut *mut c_void,
        ) -> c_long {
            match $crate::catch_panic(|| <$addin_type>::new()) {
                Ok(addin) => create_component(component, addin),
                Err(_) => $crate::CREATE_COMPONENT_ERROR as c_long,
            }
        }

        #[allow(non_snake_case)]
        #[no_mangle]
        pub unsafe extern "C" fn DestroyObject(component: *mut *mut c_void) -> c_long {
            match $crate::catch_panic(|| unsafe { destroy_component(component) }) {
                Ok(code) => code,
                Err(_) => $crate::CREATE_COMPONENT_ERROR as c_long,
            }
        }

        #[allow(non_snake_case)]
        #[no_mangle]
        pub extern "C" fn GetClassNames() -> *const u16 {
            $crate::addin1c::name!("Main").as_ptr()
        }

        #[allow(non_snake_case)]
        #[no_mangle]
        #[allow(static_mut_refs)]
        pub unsafe extern "C" fn SetPlatformCapabilities(capabilities: c_int) -> c_int {
            PLATFORM_CAPABILITIES.store(capabilities, Ordering::Relaxed);
            3
        }

        #[allow(non_snake_case)]
        #[no_mangle]
        pub extern "C" fn GetAttachType() -> $crate::addin1c::AttachType {
            $crate::addin1c::AttachType::Any
        }
    };
}

#[macro_export]
macro_rules! impl_raw_addin {
    ($addin_type:ty, $methods:expr, $props:expr, $get_params_amount:expr, $cal_func_fn:expr) => {
        impl $crate::addin1c::RawAddin for $addin_type {
            fn register_extension_as(&mut self) -> &'static [u16] {
                $crate::addin1c::name!("Main")
            }

            fn get_n_props(&mut self) -> usize {
                $props.len()
            }

            fn find_prop(&mut self, name: &[u16]) -> Option<usize> {
                $props.iter().position(|&x| x == name)
            }

            fn get_prop_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> {
                $crate::catch_panic(|| $props.get(num).copied()).unwrap_or(None)
            }

            fn get_prop_val(&mut self, num: usize, val: &mut $crate::addin1c::Variant) -> bool {
                match $crate::catch_panic(|| {
                    let field: &dyn $crate::getset::ValueType = &self[num];
                    field.get_value(val)
                }) {
                    Ok(result) => result,
                    Err(message) => $crate::set_variant_error(val, &message),
                }
            }

            fn set_prop_val(&mut self, num: usize, val: &$crate::addin1c::Variant) -> bool {
                $crate::catch_panic(|| {
                    let field: &mut dyn $crate::getset::ValueType = &mut self[num];
                    field.set_value(val);
                    true
                })
                .unwrap_or(false)
            }

            fn is_prop_readable(&mut self, _num: usize) -> bool {
                true
            }

            fn is_prop_writable(&mut self, _num: usize) -> bool {
                true
            }

            fn get_n_methods(&mut self) -> usize {
                $methods.len()
            }

            fn find_method(&mut self, name: &[u16]) -> Option<usize> {
                $methods.iter().position(|&x| x == name)
            }

            fn get_method_name(&mut self, num: usize, _alias: usize) -> Option<&'static [u16]> {
                $crate::catch_panic(|| $methods.get(num).copied()).unwrap_or(None)
            }

            fn get_n_params(&mut self, num: usize) -> usize {
                $crate::catch_panic(|| $get_params_amount(num)).unwrap_or(0)
            }

            fn get_param_def_value(
                &mut self,
                _method_num: usize,
                _param_num: usize,
                _value: $crate::addin1c::Variant,
            ) -> bool {
                true
            }

            fn has_ret_val(&mut self, _num: usize) -> bool {
                true
            }

            fn call_as_proc(
                &mut self,
                _num: usize,
                _params: &mut [$crate::addin1c::Variant],
            ) -> bool {
                false
            }

            fn call_as_func(
                &mut self,
                num: usize,
                params: &mut [$crate::addin1c::Variant],
                ret_value: &mut $crate::addin1c::Variant,
            ) -> bool {
                match $crate::catch_panic(|| $cal_func_fn(self, num, params)) {
                    Ok(value) => match $crate::catch_panic(|| value.get_value(ret_value)) {
                        Ok(result) => result,
                        Err(message) => $crate::set_variant_error(ret_value, &message),
                    },
                    Err(message) => $crate::set_variant_error(ret_value, &message),
                }
            }
        }

        impl std::ops::Index<usize> for $addin_type {
            type Output = dyn $crate::getset::ValueType;

            fn index(&self, index: usize) -> &Self::Output {
                unsafe { &*self.get_field_ptr(index) }
            }
        }

        impl std::ops::IndexMut<usize> for $addin_type {
            fn index_mut(&mut self, index: usize) -> &mut Self::Output {
                unsafe { &mut *self.get_field_ptr_mut(index) }
            }
        }
    };
}
