use std::pin::Pin;
use std::task::{Context, Poll};
use futures::Stream;
use prost::Message;
use tokio::sync::{mpsc, oneshot};
use crate::stream_manager::StreamMessage;

pub struct AckStream {
    receiver: mpsc::Receiver<StreamMessage>,
    current_ack: Option<oneshot::Sender<()>>,
}

impl AckStream {
    pub fn new(receiver: mpsc::Receiver<StreamMessage>) -> Self {
        AckStream{
            receiver,
            current_ack: None,
        }
    }
}

impl Stream for AckStream {
    type Item = Vec<u8>;

    fn poll_next(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Option<Self::Item>> {

        if let Some(ack) = self.current_ack.take() {
            let _ = ack.send(());
        }

        match self.receiver.poll_recv(cx) {
            Poll::Ready(Some(msg_with_ack)) => {
                let bytes = msg_with_ack.message.encode_to_vec();
                self.current_ack = Some(msg_with_ack.ack);
                Poll::Ready(Some(bytes))
            }
            Poll::Ready(None) => {
                Poll::Ready(None)
            }
            Poll::Pending => Poll::Pending,
        }
    }

}