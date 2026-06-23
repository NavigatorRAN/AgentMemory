# /embeddings | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/embedding/supported_embedding
- Final URL: https://docs.litellm.ai/docs/embedding/supported_embedding
- Canonical URL: https://docs.litellm.ai/docs/embedding/supported_embedding
- Fetched at: 2026-06-23T14:23:50Z
- Content type: text/html; charset=utf-8

## Description

Quick Start

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Quick Start ​
from litellm import embedding
import os
os . environ [ 'OPENAI_API_KEY' ] = ""
response = embedding ( model = 'text-embedding-ada-002' , input = [ "good morning from litellm" ] )
Async Usage - aembedding() ​
LiteLLM provides an asynchronous version of the embedding function called aembedding :
from litellm import aembedding
import asyncio
async def get_embedding ( ) :
response = await aembedding (
model = 'text-embedding-ada-002' ,
input = [ "good morning from litellm" ]
)
return response
response = asyncio . run ( get_embedding ( ) )
print ( response )
Proxy Usage ​
NOTE
For vertex_ai ,
export GOOGLE_APPLICATION_CREDENTIALS="absolute/path/to/service_account.json"
Add model to config ​
model_list :
- model_name : textembedding - gecko
litellm_params :
model : vertex_ai/textembedding - gecko
general_settings :
master_key : sk - 1234
Start proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test ​
Curl
OpenAI (python)
Langchain Embeddings
curl --location 'http://0.0.0.0:4000/embeddings' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{"input": ["Academia.edu uses"], "model": "textembedding-gecko", "encoding_format": "base64"}'
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:4000"
client . embeddings . create (
model = "textembedding-gecko" ,
input = "The food was delicious and the waiter..." ,
encoding_format = "float"
from langchain_openai import OpenAIEmbeddings
embeddings = OpenAIEmbeddings ( model = "textembedding-gecko" , openai_api_base = "http://0.0.0.0:4000" , openai_api_key = "sk-1234" )
text = "This is a test document."
query_result = embeddings . embed_query ( text )
print ( f"VERTEX AI EMBEDDINGS" )
print ( query_result [ : 5 ] )
Image Embeddings ​
For models that support image embeddings, you can pass in a base64 encoded image string to the input param.
SDK
PROXY
# set your api key
os . environ [ "COHERE_API_KEY" ] = ""
response = embedding ( model = "cohere/embed-english-v3.0" , input = [ "<base64 encoded image>" ] )
Setup config.yaml
- model_name : cohere - embed
model : cohere/embed - english - v3.0
api_key : os.environ/COHERE_API_KEY
Start proxy
Test it!
curl -X POST 'http://0.0.0.0:4000/v1/embeddings' \
-H 'Authorization: Bearer sk-54d77cd67b9febbb' \
-H 'Content-Type: application/json' \
-d '{
"model": "cohere/embed-english-v3.0",
"input": ["<base64 encoded image>"]
}'
Input Params for litellm.embedding() ​
info
Any non-openai params, will be treated as provider-specific params, and sent in the request body as kwargs to the provider.
See Reserved Params
See Example
Required Fields ​
model : string - ID of the model to use. model='text-embedding-ada-002'
input : string or array - Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for text-embedding-ada-002), cannot be an empty string, and any array must be 2048 dimensions or less.
Optional LiteLLM Fields ​
user : string (optional) A unique identifier representing your end-user,
dimensions : integer (Optional) The number of dimensions the resulting output embeddings should have. Only supported in OpenAI/Azure text-embedding-3 and later models.
encoding_format : string (Optional) The format to return the embeddings in. Can be either "float" or "base64" . Defaults to encoding_format="float"
timeout : integer (Optional) - The maximum time, in seconds, to wait for the API to respond. Defaults to 600 seconds (10 minutes).
api_base : string (optional) - The api endpoint you want to call the model with
api_version : string (optional) - (Azure-specific) the api version for the call
api_key : string (optional) - The API key to authenticate and authorize requests. If not provided, the default API key is used.
api_type : string (optional) - The type of API to use.
Output from litellm.embedding() ​
{
"object" : "list" ,
"data" : [
"object" : "embedding" ,
"index" : 0 ,
"embedding" : [
-0.0022326677571982145 ,
0.010749882087111473 ,
...
]
}
] ,
"model" : "text-embedding-ada-002-v2" ,
"usage" : {
"prompt_tokens" : 10 ,
"total_tokens" : 10
OpenAI Embedding Models ​
Usage ​
response = embedding (
model = "text-embedding-3-small" ,
input = [ "good morning from litellm" , "this is another item" ] ,
metadata = { "anything" : "good day" } ,
dimensions = 5 # Only supported in text-embedding-3 and later models.
Model Name Function Call Required OS Variables text-embedding-3-small embedding('text-embedding-3-small', input) os.environ['OPENAI_API_KEY'] text-embedding-3-large embedding('text-embedding-3-large', input) os.environ['OPENAI_API_KEY'] text-embedding-ada-002 embedding('text-embedding-ada-002', input) os.environ['OPENAI_API_KEY']
OpenAI Compatible Embedding Models ​
Use this for calling /embedding endpoints on OpenAI Compatible Servers, example https://github.com/xorbitsai/inference
Note add openai/ prefix to model so litellm knows to route to OpenAI
model = "openai/<your-llm-name>" , # add `openai/` prefix to model so litellm knows to route to OpenAI
api_base = "http://0.0.0.0:4000/" # set API Base of your Custom OpenAI Endpoint
Bedrock Embedding ​
API keys ​
This can be set as env variables or passed as params to litellm.embedding()
os . environ [ "AWS_ACCESS_KEY_ID" ] = "" # Access key
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "" # Secret access key
os . environ [ "AWS_REGION_NAME" ] = "" # us-east-1, us-east-2, us-west-1, us-west-2
model = "amazon.titan-embed-text-v1" ,
input = [ "good morning from litellm" ] ,
Model Name Function Call Amazon Nova Multimodal Embeddings embedding(model="bedrock/amazon.nova-2-multimodal-embeddings-v1:0", input=input) Amazon Nova (Async) embedding(model="bedrock/async_invoke/amazon.nova-2-multimodal-embeddings-v1:0", input=input, input_type="text", output_s3_uri="s3://bucket/") Titan Embeddings - G1 embedding(model="amazon.titan-embed-text-v1", input=input) Cohere Embeddings - English embedding(model="cohere.embed-english-v3", input=input) Cohere Embeddings - Multilingual embedding(model="cohere.embed-multilingual-v3", input=input) TwelveLabs Marengo (Async) embedding(model="bedrock/async_invoke/us.twelvelabs.marengo-embed-2-7-v1:0", input=input, input_type="text")
TwelveLabs Bedrock Embedding Models ​
TwelveLabs Marengo models support multimodal embeddings (text, image, video, audio) and require the input_type parameter to specify the input format.
# Set AWS credentials
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = "us-east-1"
# Text embedding
model = "bedrock/us.twelvelabs.marengo-embed-2-7-v1:0" ,
input = [ "Hello world from LiteLLM!" ] ,
input_type = "text" # Required parameter
# Image embedding (base64)
model = "bedrock/async_invoke/us.twelvelabs.marengo-embed-2-7-v1:0" ,
input = [ "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQ..." ] ,
input_type = "image" , # Required parameter
output_s3_uri = "s3://your-bucket/async-invoke-output/"
# Video embedding (S3 URL)
input = [ "s3://your-bucket/video.mp4" ] ,
input_type = "video" , # Required parameter
Required Parameters ​
Parameter Description Values input_type Type of input content "text" , "image" , "video" , "audio"
Supported Models ​
Model Name Function Call Notes TwelveLabs Marengo 2.7 (Sync) embedding(model="bedrock/us.twelvelabs.marengo-embed-2-7-v1:0", input=input, input_type="text") Text embeddings only TwelveLabs Marengo 2.7 (Async) embedding(model="bedrock/async_invoke/us.twelvelabs.marengo-embed-2-7-v1:0", input=input, input_type="text/image/video/audio") All input types, requires output_s3_uri
Cohere Embedding Models ​
https://docs.cohere.com/reference/embed
os . environ [ "COHERE_API_KEY" ] = "cohere key"
# cohere call
model = "embed-english-v3.0" ,
input_type = "search_document" # optional param for v3 llms
Model Name Function Call embed-english-v3.0 embedding(model="embed-english-v3.0", input=["good morning from litellm", "this is another item"]) embed-english-light-v3.0 embedding(model="embed-english-light-v3.0", input=["good morning from litellm", "this is another item"]) embed-multilingual-v3.0 embedding(model="embed-multilingual-v3.0", input=["good morning from litellm", "this is another item"]) embed-multilingual-light-v3.0 embedding(model="embed-multilingual-light-v3.0", input=["good morning from litellm", "this is another item"]) embed-english-v2.0 embedding(model="embed-english-v2.0", input=["good morning from litellm", "this is another item"]) embed-english-light-v2.0 embedding(model="embed-english-light-v2.0", input=["good morning from litellm", "this is another item"]) embed-multilingual-v2.0 embedding(model="embed-multilingual-v2.0", input=["good morning from litellm", "this is another item"])
NVIDIA NIM Embedding Models ​
os . environ [ "NVIDIA_NIM_API_KEY" ] = "" # api key
os . environ [ "NVIDIA_NIM_API_BASE" ] = "" # nim endpoint url
os . environ [ 'NVIDIA_NIM_API_KEY' ] = ""
model = 'nvidia_nim/<model_name>' ,
input_type = "query"
input_type Parameter for Embedding Models ​
Certain embedding models, such as nvidia/embed-qa-4 and the E5 family, operate in dual modes —one for indexing documents (passages) and another for querying . To maintain high retrieval accuracy, it's essential to specify how the input text is being used by setting the input_type parameter correctly.
Set the input_type parameter to one of the following values:
"passage" – for embedding content during indexing (e.g., documents).
"query" – for embedding content during retrieval (e.g., user queries).
Warning: Incorrect usage of input_type can lead to a significant drop in retrieval performance.
All models listed here are supported:
Model Name Function Call NV-Embed-QA embedding(model="nvidia_nim/NV-Embed-QA", input) nvidia/nv-embed-v1 embedding(model="nvidia_nim/nvidia/nv-embed-v1", input) nvidia/nv-embedqa-mistral-7b-v2 embedding(model="nvidia_nim/nvidia/nv-embedqa-mistral-7b-v2", input) nvidia/nv-embedqa-e5-v5 embedding(model="nvidia_nim/nvidia/nv-embedqa-e5-v5", input) nvidia/embed-qa-4 embedding(model="nvidia_nim/nvidia/embed-qa-4", input) nvidia/llama-3.2-nv-embedqa-1b-v1 embedding(model="nvidia_nim/nvidia/llama-3.2-nv-embedqa-1b-v1", input) nvidia/llama-3.2-nv-embedqa-1b-v2 embedding(model="nvidia_nim/nvidia/llama-3.2-nv-embedqa-1b-v2", input) snowflake/arctic-embed-l embedding(model="nvidia_nim/snowflake/arctic-embed-l", input) baai/bge-m3 embedding(model="nvidia_nim/baai/bge-m3", input)
HuggingFace Embedding Models ​
LiteLLM supports all Feature-Extraction + Sentence Similarity Embedding models: https://huggingface.co/models?pipeline_tag=feature-extraction
os . environ [ 'HUGGINGFACE_API_KEY' ] = ""
model = 'huggingface/microsoft/codebert-base' ,
Usage - Set input_type ​
LiteLLM infers input type (feature-extraction or sentence-similarity) by making a GET request to the api base.
Override this, by setting the input_type yourself.
input = [ "good morning from litellm" , "you are a good bot" ] ,
api_base = "https://p69xlsj6rpno5drq.us-east-1.aws.endpoints.huggingface.cloud" ,
input_type = "sentence-similarity"
Usage - Custom API Base ​
api_base = "https://p69xlsj6rpno5drq.us-east-1.aws.endpoints.huggingface.cloud"
Model Name Function Call Required OS Variables microsoft/codebert-base embedding('huggingface/microsoft/codebert-base', input=input) os.environ['HUGGINGFACE_API_KEY'] BAAI/bge-large-zh embedding('huggingface/BAAI/bge-large-zh', input=input) os.environ['HUGGINGFACE_API_KEY'] any-hf-embedding-model embedding('huggingface/hf-embedding-model', input=input) os.environ['HUGGINGFACE_API_KEY']
Mistral AI Embedding Models ​
All models listed here https://docs.mistral.ai/platform/endpoints are supported
os . environ [ 'MISTRAL_API_KEY' ] = ""
model = "mistral/mistral-embed" ,
Model Name Function Call mistral-embed embedding(model="mistral/mistral-embed", input)
Gemini AI Embedding Models ​
os . environ [ "GEMINI_API_KEY" ] = ""
Usage - Embedding ​
model = "gemini/text-embedding-004" ,
Model Name Function Call text-embedding-004 embedding(model="gemini/text-embedding-004", input) gemini-embedding-2-preview embedding(model="gemini/gemini-embedding-2-preview", input) gemini-embedding-2 (GA) embedding(model="gemini/gemini-embedding-2", input)
Gemini Embedding 2 Preview (Multimodal) ​
gemini-embedding-2-preview supports multimodal embeddings —text, images, audio, video, and PDF in a single request. See blog post for details. The GA model id gemini-embedding-2 exposes the same behavior—swap the model name in any example below. See GA blog for cost-map coverage and pricing notes.
Response shape
For the Gemini API path ( gemini/gemini-embedding-2-preview ), each input element returns its own embedding (indexed 0..N-1 )—same semantics as OpenAI's /embeddings . LiteLLM routes to Gemini's batchEmbedContents endpoint with one EmbedContentRequest per input. This differs from the Vertex AI path, which combines all parts into a single unified vector—see Vertex AI embeddings docs .
Input formats:
Data URIs: data:image/png;base64,<encoded_data>
Gemini file references: files/abc123 (pre-uploaded via Gemini Files API)
Supported MIME types: image/png , image/jpeg , audio/mpeg , audio/wav , video/mp4 , video/quicktime , application/pdf
# Text + Image (base64)
model = "gemini/gemini-embedding-2-preview" ,
input = [
"The food was delicious and the waiter..." ,
"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAIAQMAAAD+wSzIAAAABlBMVEX///+/v7+jQ3Y5AAAADklEQVQI12P4AIX8EAgALgAD/aNpbtEAAAAASUVORK5CYII"
curl -X POST http://localhost:4000/embeddings \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
"model": "gemini-embedding-2-preview",
"input": [
"The food was delicious and the waiter...",
Optional: dimensions maps to Gemini's outputDimensionality .
Combined Multimodal Embeddings ​
By default, each element in the input list produces a separate embedding (OpenAI-compatible). To combine multiple inputs into a single embedding (e.g., text + image representing one entity), wrap them in a nested list:
# Separate: 2 inputs → 2 embeddings
input = [ "a red shoe" , "data:image/png;base64,..." ] ,
# response.data has 2 embeddings
# Combined: text + image → 1 embedding
input = [ [ "a red shoe" , "data:image/png;base64,..." ] ] ,
# response.data has 1 embedding representing both together
# Mixed: 1 combined + 1 separate → 2 embeddings
input = [ [ "a red shoe" , "data:image/png;base64,..." ] , "just text" ] ,
"input": [["a red shoe", "data:image/png;base64,..."], "just text"]
This is useful for representing multi-modal entities (e.g., a product with a name + photo) as a single vector for search and retrieval. Gemini API only — Vertex AI always returns a single combined vector regardless of input shape (see Vertex AI embeddings docs ).
Vertex AI Embedding Models ​
import litellm
litellm . vertex_project = "hardy-device-38811" # Your Project ID
litellm . vertex_location = "us-central1" # proj location
model = "vertex_ai/textembedding-gecko" ,
All models listed here are supported
Model Name Function Call textembedding-gecko embedding(model="vertex_ai/textembedding-gecko", input) textembedding-gecko-multilingual embedding(model="vertex_ai/textembedding-gecko-multilingual", input) textembedding-gecko-multilingual@001 embedding(model="vertex_ai/textembedding-gecko-multilingual@001", input) textembedding-gecko@001 embedding(model="vertex_ai/textembedding-gecko@001", input) textembedding-gecko@003 embedding(model="vertex_ai/textembedding-gecko@003", input) text-embedding-preview-0409 embedding(model="vertex_ai/text-embedding-preview-0409", input) text-multilingual-embedding-preview-0409 embedding(model="vertex_ai/text-multilingual-embedding-preview-0409", input)
Voyage AI Embedding Models ​
os . environ [ 'VOYAGE_API_KEY' ] = ""
model = "voyage/voyage-01" ,
All models listed here https://docs.voyageai.com/embeddings/#models-and-specifics are supported
Model Name Function Call voyage-01 embedding(model="voyage/voyage-01", input) voyage-lite-01 embedding(model="voyage/voyage-lite-01", input) voyage-lite-01-instruct embedding(model="voyage/voyage-lite-01-instruct", input)
Provider-specific Params ​
Example ​
Cohere v3 Models have a required parameter: input_type , it can be one of the following four values:
input_type="search_document" : (default) Use this for texts (documents) you want to store in your vector database
input_type="search_query" : Use this for search queries to find the most relevant documents in your vector database
input_type="classification" : Use this if you use the embeddings as an input for a classification system
input_type="clustering" : Use this if you use the embeddings for text clustering
https://txt.cohere.com/introducing-embed-v3/
input_type = "search_document" # 👈 PROVIDER-SPECIFIC PARAM
via config
- model_name : "cohere-embed"
model : embed - english - v3.0
input_type : search_document # 👈 PROVIDER-SPECIFIC PARAM
via request
"model": "cohere-embed",
"input": ["Are you authorized to work in United States of America?"],
"input_type": "search_document" # 👈 PROVIDER-SPECIFIC PARAM
Nebius AI Studio Embedding Models ​
os . environ [ 'NEBIUS_API_KEY' ] = ""
model = "nebius/BAAI/bge-en-icl" ,
input = [ "Good morning from litellm!" ] ,
All supported models can be found here: https://studio.nebius.ai/models/embedding
Model Name Function Call BAAI/bge-en-icl embedding(model="nebius/BAAI/bge-en-icl", input) BAAI/bge-multilingual-gemma2 embedding(model="nebius/BAAI/bge-multilingual-gemma2", input) intfloat/e5-mistral-7b-instruct embedding(model="nebius/intfloat/e5-mistral-7b-instruct", input)
Quick Start
Async Usage - aembedding()
Proxy Usage
Add model to config
Test
Image Embeddings
Input Params for litellm.embedding()
Required Fields
Optional LiteLLM Fields
Output from litellm.embedding()
OpenAI Embedding Models
Usage
OpenAI Compatible Embedding Models
Bedrock Embedding
API keys
TwelveLabs Bedrock Embedding Models
Required Parameters
Supported Models
Cohere Embedding Models
NVIDIA NIM Embedding Models
input_type Parameter for Embedding Models
HuggingFace Embedding Models
Usage - Set input_type
Usage - Custom API Base
Mistral AI Embedding Models
Gemini AI Embedding Models
Usage - Embedding
Gemini Embedding 2 Preview (Multimodal)
Vertex AI Embedding Models
Voyage AI Embedding Models
Provider-specific Params
Example
Nebius AI Studio Embedding Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
