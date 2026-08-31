use std::collections::{BTreeMap, HashMap, HashSet};

use common_core::JanxValue;
use common_janx::janx;
use ldap3::{Mod, Scope, SearchEntry};

pub fn parse_scope(scope: &str) -> Scope {
    match scope.to_ascii_lowercase().as_str() {
        "base" => Scope::Base,
        "one" | "onelevel" => Scope::OneLevel,
        _ => Scope::Subtree,
    }
}

pub fn attributes_to_janx(attrs: HashMap<String, Vec<String>>) -> JanxValue {
    let mut map = BTreeMap::new();

    for (key, values) in attrs {
        map.insert(
            key,
            JanxValue::Array(
                values
                    .into_iter()
                    .map(JanxValue::String)
                    .collect::<Vec<_>>(),
            ),
        );
    }

    JanxValue::Object(map)
}

pub fn search_entry_to_janx(entry: SearchEntry) -> JanxValue {
    janx!({
        "dn": entry.dn,
        "attributes": attributes_to_janx(entry.attrs),
    })
}

pub fn parse_search_params(value: &JanxValue) -> Result<(String, Scope, String, Vec<String>), String> {
    let JanxValue::Object(map) = value else {
        return Err("Invalid search parameters".to_string());
    };

    let base = map
        .get("base")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .ok_or_else(|| "Search parameter 'base' is required".to_string())?;

    let filter = map
        .get("filter")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .unwrap_or_else(|| "(objectClass=*)".to_string());

    let scope = map
        .get("scope")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(parse_scope(s)),
            _ => None,
        })
        .unwrap_or(Scope::Subtree);

    let attributes = map
        .get("attributes")
        .map(parse_string_array)
        .unwrap_or_default();

    Ok((base, scope, filter, attributes))
}

pub fn parse_add_params(value: &JanxValue) -> Result<(String, Vec<(String, Vec<String>)>), String> {
    let JanxValue::Object(map) = value else {
        return Err("Invalid add parameters".to_string());
    };

    let dn = map
        .get("dn")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .ok_or_else(|| "Add parameter 'dn' is required".to_string())?;

    let attributes = map
        .get("attributes")
        .map(parse_attributes_map)
        .filter(|attributes| !attributes.is_empty())
        .ok_or_else(|| "Add parameter 'attributes' must be a non-empty object".to_string())?;

    Ok((dn, attributes))
}

pub fn parse_modify_params(value: &JanxValue) -> Result<(String, Vec<Mod<String>>), String> {
    let JanxValue::Object(map) = value else {
        return Err("Invalid modify parameters".to_string());
    };

    let dn = map
        .get("dn")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .ok_or_else(|| "Modify parameter 'dn' is required".to_string())?;

    let changes = map
        .get("changes")
        .map(parse_mods)
        .ok_or_else(|| "Modify parameter 'changes' is required".to_string())?;

    Ok((dn, changes))
}

pub fn to_ldap_attributes(attributes: Vec<(String, Vec<String>)>) -> Vec<(String, HashSet<String>)> {
    attributes
        .into_iter()
        .map(|(key, values)| (key, values.into_iter().collect()))
        .collect()
}

pub fn parse_compare_params(value: &JanxValue) -> Result<(String, String, String), String> {
    let JanxValue::Object(map) = value else {
        return Err("Invalid compare parameters".to_string());
    };

    let dn = map
        .get("dn")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .ok_or_else(|| "Compare parameter 'dn' is required".to_string())?;

    let attribute = map
        .get("attribute")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .ok_or_else(|| "Compare parameter 'attribute' is required".to_string())?;

    let value = map
        .get("value")
        .and_then(|v| match v {
            JanxValue::String(s) => Some(s.clone()),
            _ => None,
        })
        .unwrap_or_default();

    Ok((dn, attribute, value))
}

fn parse_string_array(value: &JanxValue) -> Vec<String> {
    match value {
        JanxValue::Array(items) => items
            .iter()
            .filter_map(|item| match item {
                JanxValue::String(s) => Some(s.clone()),
                _ => None,
            })
            .collect(),
        JanxValue::String(s) => vec![s.clone()],
        _ => Vec::new(),
    }
}

fn parse_attributes_map(value: &JanxValue) -> Vec<(String, Vec<String>)> {
    let JanxValue::Object(map) = value else {
        return Vec::new();
    };

    map.iter()
        .map(|(key, value)| (key.clone(), parse_string_array(value)))
        .collect()
}

fn parse_mods(value: &JanxValue) -> Vec<Mod<String>> {
    let JanxValue::Array(items) = value else {
        return Vec::new();
    };

    items
        .iter()
        .filter_map(|item| {
            let JanxValue::Object(map) = item else {
                return None;
            };

            let operation = map
                .get("operation")
                .and_then(|v| match v {
                    JanxValue::String(s) => Some(s.to_ascii_lowercase()),
                    _ => None,
                })
                .unwrap_or_else(|| "replace".to_string());

            let attribute = map.get("attribute").and_then(|v| match v {
                JanxValue::String(s) => Some(s.clone()),
                _ => None,
            })?;

            let values = map
                .get("values")
                .map(parse_string_array)
                .unwrap_or_default();

            let values = values.into_iter().collect::<HashSet<_>>();

            Some(match operation.as_str() {
                "add" => Mod::Add(attribute, values),
                "delete" => Mod::Delete(attribute, values),
                _ => Mod::Replace(attribute, values),
            })
        })
        .collect()
}
