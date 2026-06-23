# UI - Custom Root Path | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/custom_root_ui
- Final URL: https://docs.litellm.ai/docs/proxy/custom_root_ui
- Canonical URL: https://docs.litellm.ai/docs/proxy/custom_root_ui
- Fetched at: 2026-06-23T14:29:58Z
- Content type: text/html; charset=utf-8

## Description

💥 Use this when you want to serve LiteLLM on a custom base url path like https4000/api/v1

## Extracted Text

Skip to main content
On this page
Copy as Markdown
💥 Use this when you want to serve LiteLLM on a custom base url path like https://localhost:4000/api/v1
info
Requires v1.72.3 or higher.
Limitations:
This does not work in litellm non-root images, as it requires write access to the UI files.
Usage ​
1. Set SERVER_ROOT_PATH in your .env ​
👉 Set SERVER_ROOT_PATH in your .env and this will be set as your server root path
export SERVER_ROOT_PATH="/api/v1"
2. Run the Proxy ​
litellm proxy --config /path/to/config.yaml
After running the proxy you can access it on http://0.0.0.0:4000/api/v1/ (since we set SERVER_ROOT_PATH="/api/v1" )
3. Verify Running on correct path ​
That's it , that's all you need to run the proxy on a custom root path
Demo ​
Here's a demo video of running the proxy on a custom root path
Usage
1. Set SERVER_ROOT_PATH in your .env
2. Run the Proxy
3. Verify Running on correct path
Demo
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
