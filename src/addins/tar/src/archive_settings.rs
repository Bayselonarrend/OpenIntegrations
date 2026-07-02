use common_core::{FromJanx, JanxValue};
use flate2::Compression;

const DEFAULT_GZIP_LEVEL: u32 = 6;

#[derive(Debug, Clone)]
pub struct PackSettings {
    pub gzip: bool,
    pub gzip_level: u32,
}

impl Default for PackSettings {
    fn default() -> Self {
        Self {
            gzip: false,
            gzip_level: DEFAULT_GZIP_LEVEL,
        }
    }
}

impl PackSettings {
    pub fn from_janx(value: &JanxValue) -> Result<Self, String> {
        if matches!(value, JanxValue::Null) || value.is_empty() {
            return Ok(Self::default());
        }

        let object = value
            .as_object()
            .ok_or_else(|| "Pack settings must be a Janx object".to_string())?;

        let gzip = object
            .get("gzip")
            .and_then(bool::from_janx)
            .unwrap_or(false);

        let gzip_level = object
            .get("gzip_level")
            .and_then(parse_u32)
            .unwrap_or(DEFAULT_GZIP_LEVEL)
            .min(9);

        Ok(Self { gzip, gzip_level })
    }

    pub fn gzip_compression(&self) -> Compression {
        Compression::new(self.gzip_level)
    }
}

fn parse_u32(value: &JanxValue) -> Option<u32> {
    value
        .as_i64()
        .and_then(|number| u32::try_from(number).ok())
}
