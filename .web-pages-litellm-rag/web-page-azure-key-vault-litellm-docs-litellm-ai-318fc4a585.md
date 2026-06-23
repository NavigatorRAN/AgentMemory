# Azure Key Vault | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/secret_managers/azure_key_vault
- Final URL: https://docs.litellm.ai/docs/secret_managers/azure_key_vault
- Canonical URL: https://docs.litellm.ai/docs/secret_managers/azure_key_vault
- Fetched at: 2026-06-23T14:33:15Z
- Content type: text/html; charset=utf-8

## Description

✨ This is an Enterprise Feature

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
✨ This is an Enterprise Feature
Enterprise Pricing
Contact us here to get a free trial
Usage with LiteLLM Proxy Server ​
Install Proxy dependencies
uv tool install 'litellm[proxy]' 'litellm[extra_proxy]'
Save Azure details in your environment
export["AZURE_CLIENT_ID"]="your-azure-app-client-id"
export["AZURE_CLIENT_SECRET"]="your-azure-app-client-secret"
export["AZURE_TENANT_ID"]="your-azure-tenant-id"
export["AZURE_KEY_VAULT_URI"]="your-azure-key-vault-uri"
Add to proxy config.yaml
model_list :
- model_name : "my-azure-models" # model alias
litellm_params :
model : "azure/<your-deployment-name>"
api_key : "os.environ/AZURE-API-KEY" # reads from key vault - get_secret("AZURE_API_KEY")
api_base : "os.environ/AZURE-API-BASE" # reads from key vault - get_secret("AZURE_API_BASE")
general_settings :
key_management_system : "azure_key_vault"
You can now test this by starting your proxy:
litellm --config /path/to/config.yaml
Quick Test Proxy
Usage with LiteLLM Proxy Server
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
