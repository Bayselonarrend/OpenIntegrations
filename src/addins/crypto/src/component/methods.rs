use hmac::{Hmac, Mac};
use sha1::Sha1;
use sha2::Sha256;
use rsa::{RsaPrivateKey, pkcs1::DecodeRsaPrivateKey, pkcs8::DecodePrivateKey};
use rsa::pkcs1v15::{Pkcs1v15Sign};
use rsa::signature::digest::{Digest, FixedOutput};

// ===== HMAC ===== //

/// Генерирует HMAC-SHA1 подпись
pub fn hmac_sha1(key: &[u8], data: &[u8]) -> Result<Vec<u8>, String> {
    Hmac::<Sha1>::new_from_slice(key)
        .map_err(|e| format!("Invalid HMAC-SHA1 key: {}", e))
        .and_then(|mut mac| {
            mac.update(data);
            Ok(mac.finalize().into_bytes().to_vec())
        })
}

/// Генерирует HMAC-SHA256 подпись
pub fn hmac_sha256(key: &[u8], data: &[u8]) -> Result<Vec<u8>, String> {
    Hmac::<Sha256>::new_from_slice(key)
        .map_err(|e| format!("Invalid HMAC-SHA256 key: {}", e))
        .and_then(|mut mac| {
            mac.update(data);
            Ok(mac.finalize().into_bytes().to_vec())
        })
}

// ===== RSA ===== //

pub fn load_rsa_key(key_data: &[u8]) -> Result<RsaPrivateKey, String> {
    if let Ok(key) = RsaPrivateKey::from_pkcs1_der(key_data) {
        return Ok(key);
    }

    if let Ok(key) = RsaPrivateKey::from_pkcs8_der(key_data) {
        return Ok(key);
    }

    let pem_str = match std::str::from_utf8(key_data) {
        Ok(s) => s,
        Err(_) => return Err("Invalid key format: not DER or PEM".to_string()),
    };

    if let Ok(key) = RsaPrivateKey::from_pkcs1_pem(pem_str) {
        return Ok(key);
    }

    if let Ok(key) = RsaPrivateKey::from_pkcs8_pem(pem_str) {
        return Ok(key);
    }

    Err("Invalid RSA key format. Expected: PKCS#1/8 PEM or DER".to_string())
}

fn rsa_sign<D>(key: &RsaPrivateKey, data: &[u8]) -> Result<Vec<u8>, String>
where
    D: Digest + FixedOutput  + rsa::pkcs8::AssociatedOid,
{
    // Создаем схему подписи с указанием хеш-алгоритма
    let scheme = Pkcs1v15Sign::new::<D>();

    // Хешируем данные
    let mut hasher = D::new();
    Digest::update(&mut hasher, data);
    let digest = hasher.finalize();

    // Подписываем хеш
    let signature = key.sign(scheme, &digest).map_err(|e| format!("RSA signing error: {}", e))?;

    Ok(signature)
}

/// Подписывает данные с помощью RSA-SHA1
pub fn rsa_sha1(key: &[u8], data: &[u8]) -> Result<Vec<u8>, String> {
    let key = load_rsa_key(key)?;
    rsa_sign::<Sha1>(&key, data)
}

/// Подписывает данные с помощью RSA-SHA256
pub fn rsa_sha256(key: &[u8], data: &[u8]) -> Result<Vec<u8>, String> {
    let key = load_rsa_key(key)?;
    rsa_sign::<Sha256>(&key, data)
}