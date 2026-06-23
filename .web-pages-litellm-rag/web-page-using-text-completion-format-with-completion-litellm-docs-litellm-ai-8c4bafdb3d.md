# Using Text Completion Format - with Completion() | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/text_completion
- Final URL: https://docs.litellm.ai/docs/tutorials/text_completion
- Canonical URL: https://docs.litellm.ai/docs/tutorials/text_completion
- Fetched at: 2026-06-23T14:34:48Z
- Content type: text/html; charset=utf-8

## Description

If your prefer interfacing with the OpenAI Text Completion format this tutorial covers how to use LiteLLM in this format

## Extracted Text

Skip to main content
On this page
Copy as Markdown
If your prefer interfacing with the OpenAI Text Completion format this tutorial covers how to use LiteLLM in this format
response = openai . Completion . create (
model = "text-davinci-003" ,
prompt = 'Write a tagline for a traditional bavarian tavern' ,
temperature = 0 ,
max_tokens = 100 )
Using LiteLLM in the Text Completion format ​
With gpt-3.5-turbo ​
from litellm import text_completion
response = text_completion (
model = "gpt-3.5-turbo" ,
With text-davinci-003 ​
With llama2 ​
model = "togethercomputer/llama-2-70b-chat" ,
Using LiteLLM in the Text Completion format
With gpt-3.5-turbo
With text-davinci-003
With llama2
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
