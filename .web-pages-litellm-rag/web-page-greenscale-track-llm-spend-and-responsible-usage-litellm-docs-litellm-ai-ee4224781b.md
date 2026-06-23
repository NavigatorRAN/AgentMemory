# Greenscale - Track LLM Spend and Responsible Usage | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/greenscale_integration
- Final URL: https://docs.litellm.ai/docs/observability/greenscale_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/greenscale_integration
- Fetched at: 2026-06-23T14:25:08Z
- Content type: text/html; charset=utf-8

## Description

This is community maintained, Please make an issue if you run into a bug

## Extracted Text

Skip to main content
On this page
Copy as Markdown
tip
This is community maintained, Please make an issue if you run into a bug
https://github.com/BerriAI/litellm
Greenscale is a production monitoring platform for your LLM-powered app that provides you granular key insights into your GenAI spending and responsible usage. Greenscale only captures metadata to minimize the exposure risk of personally identifiable information (PII).
Getting Started ​
Use Greenscale to log requests across all LLM Providers
liteLLM provides callbacks , making it easy for you to log data depending on the status of your responses.
Using Callbacks ​
First, email hello@greenscale.ai to get an API_KEY.
Use just 1 line of code, to instantly log your responses across all providers with Greenscale:
litellm . success_callback = [ "greenscale" ]
Complete code ​
from litellm import completion
## set env variables
os . environ [ 'GREENSCALE_API_KEY' ] = 'your-greenscale-api-key'
os . environ [ 'GREENSCALE_ENDPOINT' ] = 'greenscale-endpoint'
os . environ [ "OPENAI_API_KEY" ] = ""
# set callback
#openai call
response = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm openai" } ]
metadata = {
"greenscale_project" : "acme-project" ,
"greenscale_application" : "acme-application"
}
)
Additional information in metadata ​
You can send any additional information to Greenscale by using the metadata field in completion and greenscale_ prefix. This can be useful for sending metadata about the request, such as the project and application name, customer_id, environment, or any other information you want to track usage. greenscale_project and greenscale_application are required fields.
#openai call with additional metadata
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
] ,
"greenscale_application" : "acme-application" ,
"greenscale_customer_id" : "customer-123"
Support & Talk with Greenscale Team ​
Schedule Demo 👋
Website 💻
Our email ✉️ hello@greenscale.ai
Getting Started
Using Callbacks
Complete code
Additional information in metadata
Support & Talk with Greenscale Team
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
