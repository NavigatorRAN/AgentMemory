# Per-Team/Project Credential Routing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/credential_routing
- Final URL: https://docs.litellm.ai/docs/proxy/credential_routing
- Canonical URL: https://docs.litellm.ai/docs/proxy/credential_routing
- Fetched at: 2026-06-23T14:29:53Z
- Content type: text/html; charset=utf-8

## Description

Route the same model to different LLM provider endpoints (e.g. different Azure instances) based on which team or project makes the request.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Route the same model to different LLM provider endpoints (e.g. different Azure instances) based on which team or project makes the request.
Overview ​
In multi-tenant deployments, different teams often need the same model name (e.g., gpt-4 ) to hit different provider endpoints — for example, separate Azure OpenAI instances per business unit for cost isolation, data residency, or rate limit separation.
Credential routing lets you configure this in team/project metadata using the existing credentials table , without duplicating model definitions or creating separate model groups per team.
Hotel Team → gpt-4 → https://hotel-eastus.openai.azure.com/
Flight Team → gpt-4 → https://flight-centralus.openai.azure.com/
Precedence Chain ​
When a request comes in, the system walks this precedence chain (first match wins):
Clientside credentials — api_base / api_key passed in the request body ( docs )
Project model-specific — override for this exact model in the project's model_config
Project default — defaultconfig in the project's model_config
Team model-specific — override for this exact model in the team's model_config
Team default — defaultconfig in the team's model_config
Deployment default — the model's litellm_params as configured in config.yaml
Quick Start ​
Step 1: Create Credentials ​
Store your Azure endpoint credentials in the credentials table. You can do this via the UI or API:
# Create credential for Hotel team's Azure endpoint
curl -X POST 'http://0.0.0.0:4000/credentials' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"credential_name": "hotel-azure-eastus",
"credential_values": {
"api_base": "https://hotel-eastus.openai.azure.com/",
"api_key": "sk-azure-hotel-key-xxx"
}
}'
# Create credential for Flight team's Azure endpoint
"credential_name": "flight-azure-centralus",
"api_base": "https://flight-centralus.openai.azure.com/",
"api_key": "sk-azure-flight-key-xxx"
Step 2: Set model_config on Teams ​
Add a model_config key to the team's metadata referencing the credential by name:
# Hotel team — default Azure endpoint for all models
curl -X PATCH 'http://0.0.0.0:4000/team/update' \
"team_id": "hotel-team-id",
"metadata": {
"model_config": {
"defaultconfig": {
"azure": {
"litellm_credentials": "hotel-azure-eastus"
# Flight team — default Azure endpoint for all models
"team_id": "flight-team-id",
"litellm_credentials": "flight-azure-centralus"
Step 3: Make Requests ​
Requests are automatically routed to the correct Azure endpoint based on the API key's team:
# Request using Hotel team's API key → routes to hotel-eastus.openai.azure.com
curl http://localhost:4000/v1/chat/completions \
-H 'Authorization: Bearer sk-hotel-team-key' \
-d '{"model": "gpt-4", "messages": [{"role": "user", "content": "Hello"}]}'
# Request using Flight team's API key → routes to flight-centralus.openai.azure.com
-H 'Authorization: Bearer sk-flight-team-key' \
Per-Model Overrides ​
You can set different credentials for specific models while keeping a default for everything else:
},
"gpt-4": {
"litellm_credentials": "hotel-azure-westus"
With this config:
gpt-4 requests → hotel-azure-westus credential (model-specific)
All other models → hotel-azure-eastus credential (default)
Project-Level Overrides ​
Projects inherit their team's model_config but can override at the project level. Project overrides take precedence over team overrides.
# Project overrides the team default for all models
curl -X PATCH 'http://0.0.0.0:4000/project/update' \
"project_id": "hotel-rec-app-id",
"litellm_credentials": "hotel-rec-azure"
"gpt-4-vision": {
"litellm_credentials": "hotel-rec-vision"
Full Example: Hotel Team with Two Projects ​
Setup:
Hotel Team : default hotel-azure-eastus , GPT-4 override to hotel-azure-westus
Hotel Rec App (project): default hotel-rec-azure , GPT-4-Vision override to hotel-rec-vision
Hotel Review App (project): no overrides — inherits team config
Resolution:
Request Resolved Credential Why Hotel Rec App → gpt-4 hotel-rec-azure Project default (no project model-specific match for gpt-4) Hotel Rec App → gpt-4-vision hotel-rec-vision Project model-specific Hotel Review App → gpt-3.5 hotel-azure-eastus Team default (no project config) Hotel Review App → gpt-4 hotel-azure-westus Team model-specific
model_config Schema ​
The model_config key is a JSON object in team/project metadata :
{
"model_config" : {
"defaultconfig" : {
"<provider>" : {
"litellm_credentials" : "<credential-name>"
} ,
"<model-name>" : {
Field Description defaultconfig Fallback credential for any model not explicitly listed <model-name> Model-specific override — must match the LiteLLM model group name <provider> Provider key (e.g. azure , openai , bedrock ). When the model name includes a provider prefix (e.g. azure/gpt-4 ), the system prefers the matching provider key litellm_credentials Name of a credential in the credentials table
Credential Values ​
The referenced credential can contain any combination of:
Key Description api_base Provider endpoint URL api_key API key for the provider api_version API version (e.g. for Azure)
Only keys present in the credential are applied. Keys already in the request (e.g. clientside api_version ) are never overwritten.
Enabling the Feature ​
This feature is disabled by default and must be explicitly enabled. To enable it:
config.yaml
Environment Variable
litellm_settings :
enable_model_config_credential_overrides : true
export LITELLM_ENABLE_MODEL_CONFIG_CREDENTIAL_OVERRIDES=true
info
The feature flag must be enabled before model_config entries in team/project metadata take effect. Without it, credential routing is completely inert — no metadata is read, no credentials are resolved.
Related Documentation ​
Adding LLM Credentials — Create and manage reusable credentials
Project Management — Project hierarchy and API
Team Budgets — Team-level budget management
Clientside LLM Credentials — Passing credentials in the request body
Credential Usage Tracking — Track spend by credential
Overview
Precedence Chain
Quick Start
Step 1: Create Credentials
Step 2: Set model_config on Teams
Step 3: Make Requests
Per-Model Overrides
Project-Level Overrides
Full Example: Hotel Team with Two Projects
model_config Schema
Credential Values
Enabling the Feature
Related Documentation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
