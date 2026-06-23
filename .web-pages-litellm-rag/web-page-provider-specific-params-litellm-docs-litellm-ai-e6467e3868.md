# Provider-specific Params | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/provider_specific_params
- Final URL: https://docs.litellm.ai/docs/completion/provider_specific_params
- Canonical URL: https://docs.litellm.ai/docs/completion/provider_specific_params
- Fetched at: 2026-06-23T14:23:27Z
- Content type: text/html; charset=utf-8

## Description

Providers might offer params not supported by OpenAI (e.g. top_k). LiteLLM treats any non-openai param, as a provider-specific param, and passes it to the provider in the request body, as a kwarg. See Reserved Params

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Providers might offer params not supported by OpenAI (e.g. top_k). LiteLLM treats any non-openai param, as a provider-specific param, and passes it to the provider in the request body, as a kwarg. See Reserved Params
You can pass those in 2 ways:
via completion(): We'll pass the non-openai param, straight to the provider as part of the request body.
e.g. completion(model="claude-instant-1", top_k=3)
via provider-specific config variable (e.g. litellm.OpenAIConfig() ).
SDK Usage ​
OpenAI
OpenAI Text Completion
Azure OpenAI
Anthropic
Huggingface
TogetherAI
Ollama
Replicate
Petals
Palm
AI21
Cohere
import litellm , os
# set env variables
os . environ [ "OPENAI_API_KEY" ] = "your-openai-key"
## SET MAX TOKENS - via completion()
response_1 = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
max_tokens = 10
)
response_1_text = response_1 . choices [ 0 ] . message . content
## SET MAX TOKENS - via config
litellm . OpenAIConfig ( max_tokens = 10 )
response_2 = litellm . completion (
response_2_text = response_2 . choices [ 0 ] . message . content
## TEST OUTPUT
assert len ( response_2_text ) > len ( response_1_text )
model = "text-davinci-003" ,
litellm . OpenAITextCompletionConfig ( max_tokens = 10 )
os . environ [ "AZURE_API_BASE" ] = "your-azure-api-base"
os . environ [ "AZURE_API_TYPE" ] = "azure" # [OPTIONAL]
os . environ [ "AZURE_API_VERSION" ] = "2023-07-01-preview" # [OPTIONAL]
model = "azure/chatgpt-v-2" ,
litellm . AzureOpenAIConfig ( max_tokens = 10 )
os . environ [ "ANTHROPIC_API_KEY" ] = "your-anthropic-key"
model = "claude-instant-1" ,
litellm . AnthropicConfig ( max_tokens_to_sample = 200 )
os . environ [ "HUGGINGFACE_API_KEY" ] = "your-huggingface-key" #[OPTIONAL]
model = "huggingface/mistralai/Mistral-7B-Instruct-v0.1" ,
api_base = "https://your-huggingface-api-endpoint" ,
litellm . HuggingfaceConfig ( max_new_tokens = 200 )
api_base = "https://your-huggingface-api-endpoint"
os . environ [ "TOGETHERAI_API_KEY" ] = "your-togetherai-key"
model = "together_ai/togethercomputer/llama-2-70b-chat" ,
litellm . TogetherAIConfig ( max_tokens_to_sample = 200 )
model = "ollama/llama2" ,
litellm . OllamConfig ( num_predict = 200 )
os . environ [ "REPLICATE_API_KEY" ] = "your-replicate-key"
model = "replicate/meta/llama-2-70b-chat:02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c9e3" ,
litellm . ReplicateConfig ( max_new_tokens = 200 )
import litellm
model = "petals/petals-team/StableBeluga2" ,
api_base = "https://chat.petals.dev/api/v1/generate" ,
litellm . PetalsConfig ( max_new_tokens = 10 )
os . environ [ "PALM_API_KEY" ] = "your-palm-key"
model = "palm/chat-bison" ,
litellm . PalmConfig ( maxOutputTokens = 10 )
os . environ [ "AI21_API_KEY" ] = "your-ai21-key"
model = "j2-mid" ,
litellm . AI21Config ( maxOutputTokens = 10 )
os . environ [ "COHERE_API_KEY" ] = "your-cohere-key"
model = "command-nightly" ,
litellm . CohereConfig ( max_tokens = 200 )
Check out the tutorial!
Proxy Usage ​
via Config
model_list :
- model_name : llama - 3 - 8b - instruct
litellm_params :
model : predibase/llama - 3 - 8b - instruct
api_key : os.environ/PREDIBASE_API_KEY
tenant_id : os.environ/PREDIBASE_TENANT_ID
max_tokens : 256
adapter_base : <my - special_base > # 👈 PROVIDER-SPECIFIC PARAM
via Request
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "llama-3-8b-instruct",
"messages": [
{
"role": "user",
"content": "What'\''s the weather like in Boston today?"
}
],
"adapater_id": "my-special-adapter-id"
}'
Provider-Specific Metadata Parameters ​
Provider Parameter Use Case AWS Bedrock requestMetadata Cost attribution, logging Gemini/Vertex AI labels Resource labeling Anthropic metadata User identification
AWS Bedrock
Gemini/Vertex AI
response = litellm . completion (
model = "bedrock/us.anthropic.claude-haiku-4-5-20251001-v1:0" ,
messages = [ { "role" : "user" , "content" : "Hello!" } ] ,
requestMetadata = { "cost_center" : "engineering" }
model = "vertex_ai/gemini-pro" ,
labels = { "environment" : "production" }
model = "anthropic/claude-3-sonnet-20240229" ,
metadata = { "user_id" : "user123" }
SDK Usage
Proxy Usage
Provider-Specific Metadata Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
