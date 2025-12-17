use proc_macro::TokenStream;
use quote::{quote, ToTokens};
use syn::{parse_macro_input, ItemFn, ItemImpl, ImplItem, FnArg};

#[proc_macro_attribute]
pub fn addin_method(attr: TokenStream, item: TokenStream) -> TokenStream {
    let input_fn = parse_macro_input!(item as ItemFn);
    
    // Парсим атрибуты из строки
    let attr_str = attr.to_string();
    let mut method_name = None;
    
    // Простой парсинг: name = "..."
    for part in attr_str.split(',') {
        let part = part.trim();
        if let Some(value) = part.strip_prefix("name =") {
            method_name = Some(value.trim().trim_matches('"').to_string());
        }
    }
    
    let method_name = method_name.expect("addin_method requires 'name' attribute");
    
    // Сохраняем оригинальную функцию
    let fn_vis = &input_fn.vis;
    let fn_sig = &input_fn.sig;
    let fn_block = &input_fn.block;
    let fn_attrs = &input_fn.attrs;
    
    // Генерируем код - просто возвращаем оригинальную функцию с меткой
    let expanded = quote! {
        #(#fn_attrs)*
        #[doc = #method_name]
        #fn_vis #fn_sig {
            #fn_block
        }
    };
    
    TokenStream::from(expanded)
}

#[proc_macro_attribute]
pub fn register_addin_methods(_attr: TokenStream, item: TokenStream) -> TokenStream {
    let input = parse_macro_input!(item as ItemImpl);
    
    let self_ty = &input.self_ty;
    let mut method_registrations = Vec::new();
    
    // Проходим по всем методам в impl блоке
    for item in &input.items {
        if let ImplItem::Fn(method) = item {
            // Ищем атрибут addin_method
            let mut method_name = None;
            
            for attr in &method.attrs {
                if attr.path().is_ident("addin_method") {
                    // Парсим атрибуты
                    let attr_str = attr.meta.to_token_stream().to_string();
                    
                    for part in attr_str.split(',') {
                        let part = part.trim();
                        if let Some(value) = part.strip_prefix("name =") {
                            method_name = Some(value.trim().trim_matches('"').to_string());
                        }
                    }
                    break;
                }
            }
            
            if method_name.is_none() {
                continue;
            }
            
            let method_name = method_name.unwrap();
            let fn_name = &method.sig.ident;
            
            // Извлекаем параметры (пропускаем self)
            let mut params = Vec::new();
            for input in &method.sig.inputs {
                match input {
                    FnArg::Receiver(_) => continue, // Пропускаем self
                    FnArg::Typed(pat_type) => {
                        params.push(pat_type);
                    }
                }
            }
            
            let param_count = params.len();
            
            // Генерируем имя для функции-обёртки
            let caller_fn = syn::Ident::new(
                &format!("__caller_{}", fn_name),
                fn_name.span()
            );
            
            // Генерируем код извлечения параметров через FromVariant
            let mut param_extractions = Vec::new();
            let mut param_names = Vec::new();
            
            for (i, param) in params.iter().enumerate() {
                let param_name = syn::Ident::new(&format!("p{}", i), fn_name.span());
                param_names.push(param_name.clone());
                
                let ty = &param.ty;
                let ty_str = quote!(#ty).to_string();
                
                // Для &str используем String и конвертируем
                let extraction = if ty_str.contains("&str") {
                    quote! {
                        let #param_name = ::common_core::FromVariant::from_variant(&params[#i]);
                    }
                } else {
                    quote! {
                        let #param_name = ::common_core::FromVariant::from_variant(&params[#i]);
                    }
                };
                
                param_extractions.push(extraction);
            }
            
            // Генерируем вызов метода
            let method_call = if param_names.is_empty() {
                quote! { obj.#fn_name() }
            } else {
                // Для &str параметров передаём через as_str()
                let param_refs: Vec<_> = params.iter().zip(&param_names).map(|(param, name)| {
                    let ty = &param.ty;
                    let ty_str = quote!(#ty).to_string();
                    
                    if ty_str.contains("&str") {
                        quote! { #name.as_str() }
                    } else {
                        quote! { #name }
                    }
                }).collect();
                
                quote! { obj.#fn_name(#(#param_refs),*) }
            };
            
            // Генерируем уникальное имя модуля для регистрации
            let registration_mod = syn::Ident::new(
                &format!("__addin_method_registration_{}_{}", method_name.replace(" ", "_").to_lowercase(), fn_name),
                fn_name.span()
            );
            
            method_registrations.push(quote! {
                #[doc(hidden)]
                #[allow(non_snake_case)]
                mod #registration_mod {
                    use super::*;
                    
                    pub fn #caller_fn(
                        obj_any: &mut dyn std::any::Any,
                        params: &mut [::addin1c::Variant]
                    ) -> Box<dyn ::common_core::getset::ValueType> {
                        let obj = obj_any.downcast_mut::<#self_ty>().expect("Invalid type");
                        #(#param_extractions)*
                        Box::new(#method_call)
                    }
                    
                    #[linkme::distributed_slice(::common_core::ADDIN_METHODS)]
                    static METHOD_REGISTRATION: ::common_core::MethodInfo = ::common_core::MethodInfo {
                        name: #method_name,
                        param_count: #param_count,
                        caller: #caller_fn,
                    };
                }
            });
        }
    }
    
    // Генерируем финальный код
    let expanded = quote! {
        #input
        
        #(#method_registrations)*
    };
    
    TokenStream::from(expanded)
}
