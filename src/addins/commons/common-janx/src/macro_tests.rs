use crate::{decode, encode, JanxValue};

#[test]
fn janx_object_with_binary_roundtrip() {
    let value = janx!({
        "result": true,
        "label": "test",
        "payload": vec![1u8, 2, 3],
        "count": 3,
    });

    let frame = encode(&value).unwrap();
    let restored = decode(&frame).unwrap();
    assert_eq!(restored, value);
}

#[test]
fn janx_nested_array() {
    let value = janx!({
        "headers": [["Content-Type", "text/plain"], ["X", "Y"]],
    });

    let JanxValue::Object(map) = value else {
        panic!("expected object");
    };
    let JanxValue::Array(rows) = map.get("headers").unwrap() else {
        panic!("expected array");
    };
    assert_eq!(rows.len(), 2);
}

#[test]
fn janx_null_and_option() {
    let value = janx!({
        "missing": None::<String>,
        "present": Some("ok"),
    });

    let JanxValue::Object(map) = value else {
        panic!("expected object");
    };
    assert!(matches!(map.get("missing"), Some(JanxValue::Null)));
    assert!(matches!(map.get("present"), Some(JanxValue::String(s)) if s == "ok"));
}
