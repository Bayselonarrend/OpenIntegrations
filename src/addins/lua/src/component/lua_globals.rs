use common_janx::JanxValue;

use crate::component::lua_engine::LuaEngine;

impl LuaEngine {
    pub fn set_global(&self, name: &str, value: JanxValue) -> Result<(), String> {
        let lua_value = self.janx_to_lua_value(value)?;
        self.lua
            .globals()
            .set(name, lua_value)
            .map_err(|e| format!("Failed to set global '{}': {}", name, e))
    }

    pub fn get_global(&self, name: &str) -> Result<JanxValue, String> {
        let value: mlua::Value = self
            .lua
            .globals()
            .get(name)
            .map_err(|e| format!("Failed to get global '{}': {}", name, e))?;
        self.lua_to_value(value)
    }
}
