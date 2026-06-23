# Vertex Batch APIs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_batch
- Final URL: https://docs.litellm.ai/docs/providers/vertex_batch
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_batch
- Fetched at: 2026-06-23T14:29:13Z
- Content type: text/html; charset=utf-8

## Description

Just add the following Vertex env vars to your environment.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Just add the following Vertex env vars to your environment.
# GCS Bucket settings, used to store batch prediction files in
export GCS_BUCKET_NAME="my-batch-bucket" # the bucket you want to store batch prediction files in
export GCS_PATH_SERVICE_ACCOUNT="/path/to/service_account.json" # path to your service account json file
# Vertex /batch endpoint settings, used for LLM API requests
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service_account.json" # path to your service account json file
export VERTEXAI_LOCATION="us-central1" # can be any vertex location
export VERTEXAI_PROJECT="my-project"
Usage ​
Follow this complete workflow: create JSONL file → upload file → create batch → retrieve batch status → get file content
1. Create a JSONL file of batch requests ​
LiteLLM expects the file to follow the OpenAI batches files format .
Each body in the file should be an OpenAI API request .
Create a file called batch_requests.jsonl with your requests:
{"custom_id": "request-1", "method": "POST", "url": "/v1/chat/completions", "body": {"model": "gemini-2.5-flash-lite", "messages": [{"role": "system", "content": "You are a helpful assistant."},{"role": "user", "content": "Hello world!"}],"max_tokens": 10}}
{"custom_id": "request-2", "method": "POST", "url": "/v1/chat/completions", "body": {"model": "gemini-2.5-flash-lite", "messages": [{"role": "system", "content": "You are an unhelpful assistant."},{"role": "user", "content": "Hello world!"}],"max_tokens": 10}}
2. Upload the file ​
Upload your JSONL file. For vertex_ai , the file will be stored in your configured GCS bucket provided by GCS_BUCKET_NAME .
Python
Curl
upload_file.py
from openai import OpenAI
oai_client = OpenAI (
api_key = "sk-1234" , # litellm proxy API key
base_url = "http://localhost:4000" # litellm proxy base url
)
file_obj = oai_client . files . create (
file = open ( "batch_requests.jsonl" , "rb" ) ,
purpose = "batch" ,
extra_headers = { "custom-llm-provider" : "vertex_ai" }
print ( f"File uploaded with ID: { file_obj . id } " )
Upload File
curl --request POST \
--url http://localhost:4000/v1/files \
--header 'Content-Type: multipart/form-data' \
--header 'custom-llm-provider: vertex_ai' \
--form purpose=batch \
--form file=@batch_requests.jsonl
Expected Response:
{
"id" : "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/abc123-def4-5678-9012-34567890abcd" ,
"bytes" : 416 ,
"created_at" : 1758303684 ,
"filename" : "litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/abc123-def4-5678-9012-34567890abcd" ,
"object" : "file" ,
"purpose" : "batch" ,
"status" : "uploaded" ,
"expires_at" : null ,
"status_details" : null
}
3. Create a batch ​
Create a batch job using the uploaded file ID.
create_batch.py
batch_input_file_id = file_obj . id # from step 2
create_batch_response = oai_client . batches . create (
completion_window = "24h" ,
endpoint = "/v1/chat/completions" ,
input_file_id = batch_input_file_id , # e.g. "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/abc123-def4-5678-9012-34567890abcd"
print ( f"Batch created with ID: { create_batch_response . id } " )
Create Batch Request
--url http://localhost:4000/v1/batches \
--header 'Content-Type: application/json' \
--data '{
"input_file_id": "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/abc123-def4-5678-9012-34567890abcd",
"endpoint": "/v1/chat/completions",
"completion_window": "24h"
}'
"id" : "7814463557919047680" ,
"completion_window" : "24hrs" ,
"created_at" : 1758328011 ,
"endpoint" : "" ,
"input_file_id" : "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/abc123-def4-5678-9012-34567890abcd" ,
"object" : "batch" ,
"status" : "validating" ,
"cancelled_at" : null ,
"cancelling_at" : null ,
"completed_at" : null ,
"error_file_id" : null ,
"errors" : null ,
"expired_at" : null ,
"failed_at" : null ,
"finalizing_at" : null ,
"in_progress_at" : null ,
"metadata" : null ,
"output_file_id" : "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite" ,
"request_counts" : null ,
"usage" : null
4. Retrieve batch status ​
Check the status of your batch job. The batch will progress through states: validating → in_progress → completed .
retrieve_batch.py
retrieved_batch = oai_client . batches . retrieve (
batch_id = create_batch_response . id , # Created batch id, e.g. 7814463557919047680
print ( f"Batch status: { retrieved_batch . status } " )
if retrieved_batch . status == "completed" :
print ( f"Output file: { retrieved_batch . output_file_id } " )
Retrieve Batch Status
curl --request GET \
--url 'http://localhost:4000/batches/7814463557919047680?provider=vertex_ai' \
--header 'Authorization: Bearer sk-1234'
Expected Response (when completed):
"status" : "completed" ,
"output_file_id" : "gs://my-batch-bucket/litellm-vertex-files/publishers/google/models/gemini-2.5-flash-lite/prediction-model-2025-09-19T21:26:51.569037Z/predictions.jsonl" ,
5. Get file content ​
Once the batch is completed, retrieve the results using the output_file_id from the batch response.
Important: The output_file_id must be URL encoded when used in the request path.
get_file_content.py
import urllib . parse
import json
output_file_id = retrieved_batch . output_file_id
# URL encode the file ID
encoded_file_id = urllib . parse . quote_plus ( output_file_id )
# Get file content
file_content = oai_client . files . content (
file_id = encoded_file_id ,
# Process the results
for line in file_content . text . strip ( ) . split ( '\n' ) :
result = json . loads ( line )
print ( f"Request: { result [ 'request' ] } " )
print ( f"Response: { result [ 'response' ] } " )
print ( "---" )
Get File Content
# Note: The file ID must be URL encoded
--url 'http://localhost:4000/files/gs%253A%252F%252Fmy-batch-bucket%252Flitellm-vertex-files%252Fpublishers%252Fgoogle%252Fmodels%252Fgemini-2.5-flash-lite%252Fprediction-model-2025-09-19T21%253A26%253A51.569037Z%252Fpredictions.jsonl/content?provider=vertex_ai' \
The response contains JSONL format with one result per line:
{"status":"","processed_time":"2025-09-19T21:29:47.352+00:00","request":{"contents":[{"parts":[{"text":"Hello world!"}],"role":"user"}],"generationConfig":{"max_output_tokens":10},"system_instruction":{"parts":[{"text":"You are a helpful assistant."}]}},"response":{"candidates":[{"avgLogprobs":-0.48079710006713866,"content":{"parts":[{"text":"Hello there! It's nice to meet you"}],"role":"model"},"finishReason":"MAX_TOKENS"}],"createTime":"2025-09-19T21:29:47.484619Z","modelVersion":"gemini-2.5-flash-lite","responseId":"S8vNaIvKHdvshMIP_aOtuAg","usageMetadata":{"candidatesTokenCount":10,"candidatesTokensDetails":[{"modality":"TEXT","tokenCount":10}],"promptTokenCount":9,"promptTokensDetails":[{"modality":"TEXT","tokenCount":9}],"totalTokenCount":19,"trafficType":"ON_DEMAND"}}}
{"status":"","processed_time":"2025-09-19T21:29:47.358+00:00","request":{"contents":[{"parts":[{"text":"Hello world!"}],"role":"user"}],"generationConfig":{"max_output_tokens":10},"system_instruction":{"parts":[{"text":"You are an unhelpful assistant."}]}},"response":{"candidates":[{"avgLogprobs":-0.6168075137668185,"content":{"parts":[{"text":"I am unable to assist with this request."}],"role":"model"},"finishReason":"STOP"}],"createTime":"2025-09-19T21:29:47.470889Z","modelVersion":"gemini-2.5-flash-lite","responseId":"S8vNaOneHISShMIP28nA8QQ","usageMetadata":{"candidatesTokenCount":9,"candidatesTokensDetails":[{"modality":"TEXT","tokenCount":9}],"promptTokenCount":9,"promptTokensDetails":[{"modality":"TEXT","tokenCount":9}],"totalTokenCount":18,"trafficType":"ON_DEMAND"}}}
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
