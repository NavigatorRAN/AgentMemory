# Message Sanitization for Tool Calling for anthropic models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/message_sanitization
- Final URL: https://docs.litellm.ai/docs/completion/message_sanitization
- Canonical URL: https://docs.litellm.ai/docs/completion/message_sanitization
- Fetched at: 2026-06-23T14:23:15Z
- Content type: text/html; charset=utf-8

## Description

Automatically fix common message formatting issues when using tool calling with modify_params=True

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Automatically fix common message formatting issues when using tool calling with modify_params=True
LiteLLM can automatically sanitize messages to handle common issues that occur during tool calling workflows, especially when using OpenAI-compatible clients with providers that have strict message format requirements (like Anthropic Claude).
Overview ​
When litellm.modify_params = True is enabled, LiteLLM automatically sanitizes messages to fix three common issues:
Orphaned Tool Calls - Assistant messages with tool_calls but missing tool results
Orphaned Tool Results - Tool messages that reference non-existent tool_call_ids
Empty Message Content - Messages with empty or whitespace-only text content
This ensures your tool calling workflows work seamlessly across different LLM providers without manual message validation.
Why Message Sanitization? ​
Different LLM providers have varying requirements for message formats, especially during tool calling:
Anthropic Claude requires every tool_call to have a corresponding tool result
Some providers reject messages with empty content
OpenAI-compatible clients may not always maintain perfect message consistency
Without sanitization, these issues cause API errors that interrupt your workflows. With modify_params=True , LiteLLM handles these edge cases automatically.
Quick Start ​
SDK
PROXY
import litellm
# Enable automatic message sanitization
litellm . modify_params = True
# This will work even if messages have formatting issues
response = litellm . completion (
model = "anthropic/claude-3-5-sonnet-20241022" ,
messages = [
{ "role" : "user" , "content" : "What's the weather in Boston?" } ,
{
"role" : "assistant" ,
"tool_calls" : [
"id" : "call_123" ,
"type" : "function" ,
"function" : { "name" : "get_weather" , "arguments" : '{"city": "Boston"}' }
}
]
# Missing tool result - LiteLLM will add a dummy result automatically
} ,
{ "role" : "user" , "content" : "Thanks!" }
] ,
tools = [ {
"function" : {
"name" : "get_weather" ,
"description" : "Get weather for a city" ,
"parameters" : {
"type" : "object" ,
"properties" : { "city" : { "type" : "string" } } ,
"required" : [ "city" ]
} ]
)
litellm_settings :
modify_params : true # Enable automatic message sanitization
model_list :
- model_name : claude - 3 - 5 - sonnet
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet - 20241022
Sanitization Cases ​
Case A: Orphaned Tool Calls (Missing Tool Results) ​
Problem: An assistant message contains tool_calls , but no corresponding tool result messages follow.
Solution: LiteLLM automatically adds dummy tool result messages for any missing tool results.
Example:
# Messages with orphaned tool calls
{ "role" : "user" , "content" : "Search for Python tutorials" } ,
"id" : "call_abc123" ,
"function" : { "name" : "web_search" , "arguments" : '{"query": "Python tutorials"}' }
# Missing tool result here!
{ "role" : "user" , "content" : "What about JavaScript?" }
# LiteLLM automatically adds:
# {
# "role": "tool",
# "tool_call_id": "call_abc123",
# "content": "[System: Tool execution skipped/interrupted by user. No result provided for tool 'web_search'.]"
# }
messages = messages ,
tools = [ . . . ]
When this happens:
User interrupts tool execution
Client loses tool results due to network issues
Conversation flow changes before tool completes
Multi-turn conversations where tools are optional
Case B: Orphaned Tool Results (Invalid tool_call_id) ​
Problem: A tool message references a tool_call_id that doesn't exist in any previous assistant message.
Solution: LiteLLM automatically removes these orphaned tool result messages.
# Messages with orphaned tool result
{ "role" : "user" , "content" : "Hello" } ,
{ "role" : "assistant" , "content" : "Hi! How can I help?" } ,
"role" : "tool" ,
"tool_call_id" : "call_nonexistent" , # This tool_call_id doesn't exist!
"content" : "Some result"
# LiteLLM automatically removes the orphaned tool message
messages = messages
Message history is manually edited
Tool results are duplicated or mismatched
Conversation state is restored incorrectly
Messages are merged from different conversations
Case C: Empty Message Content ​
Problem: User or assistant messages have empty or whitespace-only content.
Solution: LiteLLM replaces empty content with a system placeholder message.
# Messages with empty content
{ "role" : "user" , "content" : "" } , # Empty content
{ "role" : "assistant" , "content" : " " } , # Whitespace only
# LiteLLM automatically replaces with:
# {"role": "user", "content": "[System: Empty message content sanitised to satisfy protocol]"}
# {"role": "assistant", "content": "[System: Empty message content sanitised to satisfy protocol]"}
UI sends empty messages
Content is stripped during preprocessing
Placeholder messages in conversation history
Edge cases in message construction
Configuration ​
Enable Globally ​
Environment Variable
# Enable for all completion calls
modify_params : true
export LITELLM_MODIFY_PARAMS=True
Enable Per-Request ​
# Enable only for specific requests
modify_params = True # Override global setting
Supported Providers ​
Message sanitization currently works with:
✅ Anthropic (Claude)
Note: While the sanitization logic is provider-agnostic, it is currently only applied in the Anthropic message transformation pipeline. Support for additional providers may be added in future releases.
Implementation Details ​
How It Works ​
The message sanitization process runs before messages are converted to provider-specific formats:
Input: OpenAI-format messages with potential issues
Sanitization: Three helper functions process the messages:
_sanitize_empty_text_content() - Fixes empty content
_add_missing_tool_results() - Adds dummy tool results
_is_orphaned_tool_result() - Identifies orphaned results
Output: Clean, provider-compatible messages
Code Reference ​
The sanitization logic is implemented in:
litellm/litellm_core_utils/prompt_templates/factory.py
Function: sanitize_messages_for_tool_calling()
Logging ​
When sanitization occurs, LiteLLM logs debug messages:
litellm . set_verbose = True # Enable debug logging
# You'll see logs like:
# "_add_missing_tool_results: Found 1 orphaned tool calls. Adding dummy tool results."
# "_is_orphaned_tool_result: Found orphaned tool result with tool_call_id=call_123"
# "_sanitize_empty_text_content: Replaced empty text content in user message"
Best Practices ​
1. Enable for Production Workflows ​
# Recommended for production
# Ensures robust handling of edge cases
tools = tools
2. Preserve Tool Results When Possible ​
While sanitization handles missing tool results, it's better to provide actual results:
# Good: Provide actual tool results
{ "role" : "user" , "content" : "Search for Python" } ,
{ "role" : "assistant" , "tool_calls" : [ . . . ] } ,
{ "role" : "tool" , "tool_call_id" : "call_123" , "content" : "Actual search results" }
# Fallback: Sanitization adds dummy result if missing
# Missing tool result - sanitization adds dummy
3. Monitor Sanitization Events ​
Use logging to track when sanitization occurs:
import logging
# Enable debug logging
litellm . set_verbose = True
logging . basicConfig ( level = logging . DEBUG )
# Track sanitization events in your application
4. Test Edge Cases ​
Ensure your application handles sanitized messages correctly:
# Test orphaned tool calls
test_messages = [
{ "role" : "user" , "content" : "Test" } ,
{ "role" : "assistant" , "tool_calls" : [ { "id" : "call_1" , "type" : "function" , "function" : { "name" : "test" , "arguments" : "{}" } } ] } ,
{ "role" : "user" , "content" : "Continue" } # No tool result
messages = test_messages ,
# Verify the response handles the dummy tool result appropriately
Related Features ​
Drop Params - Drop unsupported parameters for specific providers
Message Trimming - Trim messages to fit token limits
Function Calling - Complete guide to tool/function calling
Reasoning Content - Extended thinking with tool calling
Troubleshooting ​
Sanitization Not Working ​
Issue: Messages still cause errors despite modify_params=True
Solution:
Verify modify_params is enabled:
print ( litellm . modify_params ) # Should be True
Check if the issue is provider-specific:
Ensure you're using a recent version of LiteLLM:
uv add --upgrade-package litellm litellm
Unexpected Dummy Tool Results ​
Issue: Dummy tool results appear when you expect actual results
Cause: Tool result messages are missing or have incorrect tool_call_id
Verify tool result messages have correct tool_call_id :
# Correct
{ "role" : "tool" , "tool_call_id" : "call_123" , "content" : "result" }
# Incorrect - will be treated as orphaned
{ "role" : "tool" , "tool_call_id" : "wrong_id" , "content" : "result" }
Ensure tool results immediately follow assistant messages with tool_calls
Performance Impact ​
Issue: Concerned about performance overhead
Details: Message sanitization has minimal performance impact:
Runs in O(n) time where n = number of messages
Only processes messages when modify_params=True
Typically adds < 1ms to request processing time
FAQ ​
Q: Does sanitization modify my original messages?
A: No, sanitization creates a new list of messages. Your original messages remain unchanged.
Q: Can I disable specific sanitization cases?
A: Currently, all three cases are handled together when modify_params=True . To disable sanitization entirely, set modify_params=False .
Q: What happens to the dummy tool results?
A: Dummy tool results are sent to the LLM provider along with other messages. The model sees them as regular tool results with informative error messages.
Q: Does this work with streaming?
A: Yes, message sanitization works with both streaming and non-streaming requests.
Q: Is this related to drop_params ?
A: No, they're separate features:
modify_params - Modifies/fixes message content and structure
drop_params - Removes unsupported API parameters
Both can be enabled simultaneously.
See Also ​
Reasoning Content with Tool Calling
Function Calling Guide
Bedrock Provider Documentation
Anthropic Provider Documentation
Overview
Why Message Sanitization?
Quick Start
Sanitization Cases
Case A: Orphaned Tool Calls (Missing Tool Results)
Case B: Orphaned Tool Results (Invalid tool_call_id)
Case C: Empty Message Content
Configuration
Enable Globally
Enable Per-Request
Supported Providers
Implementation Details
How It Works
Code Reference
Logging
Best Practices
1. Enable for Production Workflows
2. Preserve Tool Results When Possible
3. Monitor Sanitization Events
4. Test Edge Cases
Related Features
Troubleshooting
Sanitization Not Working
Unexpected Dummy Tool Results
Performance Impact
FAQ
See Also
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
