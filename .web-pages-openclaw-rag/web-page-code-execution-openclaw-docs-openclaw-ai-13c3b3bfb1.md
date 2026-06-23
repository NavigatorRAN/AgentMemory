# Code execution - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/code-execution
- Final URL: https://docs.openclaw.ai/tools/code-execution
- Canonical URL: https://docs.openclaw.ai/tools/code-execution
- Fetched at: 2026-06-23T14:57:37Z
- Content type: text/html; charset=utf-8

## Description

code_execution: run sandboxed remote Python analysis with xAI

## Extracted Text

Close
Capabilities Tools
code_execution runs sandboxed remote Python analysis on xAI's Responses API. It is registered by the bundled xai plugin (under the tools contract) and dispatches to the same https://api.x.ai/v1/responses endpoint used by x_search .
Property Value Tool name code_execution Provider plugin xai (bundled, enabledByDefault: true ) Auth xAI auth profile, XAI_API_KEY , or plugins.entries.xai.config.webSearch.apiKey Default model grok-4-1-fast Default timeout 30 seconds Default maxTurns unset (xAI applies its own internal limit)
This is different from local exec :
exec runs shell commands on your machine or paired node.
code_execution runs Python in xAI's remote sandbox.
Use code_execution for:
Calculations.
Tabulation.
Quick statistics.
Chart-style analysis.
Analyzing data returned by x_search or web_search .
Do not use it when you need local files, your shell, your repo, or paired devices. Use exec for that.
Setup
Provide xAI credentials
Sign in with Grok OAuth using an eligible SuperGrok or X Premium subscription,
use the remote-friendly device-code flow, or store an API key. OAuth works
for code_execution and x_search ; XAI_API_KEY or plugin web-search
config can also power Grok web_search .
bash Copy code openclaw models auth login --provider xai --method oauth openclaw models auth login --provider xai --device-code
During a fresh install, the same auth choices are available inside
onboarding:
bash Copy code openclaw onboard --install-daemon openclaw onboard --install-daemon --auth-choice xai-device-code
Or use an API key:
bash Copy code openclaw models auth login --provider xai --method api-key export XAI_API_KEY=xai-...
Or via config:
json5 Copy code { plugins : { entries : { xai : { config : { webSearch : { apiKey : "xai-..." , }, }, }, }, }, }
Enable and tune code_execution
code_execution is available when xAI credentials are available. Set
plugins.entries.xai.config.codeExecution.enabled to false to disable it,
or use the same block to tune the model and timeout.
json5 Copy code { plugins : { entries : { xai : { config : { codeExecution : { enabled : true , model : "grok-4-1-fast" , // override the default xAI code-execution model maxTurns : 2 , // optional cap on internal tool turns timeoutSeconds : 30 , // request timeout (default: 30) }, }, }, }, }, }
Restart the Gateway
bash Copy code openclaw gateway restart
code_execution shows up in the agent's tool list once the xAI plugin re-registers with enabled: true .
How to use it
Ask naturally and make the analysis intent explicit:
text Copy code Use code_execution to calculate the 7-day moving average for these numbers: ... text Copy code Use x_search to find posts mentioning OpenClaw this week, then use code_execution to count them by day. text Copy code Use web_search to gather the latest AI benchmark numbers, then use code_execution to compare percent changes.
The tool takes a single task parameter internally, so the agent should send the full analysis request and any inline data in one prompt.
Errors
When the tool runs without auth, it returns a structured missing_xai_api_key error pointing at the auth-profile, env var, and config options. The error is JSON, not a thrown exception, so the agent can self-correct:
json Copy code { "error" : "missing_xai_api_key" , "message" : "code_execution needs xAI credentials. Run `openclaw onboard --auth-choice xai-oauth` to sign in with Grok, run `openclaw onboard --auth-choice xai-api-key`, set `XAI_API_KEY` in the Gateway environment, or configure `plugins.entries.xai.config.webSearch.apiKey`." , "docs" : "https://docs.openclaw.ai/tools/code-execution" }
Limits
This is remote xAI execution, not local process execution.
Treat results as ephemeral analysis, not a persistent notebook session.
Do not assume access to local files or your workspace.
For fresh X data, use x_search first and pipe the result into code_execution .
Related
Exec tool
Local shell execution on your machine or paired node.
Exec approvals
Allow/deny policy for shell execution.
Web tools
web_search , x_search , and web_fetch .
xAI provider
Grok models, web/x search, and code execution config.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
