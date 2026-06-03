#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum ExchangeScheme {
    ReqRep,
    PubSub,
    Push,
    Pull,
}