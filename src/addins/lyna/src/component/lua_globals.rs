use mlua::Value;
use crate::component::lua_engine::LuaEngine;
use serde_json::Value as JsonValue;

impl LuaEngine {

    pub fn set_global(&self, name: &str, value: JsonValue) -> Result<(), String> {
        let lua_value = self.json_to_lua_value(value)?;
        match self.lua.globals().set(name, lua_value) {
            Ok(_) => Ok(()),
            Err(e) => Err(format!("Failed to set global '{}': {}", name, e)),
        }
    }

    pub fn get_global(&self, name: &str) -> Result<JsonValue, String> {
        let value: Value = match self.lua.globals().get(name) {
            Ok(v) => v,
            Err(e) => return Err(format!("Failed to get global '{}': {}", name, e)),
        };
        self.lua_value_to_json(value)
    }
}