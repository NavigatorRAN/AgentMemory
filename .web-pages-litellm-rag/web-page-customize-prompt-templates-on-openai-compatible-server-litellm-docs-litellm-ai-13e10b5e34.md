# Customize Prompt Templates on OpenAI-Compatible server | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/model_config_proxy
- Final URL: https://docs.litellm.ai/docs/tutorials/model_config_proxy
- Canonical URL: https://docs.litellm.ai/docs/tutorials/model_config_proxy
- Fetched at: 2026-06-23T14:34:27Z
- Content type: text/html; charset=utf-8

## Description

You will learn: How to set a custom prompt template on our OpenAI compatible server.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
You will learn: How to set a custom prompt template on our OpenAI compatible server.
How? We will modify the prompt template for CodeLlama
Step 1: Start OpenAI Compatible server ​
Let's spin up a local OpenAI-compatible server, to call a deployed codellama/CodeLlama-34b-Instruct-hf model using Huggingface's Text-Generation-Inference (TGI) format.
$ litellm --model huggingface/codellama/CodeLlama-34b-Instruct-hf --api_base https://my-endpoint.com
# OpenAI compatible server running on http://0.0.0.0/8000
In a new shell, run:
$ litellm --test
This will send a test request to our endpoint.
Now, let's see what got sent to huggingface. Run:
$ litellm --logs
This will return the most recent log (by default logs are stored in a local file called 'api_logs.json').
As we can see, this is the formatting sent to huggingface:
This follows our formatting for CodeLlama (based on the Huggingface's documentation ).
But this lacks BOS( <s> ) and EOS( </s> ) tokens.
So instead of using the LiteLLM default, let's use our own prompt template to use these in our messages.
Step 2: Create Custom Prompt Template ​
Our litellm server accepts prompt templates as part of a config file. You can save api keys, fallback models, prompt templates etc. in this config. See a complete config file
For now, let's just create a simple config file with our prompt template, and tell our server about it.
Create a file called litellm_config.toml :
$ touch litellm_config.toml
We want to add:
BOS ( <s> ) tokens at the start of every System and Human message
EOS ( </s> ) tokens at the end of every assistant message.
Let's open our file in our terminal:
$ vi litellm_config.toml
paste our prompt template:
[model."huggingface/codellama/CodeLlama-34b-Instruct-hf".prompt_template]
MODEL_SYSTEM_MESSAGE_START_TOKEN = "<s>[INST] <<SYS>>\n]"
MODEL_SYSTEM_MESSAGE_END_TOKEN = "\n<</SYS>>\n [/INST]\n"
MODEL_USER_MESSAGE_START_TOKEN = "<s>[INST] "
MODEL_USER_MESSAGE_END_TOKEN = " [/INST]\n"
MODEL_ASSISTANT_MESSAGE_START_TOKEN = ""
MODEL_ASSISTANT_MESSAGE_END_TOKEN = "</s>"
save our file (in vim):
:wq
Step 3: Run new template ​
Let's save our custom template to our litellm server by running:
$ litellm --config -f ./litellm_config.toml
LiteLLM will save a copy of this file in it's package, so it can persist these settings across restarts.
Re-start our server:
See our new input prompt to Huggingface!
Congratulations 🎉
Step 1: Start OpenAI Compatible server
Step 2: Create Custom Prompt Template
Step 3: Run new template
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
