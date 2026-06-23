# AWS Bedrock | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/guides/aws-bedrock
- Final URL: https://hermes-agent.nousresearch.com/docs/guides/aws-bedrock
- Canonical URL: https://hermes-agent.nousresearch.com/docs/guides/aws-bedrock
- Fetched at: 2026-06-23T14:14:54Z
- Content type: text/html; charset=utf-8

## Description

Use Hermes Agent with Amazon Bedrock — native Converse API, IAM authentication, Guardrails, and cross-region inference

## Extracted Text

Skip to main content
On this page
Hermes Agent supports Amazon Bedrock as a native provider using the Converse API — not the OpenAI-compatible endpoint. This gives you full access to the Bedrock ecosystem: IAM authentication, Guardrails, cross-region inference profiles, and all foundation models.
Prerequisites ​
AWS credentials — any source supported by the boto3 credential chain :
IAM instance role (EC2, ECS, Lambda — zero config)
AWS_ACCESS_KEY_ID + AWS_SECRET_ACCESS_KEY environment variables
AWS_PROFILE for SSO or named profiles
aws configure for local development
boto3 — install with pip install hermes-agent[bedrock]
IAM permissions — at minimum:
bedrock:InvokeModel and bedrock:InvokeModelWithResponseStream (for inference)
bedrock:ListFoundationModels and bedrock:ListInferenceProfiles (for model discovery)
EC2 / ECS / Lambda
On AWS compute, attach an IAM role with AmazonBedrockFullAccess and you're done. No API keys, no .env configuration — Hermes detects the instance role automatically.
Quick Start ​
# Install with Bedrock support
pip install hermes-agent [ bedrock ]
# Select Bedrock as your provider
hermes model
# → Choose "More providers..." → "AWS Bedrock"
# → Select your region and model
# Start chatting
hermes chat
Configuration ​
After running hermes model , your ~/.hermes/config.yaml will contain:
model :
default : us.anthropic.claude - sonnet - 4 - 6
provider : bedrock
base_url : https : //bedrock - runtime.us - east - 2.amazonaws.com
bedrock :
region : us - east - 2
Region ​
Set the AWS region in any of these ways (highest priority first):
bedrock.region in config.yaml
AWS_REGION environment variable
AWS_DEFAULT_REGION environment variable
Default: us-east-1
Guardrails ​
To apply Amazon Bedrock Guardrails to all model invocations:
guardrail :
guardrail_identifier : "abc123def456" # From the Bedrock console
guardrail_version : "1" # Version number or "DRAFT"
stream_processing_mode : "async" # "sync" or "async"
trace : "disabled" # "enabled", "disabled", or "enabled_full"
Model Discovery ​
Hermes auto-discovers available models via the Bedrock control plane. You can customize discovery:
discovery :
enabled : true
provider_filter : [ "anthropic" , "amazon" ] # Only show these providers
refresh_interval : 3600 # Cache for 1 hour
Available Models ​
Bedrock models use inference profile IDs for on-demand invocation. The hermes model picker shows these automatically, with recommended models at the top:
Model ID Notes Claude Sonnet 4.6 us.anthropic.claude-sonnet-4-6 Recommended — best balance of speed and capability Claude Opus 4.6 us.anthropic.claude-opus-4-6-v1 Most capable Claude Haiku 4.5 us.anthropic.claude-haiku-4-5-20251001-v1:0 Fastest Claude Amazon Nova Pro us.amazon.nova-pro-v1:0 Amazon's flagship Amazon Nova Micro us.amazon.nova-micro-v1:0 Fastest, cheapest DeepSeek V3.2 deepseek.v3.2 Strong open model Llama 4 Scout 17B us.meta.llama4-scout-17b-instruct-v1:0 Meta's latest
Cross-Region Inference
Models prefixed with us. use cross-region inference profiles, which provide better capacity and automatic failover across AWS regions. Models prefixed with global. route across all available regions worldwide.
Switching Models Mid-Session ​
Use the /model command during a conversation:
/model us.amazon.nova-pro-v1:0
/model deepseek.v3.2
/model us.anthropic.claude-opus-4-6-v1
Diagnostics ​
hermes doctor
The doctor checks:
Whether AWS credentials are available (env vars, IAM role, SSO)
Whether boto3 is installed
Whether the Bedrock API is reachable (ListFoundationModels)
Number of available models in your region
Gateway (Messaging Platforms) ​
Bedrock works with all Hermes gateway platforms (Telegram, Discord, Slack, Feishu, etc.). Configure Bedrock as your provider, then start the gateway normally:
hermes gateway setup
hermes gateway start
The gateway reads config.yaml and uses the same Bedrock provider configuration.
Troubleshooting ​
"No API key found" / "No AWS credentials" ​
Hermes checks for credentials in this order:
AWS_BEARER_TOKEN_BEDROCK
AWS_ACCESS_KEY_ID + AWS_SECRET_ACCESS_KEY
AWS_PROFILE
EC2 instance metadata (IMDS)
ECS container credentials
Lambda execution role
If none are found, run aws configure or attach an IAM role to your compute instance.
"Invocation of model ID ... with on-demand throughput isn't supported" ​
Use an inference profile ID (prefixed with us. or global. ) instead of the bare foundation model ID. For example:
❌ anthropic.claude-sonnet-4-6
✅ us.anthropic.claude-sonnet-4-6
"ThrottlingException" ​
You've hit the Bedrock per-model rate limit. Hermes automatically retries with backoff. To increase limits, request a quota increase in the AWS Service Quotas console .
One-Click AWS Deployment ​
For a fully automated deployment on EC2 with CloudFormation:
sample-hermes-agent-on-aws-with-bedrock — creates VPC, IAM role, EC2 instance, and configures Bedrock automatically. Deploy in any region with one click.
Prerequisites
Quick Start
Configuration
Region
Guardrails
Model Discovery
Available Models
Switching Models Mid-Session
Diagnostics
Gateway (Messaging Platforms)
Troubleshooting
"No API key found" / "No AWS credentials"
"Invocation of model ID ... with on-demand throughput isn't supported"
"ThrottlingException"
One-Click AWS Deployment
