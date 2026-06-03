use zeromq::{PubSocket, PullSocket, PushSocket, RepSocket, ReqSocket, SubSocket};

pub(crate) enum OpenSocket {
    None,
    Req(ReqSocket),
    Rep(RepSocket),
    Pub(PubSocket),
    Sub(SubSocket),
    Push(PushSocket),
    Pull(PullSocket),
}