# Google Secret Manager | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/secret_managers/google_secret_manager
- Final URL: https://docs.litellm.ai/docs/secret_managers/google_secret_manager
- Canonical URL: https://docs.litellm.ai/docs/secret_managers/google_secret_manager
- Fetched at: 2026-06-23T14:33:19Z
- Content type: text/html; charset=utf-8

## Description

✨ This is an Enterprise Feature

## Extracted Text

Skip to main content
Copy as Markdown
info
✨ This is an Enterprise Feature
Enterprise Pricing
Contact us here to get a free trial
Support for Google Secret Manager
Save Google Secret Manager details in your environment
GOOGLE_SECRET_MANAGER_PROJECT_ID="your-project-id-on-gcp" # example: adroit-crow-413218
Optional Params
export GOOGLE_SECRET_MANAGER_REFRESH_INTERVAL = "" # (int) defaults to 86400
export GOOGLE_SECRET_MANAGER_ALWAYS_READ_SECRET_MANAGER = "" # (str) set to "true" if you want to always read from google secret manager without using in memory caching. NOT RECOMMENDED in PROD
Add to proxy config.yaml
model_list :
- model_name : fake - openai - endpoint
litellm_params :
model : openai/fake
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
api_key : os.environ/OPENAI_API_KEY # this will be read from Google Secret Manager
general_settings :
key_management_system : "google_secret_manager"
You can now test this by starting your proxy:
litellm --config /path/to/config.yaml
Quick Test Proxy
