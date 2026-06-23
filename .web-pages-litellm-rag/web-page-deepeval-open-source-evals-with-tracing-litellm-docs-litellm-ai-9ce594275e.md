# 🔭 DeepEval - Open-Source Evals with Tracing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/deepeval_integration
- Final URL: https://docs.litellm.ai/docs/observability/deepeval_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/deepeval_integration
- Fetched at: 2026-06-23T14:25:03Z
- Content type: text/html; charset=utf-8

## Description

What is DeepEval?

## Extracted Text

Skip to main content
On this page
Copy as Markdown
What is DeepEval? ​
DeepEval is an open-source evaluation framework for LLMs ( Github ).
What is Confident AI? ​
Confident AI (the deepeval platfrom) offers an Observatory for teams to trace and monitor LLM applications. Think Datadog for LLM apps. The observatory allows you to:
Detect and debug issues in your LLM applications in real-time
Search and analyze historical generation data with powerful filters
Collect human feedback on model responses
Run evaluations to measure and improve performance
Track costs and latency to optimize resource usage
Quickstart ​
import os
import time
import litellm
os . environ [ 'OPENAI_API_KEY' ] = '<your-openai-api-key>'
os . environ [ 'CONFIDENT_API_KEY' ] = '<your-confident-api-key>'
litellm . success_callback = [ "deepeval" ]
litellm . failure_callback = [ "deepeval" ]
try :
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "What's the weather like in San Francisco?" }
] ,
)
except Exception as e :
print ( e )
print ( response )
info
You can obtain your CONFIDENT_API_KEY by logging into Confident AI platform.
Support & Talk with Deepeval team ​
Confident AI Docs 📝
Platform 🚀
Community Discord 💭
Support ✉️ support@confident-ai.com
What is DeepEval?
What is Confident AI?
Quickstart
Support & Talk with Deepeval team
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
