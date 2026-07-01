use common_core::{FromJanx, JanxValue};
use sevenz_rust2::{
    encoder_options::{
        AesEncoderOptions, Bzip2Options, DeltaOptions, EncoderOptions, Lzma2Options, LzmaOptions,
        PpmdOptions,
    },
    ArchiveWriter, EncoderConfiguration, EncoderMethod, Password,
};

const DEFAULT_LEVEL: u32 = 6;
const DEFAULT_CHUNK_SIZE: u64 = 1 << 18;

#[derive(Debug, Clone)]
pub struct PackSettings {
    pub password: String,
    pub method: CompressionMethod,
    pub level: u32,
    pub solid: bool,
    pub encrypt_header: Option<bool>,
    pub threads: u32,
    pub chunk_size: u64,
    pub dictionary_size: Option<u32>,
    pub delta_distance: Option<u32>,
    pub ppmd_order: Option<u32>,
    pub ppmd_memory: Option<u32>,
    pub filters: Vec<FilterMethod>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum CompressionMethod {
    #[default]
    Lzma2,
    Lzma,
    Bzip2,
    Ppmd,
    Copy,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FilterMethod {
    BcjX86,
    BcjPpc,
    BcjIa64,
    BcjArm,
    BcjArm64,
    BcjArmThumb,
    BcjSparc,
    BcjRiscv,
    Delta,
}

impl Default for PackSettings {
    fn default() -> Self {
        Self {
            password: String::new(),
            method: CompressionMethod::Lzma2,
            level: DEFAULT_LEVEL,
            solid: false,
            encrypt_header: None,
            threads: 1,
            chunk_size: DEFAULT_CHUNK_SIZE,
            dictionary_size: None,
            delta_distance: None,
            ppmd_order: None,
            ppmd_memory: None,
            filters: Vec::new(),
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

        let password = object
            .get("password")
            .and_then(String::from_janx)
            .unwrap_or_default();

        let method = object
            .get("method")
            .map(parse_compression_method)
            .transpose()?
            .unwrap_or_default();

        let level = object
            .get("level")
            .and_then(parse_u32)
            .unwrap_or(DEFAULT_LEVEL);

        let solid = object
            .get("solid")
            .and_then(bool::from_janx)
            .unwrap_or(false);

        let encrypt_header = object
            .get("encrypt_header")
            .and_then(bool::from_janx);

        let threads = object
            .get("threads")
            .and_then(parse_u32)
            .unwrap_or(1)
            .max(1);

        let chunk_size = object
            .get("chunk_size")
            .and_then(parse_u64)
            .unwrap_or(DEFAULT_CHUNK_SIZE)
            .max(1);

        let dictionary_size = object.get("dictionary_size").and_then(parse_u32);
        let delta_distance = object.get("delta_distance").and_then(parse_u32);
        let ppmd_order = object.get("ppmd_order").and_then(parse_u32);
        let ppmd_memory = object.get("ppmd_memory").and_then(parse_u32);

        let filters = match object.get("filters") {
            Some(value) => parse_filters(value)?,
            None => Vec::new(),
        };

        Ok(Self {
            password,
            method,
            level,
            solid,
            encrypt_header,
            threads,
            chunk_size,
            dictionary_size,
            delta_distance,
            ppmd_order,
            ppmd_memory,
            filters,
        })
    }

    pub fn apply_to_writer<W: std::io::Write + std::io::Seek>(
        &self,
        writer: &mut ArchiveWriter<W>,
    ) {
        let encrypt_header = self.encrypt_header.unwrap_or(!self.password.is_empty());
        writer.set_encrypt_header(encrypt_header);
        writer.set_content_methods(self.build_content_methods());
    }

    pub fn build_content_methods(&self) -> Vec<EncoderConfiguration> {
        let mut methods = Vec::new();

        if !self.password.is_empty() {
            methods.push(AesEncoderOptions::new(Password::new(&self.password)).into());
        }

        for filter in &self.filters {
            methods.push(filter.to_configuration(self));
        }

        methods.push(self.compression_configuration());
        methods
    }
}

impl PackSettings {
    fn compression_configuration(&self) -> EncoderConfiguration {
        match self.method {
            CompressionMethod::Lzma2 => {
                let mut options = if self.threads > 1 {
                    Lzma2Options::from_level_mt(self.level, self.threads, self.chunk_size)
                } else {
                    Lzma2Options::from_level(self.level)
                };

                if let Some(dict_size) = self.dictionary_size {
                    options.set_dictionary_size(dict_size);
                }

                options.into()
            }
            CompressionMethod::Lzma => {
                EncoderConfiguration::new(EncoderMethod::LZMA)
                    .with_options(EncoderOptions::Lzma(LzmaOptions::from_level(self.level)))
            }
            CompressionMethod::Bzip2 => Bzip2Options::from_level(self.level).into(),
            CompressionMethod::Ppmd => {
                let order = self.ppmd_order.unwrap_or(self.level);
                let memory = self.ppmd_memory.unwrap_or(16 * 1024 * 1024);
                PpmdOptions::from_order_memory_size(order, memory).into()
            }
            CompressionMethod::Copy => EncoderConfiguration::new(EncoderMethod::COPY),
        }
    }
}

impl FilterMethod {
    fn to_configuration(&self, settings: &PackSettings) -> EncoderConfiguration {
        match self {
            Self::BcjX86 => EncoderConfiguration::new(EncoderMethod::BCJ_X86_FILTER),
            Self::BcjPpc => EncoderConfiguration::new(EncoderMethod::BCJ_PPC_FILTER),
            Self::BcjIa64 => EncoderConfiguration::new(EncoderMethod::BCJ_IA64_FILTER),
            Self::BcjArm => EncoderConfiguration::new(EncoderMethod::BCJ_ARM_FILTER),
            Self::BcjArm64 => EncoderConfiguration::new(EncoderMethod::BCJ_ARM64_FILTER),
            Self::BcjArmThumb => EncoderConfiguration::new(EncoderMethod::BCJ_ARM_THUMB_FILTER),
            Self::BcjSparc => EncoderConfiguration::new(EncoderMethod::BCJ_SPARC_FILTER),
            Self::BcjRiscv => EncoderConfiguration::new(EncoderMethod::BCJ_RISCV_FILTER),
            Self::Delta => {
                let distance = settings.delta_distance.unwrap_or(1);
                DeltaOptions::from_distance(distance).into()
            }
        }
    }
}

fn parse_compression_method(value: &JanxValue) -> Result<CompressionMethod, String> {
    let method = String::from_janx(value)
        .ok_or_else(|| "Compression method must be a string".to_string())?;

    if method.is_empty() {
        return Ok(CompressionMethod::default());
    }

    match method.to_ascii_uppercase().as_str() {
        "LZMA2" => Ok(CompressionMethod::Lzma2),
        "LZMA" => Ok(CompressionMethod::Lzma),
        "BZIP2" | "BZ2" => Ok(CompressionMethod::Bzip2),
        "PPMD" => Ok(CompressionMethod::Ppmd),
        "COPY" | "STORE" => Ok(CompressionMethod::Copy),
        other => Err(format!("Unsupported compression method: {}", other)),
    }
}

fn parse_filter(value: &JanxValue) -> Result<FilterMethod, String> {
    let filter = String::from_janx(value)
        .ok_or_else(|| "Filter name must be a string".to_string())?;

    if filter.is_empty() {
        return Err("Filter name must not be empty".to_string());
    }

    match filter.to_ascii_uppercase().as_str() {
        "BCJ_X86" | "BCJ X86" | "X86" => Ok(FilterMethod::BcjX86),
        "BCJ_PPC" | "PPC" => Ok(FilterMethod::BcjPpc),
        "BCJ_IA64" | "IA64" => Ok(FilterMethod::BcjIa64),
        "BCJ_ARM" | "ARM" => Ok(FilterMethod::BcjArm),
        "BCJ_ARM64" | "ARM64" => Ok(FilterMethod::BcjArm64),
        "BCJ_ARM_THUMB" | "ARM_THUMB" => Ok(FilterMethod::BcjArmThumb),
        "BCJ_SPARC" | "SPARC" => Ok(FilterMethod::BcjSparc),
        "BCJ_RISCV" | "RISC_V" | "RISCV" => Ok(FilterMethod::BcjRiscv),
        "DELTA" => Ok(FilterMethod::Delta),
        other => Err(format!("Unsupported filter: {}", other)),
    }
}

fn parse_filters(value: &JanxValue) -> Result<Vec<FilterMethod>, String> {
    if value.is_empty() {
        return Ok(Vec::new());
    }

    let items = Vec::<JanxValue>::from_janx(value)
        .ok_or_else(|| "'filters' must be an array".to_string())?;

    items
        .iter()
        .filter(|item| !item.is_empty())
        .map(parse_filter)
        .collect()
}

fn parse_u32(value: &JanxValue) -> Option<u32> {
    value
        .as_i64()
        .and_then(|number| u32::try_from(number).ok())
}

fn parse_u64(value: &JanxValue) -> Option<u64> {
    value
        .as_i64()
        .and_then(|number| u64::try_from(number).ok())
}
