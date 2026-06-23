# Google Cloud Storage Buckets | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/gcs_bucket_integration
- Final URL: https://docs.litellm.ai/docs/observability/gcs_bucket_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/gcs_bucket_integration
- Fetched at: 2026-06-23T14:25:06Z
- Content type: text/html; charset=utf-8

## Description

Log LLM Logs to Google Cloud Storage Buckets

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Log LLM Logs to Google Cloud Storage Buckets
info
✨ This is an Enterprise only feature Get Started with Enterprise here
Usage ​
Add gcs_bucket to LiteLLM Config.yaml
model_list :
- litellm_params :
api_base : https : //openai - function - calling - workers.tasslexyz.workers.dev/
api_key : my - fake - key
model : openai/my - fake - model
model_name : fake - openai - endpoint
litellm_settings :
callbacks : [ "gcs_bucket" ] # 👈 KEY CHANGE # 👈 KEY CHANGE
Set required env variables
GCS_BUCKET_NAME="<your-gcs-bucket-name>"
GCS_PATH_SERVICE_ACCOUNT="/Users/ishaanjaffer/Downloads/adroit-crow-413218-a956eef1a2a8.json" # Add path to service account.json
Start Proxy
litellm --config /path/to/config.yaml
Test it!
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data ' {
"model": "fake-openai-endpoint",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
],
'
Expected Logs on GCS Buckets ​
Fields Logged on GCS Buckets ​
The standard logging object is logged on GCS Bucket
Getting service_account.json from Google Cloud Console ​
Go to Google Cloud Console
Search for IAM & Admin
Click on Service Accounts
Select a Service Account
Click on 'Keys' -> Add Key -> Create New Key -> JSON
Save the JSON file and add the path to GCS_PATH_SERVICE_ACCOUNT
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Usage
Expected Logs on GCS Buckets
Fields Logged on GCS Buckets
Getting service_account.json from Google Cloud Console
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
