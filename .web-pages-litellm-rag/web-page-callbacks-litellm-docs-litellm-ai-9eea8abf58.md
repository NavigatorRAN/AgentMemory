# Callbacks | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/callbacks
- Final URL: https://docs.litellm.ai/docs/observability/callbacks
- Canonical URL: https://docs.litellm.ai/docs/observability/callbacks
- Fetched at: 2026-06-23T14:24:59Z
- Content type: text/html; charset=utf-8

## Description

Use Callbacks to send Output Data to Posthog, Sentry etc

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Callbacks to send Output Data to Posthog, Sentry etc ​
liteLLM provides input_callbacks , success_callbacks and failure_callbacks , making it easy for you to send data to a particular provider depending on the status of your responses.
tip
New to LiteLLM Callbacks?
For proxy/server logging and observability, see the Proxy Logging Guide .
To write your own callback logic, see the Custom Callbacks Guide .
Supported Callback Integrations ​
Lunary
Langfuse
LangSmith
Helicone
Traceloop
Athina
Sentry
PostHog
Slack
Arize
PromptLayer
This is not an extensive list. Please check the dropdown for all logging integrations.
Related Cookbooks ​
Try out our cookbooks for code snippets and interactive demos:
Langfuse Callback Example (Colab)
Lunary Callback Example (Colab)
Arize Callback Example (Colab)
Proxy + Langfuse Callback Example (Colab)
PromptLayer Callback Example (Colab)
Quick Start ​
from litellm import completion
# set callbacks
litellm . input_callback = [ "sentry" ] # for sentry breadcrumbing - logs the input being sent to the api
litellm . success_callback = [ "posthog" , "helicone" , "langfuse" , "lunary" , "athina" ]
litellm . failure_callback = [ "sentry" , "lunary" , "langfuse" ]
## set env variables
os . environ [ 'LUNARY_PUBLIC_KEY' ] = ""
os . environ [ 'SENTRY_DSN' ] , os . environ [ 'SENTRY_API_TRACE_RATE' ] = ""
os . environ [ 'POSTHOG_API_KEY' ] , os . environ [ 'POSTHOG_API_URL' ] = "api-key" , "api-url"
os . environ [ "HELICONE_API_KEY" ] = ""
os . environ [ "TRACELOOP_API_KEY" ] = ""
os . environ [ "LUNARY_PUBLIC_KEY" ] = ""
os . environ [ "ATHINA_API_KEY" ] = ""
os . environ [ "LANGFUSE_PUBLIC_KEY" ] = ""
os . environ [ "LANGFUSE_SECRET_KEY" ] = ""
os . environ [ "LANGFUSE_HOST" ] = ""
response = completion ( model = "gpt-3.5-turbo" , messages = messages )
Use Callbacks to send Output Data to Posthog, Sentry etc
Supported Callback Integrations
Related Cookbooks
Quick Start
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
