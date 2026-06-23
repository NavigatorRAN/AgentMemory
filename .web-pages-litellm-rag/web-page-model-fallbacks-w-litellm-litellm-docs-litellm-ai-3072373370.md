# Model Fallbacks w/ LiteLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/model_fallbacks
- Final URL: https://docs.litellm.ai/docs/tutorials/model_fallbacks
- Canonical URL: https://docs.litellm.ai/docs/tutorials/model_fallbacks
- Fetched at: 2026-06-23T14:34:28Z
- Content type: text/html; charset=utf-8

## Description

Here's how you can implement model fallbacks across 3 LLM providers (OpenAI, Anthropic, Azure) using LiteLLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Here's how you can implement model fallbacks across 3 LLM providers (OpenAI, Anthropic, Azure) using LiteLLM.
1. Install LiteLLM ​
!uv add litellm
2. Basic Fallbacks Code ​
import litellm
from litellm import embedding , completion
# set ENV variables
os . environ [ "OPENAI_API_KEY" ] = ""
os . environ [ "ANTHROPIC_API_KEY" ] = ""
os . environ [ "AZURE_API_KEY" ] = ""
os . environ [ "AZURE_API_BASE" ] = ""
os . environ [ "AZURE_API_VERSION" ] = ""
model_fallback_list = [ "claude-instant-1" , "gpt-3.5-turbo" , "chatgpt-test" ]
user_message = "Hello, how are you?"
messages = [ { "content" : user_message , "role" : "user" } ]
for model in model_fallback_list :
try :
response = completion ( model = model , messages = messages )
except Exception as e :
print ( f"error occurred: { traceback . format_exc ( ) } " )
3. Context Window Exceptions ​
LiteLLM provides a sub-class of the InvalidRequestError class for Context Window Exceeded errors ( docs ).
Implement model fallbacks based on context window exceptions.
LiteLLM also exposes a get_max_tokens() function, which you can use to identify the context window limit that's been exceeded.
from litellm import completion , ContextWindowExceededError , get_max_tokens
os . environ [ "COHERE_API_KEY" ] = ""
context_window_fallback_list = [ { "model" : "gpt-3.5-turbo-16k" , "max_tokens" : 16385 } , { "model" : "gpt-4-32k" , "max_tokens" : 32768 } , { "model" : "claude-instant-1" , "max_tokens" : 100000 } ]
initial_model = "command-nightly"
response = completion ( model = initial_model , messages = messages )
except ContextWindowExceededError as e :
model_max_tokens = get_max_tokens ( model )
for model in context_window_fallback_list :
if model_max_tokens < model [ "max_tokens" ]
response = completion ( model = model [ "model" ] , messages = messages )
return response
model_max_tokens = get_max_tokens ( model [ "model" ] )
continue
print ( response )
1. Install LiteLLM
2. Basic Fallbacks Code
3. Context Window Exceptions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
