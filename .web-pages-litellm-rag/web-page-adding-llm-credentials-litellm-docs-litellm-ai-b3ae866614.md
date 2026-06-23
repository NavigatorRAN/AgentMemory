# Adding LLM Credentials | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/ui_credentials
- Final URL: https://docs.litellm.ai/docs/proxy/ui_credentials
- Canonical URL: https://docs.litellm.ai/docs/proxy/ui_credentials
- Fetched at: 2026-06-23T14:32:22Z
- Content type: text/html; charset=utf-8

## Description

You can add LLM provider credentials on the UI. Once you add credentials you can reuse them when adding new models

## Extracted Text

Skip to main content
On this page
Copy as Markdown
You can add LLM provider credentials on the UI. Once you add credentials you can reuse them when adding new models
Add a credential + model ​
1. Navigate to LLM Credentials page ​
Go to Models -> LLM Credentials -> Add Credential
2. Add credentials ​
Select your LLM provider, enter your API Key and click "Add Credential"
Note: Credentials are based on the provider, if you select Vertex AI then you will see Vertex Project , Vertex Location and Vertex Credentials fields
3. Use credentials when adding a model ​
Go to Add Model -> Existing Credentials -> Select your credential in the dropdown
Create a Credential from an existing model ​
Use this if you have already created a model and want to store the model credentials for future use
1. Select model to create a credential from ​
Go to Models -> Select your model -> Credential -> Create Credential
2. Use new credential when adding a model ​
Usage Tracking ​
Models attached to a reusable credential are automatically tracked in the Usage page. Each request is tagged Credential: <name> and appears in the Tag view, so you can filter spend and usage by credential without any extra configuration. See Credential Usage Tracking for details.
Frequently Asked Questions ​
How are credentials stored?
Credentials in the DB are encrypted/decrypted using LITELLM_SALT_KEY , if set. If not, then they are encrypted using LITELLM_MASTER_KEY . These keys should be kept secret and not shared with others.
Add a credential + model
1. Navigate to LLM Credentials page
2. Add credentials
3. Use credentials when adding a model
Create a Credential from an existing model
1. Select model to create a credential from
2. Use new credential when adding a model
Usage Tracking
Frequently Asked Questions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
