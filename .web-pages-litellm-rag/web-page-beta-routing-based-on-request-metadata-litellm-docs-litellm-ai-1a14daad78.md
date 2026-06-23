# [Beta] Routing based on request metadata | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/tag_management
- Final URL: https://docs.litellm.ai/docs/tutorials/tag_management
- Canonical URL: https://docs.litellm.ai/docs/tutorials/tag_management
- Fetched at: 2026-06-23T14:34:47Z
- Content type: text/html; charset=utf-8

## Description

Create routing rules based on request metadata.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Create routing rules based on request metadata.
Setup ​
Add the following to your litellm proxy config yaml file.
litellm proxy config.yaml
router_settings :
enable_tag_filtering : True # 👈 Key Change
1. Create a tag ​
On the LiteLLM UI, navigate to Experimental > Tag Management > Create Tag.
Create a tag called private-data and only select the allowed models for requests with this tag. Once created, you will see the tag in the Tag Management page.
2. Test Tag Routing ​
Now we will test the tag based routing rules.
2.1 Invalid model ​
This request will fail since we send tags=private-data but the model gpt-4o is not in the allowed models for the private-data tag.
Here is an example sending the same request using the OpenAI Python SDK.
OpenAI Python SDK
cURL
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:4000/v1/"
)
response = client . chat . completions . create (
model = "gpt-4o" ,
messages = [
{ "role" : "user" , "content" : "Hello, how are you?" }
] ,
extra_body = {
"tags" : "private-data"
}
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-4o",
"messages": [
{
"role": "user",
"content": "Hello, how are you?"
],
"tags": "private-data"
}'
2.2 Valid model ​
This request will succeed since we send tags=private-data and the model us.anthropic.claude-3-7-sonnet-20250219-v1:0 is in the allowed models for the private-data tag.
model = "us.anthropic.claude-3-7-sonnet-20250219-v1:0" ,
"model": "us.anthropic.claude-3-7-sonnet-20250219-v1:0",
Additional Tag Features ​
Sending tags in request headers
Tag based routing
Track spend per tag
Setup Budgets per Virtual Key, Team
Setup
1. Create a tag
2. Test Tag Routing
2.1 Invalid model
2.2 Valid model
Additional Tag Features
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
