# Claude Code - Context Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/claude_code_context_management
- Final URL: https://docs.litellm.ai/docs/claude_code_context_management
- Canonical URL: https://docs.litellm.ai/docs/claude_code_context_management
- Fetched at: 2026-06-23T14:23:00Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Anthropic's context_management beta natively across all providers - not just Anthropic.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Anthropic's context_management beta natively across all providers - not just Anthropic.
When you send a request to /v1/messages (or via litellm.anthropic.messages.* ) with a context_management spec, LiteLLM handles it in one of two ways depending on where the request is routed:
Routing path How context_management is applied Anthropic API Passed through to the Anthropic server, which applies edits natively OpenAI Responses API (e.g. gpt-5.x-* ) Passed through; handled by the Responses API Any other provider (OpenAI, xAI, Gemini, Azure, Bedrock non-Anthropic, …) In-gateway polyfill - LiteLLM applies the edits to the message array before forwarding
The polyfill means you write your Claude Code tool-loop once, pass context_management as you normally would, and it works regardless of which model is behind the proxy.
Supported Edit Types ​
Edit type Status What it does clear_tool_uses_20250919 ✅ Supported Clears old tool_result content from conversation history when a trigger threshold is met, keeping only the most recent N tool results intact clear_thinking_20251015 ❌ Coming soon Clears extended-thinking blocks from history compact_20260112 ✅ Supported Summarisation edit - LiteLLM calls a configured summary model, injects the summary as a system prefix, and returns a compaction block in the response
How It Works ​
Claude Code client
│
│ POST /v1/messages { context_management: { edits: [...] } }
▼
┌─────────────────────────────────────────────────────────┐
│ LiteLLM Proxy │
│ │
│ 1. Detect routing target │
│ ┌──────────────────────┐ ┌────────────────────────┐ │
│ │ Anthropic / Bedrock │ │ Any other provider │ │
│ │ Anthropic / OpenAI │ │ (OpenAI, xAI, Gemini, │ │
│ │ Responses API │ │ Azure, …) │ │
│ │ │ │ │ │
│ │ Pass context_mgmt │ │ In-gateway polyfill: │ │
│ │ spec through as-is │ │ │ │
│ │ (server applies it) │ │ clear_tool_uses: │ │
│ └──────────┬───────────┘ │ • Count input tokens │ │
│ │ │ • Check trigger │ │
│ │ │ • Clear old results │ │
│ │ │ • Keep N most recent │ │
│ │ │ │ │
│ │ │ compact_20260112: │ │
│ │ │ • Slice at compaction │ │
│ │ │ block (if present) │ │
│ │ │ • Check token trigger │ │
│ │ │ • Call summary model │ │
│ │ │ • Inject summary as │ │
│ │ │ system prefix │ │
│ │ └──────────┬─────────────┘ │
│ │ │ │
│ └────────────┬─────────────┘ │
│ │ │
│ 2. Forward to provider │ │
│ (without context_ │ │
│ management key) │ │
└──────────────────────────┼──────────────────────────────┘
Upstream model
Response + usage
│ LiteLLM attaches applied_edits to response │
│ { context_management: { applied_edits: [...] } } │
│ (compact also prepends a compaction block to content) │
└─────────────────────────────────────────────────────────┘
Usage ​
Basic request ​
import litellm
response = await litellm . anthropic . messages . acreate (
model = "xai/grok-4" , # any provider
max_tokens = 1024 ,
messages = [ . . . ] , # your multi-turn tool history
tools = [ { "name" : "get_weather" , "description" : "..." , "input_schema" : { . . . } } ] ,
context_management = {
"edits" : [
{
"type" : "clear_tool_uses_20250919" ,
"trigger" : {
"type" : "input_tokens" ,
"value" : 80000 # activate when history exceeds 80k tokens
} ,
"keep" : {
"type" : "tool_uses" ,
"value" : 3 # keep the 3 most-recent tool results
}
]
)
You can also trigger on tool-use count instead of tokens:
"trigger" : { "type" : "tool_uses" , "value" : 10 } # activate after 10 tool calls
Via the proxy (curl) ​
curl -X POST http://localhost:4000/v1/messages \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "gpt-5.4-mini",
"max_tokens": 1024,
"messages": [...],
"tools": [...],
"context_management": {
"edits": [
"type": "clear_tool_uses_20250919",
"trigger": {"type": "input_tokens", "value": 80000},
"keep": {"type": "tool_uses", "value": 3}
}'
compact_20260112 - Conversation Compaction ​
The compact_20260112 edit type summarizes the conversation history when the input token count exceeds a threshold. LiteLLM's polyfill makes this work on any provider , not just Anthropic.
Setup - configure a summary model ​
The polyfill calls a separately-configured model to generate the summary. Add context_management_summary_model to general_settings in your proxy config:
# proxy_server_config.yaml
general_settings :
context_management_summary_model : claude - sonnet - 4 - 5 # any model alias in your model_list
Without this setting, the polyfill is a no-op and applied_edits[0].error: "summary_model_not_configured" is returned.
model = "gpt-5.4-mini" , # any non-Anthropic provider
messages = [ . . . ] , # multi-turn history
"type" : "compact_20260112" ,
"value" : 80000 # compact when history exceeds 80k tokens
"type": "compact_20260112",
"trigger": {"type": "input_tokens", "value": 80000}
How it works (3 phases) ​
Phase A — slice existing compaction block
If the message history already contains a compaction block (from a previous compaction round), everything before that block is dropped and its summary text is prepended to the system prompt. This ensures prior context is carried forward.
Phase B — threshold check
LiteLLM counts the effective input tokens of the (sliced) message history. If at or below the trigger threshold, the request is forwarded immediately — no summary call is made.
Phase C — summarize (only when over threshold)
LiteLLM calls the configured context_management_summary_model with the full conversation history and a summarization prompt. The summary is:
Injected as a "Previous conversation summary: ..." prefix in the system message on the downstream model call
Returned as a compaction content block prepended to the response content array, so the Claude Code client can maintain rolling compaction state
Custom summarization prompt ​
You can override the default summarization instructions via the instructions field:
"trigger" : { "type" : "input_tokens" , "value" : 80000 } ,
"instructions" : "Summarize the key decisions made and open questions. Wrap in <summary></summary> tags."
The summary text must be wrapped in <summary>...</summary> tags. If the model returns text without these tags, applied_edits[0].error: "summary_extraction_failed" is set and the original (uncompacted) conversation is forwarded.
compact_20260112 - Knobs ​
Field Required Default Description trigger.type No "input_tokens" Only "input_tokens" is supported; other values fall back with a warning trigger.value No 150000 Token threshold. Must be ≥ 50,000 or the request is rejected with a 400 instructions No Anthropic default prompt Custom summarization prompt; must instruct the model to wrap output in <summary> tags pause_after_compaction Accepted - Accepted in request but ignored (warning noted in applied_edits )
compact_20260112 - Response ​
When compaction fires, the response includes context_management.applied_edits and a compaction block prepended to content :
"id" : "msg_01XFDUDYJgAACzvnptvVoYEL" ,
"type" : "message" ,
"role" : "assistant" ,
"content" : [
"type" : "compaction" ,
"content" : "The user is building a Python CLI tool. We have implemented the argument parser and file reader. Next step is to add the output formatter."
{ "type" : "text" , "text" : "Sure, here's the output formatter..." }
] ,
"model" : "gpt-5.4-mini" ,
"stop_reason" : "end_turn" ,
"usage" : { "input_tokens" : 420 , "output_tokens" : 120 } ,
"context_management" : {
"applied_edits" : [
"summary_input_tokens" : 8400 ,
"summary_output_tokens" : 210
If the trigger was not met, context_management is absent and no compaction block is prepended.
Error handling ​
The polyfill is best-effort. If the summary call fails or returns no parseable summary, the original conversation is forwarded unchanged and applied_edits[0].error is set:
error value Cause "summary_model_not_configured" context_management_summary_model not set in general_settings "summary_call_failed" The summary model call raised an exception "summary_extraction_failed" Summary model response contained no <summary>...</summary> block
Client-side compaction blocks (no context_management edit) ​
If the request does not include a compact_20260112 edit but the message history already contains a compaction block (e.g. from a previous Claude Code client-side compaction), LiteLLM automatically applies slice-only forwarding: the prior summary is moved to the system prefix and only the latest user question is sent downstream. No summary model call is made.
clear_tool_uses_20250919 - Knobs ​
Field Required Default Description trigger.type No "input_tokens" "input_tokens" or "tool_uses" trigger.value No 100000 Threshold; edits fire when current value exceeds this keep.type No "tool_uses" Must be "tool_uses" keep.value No 3 Number of most-recent tool results to preserve clear_at_least Accepted - Accepted in request but ignored by polyfill (v0) exclude_tools Accepted - Accepted in request but ignored by polyfill (v0) clear_tool_inputs Accepted - Accepted in request but ignored by polyfill (v0)
Hard floor: regardless of keep , LiteLLM's polyfill never clears the most recently completed tool_result - the one the model is about to reply to.
Responses ​
Non-streaming ​
When at least one edit fires, the response includes a context_management field:
"content" : [ { "type" : "text" , "text" : "Based on the latest weather data..." } ] ,
"usage" : {
"input_tokens" : 620 ,
"output_tokens" : 45
"cleared_tool_uses" : 3 ,
"cleared_input_tokens" : 8240
If the trigger was not met (context is still small), context_management is absent from the response.
Streaming ​
The context_management.applied_edits field is included in the final message_delta SSE event:
event: message_start
data: {"type":"message_start","message":{"id":"msg_01...","type":"message","role":"assistant","content":[],"model":"gpt-5.4-mini","stop_reason":null,"usage":{"input_tokens":620,"output_tokens":0}}}
event: content_block_start
data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}
event: content_block_delta
data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Based on"}}
data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":" the latest weather data..."}}
event: content_block_stop
data: {"type":"content_block_stop","index":0}
event: message_delta
data: {
"type": "message_delta",
"delta": {"stop_reason": "end_turn", "stop_sequence": null},
"usage": {"output_tokens": 45},
"applied_edits": [
"cleared_tool_uses": 3,
"cleared_input_tokens": 8240
event: message_stop
data: {"type":"message_stop"}
Disabling Context Management ​
Per-request - omit the field ​
Simply don't include context_management in the request body.
Proxy-wide - drop_params: true ​
When drop_params: true is set in your proxy config (or passed as a litellm setting), LiteLLM will silently strip context_management from any request instead of running the polyfill:
litellm_settings :
drop_params : true
Or at call time:
litellm . drop_params = True
This is useful when you have a global drop_params policy to suppress unsupported parameters - context management is treated like any other unsupported parameter and dropped rather than polyfilled.
Provider Support Matrix ​
Provider clear_tool_uses_20250919 compact_20260112 anthropic/* Native pass-through Native pass-through bedrock/anthropic.* Native pass-through Native pass-through openai/* (Responses API) Native pass-through Native pass-through openai/* (chat completions) Polyfill Polyfill azure/* Polyfill Polyfill xai/* Polyfill Polyfill gemini/* Polyfill Polyfill vertex_ai/* Polyfill Polyfill All other providers Polyfill Polyfill
Notes ​
compact_20260112 requires context_management_summary_model to be set in general_settings . Without it, the edit is acknowledged but no compaction is performed.
Token counting for polyfill threshold checks uses litellm.token_counter (tiktoken cl100k_base fallback for unknown models).
clear_tool_uses_20250919 preserves the message array structure: same number of messages, same role order. Only tool_result.content inside matching messages is replaced with "[Cleared by context management]" .
compact_20260112 collapses the entire prior history to a single system-prefix summary + the last user question. The compaction block in the response gives the Claude Code client the summary text to carry forward into the next turn.
The 50,000-token minimum for compact_20260112 trigger is enforced at the proxy; requests with a lower value are rejected with HTTP 400.
Supported Edit Types
How It Works
Usage
Basic request
Via the proxy (curl)
compact_20260112 - Conversation Compaction
Setup - configure a summary model
How it works (3 phases)
Custom summarization prompt
compact_20260112 - Knobs
compact_20260112 - Response
Error handling
Client-side compaction blocks (no context_management edit)
clear_tool_uses_20250919 - Knobs
Responses
Non-streaming
Streaming
Disabling Context Management
Per-request - omit the field
Proxy-wide - drop_params: true
Provider Support Matrix
Notes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
