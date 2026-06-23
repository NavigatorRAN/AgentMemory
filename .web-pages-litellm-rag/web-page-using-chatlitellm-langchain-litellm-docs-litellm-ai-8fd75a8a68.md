# Using ChatLiteLLM() - Langchain | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/langchain
- Final URL: https://docs.litellm.ai/docs/langchain
- Canonical URL: https://docs.litellm.ai/docs/langchain/
- Fetched at: 2026-06-23T14:24:20Z
- Content type: text/html; charset=utf-8

## Description

Pre-Requisites

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pre-Requisites ​
!uv add litellm langchain
Quick Start ​
OpenAI
Anthropic
Replicate
Cohere
import os
from langchain_community . chat_models import ChatLiteLLM
from langchain_core . prompts import (
ChatPromptTemplate ,
SystemMessagePromptTemplate ,
AIMessagePromptTemplate ,
HumanMessagePromptTemplate ,
)
from langchain_core . messages import AIMessage , HumanMessage , SystemMessage
os . environ [ 'OPENAI_API_KEY' ] = ""
chat = ChatLiteLLM ( model = "gpt-3.5-turbo" )
messages = [
HumanMessage (
content = "what model are you"
]
chat . invoke ( messages )
os . environ [ 'ANTHROPIC_API_KEY' ] = ""
chat = ChatLiteLLM ( model = "claude-2" , temperature = 0.3 )
from langchain_core . prompts . chat import (
os . environ [ 'REPLICATE_API_TOKEN' ] = ""
chat = ChatLiteLLM ( model = "replicate/llama-2-70b-chat:2c1608e18606fad2812020dc541930f2d0495ce32eee50074220b87300bc16e1" )
content = "what model are you?"
os . environ [ 'COHERE_API_KEY' ] = ""
chat = ChatLiteLLM ( model = "command-nightly" )
Use Langchain ChatLiteLLM with MLflow ​
MLflow provides open-source observability solution for ChatLiteLLM.
To enable the integration, simply call mlflow.litellm.autolog() before in your code. No other setup is necessary.
import mlflow
mlflow . litellm . autolog ( )
Once the auto-tracing is enabled, you can invoke ChatLiteLLM and see recorded traces in MLflow.
from langchain . chat_models import ChatLiteLLM
os . environ [ 'OPENAI_API_KEY' ] = "sk-..."
chat = ChatLiteLLM ( model = "gpt-4o-mini" )
chat . invoke ( "Hi!" )
Use Langchain ChatLiteLLM with Lunary ​
from langchain . schema import HumanMessage
import litellm
os . environ [ "LUNARY_PUBLIC_KEY" ] = "" # from https://app.lunary.ai/settings
litellm . success_callback = [ "lunary" ]
litellm . failure_callback = [ "lunary" ]
chat = ChatLiteLLM (
model = "gpt-4o"
chat ( messages )
Get more details here
Use LangChain ChatLiteLLM + Langfuse ​
Checkout this section here for more details on how to integrate Langfuse with ChatLiteLLM.
Using Tags with LangChain and LiteLLM ​
Tags are a powerful feature in LiteLLM that allow you to categorize, filter, and track your LLM requests. When using LangChain with LiteLLM, you can pass tags through the extra_body parameter in the metadata.
Basic Tag Usage ​
LiteLLM Proxy
from langchain_openai import ChatOpenAI
from langchain_core . messages import HumanMessage , SystemMessage
os . environ [ 'OPENAI_API_KEY' ] = "sk-your-key-here"
chat = ChatOpenAI (
model = "gpt-4o" ,
temperature = 0.7 ,
extra_body = {
"metadata" : {
"tags" : [ "production" , "customer-support" , "high-priority" ]
}
SystemMessage ( content = "You are a helpful customer support assistant." ) ,
HumanMessage ( content = "How do I reset my password?" )
response = chat . invoke ( messages )
print ( response )
os . environ [ 'ANTHROPIC_API_KEY' ] = "sk-ant-your-key-here"
model = "claude-3-sonnet-20240229" ,
"tags" : [ "research" , "analysis" , "claude-model" ]
SystemMessage ( content = "You are a research analyst." ) ,
HumanMessage ( content = "Analyze this market trend..." )
# No API key needed when using proxy
openai_api_base = "http://localhost:4000" , # Your proxy URL
"tags" : [ "proxy" , "team-alpha" , "feature-flagged" ] ,
"generation_name" : "customer-onboarding" ,
"trace_user_id" : "user-12345"
SystemMessage ( content = "You are an onboarding assistant." ) ,
HumanMessage ( content = "Welcome our new customer!" )
Advanced Tag Patterns ​
Dynamic Tags Based on Context ​
def create_chat_with_tags ( user_type : str , feature : str ) :
"""Create a chat instance with dynamic tags based on context"""
# Build tags dynamically
tags = [ "langchain-integration" ]
if user_type == "premium" :
tags . extend ( [ "premium-user" , "high-priority" ] )
elif user_type == "enterprise" :
tags . extend ( [ "enterprise" , "custom-sla" ] )
else :
tags . append ( "standard-user" )
# Add feature-specific tags
if feature == "code-review" :
tags . extend ( [ "development" , "code-analysis" ] )
elif feature == "content-gen" :
tags . extend ( [ "marketing" , "content-creation" ] )
return ChatOpenAI (
openai_api_base = "http://localhost:4000" ,
"tags" : tags ,
"user_type" : user_type ,
"feature" : feature ,
"trace_user_id" : f"user- { user_type } - { feature } "
# Usage examples
premium_chat = create_chat_with_tags ( "premium" , "code-review" )
enterprise_chat = create_chat_with_tags ( "enterprise" , "content-gen" )
messages = [ HumanMessage ( content = "Help me with this task" ) ]
response = premium_chat . invoke ( messages )
Tags for Cost Tracking and Analytics ​
# Tags for cost tracking
cost_tracking_chat = ChatOpenAI (
"tags" : [
"cost-center-marketing" ,
"budget-q4-2024" ,
"project-launch-campaign" ,
"high-cost-model" # Flag for expensive models
] ,
"department" : "marketing" ,
"project_id" : "campaign-2024-q4" ,
"cost_threshold" : "high"
SystemMessage ( content = "You are a marketing copywriter." ) ,
HumanMessage ( content = "Create compelling ad copy for our new product launch." )
response = cost_tracking_chat . invoke ( messages )
Tags for A/B Testing ​
import random
def create_ab_test_chat ( test_variant : str = None ) :
"""Create chat instance for A/B testing with appropriate tags"""
if test_variant is None :
test_variant = random . choice ( [ "variant-a" , "variant-b" ] )
temperature = 0.7 if test_variant == "variant-a" else 0.9 , # Different temp for variants
"ab-test-experiment-1" ,
f"variant- { test_variant } " ,
"temperature-test" ,
"user-experience"
"experiment_id" : "ab-test-001" ,
"variant" : test_variant ,
"test_group" : "temperature-optimization"
# Run A/B test
variant_a_chat = create_ab_test_chat ( "variant-a" )
variant_b_chat = create_ab_test_chat ( "variant-b" )
test_message = [ HumanMessage ( content = "Explain quantum computing in simple terms" ) ]
response_a = variant_a_chat . invoke ( test_message )
response_b = variant_b_chat . invoke ( test_message )
Tag Best Practices ​
1. Consistent Naming Convention ​
# ✅ Good: Consistent, descriptive tags
tags = [ "production" , "api-v2" , "customer-support" , "urgent" ]
# ❌ Avoid: Inconsistent or unclear tags
tags = [ "prod" , "v2" , "support" , "urgent123" ]
2. Hierarchical Tags ​
# ✅ Good: Hierarchical structure
tags = [ "env:production" , "team:backend" , "service:api" , "priority:high" ]
# This allows for easy filtering and grouping
3. Include Context Information ​
"tags" : [ "production" , "user-onboarding" ] ,
"user_id" : "user-12345" ,
"session_id" : "session-abc123" ,
"feature_flag" : "new-onboarding-flow" ,
"environment" : "production"
4. Tag Categories ​
Consider organizing tags into categories:
Environment : production , staging , development
Team/Service : backend , frontend , api , worker
Feature : authentication , payment , notification
Priority : critical , high , medium , low
User Type : premium , enterprise , free
Using Tags with LiteLLM Proxy ​
When using tags with LiteLLM Proxy, you can:
Filter requests based on tags
Track costs by tags in spend reports
Apply routing rules based on tags
Monitor usage with tag-based analytics
Example Proxy Configuration with Tags ​
# config.yaml
model_list :
- model_name : gpt - 4o
litellm_params :
model : gpt - 4o
api_key : your - key
# Tag-based routing rules
tag_routing :
- tags : [ "premium" , "high-priority" ]
models : [ "gpt-4o" , "claude-3-opus" ]
- tags : [ "standard" ]
models : [ "gpt-3.5-turbo" , "claude-3-haiku" ]
Monitoring and Analytics ​
Tags enable powerful analytics capabilities:
# Example: Get spend reports by tags
import requests
response = requests . get (
"http://localhost:4000/global/spend/report" ,
headers = { "Authorization" : "Bearer sk-your-key" } ,
params = {
"start_date" : "2024-01-01" ,
"end_date" : "2024-12-31" ,
"group_by" : "tags"
spend_by_tags = response . json ( )
This documentation covers the essential patterns for using tags effectively with LangChain and LiteLLM, enabling better organization, tracking, and analytics of your LLM requests.
Pre-Requisites
Quick Start
Use Langchain ChatLiteLLM with MLflow
Use Langchain ChatLiteLLM with Lunary
Use LangChain ChatLiteLLM + Langfuse
Using Tags with LangChain and LiteLLM
Basic Tag Usage
Advanced Tag Patterns
Tag Best Practices
Using Tags with LiteLLM Proxy
Monitoring and Analytics
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
