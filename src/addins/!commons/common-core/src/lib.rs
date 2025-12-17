pub mod getset;
pub mod from_variant;

// Реэкспортируем зависимости
pub use addin1c;
pub use from_variant::FromVariant;

/// Извлекает сообщение об ошибке из panic payload
pub fn extract_panic_message(panic_info: &Box<dyn std::any::Any + Send>) -> String {
    if let Some(s) = panic_info.downcast_ref::<&str>() {
        s.to_string()
    } else if let Some(s) = panic_info.downcast_ref::<String>() {
        s.clone()
    } else {
        "Unknown panic occurred".to_string()
    }
}

/// Макрос для генерации экспортируемых функций Native API
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
        pub unsafe extern "C" fn GetClassObject(_name: *const u16, component: *mut *mut c_void) -> c_long {
            let addin = <$addin_type>::new();
            create_component(component, addin)
        }

        #[allow(non_snake_case)]
        #[no_mangle]
        pub unsafe extern "C" fn DestroyObject(component: *mut *mut c_void) -> c_long {
            destroy_component(component)
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

/// Макрос для генерации реализации RawAddin с защитой от panic
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
                $props.get(num).copied()
            }

            fn get_prop_val(&mut self, num: usize, val: &mut $crate::addin1c::Variant) -> bool {
                let field: &dyn $crate::getset::ValueType = &self[num];
                field.get_value(val)
            }

            fn set_prop_val(&mut self, num: usize, val: &$crate::addin1c::Variant) -> bool {
                let field: &mut dyn $crate::getset::ValueType = &mut self[num];
                field.set_value(val);
                true
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
                $methods.get(num).copied()
            }

            fn get_n_params(&mut self, num: usize) -> usize {
                $get_params_amount(num)
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

            fn call_as_proc(&mut self, _num: usize, _params: &mut [$crate::addin1c::Variant]) -> bool {
                false
            }

            fn call_as_func(
                &mut self,
                num: usize,
                params: &mut [$crate::addin1c::Variant],
                ret_value: &mut $crate::addin1c::Variant,
            ) -> bool {
                // Защита от panic - перехватываем и возвращаем ошибку в 1С
                let result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
                    $cal_func_fn(self, num, params)
                }));

                match result {
                    Ok(value) => {
                        // Нормальное выполнение
                        value.get_value(ret_value)
                    }
                    Err(panic_info) => {
                        // Panic произошёл - извлекаем сообщение и возвращаем как ошибку
                        let panic_msg = $crate::extract_panic_message(&panic_info);
                        let error_msg = format!("Internal error (panic): {}", panic_msg);

                        // Возвращаем ошибку как строку в 1С
                        let s: Vec<u16> = error_msg.encode_utf16().collect();
                        let _ = ret_value.set_str1c(s.as_slice());
                        true
                    }
                }
            }
        }

        // Реализация Index для доступа к полям через []
        impl std::ops::Index<usize> for $addin_type {
            type Output = dyn $crate::getset::ValueType;

            fn index(&self, index: usize) -> &Self::Output {
                unsafe { &*self.get_field_ptr(index) }
            }
        }

        // Реализация IndexMut для изменения полей через []
        impl std::ops::IndexMut<usize> for $addin_type {
            fn index_mut(&mut self, index: usize) -> &mut Self::Output {
                unsafe { &mut *self.get_field_ptr_mut(index) }
            }
        }
    };
}
