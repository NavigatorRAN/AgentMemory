# Rules | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/rules
- Final URL: https://docs.litellm.ai/docs/rules
- Canonical URL: https://docs.litellm.ai/docs/rules
- Fetched at: 2026-06-23T14:32:51Z
- Content type: text/html; charset=utf-8

## Description

Use this to fail a request based on the input or output of an llm api call.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this to fail a request based on the input or output of an llm api call.
import litellm
import os
# set env vars
os . environ [ "OPENAI_API_KEY" ] = "your-api-key"
os . environ [ "OPENROUTER_API_KEY" ] = "your-api-key"
def my_custom_rule ( input ) : # receives the model response
if "i don't think i can answer" in input : # trigger fallback if the model refuses to answer
return False
return True
litellm . post_call_rules = [ my_custom_rule ] # have these be functions that can be called to fail a call
response = litellm . completion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" ,
"content" : "Hey, how's it going?" } ] , fallbacks = [ "openrouter/gryphe/mythomax-l2-13b" ] )
Available Endpoints ​
litellm.pre_call_rules = [] - A list of functions to iterate over before making the api call. Each function is expected to return either True (allow call) or False (fail call).
litellm.post_call_rules = [] - List of functions to iterate over before making the api call. Each function is expected to return either True (allow call) or False (fail call).
Expected format of rule ​
def my_custom_rule ( input : str ) - > bool : # receives the model response
Inputs ​
input : str : The user input or llm response.
Outputs ​
bool : Return True (allow call) or False (fail call)
Example Rules ​
Example 1: Fail if user input is too long ​
if len ( input ) > 10 : # fail call if too long
litellm . pre_call_rules = [ my_custom_rule ] # have these be functions that can be called to fail a call
response = litellm . completion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] )
Example 2: Fallback to uncensored model if llm refuses to answer ​
Available Endpoints
Expected format of rule
Example Rules
Example 1: Fail if user input is too long
Example 2: Fallback to uncensored model if llm refuses to answer
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
