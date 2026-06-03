use std::collections::BTreeMap;

use common_janx::{JanxNumber, JanxValue};
use mlua::{Integer, Value};

use crate::component::lua_engine::LuaEngine;

impl LuaEngine {
    pub(crate) fn lua_to_value(&self, value: Value) -> Result<JanxValue, String> {
        match value {
            Value::Nil => Ok(JanxValue::Null),
            Value::Boolean(b) => Ok(JanxValue::Bool(b)),
            Value::Integer(i) => Ok(JanxValue::Number(JanxNumber::from(i))),
            Value::Number(n) => JanxNumber::from_f64(n)
                .map(JanxValue::Number)
                .ok_or_else(|| format!("Invalid number: {}", n)),
            Value::String(s) => Ok(lua_string_to_janx(&s)),
            Value::Table(table) => {
                if Self::is_array_table(&table)? {
                    let mut items = Vec::new();
                    let len = table.len().map_err(|e| format!("Table length error: {}", e))?;
                    for index in 1..=len {
                        let element = table
                            .get(index)
                            .map_err(|e| format!("Array read error: {}", e))?;
                        items.push(self.lua_to_value(element)?);
                    }
                    Ok(JanxValue::Array(items))
                } else {
                    let mut map = BTreeMap::new();
                    for pair in table.pairs::<Value, Value>() {
                        let (key, item) = pair.map_err(|e| format!("Table iteration error: {}", e))?;
                        let key_str = lua_table_key_to_string(key)?;
                        map.insert(key_str, self.lua_to_value(item)?);
                    }
                    Ok(JanxValue::Object(map))
                }
            }
            _ => Err("Unsupported Lua value type".to_string()),
        }
    }

    pub(crate) fn janx_to_lua_value(&self, value: JanxValue) -> Result<Value, String> {
        match value {
            JanxValue::Null => Ok(Value::Nil),
            JanxValue::Bool(b) => Ok(Value::Boolean(b)),
            JanxValue::Number(n) => number_to_lua(&self.lua, n),
            JanxValue::String(s) => self
                .lua
                .create_string(s.as_str())
                .map(Value::String)
                .map_err(|e| format!("String creation error: {}", e)),
            JanxValue::Binary(bytes) => self
                .lua
                .create_string(bytes)
                .map(Value::String)
                .map_err(|e| format!("Binary string creation error: {}", e)),
            JanxValue::Array(items) => {
                let table = self
                    .lua
                    .create_table()
                    .map_err(|e| format!("Table creation error: {}", e))?;
                for (index, item) in items.into_iter().enumerate() {
                    let lua_value = self.janx_to_lua_value(item)?;
                    table
                        .set(index + 1, lua_value)
                        .map_err(|e| format!("Array table set error: {}", e))?;
                }
                Ok(Value::Table(table))
            }
            JanxValue::Object(obj) => {
                let table = self
                    .lua
                    .create_table()
                    .map_err(|e| format!("Table creation error: {}", e))?;
                for (key, item) in obj {
                    let lua_value = self.janx_to_lua_value(item)?;
                    table
                        .set(key, lua_value)
                        .map_err(|e| format!("Object table set error: {}", e))?;
                }
                Ok(Value::Table(table))
            }
        }
    }

    /// Lua table is treated as Janx array only when keys are exactly 1..n without gaps.
    /// An empty table is treated as an object: Lua does not distinguish empty array vs map.
    fn is_array_table(table: &mlua::Table) -> Result<bool, String> {
        let mut max_index = 0usize;
        let mut count = 0usize;

        for pair in table.pairs::<Value, Value>() {
            let (key, _) = pair.map_err(|e| format!("Table iteration error: {}", e))?;
            count += 1;
            match key {
                Value::Integer(i) if i >= 1 => {
                    max_index = max_index.max(i as usize);
                }
                _ => return Ok(false),
            }
        }

        if count == 0 {
            return Ok(false);
        }

        Ok(count == max_index)
    }
}

/// Lua has one string type for both text and raw bytes. On the way back to Janx:
/// valid UTF-8 → String, otherwise → Binary.
fn lua_string_to_janx(s: &mlua::String) -> JanxValue {
    let borrowed = s.as_bytes();
    let bytes = borrowed.as_ref();
    match std::str::from_utf8(bytes) {
        Ok(text) => JanxValue::String(text.to_string()),
        Err(_) => JanxValue::binary(bytes.to_vec()),
    }
}

fn lua_table_key_to_string(key: Value) -> Result<String, String> {
    match key {
        Value::String(s) => s
            .to_str()
            .map(|v| v.to_string())
            .map_err(|e| format!("Key string conversion error: {}", e)),
        Value::Integer(i) => Ok(i.to_string()),
        Value::Number(n) => Ok(n.to_string()),
        _ => Err("Unsupported table key type".to_string()),
    }
}

fn number_to_lua(_lua: &mlua::Lua, number: JanxNumber) -> Result<Value, String> {
    if let Some(i) = number.as_i64() {
        match Integer::try_from(i) {
            Ok(value) => Ok(Value::Integer(value)),
            Err(_) => Ok(Value::Number(i as f64)),
        }
    } else if let Some(f) = number.as_f64() {
        Ok(Value::Number(f))
    } else {
        Err("Invalid number".to_string())
    }
}

pub fn parse_args(data: &[u8]) -> Result<Vec<JanxValue>, String> {
    let value = common_janx::decode(data).map_err(|e| format!("Invalid Janx arguments: {}", e))?;
    match value {
        JanxValue::Array(items) => Ok(items),
        JanxValue::Null => Ok(Vec::new()),
        _ => Err("Arguments must be a Janx array".to_string()),
    }
}

pub fn parse_payload(data: &[u8]) -> Result<JanxValue, String> {
    let value = common_janx::decode(data).map_err(|e| format!("Invalid Janx value: {}", e))?;
    match value {
        JanxValue::Object(mut fields) => fields
            .remove("data")
            .ok_or_else(|| "Missing 'data' key in value object".to_string()),
        _ => Err("Value must be an object with 'data' key".to_string()),
    }
}
