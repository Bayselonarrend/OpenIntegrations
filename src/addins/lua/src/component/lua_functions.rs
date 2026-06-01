use common_janx::JanxValue;
use mlua::{Function, MultiValue, Value};

use crate::component::lua_engine::LuaEngine;

impl LuaEngine {
    pub fn call_function(&self, func_name: &str, args: Vec<JanxValue>) -> Result<JanxValue, String> {
        let func = self.get_function_by_path(func_name)?;

        let mut lua_args = Vec::new();
        for arg in args {
            lua_args.push(self.janx_to_lua_value(arg)?);
        }

        let multi_args = MultiValue::from_vec(lua_args);
        match func.call::<MultiValue>(multi_args) {
            Ok(result) => {
                let first_value = result.into_iter().next().unwrap_or(Value::Nil);
                self.lua_to_value(first_value)
            }
            Err(e) => Err(format!("Function call error: {}", e)),
        }
    }

    fn get_function_by_path(&self, path: &str) -> Result<Function, String> {
        let parts: Vec<&str> = path.split('.').collect();
        let globals = self.lua.globals();

        if parts.len() == 1 {
            globals
                .get(parts[0])
                .map_err(|e| format!("Failed to get function '{}': {}", parts[0], e))
        } else {
            let mut current: Value = globals
                .get(parts[0])
                .map_err(|e| format!("Failed to get module '{}': {}", parts[0], e))?;

            for &part in &parts[1..parts.len() - 1] {
                match current {
                    Value::Table(table) => {
                        current = table
                            .get(part)
                            .map_err(|e| format!("Failed to get '{}' from table: {}", part, e))?;
                    }
                    _ => return Err(format!("'{}' is not a table", part)),
                }
            }

            match current {
                Value::Table(table) => {
                    let func_name = parts[parts.len() - 1];
                    table
                        .get(func_name)
                        .map_err(|e| format!("Failed to get function '{}': {}", func_name, e))
                }
                _ => Err(format!(
                    "Path does not lead to a table containing function '{}'",
                    parts[parts.len() - 1]
                )),
            }
        }
    }
}
