mod abi;
mod memory;
mod variant_conv;

use std::collections::{BTreeMap, HashMap};
use std::ffi::{c_long, c_void};
use std::path::Path;

use common_janx::{janx, JanxValue};
use libloading::Library;
use uuid::Uuid;

use abi::{
    encode_utf16z, parse_class_names, utf16_ptr_to_string, ComponentRefs, DestroyObjectFn,
    GetAttachTypeFn, GetClassNamesFn, GetClassObjectFn, SetPlatformCapabilitiesFn, TVariant,
};
use memory::{connection, free_component_string, memory_manager};
use variant_conv::{
    janx_object_from_blob, janx_params_to_variants, janx_to_variant, variant_error_message,
    variant_to_janx,
};

pub struct LoadedLibrary {
    _library: Library,
    get_class_names: GetClassNamesFn,
    get_class_object: GetClassObjectFn,
    destroy_object: DestroyObjectFn,
    _set_platform_capabilities: Option<SetPlatformCapabilitiesFn>,
    _get_attach_type: Option<GetAttachTypeFn>,
}

pub struct ComponentInstance {
    component: *mut c_void,
    refs: ComponentRefs,
    destroy_object: DestroyObjectFn,
    class_name: String,
}

pub struct HostState {
    library: Option<LoadedLibrary>,
    instances: HashMap<String, ComponentInstance>,
}

impl HostState {
    pub fn new() -> Self {
        Self {
            library: None,
            instances: HashMap::new(),
        }
    }

    pub fn open_library(&mut self, path: &str) -> Result<(), String> {
        if self.library.is_some() {
            return Err("Library is already loaded in this host".to_string());
        }

        let path = Path::new(path);
        if !path.exists() {
            return Err(format!("Library not found: {}", path.display()));
        }

        let library = unsafe { Library::new(path) }.map_err(|e| e.to_string())?;

        unsafe {
            let get_class_names = *library
                .get::<GetClassNamesFn>(b"GetClassNames")
                .map_err(|e| format!("GetClassNames export not found: {}", e))?;
            let get_class_object = *library
                .get::<GetClassObjectFn>(b"GetClassObject")
                .map_err(|e| format!("GetClassObject export not found: {}", e))?;
            let destroy_object = *library
                .get::<DestroyObjectFn>(b"DestroyObject")
                .map_err(|e| format!("DestroyObject export not found: {}", e))?;

            let set_platform_capabilities = library
                .get::<SetPlatformCapabilitiesFn>(b"SetPlatformCapabilities")
                .ok()
                .map(|sym| *sym);
            let get_attach_type = library
                .get::<GetAttachTypeFn>(b"GetAttachType")
                .ok()
                .map(|sym| *sym);

            if let Some(set_caps) = set_platform_capabilities {
                let _ = set_caps(1);
            }
            if let Some(get_attach) = get_attach_type {
                let _ = get_attach();
            }

            self.library = Some(LoadedLibrary {
                _library: library,
                get_class_names,
                get_class_object,
                destroy_object,
                _set_platform_capabilities: set_platform_capabilities,
                _get_attach_type: get_attach_type,
            });
        }

        Ok(())
    }

    pub fn get_class_names(&self) -> Result<Vec<String>, String> {
        let library = self
            .library
            .as_ref()
            .ok_or_else(|| "Library is not loaded".to_string())?;

        unsafe {
            let ptr = (library.get_class_names)();
            parse_class_names(ptr)
        }
    }

    pub fn create_instance(&mut self, class_name: &str) -> Result<String, String> {
        let instance = self.instantiate_raw(class_name)?;
        let instance_id = Uuid::new_v4().to_string();
        self.instances.insert(instance_id.clone(), instance);
        Ok(instance_id)
    }

    pub fn destroy_instance(&mut self, instance_id: &str) -> Result<(), String> {
        let Some(mut instance) = self.instances.remove(instance_id) else {
            return Err(format!("Instance '{}' not found", instance_id));
        };

        Self::destroy_raw(&mut instance);
        Ok(())
    }

    pub fn get_metadata(&mut self, instance_ref: &str) -> Result<JanxValue, String> {
        self.with_instance(instance_ref, |instance| instance.metadata())
    }

    pub fn get_properties(&mut self, instance_ref: &str) -> Result<JanxValue, String> {
        self.with_instance(instance_ref, |instance| instance.all_properties())
    }

    pub fn call_method(
        &mut self,
        instance_ref: &str,
        method: &str,
        params_blob: &[u8],
        properties_blob: &[u8],
    ) -> Result<JanxValue, String> {
        self.with_instance_mut(instance_ref, |instance| {
            instance.set_properties_from_blob(properties_blob)?;
            let value = instance.call_method(method, params_blob)?;
            let properties = instance.all_properties()?;
            Ok(janx!({
                "value": value,
                "properties": properties,
            }))
        })
    }

    pub fn get_property(&mut self, instance_ref: &str, property: &str) -> Result<JanxValue, String> {
        self.with_instance(instance_ref, |instance| instance.get_property(property))
    }

    pub fn set_property(
        &mut self,
        instance_ref: &str,
        property: &str,
        value_blob: &[u8],
    ) -> Result<(), String> {
        self.with_instance_mut(instance_ref, |instance| {
            instance.set_property(property, value_blob)
        })
    }

    fn with_instance<F, R>(&mut self, instance_ref: &str, f: F) -> Result<R, String>
    where
        F: FnOnce(&ComponentInstance) -> Result<R, String>,
    {
        if self.instances.contains_key(instance_ref) {
            let instance = self
                .instances
                .get(instance_ref)
                .ok_or_else(|| format!("Instance '{}' not found", instance_ref))?;
            return f(instance);
        }

        let instance = self.instantiate_raw(instance_ref)?;
        let result = f(&instance);
        let mut temp = instance;
        Self::destroy_raw(&mut temp);
        result
    }

    fn with_instance_mut<F, R>(&mut self, instance_ref: &str, f: F) -> Result<R, String>
    where
        F: FnOnce(&mut ComponentInstance) -> Result<R, String>,
    {
        if self.instances.contains_key(instance_ref) {
            let instance = self
                .instances
                .get_mut(instance_ref)
                .ok_or_else(|| format!("Instance '{}' not found", instance_ref))?;
            return f(instance);
        }

        let mut instance = self.instantiate_raw(instance_ref)?;
        let result = f(&mut instance);
        Self::destroy_raw(&mut instance);
        result
    }

    fn instantiate_raw(&mut self, class_name: &str) -> Result<ComponentInstance, String> {
        let library = self
            .library
            .as_ref()
            .ok_or_else(|| "Library is not loaded".to_string())?;

        let destroy_object = library.destroy_object;
        let get_class_object = library.get_class_object;

        unsafe {
            let mut component: *mut c_void = std::ptr::null_mut();
            let class_name_utf16 = encode_utf16z(class_name);
            let code = get_class_object(class_name_utf16.as_ptr(), &mut component);
            if code == 0 || component.is_null() {
                return Err(format!(
                    "GetClassObject failed for class '{}' (code {})",
                    class_name_to_debug(&class_name_utf16),
                    code
                ));
            }

            let refs = ComponentRefs::from_component(component);
            if !refs.call_set_mem_manager(component, memory_manager()) {
                destroy_component(destroy_object, component);
                return Err("setMemManager failed".to_string());
            }

            if !refs.call_init(component, connection()) {
                destroy_component(destroy_object, component);
                return Err("Init failed".to_string());
            }

            Ok(ComponentInstance {
                component,
                refs,
                destroy_object,
                class_name: class_name.to_string(),
            })
        }
    }

    fn destroy_raw(instance: &mut ComponentInstance) {
        unsafe {
            instance.refs.call_done(instance.component);
            destroy_component(instance.destroy_object, instance.component);
        }
        instance.component = std::ptr::null_mut();
    }
}

impl ComponentInstance {
    fn metadata(&self) -> Result<JanxValue, String> {
        unsafe {
            let methods_count = self.refs.call_get_n_methods(self.component);
            let mut methods = Vec::new();

            for index in 0..methods_count {
                let name_ru = read_method_name(&self.refs, self.component, index, 0);
                let name_en = read_method_name(&self.refs, self.component, index, 1);
                let params = self.refs.call_get_n_params(self.component, index);
                let has_return = self.refs.call_has_ret_val(self.component, index);

                methods.push(janx!({
                    "index": index,
                    "name_ru": name_ru,
                    "name_en": name_en,
                    "params": params,
                    "has_return": has_return,
                }));
            }

            let props_count = self.refs.call_get_n_props(self.component);
            let mut properties = Vec::new();

            for index in 0..props_count {
                let name_ru = read_prop_name(&self.refs, self.component, index, 0);
                let name_en = read_prop_name(&self.refs, self.component, index, 1);
                let readable = self.refs.call_is_prop_readable(self.component, index);
                let writable = self.refs.call_is_prop_writable(self.component, index);

                properties.push(janx!({
                    "index": index,
                    "name_ru": name_ru,
                    "name_en": name_en,
                    "readable": readable,
                    "writable": writable,
                }));
            }

            Ok(janx!({
                "methods": methods,
                "properties": properties,
            }))
        }
    }

    fn all_properties(&self) -> Result<JanxValue, String> {
        unsafe {
            let props_count = self.refs.call_get_n_props(self.component);
            let mut properties = BTreeMap::new();

            for index in 0..props_count {
                if !self.refs.call_is_prop_readable(self.component, index) {
                    continue;
                }

                let name_ru = read_prop_name(&self.refs, self.component, index, 0);
                let name_en = read_prop_name(&self.refs, self.component, index, 1);
                let mut value = TVariant::default();

                if !self
                    .refs
                    .call_get_prop_val(self.component, index, &mut value)
                {
                    let message = variant_error_message(&value)
                        .unwrap_or_else(|| format!("GetPropVal failed for property index {}", index));
                    return Err(message);
                }

                let janx_value = variant_to_janx(&value);
                if !name_en.is_empty() {
                    properties.insert(name_en.clone(), janx_value.clone());
                }
                if !name_ru.is_empty() && name_ru != name_en {
                    properties.insert(name_ru, janx_value);
                }
            }

            Ok(JanxValue::Object(properties))
        }
    }

    fn call_method(&self, method: &str, params_blob: &[u8]) -> Result<JanxValue, String> {
        let method_num = resolve_method_index(&self.refs, self.component, method)?;

        let mut params = janx_params_to_variants(params_blob)?;
        let param_count = params.len() as c_long;
        let has_return = unsafe {
            self.refs
                .call_has_ret_val(self.component, method_num)
        };

        unsafe {
            if has_return {
                let mut ret_value = TVariant::default();
                let ok = self.refs.call_call_as_func(
                    self.component,
                    method_num,
                    &mut ret_value,
                    params.as_mut_ptr(),
                    param_count,
                );

                if !ok {
                    let message = variant_error_message(&ret_value)
                        .unwrap_or_else(|| "CallAsFunc returned false".to_string());
                    return Err(message);
                }

                Ok(variant_to_janx(&ret_value))
            } else {
                let ok = self.refs.call_call_as_proc(
                    self.component,
                    method_num,
                    params.as_mut_ptr(),
                    param_count,
                );
                if !ok {
                    return Err("CallAsProc returned false".to_string());
                }
                Ok(janx!({ "type": "empty" }))
            }
        }
    }

    fn get_property(&self, property: &str) -> Result<JanxValue, String> {
        let prop_num = resolve_prop_index(&self.refs, self.component, property)?;
        let mut value = TVariant::default();

        unsafe {
            if !self
                .refs
                .call_get_prop_val(self.component, prop_num, &mut value)
            {
                let message = variant_error_message(&value)
                    .unwrap_or_else(|| "GetPropVal returned false".to_string());
                return Err(message);
            }
        }

        Ok(variant_to_janx(&value))
    }

    fn set_property(&mut self, property: &str, value_blob: &[u8]) -> Result<(), String> {
        let prop_num = resolve_prop_index(&self.refs, self.component, property)?;
        let mut value = janx_params_to_variants(value_blob)?
            .into_iter()
            .next()
            .ok_or_else(|| "Property value is required".to_string())?;

        unsafe {
            if !self
                .refs
                .call_set_prop_val(self.component, prop_num, &mut value)
            {
                return Err("SetPropVal returned false".to_string());
            }
        }

        Ok(())
    }

    fn set_properties_from_blob(&mut self, properties_blob: &[u8]) -> Result<(), String> {
        let properties = janx_object_from_blob(properties_blob)?;
        for (property, value) in properties {
            let prop_num = resolve_prop_index(&self.refs, self.component, &property)?;
            let mut variant = janx_to_variant(&value)?;

            unsafe {
                if !self
                    .refs
                    .call_set_prop_val(self.component, prop_num, &mut variant)
                {
                    return Err(format!("SetPropVal returned false for '{}'", property));
                }
            }
        }

        Ok(())
    }
}

impl Drop for HostState {
    fn drop(&mut self) {
        for (_, mut instance) in self.instances.drain() {
            Self::destroy_raw(&mut instance);
        }
        self.library = None;
    }
}

unsafe fn destroy_component(destroy_object: DestroyObjectFn, component: *mut c_void) {
    let mut ptr = component;
    let _ = destroy_object(&mut ptr);
}

fn class_name_to_debug(name: &[u16]) -> String {
    let end = name.iter().position(|&c| c == 0).unwrap_or(name.len());
    String::from_utf16_lossy(&name[..end])
}

unsafe fn read_method_name(
    refs: &ComponentRefs,
    component: *mut c_void,
    index: c_long,
    alias: c_long,
) -> String {
    let ptr = refs.call_get_method_name(component, index, alias);
    let name = utf16_ptr_to_string(ptr).unwrap_or_default();
    free_component_string(ptr);
    name
}

unsafe fn read_prop_name(
    refs: &ComponentRefs,
    component: *mut c_void,
    index: c_long,
    alias: c_long,
) -> String {
    let ptr = refs.call_get_prop_name(component, index, alias);
    let name = utf16_ptr_to_string(ptr).unwrap_or_default();
    free_component_string(ptr);
    name
}

fn resolve_method_index(
    refs: &ComponentRefs,
    component: *mut c_void,
    method: &str,
) -> Result<c_long, String> {
    if let Ok(index) = method.parse::<c_long>() {
        return Ok(index);
    }

    let name = encode_utf16z(method);
    unsafe {
        let index = refs.call_find_method(component, name.as_ptr());
        if index < 0 {
            return Err(format!("Method '{}' not found", method));
        }
        Ok(index)
    }
}

fn resolve_prop_index(
    refs: &ComponentRefs,
    component: *mut c_void,
    property: &str,
) -> Result<c_long, String> {
    if let Ok(index) = property.parse::<c_long>() {
        return Ok(index);
    }

    let name = encode_utf16z(property);
    unsafe {
        let index = refs.call_find_prop(component, name.as_ptr());
        if index < 0 {
            return Err(format!("Property '{}' not found", property));
        }
        Ok(index)
    }
}
