# LLM task - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/llm-task
- Final URL: https://docs.openclaw.ai/tools/llm-task
- Canonical URL: https://docs.openclaw.ai/tools/llm-task
- Fetched at: 2026-06-23T14:57:55Z
- Content type: text/html; charset=utf-8

## Description

JSON-only LLM tasks for workflows (optional plugin tool)

## Extracted Text

Close
Capabilities Tools
llm-task is an optional plugin tool that runs a JSON-only LLM task and
returns structured output (optionally validated against JSON Schema).
This is ideal for workflow engines like Lobster: you can add a single LLM step
without writing custom OpenClaw code for each workflow.
Enable the plugin
Enable the plugin:
json Copy code { "plugins" : { "entries" : { "llm-task" : { "enabled" : true } } } }
Allow the optional tool:
json Copy code { "tools" : { "alsoAllow" : [ "llm-task" ] } }
Use tools.allow only when you want restrictive allowlist mode.
Config (optional)
json Copy code { "plugins" : { "entries" : { "llm-task" : { "enabled" : true , "config" : { "defaultProvider" : "openai" , "defaultModel" : "gpt-5.5" , "defaultAuthProfileId" : "main" , "allowedModels" : [ "openai/gpt-5.5" ] , "maxTokens" : 800 , "timeoutMs" : 30000 } } } } }
allowedModels is an allowlist of provider/model strings. If set, any request
outside the list is rejected.
Tool parameters
prompt (string, required)
input (any, optional)
schema (object, optional JSON Schema)
provider (string, optional)
model (string, optional)
thinking (string, optional)
authProfileId (string, optional)
temperature (number, optional)
maxTokens (number, optional)
timeoutMs (number, optional)
thinking accepts the standard OpenClaw reasoning presets, such as low or medium .
Output
Returns details.json containing the parsed JSON (and validates against
schema when provided).
Example: Lobster workflow step
Important limitation
The example below assumes the standalone Lobster CLI is running in an environment where openclaw.invoke already has the correct gateway URL/auth context.
For the bundled embedded Lobster runner inside OpenClaw, this nested CLI pattern is not currently reliable :
lobster Copy code openclaw.invoke --tool llm-task --action json --args-json '{ ... }'
Until embedded Lobster has a supported bridge for this flow, prefer either:
direct llm-task tool calls outside Lobster, or
Lobster steps that do not rely on nested openclaw.invoke calls.
Standalone Lobster CLI example:
lobster Copy code openclaw.invoke --tool llm-task --action json --args-json '{ "prompt": "Given the input email, return intent and draft.", "thinking": "low", "input": { "subject": "Hello", "body": "Can you help?" }, "schema": { "type": "object", "properties": { "intent": { "type": "string" }, "draft": { "type": "string" } }, "required": ["intent", "draft"], "additionalProperties": false } }'
Safety notes
The tool is JSON-only and instructs the model to output only JSON (no
code fences, no commentary).
No tools are exposed to the model for this run.
Treat output as untrusted unless you validate with schema .
Put approvals before any side-effecting step (send, post, exec).
Related
Thinking levels
Sub-agents
Slash commands
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
