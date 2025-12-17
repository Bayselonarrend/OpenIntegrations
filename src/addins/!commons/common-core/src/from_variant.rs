use addin1c::Variant;

/// Trait для автоматической конвертации из Variant в нужный тип
/// 
/// # Пример
/// 
/// ```rust
/// fn my_method(value: impl FromVariant) {
///     // value автоматически конвертируется из Variant
/// }
/// 
/// // Вызов:
/// my_method(&params[0]); // Rust сам выведет тип из сигнатуры
/// ```
pub trait FromVariant {
    fn from_variant(variant: &Variant) -> Self;
}

// Реализации для базовых типов

impl FromVariant for String {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_string().unwrap_or_default()
    }
}

impl FromVariant for bool {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_bool().unwrap_or(false)
    }
}

impl FromVariant for i32 {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_i32().unwrap_or(0)
    }
}

impl FromVariant for i64 {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_i32().unwrap_or(0) as i64
    }
}

impl FromVariant for f64 {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_f64().unwrap_or(0.0)
    }
}

impl FromVariant for f32 {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_f64().unwrap_or(0.0) as f32
    }
}

impl FromVariant for Vec<u8> {
    fn from_variant(variant: &Variant) -> Self {
        variant.get_blob().unwrap_or_default().to_vec()
    }
}

// Для &str нужен специальный подход, так как нельзя вернуть заимствование
// Вместо этого используем String и передаём &str через as_str()
