# File Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/config_management
- Final URL: https://docs.litellm.ai/docs/proxy/config_management
- Canonical URL: https://docs.litellm.ai/docs/proxy/config_management
- Fetched at: 2026-06-23T14:29:49Z
- Content type: text/html; charset=utf-8

## Description

include external YAML files in a config.yaml

## Extracted Text

Skip to main content
On this page
Copy as Markdown
include external YAML files in a config.yaml ​
You can use include to include external YAML files in a config.yaml.
Quick Start Usage:
To include a config file, use include with either a single file or a list of files.
Contents of parent_config.yaml :
include :
- model_config.yaml # 👈 Key change, will include the contents of model_config.yaml
litellm_settings :
callbacks : [ "prometheus" ]
Contents of model_config.yaml :
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
- model_name : fake - anthropic - endpoint
model : anthropic/fake
api_base : https : //exampleanthropicendpoint - production.up.railway.app/
Start proxy server
This will start the proxy server with config parent_config.yaml . Since the include directive is used, the server will also include the contents of model_config.yaml .
litellm --config parent_config.yaml --detailed_debug
Examples using include ​
Include a single file:
- model_config.yaml
Include multiple files:
- another_config.yaml
include external YAML files in a config.yaml
Examples using include
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
