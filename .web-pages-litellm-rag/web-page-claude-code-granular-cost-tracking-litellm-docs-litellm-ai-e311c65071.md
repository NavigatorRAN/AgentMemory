# Claude Code - Granular Cost Tracking | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/claude_code_customer_tracking
- Final URL: https://docs.litellm.ai/docs/tutorials/claude_code_customer_tracking
- Canonical URL: https://docs.litellm.ai/docs/tutorials/claude_code_customer_tracking
- Fetched at: 2026-06-23T14:33:48Z
- Content type: text/html; charset=utf-8

## Description

Track Claude Code usage by customer or tags using LiteLLM proxy. This enables granular cost attribution for billing, budgeting, and analytics.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Track Claude Code usage by customer or tags using LiteLLM proxy. This enables granular cost attribution for billing, budgeting, and analytics.
How It Works ​
Claude Code supports custom headers via ANTHROPIC_CUSTOM_HEADERS . LiteLLM automatically tracks requests with specific headers for cost attribution.
Tracking Options ​
Choose how you want to attribute costs:
Track By Header Use Case Customer x-litellm-customer-id Bill customers, per-user budgets Tags x-litellm-tags Project tracking, cost centers, environments
Environment Variables ​
Variable Description Example ANTHROPIC_BASE_URL LiteLLM proxy URL http://localhost:4000 ANTHROPIC_API_KEY LiteLLM API key sk-1234 ANTHROPIC_CUSTOM_HEADERS Custom headers ( header-name: value format) See examples below
Option 1: Track by Customer ​
Use this to attribute costs to specific customers or end-users.
export ANTHROPIC_BASE_URL=http://localhost:4000
export ANTHROPIC_API_KEY=sk-1234
export ANTHROPIC_CUSTOM_HEADERS="x-litellm-customer-id: claude-ishaan-local"
Option 2: Track by Tags ​
Use this to attribute costs to projects, cost centers, or environments. Pass comma-separated tags.
export ANTHROPIC_CUSTOM_HEADERS="x-litellm-tags: project:acme,env:prod,team:backend"
Quick Start ​
1. Set Environment Variables ​
2. Use Claude Code ​
claude
All requests will now be tracked under the customer ID claude-ishaan-local .
3. View Usage in LiteLLM UI ​
Navigate to the Logs tab in the LiteLLM UI.
Click on a request to see details.
Filter by customer ID to see all requests for that customer.
Supported Headers ​
Header Description x-litellm-customer-id Track by customer/end-user ID x-litellm-end-user-id Alternative customer ID header x-litellm-tags Comma-separated tags for cost attribution
Related ​
Claude Code Quickstart
Customer Budgets
Tag Budgets
Track Usage for Coding Tools
How It Works
Tracking Options
Environment Variables
Option 1: Track by Customer
Option 2: Track by Tags
Quick Start
1. Set Environment Variables
2. Use Claude Code
3. View Usage in LiteLLM UI
Supported Headers
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
