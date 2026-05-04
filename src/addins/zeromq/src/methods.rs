use crate::AddIn;

impl AddIn {
    pub fn stub_connect(&mut self, endpoint: &str) -> bool {
        self.endpoint = endpoint.to_owned();
        self.save_error_str(
            "ZeroMQ scaffold: hook up `zmq` + libzmq; Connect is not implemented.",
        );
        false
    }

    pub fn stub_bind(&mut self, endpoint: &str) -> bool {
        self.endpoint = endpoint.to_owned();
        self.save_error_str(
            "ZeroMQ scaffold: hook up `zmq` + libzmq; Bind is not implemented.",
        );
        false
    }

    pub fn stub_subscribe(&mut self, _prefix: &str) -> String {
        self.save_error_str(
            "ZeroMQ scaffold: Subscribe is for SUB sockets after ZMQ wiring.",
        );
        self.last_error.clone()
    }

    pub fn stub_send(&mut self, _data: Vec<u8>, _flags: i32) -> bool {
        self.save_error_str(
            "ZeroMQ scaffold: Send (multipart) after queue integration.",
        );
        false
    }

    pub fn stub_recv(&mut self, _timeout_ms: i32) -> Vec<u8> {
        self.save_error_str(
            "ZeroMQ scaffold: Recv will return message frames after integration.",
        );
        Vec::new()
    }
}
