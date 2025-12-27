use bytes::Buf;

// Кастомный кодек нужен потому, что сообщение сериализуется заранее
// и нужно избегать двойной сериализации в байты, которую делает default кодек

#[derive(Debug, Clone, Copy, Default)]
pub struct IdentityCodec;

impl tonic::codec::Codec for IdentityCodec {
    type Encode = Vec<u8>;
    type Decode = Vec<u8>;
    type Encoder = IdentityEncoder;
    type Decoder = IdentityDecoder;

    fn encoder(&mut self) -> Self::Encoder {
        IdentityEncoder
    }

    fn decoder(&mut self) -> Self::Decoder {
        IdentityDecoder
    }
}

#[derive(Debug, Clone, Copy, Default)]
pub struct IdentityEncoder;

impl tonic::codec::Encoder for IdentityEncoder {
    type Item = Vec<u8>;
    type Error = tonic::Status;

    fn encode(&mut self, item: Self::Item, dst: &mut tonic::codec::EncodeBuf<'_>) -> Result<(), Self::Error> {
        use bytes::BufMut;
        dst.reserve(item.len());
        dst.put_slice(&item);
        Ok(())
    }
}

#[derive(Debug, Clone, Copy, Default)]
pub struct IdentityDecoder;

impl tonic::codec::Decoder for IdentityDecoder {
    type Item = Vec<u8>;
    type Error = tonic::Status;

    fn decode(&mut self, src: &mut tonic::codec::DecodeBuf<'_>) -> Result<Option<Self::Item>, Self::Error> {
        let bytes = src.copy_to_bytes(src.remaining());
        Ok(Some(bytes.to_vec()))
    }
}
