use addin1c::Variant;

pub fn send_message(
    field1: &str,
    ret_value: &mut Variant,
) -> bool {

    let utf16_vec: Vec<u16> = field1.encode_utf16().collect();
    ret_value.set_str(&utf16_vec);
    true
}