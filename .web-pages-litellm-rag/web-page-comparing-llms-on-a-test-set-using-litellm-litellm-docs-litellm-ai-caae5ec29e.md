# Comparing LLMs on a Test Set using LiteLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/compare_llms_2
- Final URL: https://docs.litellm.ai/docs/tutorials/compare_llms_2
- Canonical URL: https://docs.litellm.ai/docs/tutorials/compare_llms_2
- Fetched at: 2026-06-23T14:33:59Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM allows you to use any LLM as a drop in replacement for

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM allows you to use any LLM as a drop in replacement for
gpt-3.5-turbo
This notebook walks through how you can compare GPT-4 vs Claude-2 on a
given test set using litellm
Output at the end of this tutorial: ​
!uv add litellm
from litellm import completion
import litellm
# init your test set questions
questions = [
"how do i call completion() using LiteLLM" ,
"does LiteLLM support VertexAI" ,
"how do I set my keys on replicate llama2?" ,
]
# set your prompt
prompt = """
You are a coding assistant helping users using litellm.
litellm is a light package to simplify calling OpenAI, Azure, Cohere, Anthropic, Huggingface API Endpoints. It manages:
"""
import os
os . environ [ 'OPENAI_API_KEY' ] = ""
os . environ [ 'ANTHROPIC_API_KEY' ] = ""
Calling gpt-3.5-turbo and claude-2 on the same questions ​
LiteLLM completion() allows you to call all LLMs in the same format ​
results = [ ] # for storing results
models = [ 'gpt-3.5-turbo' , 'claude-2' ] # define what models you're testing, see: https://docs.litellm.ai/docs/providers
for question in questions :
row = [ question ]
for model in models :
print ( "Calling:" , model , "question:" , question )
response = completion ( # using litellm.completion
model = model ,
messages = [
{ 'role' : 'system' , 'content' : prompt } ,
{ 'role' : 'user' , 'content' : question }
)
answer = response . choices [ 0 ] . message [ 'content' ]
row . append ( answer )
print ( print ( "Calling:" , model , "answer:" , answer ) )
results . append ( row ) # save results
Visualizing Results ​
# Create a table to visualize results
import pandas as pd
columns = [ 'Question' ] + models
df = pd . DataFrame ( results , columns = columns )
df
Output Table ​
Output at the end of this tutorial:
Calling gpt-3.5-turbo and claude-2 on the same questions
LiteLLM completion() allows you to call all LLMs in the same format
Visualizing Results
Output Table
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
