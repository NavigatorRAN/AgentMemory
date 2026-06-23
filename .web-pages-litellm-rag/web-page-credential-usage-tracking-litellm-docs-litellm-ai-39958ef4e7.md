# Credential Usage Tracking | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/credential_usage_tracking
- Final URL: https://docs.litellm.ai/docs/proxy/credential_usage_tracking
- Canonical URL: https://docs.litellm.ai/docs/proxy/credential_usage_tracking
- Fetched at: 2026-06-23T14:29:54Z
- Content type: text/html; charset=utf-8

## Description

When a model is attached to a reusable credential, LiteLLM automatically injects the credential name as a tag on every request that uses that model. This means credential-level spend and usage are tracked with zero extra configuration.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
When a model is attached to a reusable credential , LiteLLM automatically injects the credential name as a tag on every request that uses that model. This means credential-level spend and usage are tracked with zero extra configuration.
How It Works ​
When you attach a model to a reusable credential via litellm_credential_name , each request routed through that model is tagged Credential: <name> (for example, Credential: xAI ). This tag flows into DailyTagSpend and appears in the Tag view on the Usage page, where you can filter spend and usage by credential.
If a model has no credential attached, behavior is unchanged—no credential tag is added.
Viewing Credential Usage ​
In the Admin UI, go to Usage → Tag and look for tags with the Credential: prefix. These represent aggregated spend and token usage across all requests that used that credential.
Related Documentation ​
Adding LLM Credentials - How to create and attach reusable credentials to models
Tag Budgets - Setting spend limits on tags
Tag Routing - Routing requests based on tags
How It Works
Viewing Credential Usage
Related Documentation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
