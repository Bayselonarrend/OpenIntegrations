#![allow(dead_code)]

use std::ffi::{c_long, c_void};

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Tm {
    pub year: i32,
    pub mon: i32,
    pub mday: i32,
    pub hour: i32,
    pub min: i32,
    pub sec: i32,
}

#[repr(u16)]
#[derive(Clone, Copy, PartialEq, Eq)]
pub enum VariantType {
    Empty = 0,
    Null,
    I2,
    I4,
    R4,
    R8,
    Date,
    Tm,
    Pstr,
    Interface,
    Error,
    Bool,
    Variant,
    I1,
    Ui1,
    Ui2,
    Ui4,
    I8,
    Ui8,
    Int,
    Uint,
    Hresult,
    Pwstr,
    Blob,
    Clsid,
    Undefined = 0xFFFF,
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct DataStr {
    pub ptr: *mut u16,
    pub len: u32,
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct DataBlob {
    pub ptr: *mut u8,
    pub len: u32,
}

#[repr(C)]
pub union VariantValue {
    pub boolean: bool,
    pub i32: i32,
    pub f64: f64,
    pub tm: Tm,
    pub data_str: DataStr,
    pub data_blob: DataBlob,
}

#[repr(C)]
pub struct TVariant {
    pub value: VariantValue,
    pub elements: u32,
    pub vt: VariantType,
}

impl Default for TVariant {
    fn default() -> Self {
        Self {
            value: VariantValue { i32: 0 },
            elements: 0,
            vt: VariantType::Empty,
        }
    }
}

#[repr(C)]
pub struct MemoryManager {
    pub vptr: *const MemoryManagerVTable,
}

unsafe impl Send for MemoryManager {}
unsafe impl Sync for MemoryManager {}

#[repr(C)]
pub struct MemoryManagerVTable {
    pub dtor: usize,
    #[cfg(target_family = "unix")]
    pub dtor2: usize,
    pub alloc_memory:
        unsafe extern "system" fn(*const MemoryManager, *mut *mut c_void, u32) -> bool,
    pub free_memory: unsafe extern "system" fn(*const MemoryManager, *mut *mut c_void),
}

#[repr(C)]
pub struct ConnectionVTable {
    pub dtor: usize,
    #[cfg(target_family = "unix")]
    pub dtor2: usize,
}

#[repr(C)]
pub struct Connection {
    pub vptr: *const ConnectionVTable,
}

unsafe impl Send for Connection {}
unsafe impl Sync for Connection {}

pub type GetClassNamesFn = unsafe extern "C" fn() -> *const u16;
pub type GetClassObjectFn =
    unsafe extern "C" fn(*const u16, *mut *mut c_void) -> c_long;
pub type DestroyObjectFn = unsafe extern "C" fn(*mut *mut c_void) -> c_long;
pub type SetPlatformCapabilitiesFn = unsafe extern "C" fn(i32) -> i32;
pub type GetAttachTypeFn = unsafe extern "C" fn() -> i32;

const INIT_DONE_INIT: usize = 0;
const INIT_DONE_SET_MEM_MANAGER: usize = 1;
const INIT_DONE_GET_INFO: usize = 2;
const INIT_DONE_DONE: usize = 3;

const LANG_REGISTER_EXTENSION: usize = 0;
const LANG_GET_N_PROPS: usize = 1;
const LANG_FIND_PROP: usize = 2;
const LANG_GET_PROP_NAME: usize = 3;
const LANG_GET_PROP_VAL: usize = 4;
const LANG_SET_PROP_VAL: usize = 5;
const LANG_IS_PROP_READABLE: usize = 6;
const LANG_IS_PROP_WRITABLE: usize = 7;
const LANG_GET_N_METHODS: usize = 8;
const LANG_FIND_METHOD: usize = 9;
const LANG_GET_METHOD_NAME: usize = 10;
const LANG_GET_N_PARAMS: usize = 11;
const LANG_GET_PARAM_DEF_VALUE: usize = 12;
const LANG_HAS_RET_VAL: usize = 13;
const LANG_CALL_AS_PROC: usize = 14;
const LANG_CALL_AS_FUNC: usize = 15;

const COMPONENT_VPTR_LANG_OFFSET: usize = 1;

fn vtable_slot(base: usize, index: usize) -> usize {
    let skip = if cfg!(target_family = "unix") { 2 } else { 1 };
    base + skip + index
}

pub unsafe fn read_vtable_fn<T: Copy>(vtable: usize, index: usize) -> T {
    *((vtable as *const usize).add(index) as *const T)
}

pub struct ComponentRefs {
    pub init_done_vtable: usize,
    pub language_vtable: usize,
}

impl ComponentRefs {
    pub unsafe fn from_component(component: *mut c_void) -> Self {
        let base = component as usize;
        Self {
            init_done_vtable: *(base as *const usize),
            language_vtable: *((base as *const usize).add(COMPONENT_VPTR_LANG_OFFSET)),
        }
    }

    pub unsafe fn call_init(&self, component: *mut c_void, connection: *const Connection) -> bool {
        let this = component as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, *const Connection) -> bool =
            read_vtable_fn(self.init_done_vtable, vtable_slot(0, INIT_DONE_INIT));
        func(this, connection)
    }

    pub unsafe fn call_set_mem_manager(
        &self,
        component: *mut c_void,
        memory: *const MemoryManager,
    ) -> bool {
        let this = component as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, *const MemoryManager) -> bool =
            read_vtable_fn(
                self.init_done_vtable,
                vtable_slot(0, INIT_DONE_SET_MEM_MANAGER),
            );
        func(this, memory)
    }

    pub unsafe fn call_done(&self, component: *mut c_void) {
        let this = component as *mut u8;
        let func: unsafe extern "system" fn(*mut u8) =
            read_vtable_fn(self.init_done_vtable, vtable_slot(0, INIT_DONE_DONE));
        func(this);
    }

    pub unsafe fn call_get_n_methods(&self, component: *mut c_void) -> c_long {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8) -> c_long = read_vtable_fn(
            self.language_vtable,
            vtable_slot(0, LANG_GET_N_METHODS),
        );
        func(this)
    }

    pub unsafe fn call_find_method(&self, component: *mut c_void, name: *const u16) -> c_long {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, *const u16) -> c_long = read_vtable_fn(
            self.language_vtable,
            vtable_slot(0, LANG_FIND_METHOD),
        );
        func(this, name)
    }

    pub unsafe fn call_get_method_name(
        &self,
        component: *mut c_void,
        method_num: c_long,
        alias: c_long,
    ) -> *const u16 {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long, c_long) -> *const u16 =
            read_vtable_fn(
                self.language_vtable,
                vtable_slot(0, LANG_GET_METHOD_NAME),
            );
        func(this, method_num, alias)
    }

    pub unsafe fn call_get_n_params(&self, component: *mut c_void, method_num: c_long) -> c_long {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long) -> c_long = read_vtable_fn(
            self.language_vtable,
            vtable_slot(0, LANG_GET_N_PARAMS),
        );
        func(this, method_num)
    }

    pub unsafe fn call_has_ret_val(&self, component: *mut c_void, method_num: c_long) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long) -> bool = read_vtable_fn(
            self.language_vtable,
            vtable_slot(0, LANG_HAS_RET_VAL),
        );
        func(this, method_num)
    }

    pub unsafe fn call_call_as_func(
        &self,
        component: *mut c_void,
        method_num: c_long,
        ret_value: &mut TVariant,
        params: *mut TVariant,
        size_array: c_long,
    ) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(
            *mut u8,
            c_long,
            &mut TVariant,
            *mut TVariant,
            c_long,
        ) -> bool = read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_CALL_AS_FUNC));
        func(this, method_num, ret_value, params, size_array)
    }

    pub unsafe fn call_call_as_proc(
        &self,
        component: *mut c_void,
        method_num: c_long,
        params: *mut TVariant,
        size_array: c_long,
    ) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long, *mut TVariant, c_long) -> bool =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_CALL_AS_PROC));
        func(this, method_num, params, size_array)
    }

    pub unsafe fn call_get_n_props(&self, component: *mut c_void) -> c_long {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8) -> c_long =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_GET_N_PROPS));
        func(this)
    }

    pub unsafe fn call_find_prop(&self, component: *mut c_void, name: *const u16) -> c_long {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, *const u16) -> c_long =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_FIND_PROP));
        func(this, name)
    }

    pub unsafe fn call_get_prop_name(
        &self,
        component: *mut c_void,
        prop_num: c_long,
        alias: c_long,
    ) -> *const u16 {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long, c_long) -> *const u16 =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_GET_PROP_NAME));
        func(this, prop_num, alias)
    }

    pub unsafe fn call_get_prop_val(
        &self,
        component: *mut c_void,
        prop_num: c_long,
        value: &mut TVariant,
    ) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long, &mut TVariant) -> bool =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_GET_PROP_VAL));
        func(this, prop_num, value)
    }

    pub unsafe fn call_set_prop_val(
        &self,
        component: *mut c_void,
        prop_num: c_long,
        value: &mut TVariant,
    ) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long, &mut TVariant) -> bool =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_SET_PROP_VAL));
        func(this, prop_num, value)
    }

    pub unsafe fn call_is_prop_readable(&self, component: *mut c_void, prop_num: c_long) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long) -> bool =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_IS_PROP_READABLE));
        func(this, prop_num)
    }

    pub unsafe fn call_is_prop_writable(&self, component: *mut c_void, prop_num: c_long) -> bool {
        let this = (component as usize + std::mem::size_of::<usize>()) as *mut u8;
        let func: unsafe extern "system" fn(*mut u8, c_long) -> bool =
            read_vtable_fn(self.language_vtable, vtable_slot(0, LANG_IS_PROP_WRITABLE));
        func(this, prop_num)
    }
}

pub fn encode_utf16z(value: &str) -> Vec<u16> {
    let mut data: Vec<u16> = value.encode_utf16().collect();
    data.push(0);
    data
}

pub unsafe fn utf16_ptr_to_string(ptr: *const u16) -> Option<String> {
    if ptr.is_null() {
        return None;
    }

    let mut len = 0;
    while *ptr.add(len) != 0 {
        len += 1;
        if len > 1_000_000 {
            return None;
        }
    }

    let slice = std::slice::from_raw_parts(ptr, len);
    String::from_utf16(slice).ok()
}

pub unsafe fn utf16_ptr_to_string_with_len(ptr: *const u16, char_len: u32) -> Option<String> {
    if ptr.is_null() {
        return None;
    }
    let slice = std::slice::from_raw_parts(ptr, char_len as usize);
    String::from_utf16(slice).ok()
}

pub fn parse_class_names(ptr: *const u16) -> Result<Vec<String>, String> {
    unsafe {
        let raw = utf16_ptr_to_string(ptr).ok_or_else(|| "GetClassNames returned null".to_string())?;
        Ok(raw
            .split('|')
            .filter(|part| !part.is_empty())
            .map(|part| part.to_string())
            .collect())
    }
}
