pub mod getset;

/// Извлекает сообщение об ошибке из panic payload
/// 
/// # Примеры
/// 
/// ```rust
/// use common_core::extract_panic_message;
/// 
/// let result = std::panic::catch_unwind(|| {
///     panic!("Something went wrong");
/// });
/// 
/// if let Err(panic_info) = result {
///     let msg = extract_panic_message(&panic_info);
///     println!("Panic: {}", msg);
/// }
/// ```
pub fn extract_panic_message(panic_info: &Box<dyn std::any::Any + Send>) -> String {
    if let Some(s) = panic_info.downcast_ref::<&str>() {
        s.to_string()
    } else if let Some(s) = panic_info.downcast_ref::<String>() {
        s.clone()
    } else {
        "Unknown panic occurred".to_string()
    }
}

/// Макрос для генерации реализации RawAddin с защитой от panic
/// 
/// # Использование
/// 
/// ```rust
/// use common_core::impl_raw_addin;
/// use crate::component::{AddIn, METHODS, PROPS, get_params_amount, cal_func};
/// 
/// impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);
/// ```
#[macro_export]
macro_rules! impl_raw_addin {
    ($addin_type:ty, $methods:expr, $props:expr, $get_params_fn:expr, $cal_func_fn:expr) => {
        impl addin1c::RawAddin for $addin_type {
            fn register_extension_as(&mut self) -> &'static [u16] {
                addin1c::name!("Main")
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

            fn get_prop_val(&mut self, num: usize, val: &mut addin1c::Variant) -> bool {
                let field: &dyn $crate::getset::ValueType = &self[num];
                field.get_value(val)
            }

            fn set_prop_val(&mut self, num: usize, val: &addin1c::Variant) -> bool {
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
                $get_params_fn(num)
            }

            fn get_param_def_value(
                &mut self,
                _method_num: usize,
                _param_num: usize,
                _value: addin1c::Variant,
            ) -> bool {
                true
            }

            fn has_ret_val(&mut self, _num: usize) -> bool {
                true
            }

            fn call_as_proc(&mut self, _num: usize, _params: &mut [addin1c::Variant]) -> bool {
                false
            }

            fn call_as_func(
                &mut self,
                num: usize,
                params: &mut [addin1c::Variant],
                ret_value: &mut addin1c::Variant,
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
