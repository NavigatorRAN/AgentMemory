# Azure Passthrough | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/azure_passthrough
- Final URL: https://docs.litellm.ai/docs/pass_through/azure_passthrough
- Canonical URL: https://docs.litellm.ai/docs/pass_through/azure_passthrough
- Fetched at: 2026-06-23T14:25:48Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for /azure

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for /azure
Overview ​
Feature Supported Notes Cost Tracking ❌ Not supported Logging ✅ Works across all integrations Streaming ✅ Fully supported
When to use this? ​
For most use cases, you should use the native LiteLLM Azure OpenAI Integration ( /chat/completions , /embeddings , /completions , /images , etc.)
Use this passthrough to call newer or less common Azure OpenAI endpoints that LiteLLM doesn't fully support yet, such as /assistants , /threads , /vector_stores
Simply replace your Azure endpoint (e.g. https://<your-resource-name>.openai.azure.com ) with LITELLM_PROXY_BASE_URL/azure
Usage Examples ​
Assistants API ​
Create Azure OpenAI Client ​
Make sure you do the following:
Point azure_endpoint to your LITELLM_PROXY_BASE_URL/azure
Use your LITELLM_API_KEY as the api_key
import openai
client = openai . AzureOpenAI (
azure_endpoint = "http://0.0.0.0:4000/azure" , # <your-proxy-url>/azure
api_key = "sk-anything" , # <your-proxy-api-key>
api_version = "2024-05-01-preview" # required Azure API version
)
Create an Assistant ​
assistant = client . beta . assistants . create (
name = "Math Tutor" ,
instructions = "You are a math tutor. Help solve equations." ,
model = "gpt-4o" ,
Create a Thread ​
thread = client . beta . threads . create ( )
Add a Message to the Thread ​
message = client . beta . threads . messages . create (
thread_id = thread . id ,
role = "user" ,
content = "Solve 3x + 11 = 14" ,
Run the Assistant ​
run = client . beta . threads . runs . create (
assistant_id = assistant . id ,
# Check run status
run_status = client . beta . threads . runs . retrieve (
run_id = run . id
Retrieve Messages ​
messages = client . beta . threads . messages . list (
thread_id = thread . id
Delete the Assistant ​
client . beta . assistants . delete ( assistant . id )
Overview
When to use this?
Usage Examples
Assistants API
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
