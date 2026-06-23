# 🌙 Lunary - GenAI Observability | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/lunary_integration
- Final URL: https://docs.litellm.ai/docs/observability/lunary_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/lunary_integration
- Fetched at: 2026-06-23T14:25:19Z
- Content type: text/html; charset=utf-8

## Description

Lunary is an open-source platform providing observability, prompt management, and analytics to help team manage and improve LLM chatbots.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Lunary is an open-source platform providing observability , prompt management , and analytics to help team manage and improve LLM chatbots.
You can reach out to us anytime by email or directly schedule a Demo .
Usage with LiteLLM Python SDK ​
Pre-Requisites ​
uv add litellm lunary
Quick Start ​
First, get your Lunary public key on the Lunary dashboard .
Use just 2 lines of code, to instantly log your responses across all providers with Lunary:
litellm . success_callback = [ "lunary" ]
litellm . failure_callback = [ "lunary" ]
Complete code:
from litellm import completion
os . environ [ "LUNARY_PUBLIC_KEY" ] = "your-lunary-public-key" # from https://app.lunary.ai/)
os . environ [ "OPENAI_API_KEY" ] = ""
response = completion (
model = "gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hi there 👋" } ] ,
user = "ishaan_litellm"
)
Usage with LangChain ChatLiteLLM ​
import os
from langchain . chat_models import ChatLiteLLM
from langchain . schema import HumanMessage
import litellm
os . environ [ "LUNARY_PUBLIC_KEY" ] = "" # from https://app.lunary.ai/settings
os . environ [ 'OPENAI_API_KEY' ] = "sk-..."
chat = ChatLiteLLM (
model = "gpt-4o"
messages = [
HumanMessage (
content = "what model are you"
]
chat ( messages )
Usage with Prompt Templates ​
You can use Lunary to manage prompt templates and use them across all your LLM providers with LiteLLM.
from lunary
template = lunary . render_template ( "template-slug" , {
"name" : "John" , # Inject variables
} )
result = completion ( ** template )
Usage with custom chains ​
You can wrap your LLM calls inside custom chains, so that you can visualize them as traces.
import lunary
@lunary . chain ( "My custom chain name" )
def my_chain ( chain_input ) :
chain_run_id = lunary . run_manager . current_run_id
messages = [ { "role" : "user" , "content" : "Say 1" } ] ,
metadata = { "parent_run_id" : chain_run_id } ,
messages = [ { "role" : "user" , "content" : "Say 2" } ] ,
chain_output = response . choices [ 0 ] . message
return chain_output
my_chain ( "Chain input" )
Usage with LiteLLM Proxy Server ​
Step1: Install dependencies and set your environment variables ​
Install the dependencies
Get you Lunary public key from from https://app.lunary.ai/settings
export LUNARY_PUBLIC_KEY="<your-public-key>"
Step 2: Create a config.yaml and set lunary callbacks ​
model_list :
- model_name : "*"
litellm_params :
model : "*"
litellm_settings :
success_callback : [ "lunary" ]
failure_callback : [ "lunary" ]
Step 3: Start the LiteLLM proxy ​
litellm --config config.yaml
Step 4: Make a request ​
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-d '{
"model": "gpt-4o",
"messages": [
{
"role": "system",
"content": "You are a helpful math tutor. Guide the user through the solution step by step."
},
"role": "user",
"content": "how can I solve 8x + 7 = -23"
}
}'
You can find more details about the different ways of making requests to the LiteLLM proxy on this page
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Usage with LiteLLM Python SDK
Pre-Requisites
Quick Start
Usage with LangChain ChatLiteLLM
Usage with Prompt Templates
Usage with custom chains
Usage with LiteLLM Proxy Server
Step1: Install dependencies and set your environment variables
Step 2: Create a config.yaml and set lunary callbacks
Step 3: Start the LiteLLM proxy
Step 4: Make a request
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
