# Generic API Callback (Webhook) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/generic_api
- Final URL: https://docs.litellm.ai/docs/observability/generic_api
- Canonical URL: https://docs.litellm.ai/docs/observability/generic_api
- Fetched at: 2026-06-23T14:25:06Z
- Content type: text/html; charset=utf-8

## Description

Send LiteLLM logs to any HTTP endpoint.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Send LiteLLM logs to any HTTP endpoint.
Quick Start ​
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "custom_api_name" ]
callback_settings :
custom_api_name :
callback_type : generic_api
endpoint : https : //your - endpoint.com/logs
headers :
Authorization : Bearer sk - 1234
Configuration ​
Basic Setup ​
<callback_name> :
endpoint : https : //your - endpoint.com # required
headers : # optional
Authorization : Bearer <token >
Custom-Header : value
event_types : # optional, defaults to all events
- llm_api_success
- llm_api_failure
Parameters ​
Parameter Type Required Description callback_type string Yes Must be generic_api endpoint string Yes HTTP endpoint to send logs to headers dict No Custom headers for the request event_types list No Filter events: llm_api_success , llm_api_failure . Defaults to all events. log_format string No Output format: json_array (default), ndjson , or single . Controls how logs are batched and sent.
Pre-configured Callbacks ​
Use built-in configurations from generic_api_compatible_callbacks.json :
callbacks : [ "rubrik" ] # loads pre-configured settings
rubrik :
endpoint : https : //your - endpoint.com # override defaults
Authorization : Bearer $ { RUBRIK_API_KEY }
Payload Format ​
Logs are sent as StandardLoggingPayload objects in JSON format:
[
{
"id" : "chatcmpl-123" ,
"call_type" : "litellm.completion" ,
"model" : "gpt-3.5-turbo" ,
"messages" : [ ... ] ,
"response" : { ... } ,
"usage" : { ... } ,
"cost" : 0.0001 ,
"startTime" : "2024-01-01T00:00:00" ,
"endTime" : "2024-01-01T00:00:01" ,
"metadata" : { ... }
}
]
Environment Variables ​
Set via environment variables instead of config:
export GENERIC_LOGGER_ENDPOINT=https://your-endpoint.com
export GENERIC_LOGGER_HEADERS="Authorization=Bearer token,Custom-Header=value"
Batch Settings ​
Control batching behavior (inherits from CustomBatchLogger ):
my_api :
endpoint : https : //your - endpoint.com
batch_size : 100 # default: 100
flush_interval : 60 # seconds, default: 60
Log Format Options ​
Control how logs are formatted and sent to your endpoint.
JSON Array (Default) ​
log_format : json_array # default if not specified
Sends all logs in a batch as a single JSON array [{log1}, {log2}, ...] . This is the default behavior and maintains backward compatibility.
When to use : Most HTTP endpoints expecting batched JSON data.
NDJSON (Newline-Delimited JSON) ​
log_format : ndjson
Sends logs as newline-delimited JSON (one record per line):
{log1}
{log2}
{log3}
When to use : Log aggregation services like Sumo Logic, Splunk, or Datadog that support field extraction on individual records.
Benefits :
Each log is ingested as a separate message
Field Extraction Rules work at ingest time
Better parsing and querying performance
Single ​
log_format : single
Sends each log as an individual HTTP request in parallel when the batch is flushed.
When to use : Endpoints that expect individual records, or when you need maximum compatibility.
Note : This mode sends N HTTP requests per batch (more overhead). Consider using ndjson instead if your endpoint supports it.
Quick Start
Configuration
Basic Setup
Parameters
Pre-configured Callbacks
Payload Format
Environment Variables
Batch Settings
Log Format Options
JSON Array (Default)
NDJSON (Newline-Delimited JSON)
Single
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
