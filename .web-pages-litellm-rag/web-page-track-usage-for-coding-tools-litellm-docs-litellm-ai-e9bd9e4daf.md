# Track Usage for Coding Tools | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/cost_tracking_coding
- Final URL: https://docs.litellm.ai/docs/tutorials/cost_tracking_coding
- Canonical URL: https://docs.litellm.ai/docs/tutorials/cost_tracking_coding
- Fetched at: 2026-06-23T14:34:00Z
- Content type: text/html; charset=utf-8

## Description

Track usage and costs for AI-powered coding tools like Claude Code, Roo Code, Gemini CLI, and OpenAI Codex through LiteLLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Track usage and costs for AI-powered coding tools like Claude Code, Roo Code, Gemini CLI, and OpenAI Codex through LiteLLM.
Monitor requests, costs, and user engagement metrics for each coding tool using User-Agent headers.
Who This Is For ​
Central AI Platform teams providing developers access to coding tools through LiteLLM. Monitor tool engagement and track individual user usage patterns.
What You Can Track ​
Summary Metrics ​
Cost per coding tool
Successful requests and token usage per tool
User Engagement Metrics ​
Daily, weekly, and monthly active users for each User-Agent
Quick Start ​
1. Connect Your Coding Tool to LiteLLM ​
Configure your coding tool to send requests through the LiteLLM proxy with appropriate User-Agent headers.
Setup guides:
Use LiteLLM with Claude Code
Use LiteLLM with Gemini CLI
Use LiteLLM with OpenAI Codex
2. Send Requests with User-Agent Headers ​
Ensure your coding tool includes identifying User-Agent headers in API requests.
3. Verify Tracking in LiteLLM Logs ​
Confirm LiteLLM is properly tracking requests by checking logs for the expected User-Agent values.
4. View Usage Dashboard ​
Access the LiteLLM dashboard to view aggregated usage metrics and user engagement data.
View total cost and successful requests for each coding tool.
Daily, Weekly, and Monthly Active Users ​
View active user metrics for each coding tool.
How LiteLLM Identifies Coding Tools ​
LiteLLM tracks coding tools by monitoring the User-Agent header in incoming API requests ( /chat/completions , /responses , etc.). Each unique User-Agent is tracked separately for usage analytics.
Example Request ​
Example using claude-cli as the User-Agent:
curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-H "User-Agent: claude-cli/1.0" \
-d '{"model": "claude-3-5-sonnet-latest", "messages": [{"role": "user", "content": "Hello, how are you?"}]}' \
http://localhost:4000/chat/completions
Who This Is For
What You Can Track
Summary Metrics
User Engagement Metrics
Quick Start
1. Connect Your Coding Tool to LiteLLM
2. Send Requests with User-Agent Headers
3. Verify Tracking in LiteLLM Logs
4. View Usage Dashboard
How LiteLLM Identifies Coding Tools
Example Request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
