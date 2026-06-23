# Mock Completion Responses - Save Testing Costs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/mock_completion
- Final URL: https://docs.litellm.ai/docs/tutorials/mock_completion
- Canonical URL: https://docs.litellm.ai/docs/tutorials/mock_completion
- Fetched at: 2026-06-23T14:34:26Z
- Content type: text/html; charset=utf-8

## Description

Trying to test making LLM Completion calls without calling the LLM APIs ?

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Trying to test making LLM Completion calls without calling the LLM APIs ?
Pass mock_response to litellm.completion and litellm will directly return the response without neededing the call the LLM API and spend $$
Using completion() with mock_response ​
from litellm import completion
model = "gpt-3.5-turbo"
messages = [ { "role" : "user" , "content" : "Why is LiteLLM amazing?" } ]
completion ( model = model , messages = messages , mock_response = "It's simple to use and easy to get started" )
Building a pytest function using completion ​
import pytest
def test_completion_openai ( ) :
try :
response = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Why is LiteLLM amazing?" } ] ,
mock_response = "LiteLLM is awesome"
)
# Add any assertions here to check the response
print ( response )
print ( response [ 'choices' ] [ 0 ] [ 'finish_reason' ] )
except Exception as e :
pytest . fail ( f"Error occurred: { e } " )
Using completion() with mock_response
Building a pytest function using completion
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
