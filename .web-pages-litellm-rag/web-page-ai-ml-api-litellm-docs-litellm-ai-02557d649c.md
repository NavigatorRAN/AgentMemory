# AI/ML API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/aiml
- Final URL: https://docs.litellm.ai/docs/providers/aiml
- Canonical URL: https://docs.litellm.ai/docs/providers/aiml
- Fetched at: 2026-06-23T14:26:41Z
- Content type: text/html; charset=utf-8

## Description

https://aimlapi.com/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://aimlapi.com/
Overview ​
Property Details Description AI/ML API provides access to state-of-the-art AI models including flux-pro/v1.1 for high-quality image generation. Provider Route on LiteLLM aiml/ Link to Provider Doc AI/ML API ↗ Supported Operations [ /chat/completions ], /images/generations
LiteLLM supports AI/ML API Image Generation calls.
API Base, Key ​
# env variable
os . environ [ 'AIML_API_KEY' ] = "your-api-key"
os . environ [ 'AIML_API_BASE' ] = "https://api.aimlapi.com" # [optional]
Getting started with the AI/ML API is simple. Follow these steps to set up your integration:
1. Get Your API Key ​
To begin, you need an API key. You can obtain yours here:
🔑 Get Your API Key
2. Explore Available Models ​
Looking for a different model? Browse the full list of supported models:
📚 Full List of Models
3. Read the Documentation ​
For detailed setup instructions and usage guidelines, check out the official documentation:
📖 AI/ML API Docs
4. Need Help? ​
If you have any questions, feel free to reach out. We’re happy to assist! 🚀 Discord
Usage ​
You can choose from LLama, Qwen, Flux, and 200+ other open and closed-source models on aimlapi.com/models. For example:
import litellm
response = litellm . completion (
model = "aiml/meta-llama/Meta-Llama-3.1-405B-Instruct-Turbo" , # The model name must include prefix "openai" + the model name from ai/ml api
api_key = "" , # your aiml api-key
api_base = "https://api.aimlapi.com/v2" ,
messages = [
{
"role" : "user" ,
"content" : "Hey, how's it going?" ,
}
] ,
)
Streaming ​
model = "aiml/Qwen/Qwen2-72B-Instruct" , # The model name must include prefix "openai" + the model name from ai/ml api
stream = True ,
for chunk in response :
print ( chunk )
Async Completion ​
import asyncio
async def main ( ) :
response = await litellm . acompletion (
model = "aiml/anthropic/claude-3-5-haiku" , # The model name must include prefix "openai" + the model name from ai/ml api
print ( response )
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Async Streaming ​
import traceback
try :
print ( "test acompletion + streaming" )
model = "aiml/nvidia/Llama-3.1-Nemotron-70B-Instruct-HF" , # The model name must include prefix "openai" + the model name from ai/ml api
messages = [ { "content" : "Hey, how's it going?" , "role" : "user" } ] ,
print ( f"response: { response } " )
async for chunk in response :
except :
print ( f"error occurred: { traceback . format_exc ( ) } " )
pass
Async Embedding ​
response = await litellm . aembedding (
model = "aiml/text-embedding-3-small" , # The model name must include prefix "openai" + the model name from ai/ml api
api_base = "https://api.aimlapi.com/v1" , # 👈 the URL has changed from v2 to v1
input = "Your text string" ,
Async Image Generation ​
response = await litellm . aimage_generation (
model = "aiml/dall-e-3" , # The model name must include prefix "openai" + the model name from ai/ml api
prompt = "A cute baby sea otter" ,
Overview
API Base, Key
1. Get Your API Key
2. Explore Available Models
3. Read the Documentation
4. Need Help?
Usage
Streaming
Async Completion
Async Streaming
Async Embedding
Async Image Generation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
