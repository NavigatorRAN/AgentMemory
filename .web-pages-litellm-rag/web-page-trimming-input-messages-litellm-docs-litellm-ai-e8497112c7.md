# Trimming Input Messages | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/message_trimming
- Final URL: https://docs.litellm.ai/docs/completion/message_trimming
- Canonical URL: https://docs.litellm.ai/docs/completion/message_trimming
- Fetched at: 2026-06-23T14:23:16Z
- Content type: text/html; charset=utf-8

## Description

Use litellm.trim_messages() to ensure messages does not exceed a model's token limit or specified max_tokens

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use litellm.trim_messages() to ensure messages does not exceed a model's token limit or specified max_tokens
Usage ​
from litellm import completion
from litellm . utils import trim_messages
response = completion (
model = model ,
messages = trim_messages ( messages , model ) # trim_messages ensures tokens(messages) < max_tokens(model)
)
Usage - set max_tokens ​
messages = trim_messages ( messages , model , max_tokens = 10 ) , # trim_messages ensures tokens(messages) < max_tokens
Parameters ​
The function uses the following parameters:
messages :[Required] This should be a list of input messages
model :[Optional] This is the LiteLLM model being used. This parameter is optional, as you can alternatively specify the max_tokens parameter.
max_tokens :[Optional] This is an int, manually set upper limit on messages
trim_ratio :[Optional] This represents the target ratio of tokens to use following trimming. It's default value is 0.75, which implies that messages will be trimmed to utilise about 75%
Usage
Usage - set max_tokens
Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
