# Local Debugging | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/debugging/local_debugging
- Final URL: https://docs.litellm.ai/docs/debugging/local_debugging
- Canonical URL: https://docs.litellm.ai/docs/debugging/local_debugging
- Fetched at: 2026-06-23T14:23:45Z
- Content type: text/html; charset=utf-8

## Description

There's 2 ways to do local debugging - litellm.turnondebug() and by passing in a custom function completion(...loggerfn=). Warning: Make sure to not use turnon_debug() in production. It logs API keys, which might end up in log files.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
There's 2 ways to do local debugging - litellm._turn_on_debug() and by passing in a custom function completion(...logger_fn=<your_local_function>) . Warning: Make sure to not use _turn_on_debug() in production. It logs API keys, which might end up in log files.
Set Verbose ​
This is good for getting print statements for everything litellm is doing.
import litellm
from litellm import completion
litellm . _turn_on_debug ( ) # 👈 this is the 1-line change you need to make
## set ENV variables
os . environ [ "OPENAI_API_KEY" ] = "openai key"
os . environ [ "COHERE_API_KEY" ] = "cohere key"
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# openai call
response = completion ( model = "gpt-3.5-turbo" , messages = messages )
# cohere call
response = completion ( "command-nightly" , messages )
JSON Logs ​
If you need to store the logs as JSON, just set the litellm.json_logs = True .
We currently just log the raw POST request from litellm as a JSON - [ See Code ].
Share feedback here
Logger Function ​
But sometimes all you care about is seeing exactly what's getting sent to your api call and what's being returned - e.g. if the api call is failing, why is that happening? what are the exact params being set?
In that case, LiteLLM allows you to pass in a custom logging function to see / modify the model call Input/Outputs.
Note : We expect you to accept a dict object.
Your custom function
def my_custom_logging_fn ( model_call_dict ) :
print ( f"model call details: { model_call_dict } " )
Complete Example ​
response = completion ( model = "gpt-3.5-turbo" , messages = messages , logger_fn = my_custom_logging_fn )
response = completion ( "command-nightly" , messages , logger_fn = my_custom_logging_fn )
Still Seeing Issues? ​
Join the Discord .
We promise to help you in lite ning speed ❤️
Set Verbose
JSON Logs
Logger Function
Complete Example
Still Seeing Issues?
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
