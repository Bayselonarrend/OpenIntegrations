use std::path::Path;

use common_janx::JanxValue;

use crate::component::lua_engine::LuaEngine;

impl LuaEngine {
    pub fn add_package(&mut self, name: String, code: String) -> Result<(), String> {
        let result = match self.lua.load(&code).eval::<mlua::Value>() {
            Ok(value) => value,
            Err(e) => return Err(format!("Package execution error: {}", e)),
        };

        let globals = self.lua.globals();
        let package: mlua::Table = globals
            .get("package")
            .map_err(|e| format!("Failed to get package table: {}", e))?;
        let loaded: mlua::Table = package
            .get("loaded")
            .map_err(|e| format!("Failed to get package.loaded table: {}", e))?;

        loaded
            .set(name.clone(), result)
            .map_err(|e| format!("Failed to register module '{}': {}", name, e))?;

        self.packages.insert(name, code);
        Ok(())
    }

    pub fn load_package_from_file<P: AsRef<Path>>(
        &mut self,
        name: String,
        path: P,
    ) -> Result<(), String> {
        let code = std::fs::read_to_string(path)
            .map_err(|e| format!("Failed to read package file: {}", e))?;
        self.add_package(name, code)
    }

    pub fn get_packages(&self) -> JanxValue {
        let names = self
            .packages
            .keys()
            .map(|name| JanxValue::String(name.clone()))
            .collect();
        JanxValue::Array(names)
    }
}
