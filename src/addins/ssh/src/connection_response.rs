use common_core::JanxValue;
use common_janx::janx;
use common_utils::utils::janx_error;
use serde::{Deserialize, Serialize};

use crate::keyboard_interactive::PromptInfo;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ConnectionResponse {
    pub result: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
    pub identities: Vec<String>,
    pub methods: String,
    pub banner: String,
    pub kex_methods: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub keyboard_prompts: Option<Vec<PromptInfo>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub keyboard_callback_count: Option<usize>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub keyboard_responses_provided: Option<usize>,
}

impl ConnectionResponse {
    pub fn new(result: bool) -> Self {
        Self {
            result,
            error: None,
            identities: Vec::new(),
            methods: String::new(),
            banner: String::new(),
            kex_methods: String::new(),
            keyboard_prompts: None,
            keyboard_callback_count: None,
            keyboard_responses_provided: None,
        }
    }

    pub fn with_error(mut self, error: String) -> Self {
        self.error = Some(error);
        self
    }

    pub fn with_identities(mut self, identities: Vec<String>) -> Self {
        self.identities = identities;
        self
    }

    pub fn with_methods(mut self, methods: String) -> Self {
        self.methods = methods;
        self
    }

    pub fn with_banner(mut self, banner: String) -> Self {
        self.banner = banner;
        self
    }

    pub fn with_kex_methods(mut self, kex_methods: String) -> Self {
        self.kex_methods = kex_methods;
        self
    }

    pub fn with_keyboard_info(
        mut self,
        prompts: Vec<PromptInfo>,
        callback_count: usize,
        responses_count: usize,
    ) -> Self {
        self.keyboard_prompts = Some(prompts);
        self.keyboard_callback_count = Some(callback_count);
        self.keyboard_responses_provided = Some(responses_count);
        self
    }

    pub fn to_janx(&self) -> JanxValue {
        if !self.result {
            return janx_error(
                self.error
                    .clone()
                    .unwrap_or_else(|| "Unknown error".to_string()),
            );
        }

        let keyboard_prompts = self.keyboard_prompts.as_ref().map(|prompts| {
            JanxValue::Array(
                prompts
                    .iter()
                    .map(|p| {
                        janx!({
                            "text": p.text.clone(),
                            "echo": p.echo,
                        })
                    })
                    .collect(),
            )
        });

        janx!({
            "result": true,
            "identities": self.identities.clone(),
            "methods": self.methods.clone(),
            "banner": self.banner.clone(),
            "kex_methods": self.kex_methods.clone(),
            "keyboard_prompts": keyboard_prompts,
            "keyboard_callback_count": self.keyboard_callback_count,
            "keyboard_responses_provided": self.keyboard_responses_provided,
        })
    }
}
