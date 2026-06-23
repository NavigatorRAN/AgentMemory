# Llama2 - Huggingface Tutorial | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/huggingface_tutorial
- Final URL: https://docs.litellm.ai/docs/tutorials/huggingface_tutorial
- Canonical URL: https://docs.litellm.ai/docs/tutorials/huggingface_tutorial
- Fetched at: 2026-06-23T14:34:17Z
- Content type: text/html; charset=utf-8

## Description

Huggingface is an open source platform to deploy machine-learnings models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Huggingface is an open source platform to deploy machine-learnings models.
Call Llama2 with Huggingface Inference Endpoints ​
LiteLLM makes it easy to call your public, private or the default huggingface endpoints.
In this case, let's try and call 3 models:
Model Type of Endpoint deepset/deberta-v3-large-squad2 Default Huggingface Endpoint meta-llama/Llama-2-7b-hf Public Endpoint meta-llama/Llama-2-7b-chat-hf Private Endpoint
Case 1: Call default huggingface endpoint ​
Here's the complete example:
from litellm import completion
model = "deepset/deberta-v3-large-squad2"
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] # LiteLLM follows the OpenAI format
### CALLING ENDPOINT
completion ( model = model , messages = messages , custom_llm_provider = "huggingface" )
What's happening?
model: This is the name of the deployed model on huggingface
messages: This is the input. We accept the OpenAI chat format. For huggingface, by default we iterate through the list and add the message["content"] to the prompt. Relevant Code
custom_llm_provider: Optional param. This is an optional flag, needed only for Azure, Replicate, Huggingface and Together-ai (platforms where you deploy your own models). This enables litellm to route to the right provider, for your model.
Case 2: Call Llama2 public Huggingface endpoint ​
We've deployed meta-llama/Llama-2-7b-hf behind a public endpoint - https://ag3dkq4zui5nu8g3.us-east-1.aws.endpoints.huggingface.cloud .
Let's try it out:
model = "meta-llama/Llama-2-7b-hf"
api_base = "https://ag3dkq4zui5nu8g3.us-east-1.aws.endpoints.huggingface.cloud"
completion ( model = model , messages = messages , custom_llm_provider = "huggingface" , api_base = api_base )
api_base: Optional param. Since this uses a deployed endpoint (not the default huggingface inference endpoint ), we pass that to LiteLLM.
Case 3: Call Llama2 private Huggingface endpoint ​
The only difference between this and the public endpoint, is that you need an api_key for this.
On LiteLLM there's 3 ways you can pass in an api_key.
Either via environment variables, by setting it as a package variable or when calling completion() .
Setting via environment variables
Here's the 1 line of code you need to add
os . environ [ "HF_TOKEN" ] = "..."
Here's the full code:
Setting it as package variable
litellm . huggingface_key = "..."
import litellm
Passed in during completion call
completion ( . . . , api_key = "..." )
completion ( model = model , messages = messages , custom_llm_provider = "huggingface" , api_base = api_base , api_key = "..." )
Call Llama2 with Huggingface Inference Endpoints
Case 1: Call default huggingface endpoint
Case 2: Call Llama2 public Huggingface endpoint
Case 3: Call Llama2 private Huggingface endpoint
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
