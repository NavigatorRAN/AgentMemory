# DataDog | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/datadog
- Final URL: https://docs.litellm.ai/docs/observability/datadog
- Canonical URL: https://docs.litellm.ai/docs/observability/datadog
- Fetched at: 2026-06-23T14:25:02Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM Supports logging to the following Datdog Integrations:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM Supports logging to the following Datdog Integrations:
datadog Datadog Logs
datadog_llm_observability Datadog LLM Observability
datadog_metrics Datadog Custom Metrics
datadog_cost_management Datadog Cloud Cost Management
ddtrace-run Datadog Tracing
Datadog Logs ​
Feature Details What is logged StandardLoggingPayload Events Success + Failure Product Link Datadog Logs
We will use the --config to set litellm.callbacks = ["datadog"] this will log all successful LLM calls to DataDog
Step 1 : Create a config.yaml file and set litellm_settings : success_callback
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : gpt - 3.5 - turbo
litellm_settings :
callbacks : [ "datadog" ] # logs llm success + failure logs on datadog
service_callback : [ "datadog" ] # logs redis, postgres failures on datadog
Datadog LLM Observability ​
Overview
Feature Details What is logged StandardLoggingPayload Events Success + Failure Product Link Datadog LLM Observability
callbacks : [ "datadog_llm_observability" ] # logs llm success logs on datadog
Step 2 : Set Required env variables for datadog
Direct API ​
Send logs directly to Datadog API:
DD_API_KEY="5f2d0f310***********" # your datadog API Key
DD_SITE="us5.datadoghq.com" # your datadog base url
DD_SOURCE="litellm_dev" # [OPTIONAL] your datadog source. use to differentiate dev vs. prod deployments
Via DataDog Agent ​
Send logs through a local DataDog agent (useful for containerized environments):
LITELLM_DD_AGENT_HOST="localhost" # hostname or IP of DataDog agent
LITELLM_DD_AGENT_PORT="10518" # [OPTIONAL] port of DataDog agent (default: 10518)
DD_API_KEY="5f2d0f310***********" # [OPTIONAL] your datadog API Key (Agent handles auth for Logs. REQUIRED for LLM Observability)
DD_SOURCE="litellm_dev" # [OPTIONAL] your datadog source
When LITELLM_DD_AGENT_HOST is set, logs are sent to the agent instead of directly to DataDog API. This is useful for:
Centralized log shipping in containerized environments
Reducing direct API calls from multiple services
Leveraging agent-side processing and filtering
Note: We use LITELLM_DD_AGENT_HOST instead of DD_AGENT_HOST to avoid conflicts with ddtrace which automatically sets DD_AGENT_HOST for APM tracing.
[!IMPORTANT]
Datadog LLM Observability : DD_API_KEY is REQUIRED even when using the Datadog Agent ( LITELLM_DD_AGENT_HOST ). The agent acts as a proxy but the API key header is mandatory for the LLM Observability endpoint.
Step 3 : Start the proxy, make a test request
Start proxy
litellm --config config.yaml --debug
Test Request
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
],
"metadata": {
"your-custom-metadata": "custom-field",
}'
Expected output on Datadog
Redacting Messages and Responses ​
This section covers how to redact sensitive data from messages and responses in the logged payload on Datadog LLM Observability.
When redaction is enabled, the actual message content and response text will be excluded from Datadog logs while preserving metadata like token counts, latency, and model information.
Step 1 : Configure redaction in your config.yaml
config.yaml
# Params to apply only for "datadog_llm_observability" callback
datadog_llm_observability_params :
turn_off_message_logging : true # redacts input messages and output responses
Step 2 : Send a chat completion request
]
Step 3 : Verify redaction in Datadog LLM Observability
On the Datadog LLM Observability page, you should see that both input messages and output responses are redacted, while metadata (token counts, timing, model info) remains visible.
Datadog Custom Metrics ​
Feature Details What is logged Latency metrics, request counts by status code Events Success + Failure Product Link Datadog Metrics
Publishes the following metrics to Datadog via the /api/v2/series endpoint:
Metric Type Description litellm.request.total_latency Gauge End-to-end request latency (seconds) litellm.llm_api.latency Gauge Time spent waiting for the LLM provider response (seconds) litellm.llm_api.request_count Count Request count, tagged with status code
Using total_latency and llm_api.latency , you can derive internal latency = total_latency - llm_api.latency .
All metrics include the following tags: env , service , version , HOSTNAME , POD_NAME , provider , model_name , model_group , team , status_code .
Step 1 : Create a config.yaml file
success_callback : [ "datadog_metrics" ]
failure_callback : [ "datadog_metrics" ]
Step 2 : Set required env variables
DD_API_KEY="your-api-key"
DD_SITE="us5.datadoghq.com" # your datadog site
Step 3 : Start the proxy and make a test request
litellm --config config.yaml
--header 'Authorization: Bearer sk-1234' \
"messages": [{"role": "user", "content": "hello"}]
Step 4 : View metrics in Datadog Metrics Explorer
Navigate to Metrics > Explorer in Datadog and search for litellm.request.total_latency , litellm.llm_api.latency , or litellm.llm_api.request_count .
Datadog Cloud Cost Management ​
Feature Details What is logged Aggregated LLM Costs (FOCUS format) Events Periodic Uploads of Aggregated Cost Data Product Link Datadog Cloud Cost Management
We will use the --config to set litellm.callbacks = ["datadog_cost_management"] . This will periodically upload aggregated LLM cost data to Datadog.
callbacks : [ "datadog_cost_management" ]
Step 2 : Set Required env variables
DD_APP_KEY="your-app-key" # REQUIRED for Cost Management
DD_SITE="us5.datadoghq.com"
Step 3 : Start the proxy
How it works
LiteLLM aggregates costs in-memory by Provider, Model, Date, and Tags.
Requires DD_APP_KEY for the Custom Costs API.
Costs are uploaded periodically (flushed).
Datadog Tracing ​
Use ddtrace-run to enable Datadog Tracing on litellm proxy
DD Tracer
Pass USE_DDTRACE=true to the docker run command. When USE_DDTRACE=true , the proxy will run ddtrace-run litellm as the ENTRYPOINT instead of just litellm
DD Profiler
Pass USE_DDPROFILER=true to the docker run command. When USE_DDPROFILER=true , the proxy will activate the Datadog Profiler . This is useful for debugging CPU% and memory usage.
We don't recommend using USE_DDPROFILER in production. It is only recommended for debugging CPU% and memory usage.
docker run \
-v $(pwd)/litellm_config.yaml:/app/config.yaml \
-e USE_DDTRACE=true \
-e USE_DDPROFILER=true \
-p 4000:4000 \
docker.litellm.ai/berriai/litellm:main-latest \
--config /app/config.yaml --detailed_debug
Set DD variables ( DD_SERVICE etc) ​
LiteLLM supports customizing the following Datadog environment variables
Environment Variable Description Default Value Required DD_API_KEY Your Datadog API key for authentication (required for direct API, optional for agent) None Conditional* DD_SITE Your Datadog site (e.g., "us5.datadoghq.com") (required for direct API) None Conditional* LITELLM_DD_AGENT_HOST Hostname or IP of DataDog agent (e.g., "localhost"). When set, logs are sent to agent instead of direct API None ❌ No LITELLM_DD_AGENT_PORT Port of DataDog agent for log intake "10518" ❌ No DD_ENV Environment tag for your logs (e.g., "production", "staging") "unknown" ❌ No DD_SERVICE Service name for your logs "litellm-server" ❌ No DD_LLMOBS_ML_APP Default ml_app name for LLM Observability (Application column). Can be overridden per-request via metadata.ml_app . Falls back to DD_SERVICE ❌ No DD_SOURCE Source name for your logs "litellm" ❌ No DD_VERSION Version tag for your logs "unknown" ❌ No HOSTNAME Hostname tag for your logs "" ❌ No POD_NAME Pod name tag (useful for Kubernetes deployments) "unknown" ❌ No
* Required when using Direct API (default): DD_API_KEY and DD_SITE are required
* Optional when using DataDog Agent : Set LITELLM_DD_AGENT_HOST to use agent mode; DD_API_KEY and DD_SITE are not required for Datadog Logs . ( Note: DD_API_KEY IS REQUIRED for Datadog LLM Observability )
Automatic Tags ​
LiteLLM automatically adds the following tags to your Datadog logs and metrics if the information is available in the request:
Tag Description Source team The team alias or ID associated with the API Key user_api_key_team_alias , team_alias , user_api_key_team_id , or team_id in metadata request_tag Custom tags passed in the request request_tags in logging payload
Datadog Logs
Datadog LLM Observability
Redacting Messages and Responses
Datadog Custom Metrics
Datadog Cloud Cost Management
Datadog Tracing
Set DD variables ( DD_SERVICE etc)
Automatic Tags
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
