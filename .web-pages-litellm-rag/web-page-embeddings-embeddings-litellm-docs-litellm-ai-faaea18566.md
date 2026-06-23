# Embeddings - /embeddings | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/embedding
- Final URL: https://docs.litellm.ai/docs/proxy/embedding
- Canonical URL: https://docs.litellm.ai/docs/proxy/embedding
- Fetched at: 2026-06-23T14:30:12Z
- Content type: text/html; charset=utf-8

## Description

See supported Embedding Providers & Models here

## Extracted Text

Skip to main content
On this page
Copy as Markdown
See supported Embedding Providers & Models here
Supported Input Formats ​
The /v1/embeddings endpoint follows the OpenAI embeddings API specification . The following input formats are supported:
Format Example String "input": "Hello" Array of strings "input": ["Hello", "World"] Array of tokens (integers) "input": [1234, 5678, 9012] Array of token arrays "input": [[1234, 5678], [9012, 3456]]
Quick start ​
Here's how to route between GPT-J embedding (sagemaker endpoint), Amazon Titan embedding (Bedrock) and Azure OpenAI embedding on the proxy server:
Set models in your config.yaml
model_list :
- model_name : sagemaker - embeddings
litellm_params :
model : "sagemaker/berri-benchmarking-gpt-j-6b-fp16"
- model_name : amazon - embeddings
model : "bedrock/amazon.titan-embed-text-v1"
- model_name : azure - embeddings
model : "azure/azure-embedding-model"
api_base : "os.environ/AZURE_API_BASE" # os.getenv("AZURE_API_BASE")
api_key : "os.environ/AZURE_API_KEY" # os.getenv("AZURE_API_KEY")
api_version : "2023-07-01-preview"
general_settings :
master_key : sk - 1234 # [OPTIONAL] if set all calls to proxy will require either this key or a valid generated token
Start the proxy
$ litellm --config /path/to/config.yaml
Test the embedding call
curl --location 'http://0.0.0.0:4000/v1/embeddings' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"input": "The food was delicious and the waiter..",
"model": "sagemaker-embeddings",
}'
Default encoding_format ​
For embeddings routed through LiteLLM’s OpenAI-compatible embedding path (for example OpenAI models, openai/... with a custom api_base , or the proxy /v1/embeddings route that forwards to that path), LiteLLM sends an explicit encoding_format when the caller omits it.
Resolution order (first match wins):
Value in the embedding request body ( encoding_format in JSON).
Per-model default from litellm_params.encoding_format in config.yaml .
Process environment variable LITELLM_DEFAULT_EMBEDDING_ENCODING_FORMAT (e.g. float or base64 ).
Fallback float .
You can still override per request from any OpenAI-compatible client:
--data '{"model": "my-embedding-model", "input": "hello", "encoding_format": "base64"}'
See also: Config settings ( LITELLM_DEFAULT_EMBEDDING_ENCODING_FORMAT ).
Supported Input Formats
Quick start
Default encoding_format
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
