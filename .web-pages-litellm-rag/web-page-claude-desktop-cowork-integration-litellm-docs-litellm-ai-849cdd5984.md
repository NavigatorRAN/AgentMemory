# Claude Desktop (Cowork) Integration | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/claude_desktop_cowork
- Final URL: https://docs.litellm.ai/docs/tutorials/claude_desktop_cowork
- Canonical URL: https://docs.litellm.ai/docs/tutorials/claude_desktop_cowork
- Fetched at: 2026-06-23T14:33:54Z
- Content type: text/html; charset=utf-8

## Description

Route Claude Desktop requests through LiteLLM Proxy to get unified logging, budget controls, and access to any model.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Route Claude Desktop requests through LiteLLM Proxy to get unified logging, budget controls, and access to any model.
Quick Reference ​
Setting Value Gateway URL <LITELLM_PROXY_BASE_URL> API Key Your LiteLLM Virtual Key
Step 1: Enable Developer Mode ​
In Claude Desktop, go to Help → Claude → Help and click Enable Developer Mode .
Step 2: Open Configure Third-Party Inference ​
Click the menu bar icon to open the Claude menu.
Click Developer .
Click Configure Third-Party Inference…
Step 3: Enter Your LiteLLM Gateway URL and API Key ​
The inference settings dialog opens. Enter your LiteLLM Proxy URL in the Gateway URL field.
https://your-litellm-proxy.com
Next, get your virtual API key from the LiteLLM Dashboard. Go to Virtual Keys → + Create New Key , copy the key, then paste it into the API Key field.
Save the settings.
Step 4: Verify Your Setup ​
Restart Claude Desktop. Open a new conversation and send a message. All requests now route through your LiteLLM Proxy.
You can verify traffic is flowing by checking the LiteLLM Dashboard under Usage — you should see requests attributed to your virtual key.
Related ​
LiteLLM Virtual Keys
Cursor Integration
Claude Code Integration
Quick Reference
Step 1: Enable Developer Mode
Step 2: Open Configure Third-Party Inference
Step 3: Enter Your LiteLLM Gateway URL and API Key
Step 4: Verify Your Setup
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
