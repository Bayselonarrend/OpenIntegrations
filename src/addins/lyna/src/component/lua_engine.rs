use std::collections::HashMap;
use std::path::Path;
use mlua::{Lua, LuaOptions, StdLib, Value};
use serde_json::Value as JsonValue;

#[inline]
fn default_std_libs() -> StdLib {
    #[cfg(feature = "luajit")]
    {
        // `FFI` не входит в `ALL_SAFE`; для WinAPI из Lua нужен `require("ffi")`.
        // Загрузка возможна только в «unsafe» VM — см. `Lua::unsafe_new_with` ниже.
        StdLib::ALL_SAFE | StdLib::FFI
    }
    #[cfg(not(feature = "luajit"))]
    {
        StdLib::ALL
    }
}

pub struct LuaEngine {
    pub(crate) lua: Lua,
    pub(crate) packages: HashMap<String, String>,
}

fn create_lua() -> Lua {
    // `Lua::new()` включает safe mode и блокирует C-модули (`require` к .dll).
    unsafe { Lua::unsafe_new_with(default_std_libs(), LuaOptions::default()) }
}

impl LuaEngine {
    pub fn new() -> Result<Self, String> {
        Ok(LuaEngine {
            lua: create_lua(),
            packages: HashMap::new(),
        })
    }

    pub fn execute_string(&self, code: &str) -> Result<JsonValue, String> {
        match self.lua.load(code).eval::<Value>() {
            Ok(result) => self.lua_value_to_json(result),
            Err(e) => Err(format!("Lua execution error: {}", e)),
        }
    }

    pub fn execute_file<P: AsRef<Path>>(&self, path: P) -> Result<JsonValue, String> {
        let code = std::fs::read_to_string(path)
            .map_err(|e| format!("Failed to read file: {}", e))?;
        self.execute_string(&code)
    }

    pub fn execute_bytecode(&self, bytecode: &[u8]) -> Result<JsonValue, String> {
        match self.lua.load(bytecode).eval::<Value>() {
            Ok(result) => self.lua_value_to_json(result),
            Err(e) => Err(format!("Bytecode execution error: {}", e)),
        }
    }

    pub fn execute_bytecode_file<P: AsRef<Path>>(&self, path: P) -> Result<JsonValue, String> {
        let code = std::fs::read(path)
            .map_err(|e| format!("Failed to read file: {}", e))?;
        self.execute_bytecode(&code)
    }

    pub fn compile_to_bytecode(&self, code: &str) -> Result<Vec<u8>, String> {
        match self.lua.load(code).into_function() {
            Ok(func) => Ok(func.dump(false)),
            Err(e) => Err(format!("Compilation error: {}", e)),
        }
    }

    pub fn reset(&mut self) -> Result<(), String> {
        self.lua = create_lua();
        self.packages.clear();
        Ok(())
    }

}

impl Default for LuaEngine {
    fn default() -> Self {
        Self::new().expect("Failed to create Lua engine")
    }
}