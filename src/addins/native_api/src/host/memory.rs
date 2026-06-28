use std::alloc::{alloc, dealloc, Layout};
use std::ffi::c_void;
use std::ptr;
use std::sync::OnceLock;

use super::abi::{Connection, ConnectionVTable, MemoryManager, MemoryManagerVTable};

unsafe extern "system" fn alloc_memory(
    _mgr: *const MemoryManager,
    ptr: *mut *mut c_void,
    size: u32,
) -> bool {
    if size == 0 {
        *ptr = ptr::null_mut();
        return true;
    }

    let layout = match Layout::from_size_align(size as usize, 8) {
        Ok(layout) => layout,
        Err(_) => return false,
    };

    let mem = alloc(layout);
    if mem.is_null() {
        return false;
    }

    *ptr = mem as *mut c_void;
    true
}

unsafe extern "system" fn free_memory(_mgr: *const MemoryManager, ptr: *mut *mut c_void) {
    if ptr.is_null() || (*ptr).is_null() {
        return;
    }

    let mem = *ptr;
    let layout = Layout::from_size_align(1, 8).unwrap();
    dealloc(mem as *mut u8, layout);
    *ptr = ptr::null_mut();
}

static CONNECTION_VTABLE: ConnectionVTable = ConnectionVTable {
    dtor: 0,
    #[cfg(target_family = "unix")]
    dtor2: 0,
};

static MEMORY_MANAGER_VTABLE: MemoryManagerVTable = MemoryManagerVTable {
    dtor: 0,
    #[cfg(target_family = "unix")]
    dtor2: 0,
    alloc_memory,
    free_memory,
};

static CONNECTION: OnceLock<Connection> = OnceLock::new();
static MEMORY_MANAGER: OnceLock<MemoryManager> = OnceLock::new();

pub fn connection() -> &'static Connection {
    CONNECTION.get_or_init(|| Connection {
        vptr: &CONNECTION_VTABLE,
    })
}

pub fn memory_manager() -> &'static MemoryManager {
    MEMORY_MANAGER.get_or_init(|| MemoryManager {
        vptr: &MEMORY_MANAGER_VTABLE,
    })
}

pub unsafe fn free_component_string(ptr: *const u16) {
    if ptr.is_null() {
        return;
    }

    let mut raw = ptr as *mut c_void;
    free_memory(memory_manager(), &mut raw);
}
