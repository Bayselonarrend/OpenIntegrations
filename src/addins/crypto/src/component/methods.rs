use hmac::{Hmac, Mac};
use sha1::Sha1;
use sha2::{Sha256};
use rsa::{RsaPrivateKey, pkcs1::DecodeRsaPrivateKey};
use rsa::pkcs1v15::SigningKey;
use rsa::signature::digest::{Digest, FixedOutput};
use rsa::signature::{Signer, SignatureEncoding};

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

fn load_rsa_key(key: &[u8]) -> Result<RsaPrivateKey, String> {

    match RsaPrivateKey::from_pkcs1_der(key){
        Ok(v) => Ok(v),
        Err(_) => {

            let pem_string = match std::str::from_utf8(key){
                Ok(pem_str) => pem_str,
                Err(_) =>  return Err("Invalid RSA key format".to_string()),
            };

            match RsaPrivateKey::from_pkcs1_pem(pem_string){
                Ok(v) => Ok(v),
                Err(_) =>  Err("Invalid RSA key format".to_string()),
            }

        }
    }
}

fn rsa_sign<D>(key: &RsaPrivateKey, data: &[u8]) -> Result<Vec<u8>, String>
where
    D: Digest + FixedOutput,
    SigningKey<D>: From<RsaPrivateKey>,
{
    let signing_key = SigningKey::<D>::new_unprefixed(key.clone());
    let mut hasher = D::new();
    Digest::update(&mut hasher, data);
    let digest = hasher.finalize();

    let sign_result = signing_key.try_sign(&digest);

    match sign_result {
        Ok(signature) => Ok(signature.to_vec()),
        Err(e) => Err(format!("RSA signing error: {}", e)),
    }
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
