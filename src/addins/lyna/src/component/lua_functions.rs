use crate::component::lua_engine::LuaEngine;
use mlua::{Value, Function, MultiValue};
use serde_json::Value as JsonValue;

impl LuaEngine {
    pub fn call_function(&self, func_name: &str, args: Vec<JsonValue>) -> Result<JsonValue, String> {
        let func = self.get_function_by_path(func_name)?;

        let mut lua_args = Vec::new();
        for arg in args {
            match self.json_to_lua_value(arg) {
                Ok(val) => lua_args.push(val),
                Err(e) => return Err(e),
            }
        }

        let multi_args = MultiValue::from_vec(lua_args);
        match func.call::<MultiValue>(multi_args) {
            Ok(result) => {
                let first_value = result.into_iter().next().unwrap_or(Value::Nil);
                self.lua_value_to_json(first_value)
            },
            Err(e) => Err(format!("Function call error: {}", e)),
        }
    }

    fn get_function_by_path(&self, path: &str) -> Result<Function, String> {
        let parts: Vec<&str> = path.split('.').collect();
        let globals = self.lua.globals();

        if parts.len() == 1 {
            match globals.get(parts[0]) {
                Ok(f) => Ok(f),
                Err(e) => Err(format!("Failed to get function '{}': {}", parts[0], e)),
            }
        } else {
            let mut current: Value = match globals.get(parts[0]) {
                Ok(v) => v,
                Err(e) => return Err(format!("Failed to get module '{}': {}", parts[0], e)),
            };

            for &part in &parts[1..parts.len() - 1] {
                match current {
                    Value::Table(table) => {
                        current = match table.get(part) {
                            Ok(v) => v,
                            Err(e) => return Err(format!("Failed to get '{}' from table: {}", part, e)),
                        };
                    },
                    _ => return Err(format!("'{}' is not a table", part)),
                }
            }

            match current {
                Value::Table(table) => {
                    let func_name = parts[parts.len() - 1];
                    match table.get(func_name) {
                        Ok(f) => Ok(f),
                        Err(e) => Err(format!("Failed to get function '{}': {}", func_name, e)),
                    }
                },
                _ => Err(format!("Path does not lead to a table containing function '{}'", parts[parts.len()-1])),
            }
        }
    }
}