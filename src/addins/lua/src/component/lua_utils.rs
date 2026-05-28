use crate::component::lua_engine::LuaEngine;
use mlua::{Integer, Value};
use serde_json::Value as JsonValue;

impl LuaEngine {
    pub(crate) fn lua_value_to_json(&self, value: Value) -> Result<JsonValue, String> {
        match value {
            Value::Nil => Ok(JsonValue::Null),
            Value::Boolean(b) => Ok(JsonValue::Bool(b)),
            Value::Integer(i) => Ok(JsonValue::Number(serde_json::Number::from(i))),
            Value::Number(n) => {
                if let Some(num) = serde_json::Number::from_f64(n) {
                    Ok(JsonValue::Number(num))
                } else {
                    Err(format!("Invalid number: {}", n))
                }
            },
            Value::String(s) => {
                match s.to_str() {
                    Ok(str_val) => Ok(JsonValue::String(str_val.to_string())),
                    Err(e) => Err(format!("String conversion error: {}", e)),
                }
            },
            Value::Table(table) => {
                let mut map = serde_json::Map::new();
                for pair in table.pairs::<Value, Value>() {
                    let (key, value) = match pair {
                        Ok(p) => p,
                        Err(e) => return Err(format!("Table iteration error: {}", e)),
                    };
                    let key_str = match key {
                        Value::String(s) => match s.to_str() {
                            Ok(str_val) => str_val.to_string(),
                            Err(e) => return Err(format!("Key string conversion error: {}", e)),
                        },
                        Value::Integer(i) => i.to_string(),
                        Value::Number(n) => n.to_string(),
                        _ => return Err("Unsupported table key type".to_string()),
                    };
                    let json_value = self.lua_value_to_json(value)?;
                    map.insert(key_str, json_value);
                }
                Ok(JsonValue::Object(map))
            },
            _ => Err("Unsupported Lua value type".to_string()),
        }
    }

    pub(crate) fn json_to_lua_value(&self, value: JsonValue) -> Result<Value, String> {
        match value {
            JsonValue::Null => Ok(Value::Nil),
            JsonValue::Bool(b) => Ok(Value::Boolean(b)),
            JsonValue::Number(n) => {
                if let Some(i) = n.as_i64() {
                    match Integer::try_from(i) {
                        Ok(li) => Ok(Value::Integer(li)),
                        Err(_) => Ok(Value::Number(i as f64)),
                    }
                } else if let Some(f) = n.as_f64() {
                    Ok(Value::Number(f))
                } else {
                    Err("Invalid number".to_string())
                }
            },
            JsonValue::String(s) => {
                match self.lua.create_string(&s) {
                    Ok(lua_string) => Ok(Value::String(lua_string)),
                    Err(e) => Err(format!("String creation error: {}", e)),
                }
            },
            JsonValue::Array(arr) => {
                let table = match self.lua.create_table() {
                    Ok(t) => t,
                    Err(e) => return Err(format!("Table creation error: {}", e)),
                };
                for (i, item) in arr.into_iter().enumerate() {
                    let lua_value = self.json_to_lua_value(item)?;
                    if let Err(e) = table.set(i + 1, lua_value) {
                        return Err(format!("Array table set error: {}", e));
                    }
                }
                Ok(Value::Table(table))
            },
            JsonValue::Object(obj) => {
                let table = match self.lua.create_table() {
                    Ok(t) => t,
                    Err(e) => return Err(format!("Table creation error: {}", e)),
                };
                for (key, value) in obj {
                    let lua_value = self.json_to_lua_value(value)?;
                    if let Err(e) = table.set(key, lua_value) {
                        return Err(format!("Object table set error: {}", e));
                    }
                }
                Ok(Value::Table(table))
            },
        }
    }
}