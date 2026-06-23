# Guardrail Load Balancing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrail_load_balancing
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrail_load_balancing
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrail_load_balancing
- Fetched at: 2026-06-23T14:30:30Z
- Content type: text/html; charset=utf-8

## Description

Load balance guardrail requests across multiple guardrail deployments. This is useful when you have rate limits on guardrail providers (e.g., AWS Bedrock Guardrails) and want to distribute requests across multiple accounts or regions.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Load balance guardrail requests across multiple guardrail deployments. This is useful when you have rate limits on guardrail providers (e.g., AWS Bedrock Guardrails) and want to distribute requests across multiple accounts or regions.
How It Works ​
When you define multiple guardrails with the same guardrail_name , LiteLLM automatically load balances requests across them using the router's load balancing strategy.
Why Use Guardrail Load Balancing? ​
Use Case Benefit AWS Bedrock Rate Limits Bedrock Guardrails have per-account rate limits. Distribute across multiple AWS accounts to increase throughput Multi-Region Redundancy Deploy guardrails across regions for failover and lower latency Cost Optimization Spread usage across accounts with different pricing tiers or credits A/B Testing Test different guardrail configurations with weighted distribution
Quick Start ​
1. Define Multiple Guardrails with Same Name ​
Define multiple guardrail entries with the same guardrail_name but different configurations:
Bedrock Guardrails
Custom Guardrails
Aporia Guardrails
config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/gpt - 4
api_key : os.environ/OPENAI_API_KEY
guardrails :
# First Bedrock guardrail - AWS Account 1
- guardrail_name : "content-filter"
guardrail : bedrock/guardrail
mode : "pre_call"
guardrailIdentifier : "abc123"
guardrailVersion : "1"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID_1
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY_1
aws_region_name : "us-east-1"
# Second Bedrock guardrail - AWS Account 2
guardrailIdentifier : "def456"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID_2
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY_2
aws_region_name : "us-west-2"
# First custom guardrail instance
- guardrail_name : "pii-filter"
guardrail : custom_guardrail.PIIFilterA
# Second custom guardrail instance
guardrail : custom_guardrail.PIIFilterB
# First Aporia instance
- guardrail_name : "toxicity-filter"
guardrail : aporia
api_key : os.environ/APORIA_API_KEY_1
api_base : os.environ/APORIA_API_BASE_1
# Second Aporia instance
api_key : os.environ/APORIA_API_KEY_2
api_base : os.environ/APORIA_API_BASE_2
2. Start LiteLLM Gateway ​
Start proxy
litellm --config config.yaml --detailed_debug
3. Make Requests ​
Requests using the guardrail will be automatically load balanced:
Test request
curl -X POST http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hello, how are you?"}],
"guardrails": ["content-filter"]
}'
Weighted Load Balancing ​
Assign weights to distribute traffic unevenly across guardrail instances:
config.yaml - Weighted distribution
# 80% of traffic
guardrailIdentifier : "primary-guard"
weight : 8 # Higher weight = more traffic
# 20% of traffic
guardrailIdentifier : "secondary-guard"
weight : 2 # Lower weight = less traffic
Bedrock Guardrails - Multi-Account Setup ​
AWS Bedrock Guardrails have rate limits per account. Here's how to set up load balancing across multiple AWS accounts:
Architecture ​
Configuration ​
config.yaml - Multi-account Bedrock
- model_name : claude - 3
model : bedrock/anthropic.claude - 3 - sonnet - 20240229 - v1 : 0
# AWS Account 1 - US East
- guardrail_name : "bedrock-content-filter"
mode : "during_call"
guardrailIdentifier : "guard-us-east"
guardrailVersion : "DRAFT"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_1
aws_secret_access_key : os.environ/AWS_SECRET_KEY_1
# AWS Account 2 - US West
guardrailIdentifier : "guard-us-west"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_2
aws_secret_access_key : os.environ/AWS_SECRET_KEY_2
# AWS Account 3 - EU West
guardrailIdentifier : "guard-eu-west"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_3
aws_secret_access_key : os.environ/AWS_SECRET_KEY_3
aws_region_name : "eu-west-1"
Test Multi-Account Setup ​
Run multiple requests to verify load balancing
# Run 10 requests - they will be distributed across accounts
for i in {1..10}; do
curl -s -X POST http://localhost:4000/v1/chat/completions \
"model": "claude-3",
"messages": [{"role": "user", "content": "Hello"}],
"guardrails": ["bedrock-content-filter"]
}' &
done
wait
Check proxy logs to verify requests are distributed across different AWS accounts.
Custom Guardrails Example ​
Create two custom guardrail classes for load balancing:
custom_guardrail.py
from litellm . integrations . custom_guardrail import CustomGuardrail
from litellm . proxy . _types import UserAPIKeyAuth
from litellm . caching . caching import DualCache
class PIIFilterA ( CustomGuardrail ) :
"""PII Filter Instance A"""
async def async_pre_call_hook (
self ,
user_api_key_dict : UserAPIKeyAuth ,
cache : DualCache ,
data : dict ,
call_type : str ,
) :
print ( "PIIFilterA processing request" )
# Your PII filtering logic here
return data
class PIIFilterB ( CustomGuardrail ) :
"""PII Filter Instance B"""
print ( "PIIFilterB processing request" )
Verifying Load Balancing ​
Enable detailed debug logging to verify load balancing is working:
Start with debug logging
You should see logs indicating which guardrail instance is selected:
Selected guardrail deployment: bedrock/guardrail (guard-us-east)
Selected guardrail deployment: bedrock/guardrail (guard-us-west)
Selected guardrail deployment: bedrock/guardrail (guard-eu-west)
...
Related ​
Guardrails Quick Start
Load Balancing for LLM Calls
How It Works
Why Use Guardrail Load Balancing?
Quick Start
1. Define Multiple Guardrails with Same Name
2. Start LiteLLM Gateway
3. Make Requests
Weighted Load Balancing
Bedrock Guardrails - Multi-Account Setup
Architecture
Configuration
Test Multi-Account Setup
Custom Guardrails Example
Verifying Load Balancing
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
