use std::collections::HashMap;
use common_tcp::tls_settings::TlsSettings;
use prost_reflect::DescriptorPool;
use tonic::transport::Channel;
use crate::stream_manager::StreamManager;

pub struct ClientState {
    pub(crate) connected: bool,
    pub(crate) address: String,
    pub(crate) tls_settings: Option<TlsSettings>,
    pub(crate) metadata: HashMap<String, String>,
    pub(crate) channel: Option<Channel>,
    pub(crate) descriptor_pool: Option<DescriptorPool>,
    pub(crate) stream_manager: StreamManager,
    pub(crate) proto_files: HashMap<String, String>,
}

impl ClientState {
    pub(crate) fn new() -> Self {
        Self {
            connected: false,
            address: String::new(),
            tls_settings: None,
            metadata: HashMap::new(),
            channel: None,
            descriptor_pool: None,
            stream_manager: StreamManager::new(),
            proto_files: HashMap::new(),
        }
    }

    pub(crate) fn disconnect(&mut self) {
        self.connected = false;
        self.address.clear();
        self.metadata.clear();
        self.channel = None;
    }

    pub(crate) fn set_metadata(&mut self, metadata: HashMap<String, String>) {
        self.metadata = metadata;
    }
}