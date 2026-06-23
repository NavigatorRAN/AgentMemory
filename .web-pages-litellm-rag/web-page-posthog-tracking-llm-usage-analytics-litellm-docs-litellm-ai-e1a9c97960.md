# PostHog - Tracking LLM Usage Analytics | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/posthog_integration
- Final URL: https://docs.litellm.ai/docs/observability/posthog_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/posthog_integration
- Fetched at: 2026-06-23T14:25:28Z
- Content type: text/html; charset=utf-8

## Description

What is PostHog?

## Extracted Text

Skip to main content
On this page
Copy as Markdown
What is PostHog? ​
PostHog is an open-source product analytics platform that helps you track and analyze how users interact with your product. For LLM applications, PostHog provides specialized AI features to track model usage, performance, and user interactions with your AI features.
Usage with LiteLLM Proxy (LLM Gateway) ​
Step 1 : Create a config.yaml file and set litellm_settings : success_callback
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : gpt - 3.5 - turbo
litellm_settings :
success_callback : [ "posthog" ]
failure_callback : [ "posthog" ]
Step 2 : Set required environment variables
export POSTHOG_API_KEY="your-posthog-api-key"
# Optional, defaults to https://app.posthog.com
export POSTHOG_API_URL="https://app.posthog.com" # optional
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
"user_id": "user-123",
"custom_field": "custom_value"
}'
Team-Based Logging ​
Configure different PostHog credentials per team using the team callback settings:
curl -X POST 'http://localhost:4000/team/{team_id}/callback' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"callback_name": "posthog",
"callback_type": "success",
"callback_vars": {
"posthog_api_key": "ph_team_specific_key",
"posthog_api_url": "https://custom.posthog.com"
Now all requests from that team will be logged to their specific PostHog project.
Usage with LiteLLM Python SDK ​
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with PostHog:
litellm . success_callback = [ "posthog" ]
litellm . failure_callback = [ "posthog" ] # logs errors to posthog
import litellm
import os
# from PostHog
os . environ [ "POSTHOG_API_KEY" ] = ""
os . environ [ "POSTHOG_API_URL" ] = "" # optional
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set posthog as a callback, litellm will send the data to posthog
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi - i'm openai" }
] ,
metadata = {
"user_id" : "user-123" , # set posthog user ID
)
Advanced ​
Set User ID and Custom Metadata ​
Pass user_id in metadata to associate events with specific users in PostHog:
With LiteLLM Python SDK:
{ "role" : "user" , "content" : "Hello world" }
"user_id" : "user-123" , # Add user ID for PostHog tracking
"custom_field" : "custom_value" # Add custom metadata
With LiteLLM Proxy using OpenAI Python SDK:
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # Your LiteLLM Proxy API key
base_url = "http://0.0.0.0:4000" # Your LiteLLM Proxy URL
response = client . chat . completions . create (
extra_body = {
"metadata" : {
"project_name" : "my-project" , # Add custom metadata
"environment" : "production"
Per-Request Credentials ​
You can override PostHog credentials on a per-request basis:
# Use custom PostHog credentials for this specific request
posthog_api_key = "ph_custom_project_key" ,
posthog_api_url = "https://custom.posthog.com"
This is useful when you need to:
Log different teams/projects to separate PostHog instances
Use different PostHog projects for staging vs production
Route logs based on customer or tenant
Disable Logging for Specific Calls ​
Use the no-log flag to prevent logging for specific calls:
{ "role" : "user" , "content" : "This won't be logged" }
metadata = { "no-log" : True }
What's Logged to PostHog? ​
When LiteLLM logs to PostHog, it captures detailed information about your LLM usage:
For Completion Calls ​
Model Information : Provider, model name, model parameters
Usage Metrics : Input tokens, output tokens, total cost
Performance : Latency, completion time
Content : Input messages, model responses (respects privacy settings)
Metadata : Custom fields, user ID, trace information
For Embedding Calls ​
Model Information : Provider, model name
Usage Metrics : Input tokens, total cost
Performance : Latency
Content : Input text (respects privacy settings)
For Errors ​
Error Details : Error type, error message, stack trace
Context : Model, provider, input that caused the error
Timing : When the error occurred, request duration
Environment Variables ​
Variable Required Description POSTHOG_API_KEY Yes Your PostHog project API key POSTHOG_API_URL No PostHog API URL (defaults to https://app.posthog.com )
Troubleshooting ​
1. Missing API Key ​
Error: POSTHOG_API_KEY is not set
Set your PostHog API key:
os . environ [ "POSTHOG_API_KEY" ] = "your-api-key"
2. Custom PostHog Instance ​
If you're using a self-hosted PostHog instance:
os . environ [ "POSTHOG_API_URL" ] = "https://your-posthog-instance.com"
3. Events Not Appearing ​
Check that your API key is correct
Verify network connectivity to PostHog
Events may take a few minutes to appear in PostHog dashboard
What is PostHog?
Usage with LiteLLM Proxy (LLM Gateway)
Team-Based Logging
Usage with LiteLLM Python SDK
Quick Start
Advanced
What's Logged to PostHog?
For Completion Calls
For Embedding Calls
For Errors
Environment Variables
Troubleshooting
1. Missing API Key
2. Custom PostHog Instance
3. Events Not Appearing
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
