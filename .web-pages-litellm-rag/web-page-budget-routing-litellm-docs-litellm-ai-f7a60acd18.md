# Budget Routing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/provider_budget_routing
- Final URL: https://docs.litellm.ai/docs/proxy/provider_budget_routing
- Canonical URL: https://docs.litellm.ai/docs/proxy/provider_budget_routing
- Fetched at: 2026-06-23T14:31:48Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM Supports setting the following budgets:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM Supports setting the following budgets:
Provider budget - $100/day for OpenAI, $100/day for Azure.
Model budget - $100/day for gpt-4 https://api-base-1 , $100/day for gpt-4o https://api-base-2
Tag budget - $10/day for tag= product:chat-bot , $100/day for tag= product:chat-bot-2
Provider Budgets ​
Use this to set budgets for LLM Providers - example $100/day for OpenAI, $100/day for Azure.
Quick Start ​
Set provider budgets in your proxy_config.yaml file
Proxy Config setup ​
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
router_settings :
provider_budget_config :
openai :
budget_limit : 0.000000000001 # float of $ value budget for time period
time_period : 1d # can be 1d, 2d, 30d, 1mo, 2mo
azure :
budget_limit : 100
time_period : 1d
anthropic :
time_period : 10d
vertex_ai :
time_period : 12d
gemini :
# OPTIONAL: Set Redis Host, Port, and Password if using multiple instance of LiteLLM
redis_host : os.environ/REDIS_HOST
redis_port : os.environ/REDIS_PORT
redis_password : os.environ/REDIS_PASSWORD
general_settings :
master_key : sk - 1234
Make a test request ​
We expect the first request to succeed, and the second request to fail since we cross the budget for openai
Langchain, OpenAI SDK Usage Examples
Successful Call
Unsuccessful call
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4o",
"messages": [
{"role": "user", "content": "hi my name is test request"}
]
}'
Expect this to fail since since we cross the budget for provider openai
Expected response on failure
{
"error" : {
"message" : "No deployments available - crossed budget for provider: Exceeded budget for provider openai: 0.0007350000000000001 >= 1e-12" ,
"type" : "None" ,
"param" : "None" ,
"code" : "429"
}
How provider budget routing works ​
Budget Tracking :
Uses Redis to track spend for each provider
Tracks spend over specified time periods (e.g., "1d", "30d")
Automatically resets spend after time period expires
Routing Logic :
Routes requests to providers under their budget limits
Skips providers that have exceeded their budget
If all providers exceed budget, raises an error
Supported Time Periods :
Seconds: "Xs" (e.g., "30s")
Minutes: "Xm" (e.g., "10m")
Hours: "Xh" (e.g., "24h")
Days: "Xd" (e.g., "1d", "30d")
Months: "Xmo" (e.g., "1mo", "2mo")
Requirements :
Redis required for tracking spend across instances
Provider names must be litellm provider names. See Supported Providers
Monitoring Provider Remaining Budget ​
Get Budget, Spend Details ​
Use this endpoint to check current budget, spend and budget reset time for a provider
Example Request
curl -X GET http://localhost:4000/provider/budgets \
-H "Authorization: Bearer sk-1234"
Example Response
"providers" : {
"openai" : {
"budget_limit" : 1e-12 ,
"time_period" : "1d" ,
"spend" : 0.0 ,
"budget_reset_at" : null
} ,
"azure" : {
"budget_limit" : 100.0 ,
"anthropic" : {
"time_period" : "10d" ,
"vertex_ai" : {
"time_period" : "12d" ,
Prometheus Metric ​
LiteLLM will emit the following metric on Prometheus to track the remaining budget for each provider
This metric indicates the remaining budget for a provider in dollars (USD)
litellm_provider_remaining_budget_metric{api_provider="openai"} 10
Model Budgets ​
Use this to set budgets for models - example $10/day for openai/gpt-4o, $100/day for openai/gpt-4o-mini
Set model budgets in your proxy_config.yaml file
- model_name : gpt - 4o
model : openai/gpt - 4o
max_budget : 0.000000000001 # (USD)
budget_duration : 1d # (Duration. can be 1s, 1m, 1h, 1d, 1mo)
- model_name : gpt - 4o - mini
model : openai/gpt - 4o - mini
max_budget : 100 # (USD)
budget_duration : 30d # (Duration. can be 1s, 1m, 1h, 1d, 1mo)
We expect the first request to succeed, and the second request to fail since we cross the budget for openai/gpt-4o
Expect this to fail since since we cross the budget for openai/gpt-4o
"message" : "No deployments available - crossed budget: Exceeded budget for deployment model_name: gpt-4o, litellm_params.model: openai/gpt-4o, model_id: dbe80f2fe2b2465f7bfa9a5e77e0f143a2eb3f7d167a8b55fb7fe31aed62587f: 0.00015250000000000002 >= 1e-12" ,
✨ Tag Budgets ​
info
✨ This is an Enterprise only feature Get Started with Enterprise here
Use this to set budgets for tags - example $10/day for tag= product:chat-bot , $100/day for tag= product:chat-bot-2
Set tag budgets by setting tag_budget_config in your proxy_config.yaml file
litellm_settings :
tag_budget_config :
product:chat-bot : # (Tag)
budget_duration : 1d # (Duration)
product:chat-bot-2 : # (Tag)
],
"metadata": {"tags": ["product:chat-bot"]}
Expect this to fail since since we cross the budget for tag= product:chat-bot
"message" : "No deployments available - crossed budget: Exceeded budget for tag='product:chat-bot', tag_spend=0.00015250000000000002, tag_budget_limit=1e-12" ,
Multi-instance setup ​
If you are using a multi-instance setup, you will need to set the Redis host, port, and password in the proxy_config.yaml file. Redis is used to sync the spend across LiteLLM instances.
# 👇 Add this: Set Redis Host, Port, and Password if using multiple instance of LiteLLM
Spec for provider_budget_config ​
The provider_budget_config is a dictionary where:
Key : Provider name (string) - Must be a valid LiteLLM provider name
Value : Budget configuration object with the following parameters:
budget_limit : Float value representing the budget in USD
time_period : Duration string in one of the following formats:
Example structure:
budget_limit : 100.0 # $100 USD
time_period : "1d" # 1 day period
budget_limit : 500.0 # $500 USD
time_period : "30d" # 30 day period
budget_limit : 200.0 # $200 USD
time_period : "1mo" # 1 month period
budget_limit : 50.0 # $50 USD
time_period : "24h" # 24 hour period
Provider Budgets
Quick Start
Monitoring Provider Remaining Budget
Model Budgets
✨ Tag Budgets
Multi-instance setup
Spec for provider_budget_config
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
