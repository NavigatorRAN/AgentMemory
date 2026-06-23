# DataRobot | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/datarobot
- Final URL: https://docs.litellm.ai/docs/providers/datarobot
- Canonical URL: https://docs.litellm.ai/docs/providers/datarobot
- Fetched at: 2026-06-23T14:27:36Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models from DataRobot. Select datarobot as the provider to route your request through the datarobot OpenAI-compatible endpoint using the upstream official OpenAI Python API library.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models from DataRobot . Select datarobot as the provider to route your request through the datarobot OpenAI-compatible endpoint using the upstream official OpenAI Python API library .
Usage ​
Environment variables ​
import os
from litellm import completion
os . environ [ "DATAROBOT_API_KEY" ] = ""
os . environ [ "DATAROBOT_API_BASE" ] = "" # [OPTIONAL] defaults to https://app.datarobot.com
response = completion (
model = "datarobot/openai/gpt-4o-mini" ,
messages = messages ,
)
### Completion
```python
import litellm
response = litellm . completion (
model = "datarobot/openai/gpt-4o-mini" , # add `datarobot/` prefix to model so litellm knows to route through DataRobot
messages = [
{
"role" : "user" ,
"content" : "Hey, how's it going?" ,
}
] ,
print ( response )
DataRobot completion models ​
🚨 LiteLLM supports all DataRobot LLM gateway models. To get a list for your installation and user account, send the following CURL command:
curl -X GET -H "Authorization: Bearer $DATAROBOT_API_TOKEN" "$DATAROBOT_ENDPOINT/genai/llmgw/catalog/" | jq | grep 'model":'DATAROBOT_ENDPOINT/genai/llmgw/catalog/
Usage
Environment variables
DataRobot completion models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
