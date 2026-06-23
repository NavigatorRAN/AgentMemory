# OpenAI - Response API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/openai/responses_api
- Final URL: https://docs.litellm.ai/docs/providers/openai/responses_api
- Canonical URL: https://docs.litellm.ai/docs/providers/openai/responses_api
- Fetched at: 2026-06-23T14:28:34Z
- Content type: text/html; charset=utf-8

## Description

Usage

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Usage ​
LiteLLM Python SDK ​
Non-streaming ​
OpenAI Non-streaming Response
import litellm
# Non-streaming response
response = litellm . responses (
model = "openai/o1-pro" ,
input = "Tell me a three sentence bedtime story about a unicorn." ,
max_output_tokens = 100
)
print ( response )
Streaming ​
OpenAI Streaming Response
# Streaming response
stream = True
for event in response :
print ( event )
Web Search ​
OpenAI Responses with Web Search
model = "openai/gpt-5" ,
input = "What is the capital of France?" ,
tools = [ {
"type" : "web_search_preview" ,
"search_context_size" : "medium" # Options: "low", "medium", "high"
} ]
For full details, see the Web Search guide .
Image Generation with Streaming ​
OpenAI Streaming Image Generation
import base64
# Streaming image generation with partial images
stream = litellm . responses (
model = "gpt-4.1" , # Use an actual image generation model
input = "Generate a gorgeous image of a river made of white owl feathers" ,
stream = True ,
tools = [ { "type" : "image_generation" , "partial_images" : 2 } ] ,
for event in stream :
if event . type == "response.image_generation_call.partial_image" :
idx = event . partial_image_index
image_base64 = event . partial_image_b64
image_bytes = base64 . b64decode ( image_base64 )
with open ( f"river { idx } .png" , "wb" ) as f :
f . write ( image_bytes )
GET a Response ​
Get Response by ID
# First, create a response
# Get the response ID
response_id = response . id
# Retrieve the response by ID
retrieved_response = litellm . get_responses (
response_id = response_id
print ( retrieved_response )
# For async usage
# retrieved_response = await litellm.aget_responses(response_id=response_id)
DELETE a Response ​
Delete Response by ID
# Delete the response by ID
delete_response = litellm . delete_responses (
print ( delete_response )
# delete_response = await litellm.adelete_responses(response_id=response_id)
LiteLLM Proxy with OpenAI SDK ​
Set up config.yaml
OpenAI Proxy Configuration
model_list :
- model_name : openai/o1 - pro
litellm_params :
model : openai/o1 - pro
api_key : os.environ/OPENAI_API_KEY
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Use OpenAI SDK with LiteLLM Proxy
OpenAI Proxy Non-streaming Response
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-api-key" # Your proxy API key
response = client . responses . create (
input = "Tell me a three sentence bedtime story about a unicorn."
OpenAI Proxy Streaming Response
OpenAI Proxy Streaming Image Generation
client = OpenAI ( api_key = "sk-1234" , base_url = "http://localhost:4000" )
stream = client . responses . create (
model = "gpt-4.1" ,
input = "Draw a gorgeous image of a river made of white owl feathers, snaking its way through a serene winter landscape" ,
print ( f"event: { event } " )
Get Response by ID with OpenAI SDK
retrieved_response = client . responses . retrieve ( response_id )
Delete Response by ID with OpenAI SDK
delete_response = client . responses . delete ( response_id )
Supported Responses API Parameters ​
Provider Supported Parameters openai All Responses API parameters are supported
Reusable Prompts ​
Use the prompt parameter to reference a stored prompt template and optionally supply variables.
Stored Prompt
prompt = {
"id" : "pmpt_abc123" ,
"version" : "2" ,
"variables" : {
"customer_name" : "Jane Doe" ,
"product" : "40oz juice box" ,
} ,
The same parameter is supported when calling the LiteLLM proxy with the OpenAI SDK:
Stored Prompt via Proxy
client = OpenAI ( base_url = "http://localhost:4000" , api_key = "your-api-key" )
Computer Use ​
LiteLLM Python SDK
LiteLLM Proxy
model = "computer-use-preview" ,
"type" : "computer_use_preview" ,
"display_width" : 1024 ,
"display_height" : 768 ,
"environment" : "browser" # other possible values: "mac", "windows", "ubuntu"
} ] ,
input = [
{
"role" : "user" ,
"content" : [
"type" : "text" ,
"text" : "Check the latest OpenAI news on bing.com."
}
# Optional: include a screenshot of the initial state of the environment
# {
# type: "input_image",
# image_url: f"data:image/png;base64,{screenshot_base64}"
# }
]
] ,
reasoning = {
"summary" : "concise" ,
truncation = "auto"
print ( response . output )
Test it!
MCP Tools ​
MCP Tools with LiteLLM SDK
from typing import Optional
# Configure MCP Tools
MCP_TOOLS = [
"type" : "mcp" ,
"server_label" : "deepwiki" ,
"server_url" : "https://mcp.deepwiki.com/mcp" ,
"allowed_tools" : [ "ask_question" ]
# Step 1: Make initial request - OpenAI will use MCP LIST and return MCP calls for approval
model = "openai/gpt-4.1" ,
tools = MCP_TOOLS ,
input = "What transport protocols does the 2025-03-26 version of the MCP spec support?"
# Get the MCP approval ID
mcp_approval_id = None
for output in response . output :
if output . type == "mcp_approval_request" :
mcp_approval_id = output . id
break
# Step 2: Send followup with approval for the MCP call
response_with_mcp_call = litellm . responses (
"type" : "mcp_approval_response" ,
"approve" : True ,
"approval_request_id" : mcp_approval_id
previous_response_id = response . id ,
print ( response_with_mcp_call )
- model_name : openai/gpt - 4.1
model : openai/gpt - 4.1
MCP Tools with OpenAI SDK via LiteLLM Proxy
response_with_mcp_call = client . responses . create (
Verbosity Parameter ​
The verbosity parameter is supported for the responses API.
Verbosity Parameter
from litellm import responses
question = "Write a poem about a boy and his first pet dog."
for verbosity in [ "low" , "medium" , "high" ] :
response = responses (
model = "gpt-5-mini" ,
input = question ,
text = { "verbosity" : verbosity }
import pandas as pd
from IPython . display import display
data = [ ]
# Extract text
output_text = ""
for item in response . output :
if hasattr ( item , "content" ) :
for content in item . content :
if hasattr ( content , "text" ) :
output_text += content . text
usage = response . usage
data . append ( {
"Verbosity" : verbosity ,
"Sample Output" : output_text ,
"Output Tokens" : usage . output_tokens
} )
# Create DataFrame
df = pd . DataFrame ( data )
# Display nicely with centered headers
pd . set_option ( 'display.max_colwidth' , None )
styled_df = df . style . set_table_styles (
[
{ 'selector' : 'th' , 'props' : [ ( 'text-align' , 'center' ) ] } , # Center column headers
{ 'selector' : 'td' , 'props' : [ ( 'text-align' , 'left' ) ] } # Left-align table cells
display ( styled_df )
Function Calling ​
Function Calling with Parallel Tool Calls
import json
tools = [
"type" : "function" ,
"name" : "get_weather" ,
"description" : "Get current weather for a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : { "type" : "string" }
"required" : [ "location" ]
# Step 1: Request with tools (parallel_tool_calls=True allows multiple calls)
model = "openai/gpt-4o" ,
input = [ { "role" : "user" , "content" : "What's the weather in Paris and Tokyo?" } ] ,
tools = tools ,
parallel_tool_calls = True , # Defaults = True
# Step 2: Execute tool calls and collect results
tool_results = [ ]
if output . type == "function_call" :
result = { "temperature" : 15 , "condition" : "sunny" } # Your function logic here
tool_results . append ( {
"type" : "function_call_output" ,
"call_id" : output . call_id ,
"output" : json . dumps ( result )
# Step 3: Send results back
final_response = litellm . responses (
input = tool_results ,
print ( final_response . output )
Set parallel_tool_calls=False to ensure zero or one tool is called per turn. More details .
Tool Search & Namespaces ​
Tool search lets models dynamically load tools at runtime instead of sending every tool definition in the prompt. Group functions into namespaces and mark them with defer_loading: true — the model only loads the schemas it actually needs, saving tokens.
Requires gpt-5.4 or later. See OpenAI Tool Search docs for full details.
Tool Search with Namespaces
# Define namespaces with deferred tools
{ "type" : "tool_search" } , # Enable tool search
"type" : "namespace" ,
"name" : "crm" ,
"description" : "CRM tools for customer management" ,
"tools" : [
"name" : "get_customer" ,
"description" : "Get customer details by ID" ,
"customer_id" : { "type" : "string" }
"required" : [ "customer_id" ] ,
"defer_loading" : True ,
"name" : "list_customers" ,
"description" : "List customers with optional filters" ,
"status" : { "type" : "string" , "enum" : [ "active" , "inactive" ] } ,
"name" : "billing" ,
"description" : "Billing and invoicing tools" ,
"name" : "get_invoice" ,
"description" : "Get an invoice by ID" ,
"invoice_id" : { "type" : "string" }
"required" : [ "invoice_id" ] ,
model = "openai/gpt-5.4" ,
input = "Look up invoice INV-2024-001 from the billing system" ,
# The response contains tool_search_call, tool_search_output, and function_call items
if isinstance ( item , dict ) :
if item [ "type" ] == "tool_search_call" :
print ( f"Searched namespaces: { item [ 'arguments' ] [ 'paths' ] } " )
elif item [ "type" ] == "tool_search_output" :
print ( f"Loaded { len ( item [ 'tools' ] ) } tool(s)" )
elif item [ "type" ] == "function_call" :
print ( f"Called: { item . get ( 'namespace' , '' ) } . { item [ 'name' ] } ( { item [ 'arguments' ] } )" )
else :
if item . type == "function_call" :
print ( f"Called: { item . namespace } . { item . name } ( { item . arguments } )" )
- model_name : openai/gpt - 5.4
model : openai/gpt - 5.4
Tool Search via OpenAI SDK with LiteLLM Proxy
base_url = "http://localhost:4000" ,
api_key = "your-api-key"
{ "type" : "tool_search" } ,
"properties" : { "invoice_id" : { "type" : "string" } } ,
Tool Search via Chat Completions Bridge ​
You can also use tool search through the /v1/chat/completions endpoint by prefixing the model with openai/responses/ . The request is routed through the Responses API but returns a standard chat completions response.
Tool Search via Chat Completions Bridge
response = litellm . completion (
model = "openai/responses/gpt-5.4" ,
messages = [ { "role" : "user" , "content" : "Look up invoice INV-2024-001" } ] ,
# Standard chat completions response
for tool_call in response . choices [ 0 ] . message . tool_calls :
print ( f"Called: { tool_call . function . name } ( { tool_call . function . arguments } )" )
Tool Search via /v1/chat/completions
curl http://localhost:4000/v1/chat/completions \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-H "Content-Type: application/json" \
-d '{
"model": "openai/responses/gpt-5.4",
"messages": [{"role": "user", "content": "Look up invoice INV-2024-001"}],
"tools": [
{"type": "tool_search"},
"type": "namespace",
"name": "billing",
"description": "Billing and invoicing tools",
"type": "function",
"name": "get_invoice",
"description": "Get an invoice by ID",
"parameters": {
"type": "object",
"properties": {"invoice_id": {"type": "string"}},
"required": ["invoice_id"]
},
"defer_loading": true
}'
Free-form Function Calling ​
Free-form Function Calling
input = "Please use the code_exec tool to calculate the area of a circle with radius equal to the number of 'r's in strawberry" ,
text = { "format" : { "type" : "text" } } ,
"type" : "custom" ,
"name" : "code_exec" ,
"description" : "Executes arbitrary python code" ,
Context-Free Grammar ​
Context-Free Grammar
import textwrap
# ----------------- grammars for MS SQL dialect -----------------
mssql_grammar = textwrap . dedent ( r"""
// ---------- Punctuation & operators ----------
SP: " "
COMMA: ","
GT: ">"
EQ: "="
SEMI: ";"
// ---------- Start ----------
start: "SELECT" SP "TOP" SP NUMBER SP select_list SP "FROM" SP table SP "WHERE" SP amount_filter SP "AND" SP date_filter SP "ORDER" SP "BY" SP sort_cols SEMI
// ---------- Projections ----------
select_list: column (COMMA SP column)*
column: IDENTIFIER
// ---------- Tables ----------
table: IDENTIFIER
// ---------- Filters ----------
amount_filter: "total_amount" SP GT SP NUMBER
date_filter: "order_date" SP GT SP DATE
// ---------- Sorting ----------
sort_cols: "order_date" SP "DESC"
// ---------- Terminals ----------
IDENTIFIER: /[A-Za-z_][A-Za-z0-9_]*/
NUMBER: /[0-9]+/
DATE: /'[0-9]{4}-[0-9]{2}-[0-9]{2}'/
""" )
sql_prompt_mssql = (
"Call the mssql_grammar to generate a query for Microsoft SQL Server that retrieve the "
"five most recent orders per customer, showing customer_id, order_id, order_date, and total_amount, "
"where total_amount > 500 and order_date is after '2025-01-01'. "
model = "gpt-5" ,
input = sql_prompt_mssql ,
"name" : "mssql_grammar" ,
"description" : "Executes read-only Microsoft SQL Server queries limited to SELECT statements with TOP and basic WHERE/ORDER BY. YOU MUST REASON HEAVILY ABOUT THE QUERY AND MAKE SURE IT OBEYS THE GRAMMAR." ,
"format" : {
"type" : "grammar" ,
"syntax" : "lark" ,
"definition" : mssql_grammar
parallel_tool_calls = False
print ( "--- MS SQL Query ---" )
print ( response_mssql . output [ 1 ] . input )
Minimal Reasoning ​
Minimal Reasoning
input = [ { 'role' : 'developer' , 'content' : prompt } ,
{ 'role' : 'user' , 'content' : 'The food that the restaurant was great! I recommend it to everyone.' } ] ,
"effort" : "minimal"
prompt = "Classify sentiment of the review as positive|neutral|negative. Return one word only."
# Extract model's text output
# Token usage details
print ( "--------------------------------" )
print ( "Output:" )
print ( output_text )
Usage
LiteLLM Proxy with OpenAI SDK
Supported Responses API Parameters
Reusable Prompts
Computer Use
MCP Tools
Function Calling
Tool Search & Namespaces
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
