use common_janx::{decode, janx, JanxValue};

use super::abi::{DataBlob, DataStr, TVariant, VariantType, VariantValue};
use super::memory::memory_manager;

pub fn variant_to_janx(variant: &TVariant) -> JanxValue {
    unsafe {
        match variant.vt {
            VariantType::Empty | VariantType::Null | VariantType::Undefined => {
                janx!({ "type": "empty" })
            }
            VariantType::Bool => janx!({
                "type": "bool",
                "value": variant.value.boolean,
            }),
            VariantType::I4 | VariantType::I2 | VariantType::I1 | VariantType::Int => janx!({
                "type": "number",
                "value": variant.value.i32,
            }),
            VariantType::R8 | VariantType::R4 | VariantType::Date => janx!({
                "type": "number",
                "value": variant.value.f64,
            }),
            VariantType::Pwstr => {
                let data = variant.value.data_str;
                let text = if data.ptr.is_null() {
                    String::new()
                } else {
                    String::from_utf16_lossy(std::slice::from_raw_parts(
                        data.ptr,
                        data.len as usize,
                    ))
                };
                janx!({
                    "type": "string",
                    "value": text,
                })
            }
            VariantType::Blob => {
                let data = variant.value.data_blob;
                let bytes = if data.ptr.is_null() {
                    Vec::new()
                } else {
                    std::slice::from_raw_parts(data.ptr, data.len as usize).to_vec()
                };
                janx!({
                    "type": "blob",
                    "value": bytes,
                })
            }
            VariantType::Error => janx!({
                "type": "error",
                "value": variant.value.i32,
            }),
            _ => janx!({
                "type": "unsupported",
                "vt": variant.vt as u16,
            }),
        }
    }
}

pub fn janx_to_variant(value: &JanxValue) -> Result<TVariant, String> {
    match value {
        JanxValue::Null => Ok(empty_variant()),
        JanxValue::Bool(boolean) => {
            let mut variant = empty_variant();
            variant.vt = VariantType::Bool;
            variant.value.boolean = *boolean;
            Ok(variant)
        }
        JanxValue::Number(number) => {
            let mut variant = empty_variant();
            let float = number.as_f64().unwrap_or(0.0);
            if float.fract() == 0.0 && float.abs() <= i32::MAX as f64 {
                variant.vt = VariantType::I4;
                variant.value.i32 = float as i32;
            } else {
                variant.vt = VariantType::R8;
                variant.value.f64 = float;
            }
            Ok(variant)
        }
        JanxValue::String(text) => set_string_variant(text),
        JanxValue::Binary(bytes) => set_blob_variant(bytes),
        JanxValue::Object(map) => {
            if let Some(inner) = map.get("value") {
                return janx_to_variant(inner);
            }
            if map.contains_key("type") {
                return janx_to_variant(&JanxValue::Null);
            }
            Err("Unsupported object parameter".to_string())
        }
        JanxValue::Array(items) => Err(format!(
            "Array parameters are not supported yet (size {})",
            items.len()
        )),
    }
}

pub fn janx_params_to_variants(params: &[u8]) -> Result<Vec<TVariant>, String> {
    if params.is_empty() {
        return Ok(Vec::new());
    }

    let janx = decode(params).map_err(|e| e.to_string())?;
    let values = match janx {
        JanxValue::Array(items) => items,
        single => vec![single],
    };

    values.iter().map(janx_to_variant).collect()
}

pub fn janx_object_from_blob(blob: &[u8]) -> Result<std::collections::BTreeMap<String, JanxValue>, String> {
    if blob.is_empty() {
        return Ok(std::collections::BTreeMap::new());
    }

    let janx = decode(blob).map_err(|e| e.to_string())?;
    match janx {
        JanxValue::Object(map) => Ok(map),
        _ => Err("Properties payload must be an object".to_string()),
    }
}

fn empty_variant() -> TVariant {
    TVariant {
        value: VariantValue { i32: 0 },
        elements: 0,
        vt: VariantType::Empty,
    }
}

fn set_string_variant(text: &str) -> Result<TVariant, String> {
    let utf16: Vec<u16> = text.encode_utf16().collect();
    let byte_len = utf16.len() * 2;
    let mgr = memory_manager();

    let mut ptr_raw: *mut std::ffi::c_void = std::ptr::null_mut();
    let ok = unsafe {
        ((*mgr.vptr).alloc_memory)(mgr, &mut ptr_raw, byte_len as u32)
    };
    if !ok || ptr_raw.is_null() {
        return Err("Failed to allocate string for parameter".to_string());
    }

    unsafe {
        std::ptr::copy_nonoverlapping(
            utf16.as_ptr(),
            ptr_raw as *mut u16,
            utf16.len(),
        );
    }

    Ok(TVariant {
        value: VariantValue {
            data_str: DataStr {
                ptr: ptr_raw as *mut u16,
                len: utf16.len() as u32,
            },
        },
        elements: 0,
        vt: VariantType::Pwstr,
    })
}

fn set_blob_variant(bytes: &[u8]) -> Result<TVariant, String> {
    let mgr = memory_manager();
    let mut ptr_raw: *mut std::ffi::c_void = std::ptr::null_mut();
    let ok = unsafe { ((*mgr.vptr).alloc_memory)(mgr, &mut ptr_raw, bytes.len() as u32) };
    if !ok || ptr_raw.is_null() {
        return Err("Failed to allocate blob for parameter".to_string());
    }

    unsafe {
        std::ptr::copy_nonoverlapping(bytes.as_ptr(), ptr_raw as *mut u8, bytes.len());
    }

    Ok(TVariant {
        value: VariantValue {
            data_blob: DataBlob {
                ptr: ptr_raw as *mut u8,
                len: bytes.len() as u32,
            },
        },
        elements: 0,
        vt: VariantType::Blob,
    })
}

pub fn variant_error_message(variant: &TVariant) -> Option<String> {
    if variant.vt == VariantType::Pwstr {
        unsafe {
            let data = variant.value.data_str;
            if data.ptr.is_null() {
                return None;
            }
            return String::from_utf16(std::slice::from_raw_parts(
                data.ptr,
                data.len as usize,
            ))
            .ok();
        }
    }

    if variant.vt == VariantType::Error {
        return Some(format!("Component error code {}", unsafe { variant.value.i32 }));
    }

    None
}
