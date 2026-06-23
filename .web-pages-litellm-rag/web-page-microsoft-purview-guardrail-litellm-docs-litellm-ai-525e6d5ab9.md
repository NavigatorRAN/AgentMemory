# Microsoft Purview Guardrail | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/microsoft_purview
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/microsoft_purview
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/microsoft_purview
- Fetched at: 2026-06-23T14:30:40Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Microsoft Purview DLP policies via the Microsoft Graph processContent API.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Microsoft Purview DLP policies via the Microsoft Graph processContent API .
Supported modes ​
Mode What it does pre_call Evaluates the user prompt against DLP policies before the LLM call. Blocks if a restrictAccess/block policy action fires. post_call Evaluates the LLM response against DLP policies. Blocks if a restrictAccess/block policy action fires. logging_only Sends both prompt and response to Purview for audit. Never blocks the request.
Prerequisites ​
An Entra app registration with the following Microsoft Graph application permissions:
InformationProtectionPolicy.Read.All
ProtectionScopes.Compute.User
Content.Process.User
A DLP policy in Microsoft Purview targeting your app registration's client_id as a Protected App. Without an active policy, policyActions in the API response will always be empty.
Entra user object IDs — each request must carry the Entra object ID of the end-user (not a username or email). The guardrail skips the DLP check and logs a warning when no user ID can be resolved.
Quick Start ​
1. Register your app in Entra ​
# Create app registration and note the appId (client_id) and tenantId
az ad app create --display-name "LiteLLM-Purview"
az ad sp create --id <appId>
# Create a client secret
az ad app credential reset --id <appId> --append
Grant the permissions listed above in the Azure portal under App registrations → API permissions , then Grant admin consent .
2. Define the guardrail in config.yaml ​
pre_call
post_call
logging_only (audit)
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : purview - prompt - dlp
guardrail : microsoft_purview
mode : pre_call
api_key : os.environ/AZURE_CLIENT_SECRET # client_secret
tenant_id : os.environ/AZURE_TENANT_ID
client_id : os.environ/AZURE_CLIENT_ID
default_on : true
- guardrail_name : purview - response - dlp
mode : post_call
api_key : os.environ/AZURE_CLIENT_SECRET
- guardrail_name : purview - audit
mode : logging_only
3. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
4. Test request ​
Pass the Entra object ID of the end-user in metadata :
curl -X POST http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4o",
"messages": [{"role": "user", "content": "Hello, what is the capital of France?"}],
"metadata": {"user_id": "<entra-user-object-id>"}
}'
When a DLP policy blocks the request , LiteLLM returns:
{
"error" : {
"status_code" : 400 ,
"message" : {
"error" : "Microsoft Purview DLP: Content blocked by policy" ,
"activity" : "uploadText"
}
Supported Params ​
Param Type Required Description guardrail str Yes Must be "microsoft_purview" mode str Yes pre_call , post_call , or logging_only api_key str Yes Entra app client secret (can use os.environ/VAR ) tenant_id str Yes Entra tenant ID client_id str Yes Entra app registration client ID (also used as the Protected App identifier in Purview) default_on bool No Run this guardrail for every request. Default: false purview_app_name str No App name reported to Purview in processContent . Default: "LiteLLM" user_id_field str No Metadata field used only when no stronger identity exists (see User ID resolution). Default: "user_id"
User ID resolution ​
The Entra object ID used for Purview protectionScopes / processContent is resolved in trust order (strongest first) so a client cannot override the authenticated LiteLLM user by setting metadata[user_id_field] :
user_api_key_dict.user_id — user tied to the LiteLLM API key
user_api_key_dict.end_user_id — end-user on the key
metadata["user_api_key_user_id"] — value the proxy injects from the key (when present)
metadata[user_id_field] — caller-supplied (e.g. default metadata["user_id"] ); used only when none of the above are set
If none of these resolve to a value, the DLP check is skipped and a warning is logged.
The logging-only hook uses the same order via proxy metadata ( litellm_params.metadata ).
Enabling per request ​
When default_on: false , you can opt individual requests in or out:
"messages": [{"role": "user", "content": "Hello"}],
"guardrails": ["purview-prompt-dlp"],
How it works ​
Token acquisition — The guardrail uses the OAuth2 client credentials grant to get a Microsoft Graph bearer token. Tokens are cached until 60 seconds before expiry.
Protection scope computation — Before each DLP check, the guardrail calls protectionScopes/compute for the user to retrieve the ETag representing current policy state. Results are cached per user for 1 hour (per Microsoft's recommendation). If the processContent response indicates policies have changed ( protectionScopeState: modified ), the cache is invalidated.
Content evaluation — The guardrail calls processContent with the text and an activityMetadata.activity of uploadText (prompts) or downloadText (responses). Chat ( /v1/chat/completions ): pre-call concatenates string content from every message (all roles); post-call uses assistant message.content from every chat choice when n > 1 . Legacy text completions ( /v1/completions ): pre-call uses the prompt field (string or list of strings; token-id-only prompts are skipped); post-call uses text from every TextChoices entry.
Block decision — If any policyActions entry has @odata.type containing restrictAccessAction and restrictionAction: "block" , the guardrail raises an HTTP 400.
Audit logging — In all modes, guardrail results are recorded in metadata.standard_logging_guardrail_information and flow to configured observability backends (Langfuse, Datadog, OTEL, etc.).
Further Reading ​
Microsoft Graph processContent API
Microsoft Purview DLP overview
Control Guardrails per API Key
Supported modes
Prerequisites
Quick Start
1. Register your app in Entra
2. Define the guardrail in config.yaml
3. Start LiteLLM Gateway
4. Test request
Supported Params
User ID resolution
Enabling per request
How it works
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
