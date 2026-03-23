use serde::{Deserialize, Serialize};
use ssh2::KeyboardInteractivePrompt;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PromptInfo {
    pub text: String,
    pub echo: bool,
}

pub struct KeyboardInteractiveHandler {
    responses: Vec<String>,
    index: usize,
    prompts_received: Vec<PromptInfo>,
    callback_count: usize,
}

impl KeyboardInteractiveHandler {
    pub fn new(responses: Vec<String>) -> Self {
        Self {
            responses,
            index: 0,
            prompts_received: Vec::new(),
            callback_count: 0,
        }
    }

    pub fn get_prompts(&self) -> Vec<PromptInfo> {
        self.prompts_received.clone()
    }

    pub fn get_callback_count(&self) -> usize {
        self.callback_count
    }

    pub fn get_responses_count(&self) -> usize {
        self.responses.len()
    }
}

impl KeyboardInteractivePrompt for KeyboardInteractiveHandler {
    fn prompt<'a>(
        &mut self,
        _username: &str,
        _instructions: &str,
        prompts: &[ssh2::Prompt<'a>],
    ) -> Vec<String> {
        self.callback_count += 1;

        let mut answers = Vec::new();

        for prompt in prompts {
            self.prompts_received.push(PromptInfo {
                text: prompt.text.to_string(),
                echo: prompt.echo,
            });

            if self.index < self.responses.len() {
                answers.push(self.responses[self.index].clone());
                self.index += 1;
            } else {
                answers.push(String::new());
            }
        }
        answers
    }
}