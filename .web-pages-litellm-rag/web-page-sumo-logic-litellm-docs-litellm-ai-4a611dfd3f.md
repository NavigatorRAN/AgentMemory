# Sumo Logic | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/sumologic_integration
- Final URL: https://docs.litellm.ai/docs/observability/sumologic_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/sumologic_integration
- Fetched at: 2026-06-23T14:25:38Z
- Content type: text/html; charset=utf-8

## Description

Send LiteLLM logs to Sumo Logic for observability, monitoring, and analysis.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Send LiteLLM logs to Sumo Logic for observability, monitoring, and analysis.
Sumo Logic is a cloud-native machine data analytics platform that provides real-time insights into your applications and infrastructure.
https://www.sumologic.com/
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
Create a Sumo Logic account at https://www.sumologic.com/
Set up an HTTP Logs and Metrics Source in Sumo Logic:
Go to Manage Data > Collection > Collection
Click Add Source next to a Hosted Collector
Select HTTP Logs & Metrics
Copy the generated URL (it contains the authentication token)
For more details, see the HTTP Logs & Metrics Source documentation.
uv add litellm
Quick Start ​
Use just 2 lines of code to instantly log your LLM responses to Sumo Logic.
The Sumo Logic HTTP Source URL includes the authentication token, so no separate API key is required.
SDK
LiteLLM Proxy
litellm . callbacks = [ "sumologic" ]
import litellm
import os
# Sumo Logic HTTP Source URL (includes auth token)
os . environ [ "SUMOLOGIC_WEBHOOK_URL" ] = "https://collectors.sumologic.com/receiver/v1/http/your-token-here"
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# Set sumologic as a callback
# OpenAI call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - I'm testing Sumo Logic integration" }
]
)
Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "sumologic" ]
environment_variables :
SUMOLOGIC_WEBHOOK_URL : os.environ/SUMOLOGIC_WEBHOOK_URL
Start LiteLLM Proxy
litellm --config /path/to/config.yaml
Test it!
curl -L -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "Hey, how are you?"
}
}'
What Data is Logged? ​
LiteLLM sends the Standard Logging Payload to Sumo Logic, which includes:
Request details : Model, messages, parameters
Response details : Completion text, token usage, latency
Metadata : User ID, custom metadata, timestamps
Cost tracking : Response cost based on token usage
Example payload:
"id" : "chatcmpl-123" ,
"call_type" : "litellm.completion" ,
"model" : "gpt-3.5-turbo" ,
"messages" : [
{ "role" : "user" , "content" : "Hello" }
] ,
"response" : {
"choices" : [ {
"message" : {
"role" : "assistant" ,
"content" : "Hi there!"
} ]
} ,
"usage" : {
"prompt_tokens" : 10 ,
"completion_tokens" : 5 ,
"total_tokens" : 15
"response_cost" : 0.0001 ,
"start_time" : "2024-01-01T00:00:00" ,
"end_time" : "2024-01-01T00:00:01"
Advanced Configuration ​
Log Format ​
The Sumo Logic integration uses NDJSON (newline-delimited JSON) format by default. This format is optimal for Sumo Logic's parsing capabilities and allows Field Extraction Rules to work at ingest time.
NDJSON Format ​
Each log entry is sent as a separate line in the HTTP request:
{"id":"chatcmpl-1","model":"gpt-3.5-turbo","response_cost":0.0001,...}
{"id":"chatcmpl-2","model":"gpt-4","response_cost":0.0003,...}
{"id":"chatcmpl-3","model":"gpt-3.5-turbo","response_cost":0.0001,...}
Benefits for Field Extraction Rules (FERs) ​
With NDJSON format, you can create Field Extraction Rules directly:
_sourceCategory=litellm/logs
| json field=_raw "model", "response_cost", "user" as model, cost, user
Before NDJSON (with JSON array format):
Required parse regex ... multi workaround
FERs couldn't parse at ingest time
Query-time parsing impacted dashboard performance
After NDJSON :
✅ FERs parse fields at ingest time
✅ No query-time workarounds needed
✅ Better dashboard performance
✅ Simpler query syntax
Changing the Log Format (Advanced) ​
If you need to change the log format (not recommended for Sumo Logic):
callback_settings :
sumologic :
callback_type : generic_api
callback_name : sumologic
log_format : json_array # Override to use JSON array instead
Batching Settings ​
Control how LiteLLM batches logs before sending to Sumo Logic:
os . environ [ "SUMOLOGIC_WEBHOOK_URL" ] = "https://collectors.sumologic.com/receiver/v1/http/your-token"
# Configure batch settings (optional)
# These are inherited from CustomBatchLogger
# Default batch_size: 100
# Default flush_interval: 60 seconds
Compressed Data ​
Sumo Logic supports compressed data (gzip or deflate). LiteLLM automatically handles compression when beneficial.
Benefits:
Reduced network usage
Faster message delivery
Lower data transfer costs
Query Logs in Sumo Logic ​
Once logs are flowing to Sumo Logic, you can query them using the Sumo Logic Query Language:
_sourceCategory = litellm
| json "model" , "response_cost" , "usage.total_tokens" as model , cost , tokens
| sum ( cost ) by model
Example queries:
Total cost by model:
| json "model" , "response_cost" as model , cost
| sum ( cost ) as total_cost by model
| sort by total_cost desc
Average response time:
| json "start_time" , "end_time" as start , end
| parse regex field = start "(?<start_ms>\d+)"
| parse regex field = end "(?<end_ms>\d+)"
| ( end_ms - start_ms ) as response_time_ms
| avg ( response_time_ms ) as avg_response_time
Requests per user:
| json "model_parameters.user" as user
| count by user
Authentication ​
The Sumo Logic HTTP Source URL includes the authentication token, so you only need to set the SUMOLOGIC_WEBHOOK_URL environment variable.
Security Best Practices:
Keep your HTTP Source URL private (it contains the auth token)
Store it in environment variables or secrets management
Regenerate the URL if it's compromised (in Sumo Logic UI)
Use separate HTTP Sources for different environments (dev, staging, prod)
Getting Your Sumo Logic URL ​
Log in to Sumo Logic
Configure the source:
Name : LiteLLM Logs
Source Category : litellm (optional, but helps with queries)
Click Save
Copy the displayed URL - it will look like:
https://collectors.sumologic.com/receiver/v1/http/ZaVnC4dhaV39Tn37...
Troubleshooting ​
Logs not appearing in Sumo Logic ​
Verify the URL : Make sure SUMOLOGIC_WEBHOOK_URL is set correctly
Check the HTTP Source : Ensure it's active in Sumo Logic UI
Wait for batching : Logs are sent in batches, wait 60 seconds
Check for errors : Enable debug logging in LiteLLM:
litellm . set_verbose = True
URL Format ​
The URL must be the complete HTTP Source URL from Sumo Logic:
✅ Correct: https://collectors.sumologic.com/receiver/v1/http/ZaVnC4dhaV39Tn37...
No authentication errors ​
If you get authentication errors, regenerate the HTTP Source URL in Sumo Logic:
Go to your HTTP Source in Sumo Logic
Click the settings icon
Click Show URL
Click Regenerate URL
Update your SUMOLOGIC_WEBHOOK_URL environment variable
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
What Data is Logged?
Advanced Configuration
Log Format
Batching Settings
Compressed Data
Query Logs in Sumo Logic
Authentication
Getting Your Sumo Logic URL
Troubleshooting
Logs not appearing in Sumo Logic
URL Format
No authentication errors
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
