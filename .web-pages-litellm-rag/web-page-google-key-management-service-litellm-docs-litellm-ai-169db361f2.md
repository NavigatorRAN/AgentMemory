# Google Key Management Service | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/secret_managers/google_kms
- Final URL: https://docs.litellm.ai/docs/secret_managers/google_kms
- Canonical URL: https://docs.litellm.ai/docs/secret_managers/google_kms
- Fetched at: 2026-06-23T14:33:18Z
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
Use encrypted keys from Google KMS on the proxy
Step 1. Add keys to env
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/credentials.json"
export GOOGLE_KMS_RESOURCE_NAME="projects/*/locations/*/keyRings/*/cryptoKeys/*"
export PROXY_DATABASE_URL_ENCRYPTED=b'\n$\x00D\xac\xb4/\x8e\xc...'
Step 2: Update Config
general_settings :
key_management_system : "google_kms"
database_url : "os.environ/PROXY_DATABASE_URL_ENCRYPTED"
master_key : sk - 1234
Step 3: Start + test proxy
$ litellm --config /path/to/config.yaml
And in another terminal
$ litellm --test
Quick Test Proxy
