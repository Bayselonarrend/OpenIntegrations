use common_core::JanxValue;

#[derive(Debug, Clone, Default)]
pub struct PackSettings;

impl PackSettings {
    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        if matches!(value, JanxValue::Null) || value.is_empty() {
            return Ok(Self);
        }

        if value.as_object().is_some() {
            return Ok(Self);
        }

        Err("Pack settings must be a Janx object".to_string())
    }
}
