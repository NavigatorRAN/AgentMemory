# Replacing OpenAI ChatCompletion with Completion() | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/azure_openai
- Final URL: https://docs.litellm.ai/docs/tutorials/azure_openai
- Canonical URL: https://docs.litellm.ai/docs/tutorials/azure_openai
- Fetched at: 2026-06-23T14:33:44Z
- Content type: text/html; charset=utf-8

## Description

* Supported OpenAI LLMs

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Supported OpenAI LLMs
Supported Azure OpenAI LLMs
Completion() - Quick Start ​
import os
from litellm import completion
# openai configs
os . environ [ "OPENAI_API_KEY" ] = ""
# azure openai configs
os . environ [ "AZURE_API_KEY" ] = ""
os . environ [ "AZURE_API_BASE" ] = "https://openai-gpt-4-test-v-1.openai.azure.com/"
os . environ [ "AZURE_API_VERSION" ] = "2023-05-15"
# openai call
response = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
print ( "Openai Response\n" )
print ( response )
# azure call
model = "azure/<your-azure-deployment>" ,
print ( "Azure Response\n" )
Completion() with Streaming ​
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
stream = True
print ( "OpenAI Streaming response" )
for chunk in response :
print ( chunk )
print ( "Azure Streaming response" )
Completion() with Streaming + Async ​
from litellm import acompletion
response = acompletion (
Completion() multi-threaded ​
import threading
# Function to make a completion call
def make_completion ( model , messages ) :
model = model ,
messages = messages ,
print ( f"Response for { model } : { response } " )
# Set your API keys
os . environ [ "OPENAI_API_KEY" ] = "YOUR_OPENAI_API_KEY"
os . environ [ "AZURE_API_KEY" ] = "YOUR_AZURE_API_KEY"
# Define the messages for the completions
# Create threads for making the completions
thread1 = threading . Thread ( target = make_completion , args = ( "gpt-3.5-turbo" , messages ) )
thread2 = threading . Thread ( target = make_completion , args = ( "azure/your-azure-deployment" , messages ) )
# Start both threads
thread1 . start ( )
thread2 . start ( )
# Wait for both threads to finish
thread1 . join ( )
thread2 . join ( )
print ( "Both completions are done." )
Completion() - Quick Start
Completion() with Streaming
Completion() with Streaming + Async
Completion() multi-threaded
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
