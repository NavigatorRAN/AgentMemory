# Vertex AI Embedding | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_embedding
- Final URL: https://docs.litellm.ai/docs/providers/vertex_embedding
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_embedding
- Fetched at: 2026-06-23T14:29:14Z
- Content type: text/html; charset=utf-8

## Description

Usage - Embedding

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Usage - Embedding ​
SDK
LiteLLM PROXY
import litellm
from litellm import embedding
litellm . vertex_project = "hardy-device-38811" # Your Project ID
litellm . vertex_location = "us-central1" # proj location
response = embedding (
model = "vertex_ai/textembedding-gecko" ,
input = [ "good morning from litellm" ] ,
)
print ( response )
Add model to config.yaml
model_list :
- model_name : snowflake - arctic - embed - m - long - 1731622468876
litellm_params :
model : vertex_ai/<your - model - id >
vertex_project : "adroit-crow-413218"
vertex_location : "us-central1"
vertex_credentials : adroit - crow - 413218 - a956eef1a2a8.json
litellm_settings :
drop_params : True
Start Proxy
$ litellm --config /path/to/config.yaml
Make Request using OpenAI Python SDK, Langchain Python SDK
import openai
client = openai . OpenAI ( api_key = "sk-1234" , base_url = "http://0.0.0.0:4000" )
response = client . embeddings . create (
model = "snowflake-arctic-embed-m-long-1731622468876" ,
input = [ "good morning from litellm" , "this is another item" ] ,
Supported Embedding Models ​
All models listed here are supported
Model Name Function Call text-embedding-004 embedding(model="vertex_ai/text-embedding-004", input) text-multilingual-embedding-002 embedding(model="vertex_ai/text-multilingual-embedding-002", input) textembedding-gecko embedding(model="vertex_ai/textembedding-gecko", input) textembedding-gecko-multilingual embedding(model="vertex_ai/textembedding-gecko-multilingual", input) textembedding-gecko-multilingual@001 embedding(model="vertex_ai/textembedding-gecko-multilingual@001", input) textembedding-gecko@001 embedding(model="vertex_ai/textembedding-gecko@001", input) textembedding-gecko@003 embedding(model="vertex_ai/textembedding-gecko@003", input) text-embedding-preview-0409 embedding(model="vertex_ai/text-embedding-preview-0409", input) text-multilingual-embedding-preview-0409 embedding(model="vertex_ai/text-multilingual-embedding-preview-0409", input) gemini-embedding-2-preview embedding(model="vertex_ai/gemini-embedding-2-preview", input) gemini-embedding-2 (GA) embedding(model="vertex_ai/gemini-embedding-2", input) Fine-tuned OR Custom Embedding models embedding(model="vertex_ai/<your-model-id>", input)
Supported OpenAI (Unified) Params ​
param type vertex equivalent input string or List[string] instances dimensions int output_dimensionality input_type Literal["RETRIEVAL_QUERY","RETRIEVAL_DOCUMENT", "SEMANTIC_SIMILARITY", "CLASSIFICATION", "CLUSTERING", "QUESTION_ANSWERING", "FACT_VERIFICATION"] task_type Usage with OpenAI (Unified) Params ​
response = litellm . embedding (
model = "vertex_ai/text-embedding-004" ,
input = [ "good morning from litellm" , "gm" ]
input_type = "RETRIEVAL_DOCUMENT" ,
dimensions = 1 ,
model = "text-embedding-004" ,
input = [ "good morning from litellm" , "gm" ] ,
extra_body = {
"input_type" : "RETRIEVAL_QUERY" ,
}
Supported Vertex Specific Params ​
param type auto_truncate bool task_type Literal["RETRIEVAL_QUERY","RETRIEVAL_DOCUMENT", "SEMANTIC_SIMILARITY", "CLASSIFICATION", "CLUSTERING", "QUESTION_ANSWERING", "FACT_VERIFICATION"] title str Usage with Vertex Specific Params (Use task_type and title ) ​
You can pass any vertex specific params to the embedding model. Just pass them to the embedding function like this:
Relevant Vertex AI doc with all embedding params
task_type = "RETRIEVAL_DOCUMENT" ,
title = "test" ,
auto_truncate = True ,
"task_type" : "RETRIEVAL_QUERY" ,
"auto_truncate" : True ,
"title" : "test" ,
BGE Embeddings ​
Use BGE (Baidu General Embedding) models deployed on Vertex AI.
Usage ​
Using BGE on Vertex AI
model = "vertex_ai/bge/<your-endpoint-id>" ,
input = [ "Hello" , "World" ] ,
vertex_project = "your-project-id" ,
vertex_location = "your-location"
config.yaml
- model_name : bge - embedding
model : vertex_ai/bge/<your - endpoint - id >
vertex_project : "your-project-id"
vertex_credentials : your - credentials.json
Make Request using OpenAI Python SDK
Making requests to BGE
model = "bge-embedding" ,
input = [ "good morning from litellm" , "this is another item" ]
Using a Private Service Connect (PSC) endpoint
config.yaml (PSC)
- model_name : bge - small - en - v1.5
model : vertex_ai/bge/1234567890
api_base : http : //10.96.32.8 # Your PSC IP
vertex_project : my - project - id #optional
vertex_location : us - central1 #optional
Multi-Modal Embeddings ​
Gemini Embedding 2 Preview (Multimodal) ​
gemini-embedding-2-preview supports unified multimodal embeddings —text, images, audio, video, and PDF in a single request. See blog post for details. The GA model id gemini-embedding-2 exposes the same behavior—swap the model name in any example below. See GA blog for cost-map coverage and pricing notes.
Response shape — Vertex returns one combined vector
Vertex AI's Gemini embedding endpoint only exposes single-content embedContent (no batchEmbedContents ), so passing N items in input=[...] returns 1 unified embedding that fuses all parts—not N separate vectors. To get one vector per item, call embedding(...) once per input.
This differs from the Gemini API path ( gemini/gemini-embedding-2-preview ), which returns one embedding per input element (OpenAI-compatible). See Gemini embedding docs .
Input formats:
Data URIs: data:image/png;base64,<encoded_data>
GCS URLs: gs://bucket/path/to/file.png (MIME type inferred from extension)
Supported MIME types: image/png , image/jpeg , audio/mpeg , audio/wav , video/mp4 , video/quicktime , application/pdf
litellm . vertex_project = "your-project-id"
litellm . vertex_location = "us-central1"
# Text + Image (GCS URL)
model = "vertex_ai/gemini-embedding-2-preview" ,
input = [
"Describe this image" ,
"gs://my-bucket/images/photo.png"
] ,
# Text + Image (base64)
"The food was delicious" ,
"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAIAQMAAAD+wSzIAAAABlBMVEX///+/v7+jQ3Y5AAAADklEQVQI12P4AIX8EAgALgAD/aNpbtEAAAAASUVORK5CYII"
- model_name : vertex - gemini - embedding - 2 - preview
model : vertex_ai/gemini - embedding - 2 - preview
curl -X POST http://localhost:4000/embeddings \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "vertex-gemini-embedding-2-preview",
"input": ["Describe this", "gs://bucket/image.png"]
}'
multimodalembedding@001 (Legacy) ​
Known Limitations:
Only supports 1 image / video / image per request
Only supports GCS or base64 encoded images / videos
LiteLLM PROXY (Unified Endpoint)
LiteLLM PROXY (Vertex SDK)
Using GCS Images
response = await litellm . aembedding (
model = "vertex_ai/multimodalembedding@001" ,
input = "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" # will be sent as a gcs image
Using base 64 encoded images
input = "data:image/jpeg;base64,..." # will be sent as a base64 encoded image
- model_name : multimodalembedding@001
model : vertex_ai/multimodalembedding@001
Make Request use OpenAI Python SDK, Langchain Python SDK
OpenAI SDK
Langchain
Requests with GCS Image / Video URI
# # request sent to model set on litellm proxy, `litellm --model`
model = "multimodalembedding@001" ,
input = "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ,
Requests with base64 encoded images
input = "data:image/jpeg;base64,..." ,
from langchain_openai import OpenAIEmbeddings
embeddings_models = "multimodalembedding@001"
embeddings = OpenAIEmbeddings (
base_url = "http://0.0.0.0:4000" ,
api_key = "sk-1234" , # type: ignore
query_result = embeddings . embed_query (
"gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png"
print ( query_result )
"data:image/jpeg;base64,..."
default_vertex_config :
Make Request use OpenAI Python SDK
import vertexai
from vertexai . vision_models import Image , MultiModalEmbeddingModel , Video
from vertexai . vision_models import VideoSegmentConfig
from google . auth . credentials import Credentials
LITELLM_PROXY_API_KEY = "sk-1234"
LITELLM_PROXY_BASE = "http://0.0.0.0:4000/vertex-ai"
import datetime
class CredentialsWrapper ( Credentials ) :
def __init__ ( self , token = None ) :
super ( ) . __init__ ( )
self . token = token
self . expiry = None # or set to a future date if needed
def refresh ( self , request ) :
pass
def apply ( self , headers , token = None ) :
headers [ 'Authorization' ] = f'Bearer { self . token } '
@property
def expired ( self ) :
return False # Always consider the token as non-expired
def valid ( self ) :
return True # Always consider the credentials as valid
credentials = CredentialsWrapper ( token = LITELLM_PROXY_API_KEY )
vertexai . init (
project = "adroit-crow-413218" ,
location = "us-central1" ,
api_endpoint = LITELLM_PROXY_BASE ,
credentials = credentials ,
api_transport = "rest" ,
model = MultiModalEmbeddingModel . from_pretrained ( "multimodalembedding" )
image = Image . load_from_file (
embeddings = model . get_embeddings (
image = image ,
contextual_text = "Colosseum" ,
dimension = 1408 ,
print ( f"Image Embedding: { embeddings . image_embedding } " )
print ( f"Text Embedding: { embeddings . text_embedding } " )
Text + Image + Video Embeddings ​
Text + Image
input = [ "hey" , "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ] # will be sent as a gcs image
Text + Video
input = [ "hey" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] # will be sent as a gcs image
Image + Video
input = [ "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] # will be sent as a gcs image
input = [ "hey" , "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ] ,
input = [ "hey" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] ,
input = [ "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] ,
Usage - Embedding
Supported OpenAI (Unified) Params
Supported Vertex Specific Params
BGE Embeddings
Usage
Multi-Modal Embeddings
Gemini Embedding 2 Preview (Multimodal)
multimodalembedding@001 (Legacy)
Text + Image + Video Embeddings
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
