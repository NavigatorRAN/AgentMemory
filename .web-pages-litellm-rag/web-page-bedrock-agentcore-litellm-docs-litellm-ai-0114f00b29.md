# Bedrock AgentCore | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_agentcore
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_agentcore
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_agentcore
- Fetched at: 2026-06-23T14:27:11Z
- Content type: text/html; charset=utf-8

## Description

Call Bedrock AgentCore in the OpenAI Request/Response format.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Bedrock AgentCore in the OpenAI Request/Response format.
Property Details Description Amazon Bedrock AgentCore provides direct access to hosted agent runtimes for executing agentic workflows with foundation models. Provider Route on LiteLLM bedrock/agentcore/{AGENT_RUNTIME_ARN} Provider Doc AWS Bedrock AgentCore ↗
info
This documentation is for AgentCore Agents (agent runtimes). If you want to use AgentCore MCP servers with LiteLLM, see the MCP AWS SigV4 Auth guide for setup instructions.
Quick Start ​
Model Format to LiteLLM ​
To call a bedrock agent runtime through LiteLLM, use the following model format.
Here the model=bedrock/agentcore/ tells LiteLLM to call the bedrock InvokeAgentRuntime API.
Model Format to LiteLLM
bedrock/agentcore/{AGENT_RUNTIME_ARN}
Example:
bedrock/agentcore/arn:aws:bedrock-agentcore:us-west-2:123456789012:runtime/my-agent-runtime
You can find the Agent Runtime ARN in your AWS Bedrock console under AgentCore.
LiteLLM Python SDK ​
Basic AgentCore Completion
import litellm
# Make a completion request to your AgentCore runtime
response = litellm . completion (
model = "bedrock/agentcore/arn:aws:bedrock-agentcore:us-west-2:123456789012:runtime/my-agent-runtime" ,
messages = [
{
"role" : "user" ,
"content" : "Explain machine learning in simple terms"
}
] ,
)
print ( response . choices [ 0 ] . message . content )
print ( f"Usage: { response . usage } " )
Streaming AgentCore Responses
# Stream responses from your AgentCore runtime
"content" : "What are the key principles of software architecture?"
stream = True ,
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
LiteLLM Proxy ​
1. Configure your model in config.yaml ​
config.yaml
LiteLLM Proxy Configuration
model_list :
- model_name : agentcore - runtime - 1
litellm_params :
model : bedrock/agentcore/arn : aws : bedrock - agentcore : us - west - 2 : 123456789012 : runtime/my - agent - runtime
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
- model_name : agentcore - runtime - 2
model : bedrock/agentcore/arn : aws : bedrock - agentcore : us - east - 1 : 987654321098 : runtime/production - runtime
aws_region_name : us - east - 1
2. Start the LiteLLM Proxy ​
Start LiteLLM Proxy
litellm --config config.yaml
3. Make requests to your AgentCore runtimes ​
Curl
OpenAI Python SDK
Basic AgentCore Request
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "agentcore-runtime-1",
"messages": [
"role": "user",
"content": "Summarize the main benefits of cloud computing"
]
}'
Streaming AgentCore Request
"model": "agentcore-runtime-2",
"content": "Explain the differences between SQL and NoSQL databases"
],
"stream": true
Using OpenAI SDK with LiteLLM Proxy
from openai import OpenAI
# Initialize client with your LiteLLM proxy URL
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "your-litellm-api-key"
response = client . chat . completions . create (
model = "agentcore-runtime-1" ,
"content" : "What are best practices for API design?"
Streaming with OpenAI SDK
# Stream AgentCore responses
stream = client . chat . completions . create (
model = "agentcore-runtime-2" ,
"content" : "Describe the microservices architecture pattern"
stream = True
for chunk in stream :
if chunk . choices [ 0 ] . delta . content is not None :
Provider-specific Parameters ​
AgentCore supports additional parameters that can be passed to customize the runtime invocation.
SDK
Proxy
Using AgentCore-specific parameters
from litellm import completion
"content" : "Analyze this data and provide insights" ,
qualifier = "production" , # PROVIDER-SPECIFIC: Runtime qualifier/version
runtimeSessionId = "session-abc-123" , # PROVIDER-SPECIFIC: Custom session ID
LiteLLM Proxy Configuration with Parameters
- model_name : agentcore - runtime - prod
qualifier : production
Available Parameters ​
Parameter Type Description qualifier string Optional runtime qualifier/version to invoke a specific version of the agent runtime runtimeSessionId string Optional custom session ID (must be 33+ characters). If not provided, LiteLLM generates one automatically
LiteLLM A2A Gateway ​
Register a Bedrock AgentCore runtime as a first-class A2A agent on the LiteLLM Agent Gateway . This gives you per-agent RBAC, access groups, trace-ID enforcement, and the x-a2a-{agent_name_or_id}-{header} per-user passthrough convention — same surface as any other A2A provider.
This path is distinct from the chat-completions invocation above. Pick one based on your client:
You want to call AgentCore via... Use this path /v1/chat/completions with model: bedrock/agentcore/<ARN> Chat completions (covered above) POST /a2a/{agent_id} with A2A JSON-RPC 2.0 ( message/send or message/stream ) A2A Gateway (this section)
1. Register the agent ​
UI
REST API
Go to Agents → Add Agent .
Select Bedrock AgentCore as the provider.
Paste the AgentCore Runtime ARN as the agent URL.
Configure AWS credentials (or leave blank to use the proxy's ambient credential chain — see Authentication below).
curl -X POST http://localhost:4000/v1/agents \
-H "Authorization: Bearer sk-admin" \
"agent_name": "my-agentcore-runtime",
"agent_card_params": {
"name": "my-agentcore-runtime",
"description": "Internal research agent",
"url": "bedrock/agentcore/arn:aws:bedrock-agentcore:us-east-1:123456789012:runtime/my-runtime"
},
"litellm_params": {
"custom_llm_provider": "bedrock",
"aws_role_name": "arn:aws:iam::123456789012:role/LiteLLMAgentCoreInvoker",
"aws_region_name": "us-east-1"
2. Invoke via A2A ​
curl -X POST http://localhost:4000/a2a/my-agentcore-runtime/message/send \
-H "x-litellm-api-key: Bearer sk-client-key" \
"jsonrpc": "2.0",
"id": "1",
"method": "message/send",
"params": {
"message": {
"parts": [{"kind": "text", "text": "Summarize the latest clinical trial results"}],
"messageId": "msg-1"
Authentication ​
The AgentCore A2A path supports two distinct outbound auth modes , picked automatically based on what's in litellm_params :
Mode When it fires What's sent to AgentCore Bearer / JWT litellm_params.api_key is set (any value) Authorization: Bearer <api_key> — SigV4 is bypassed entirely SigV4 litellm_params.api_key is not set Per-request SigV4 signature using the full AWS credential chain (below) SigV4 credential resolution ​
When SigV4 mode is active, credentials are resolved in this priority order:
aws_web_identity_token + aws_role_name + aws_session_name → sts:AssumeRoleWithWebIdentity . Cross-account IRSA path.
aws_role_name alone → sts:AssumeRole . The proxy's ambient credentials (instance profile, IRSA, env vars) are the source identity. Session name auto-generated if omitted.
aws_profile_name → resolved via the boto3 profile loader ( ~/.aws/credentials ).
aws_access_key_id + aws_secret_access_key + aws_session_token → explicit temporary credentials.
aws_access_key_id + aws_secret_access_key + aws_region_name → explicit long-lived credentials. All three must be set; without aws_region_name this branch is skipped.
No credentials configured → boto3 default chain (env vars, IRSA via AWS_WEB_IDENTITY_TOKEN_FILE + AWS_ROLE_ARN , instance metadata).
Recognized fields on litellm_params for SigV4:
Field Description aws_role_name IAM role ARN to assume via STS aws_session_name Session name for the AssumeRole call (auto-generated if omitted) aws_external_id ExternalId passed to sts:AssumeRole for cross-account trust policies aws_web_identity_token OIDC token for AssumeRoleWithWebIdentity (set explicitly or via AWS_WEB_IDENTITY_TOKEN_FILE env) aws_profile_name AWS CLI profile name aws_sts_endpoint Custom STS endpoint (VPC endpoints, FIPS endpoints) aws_access_key_id / aws_secret_access_key / aws_session_token Explicit credentials aws_region_name AWS region. If omitted, detected from the runtime ARN in agent_card_params.url . IRSA on EKS ​
For Kubernetes deployments using IAM Roles for Service Accounts , no explicit credential configuration is needed — boto3's default chain picks up AWS_WEB_IDENTITY_TOKEN_FILE and AWS_ROLE_ARN from the pod environment automatically.
If you want the invocation to assume a second role (e.g. separate the pod's identity from the agent-invocation identity for CloudTrail attribution), combine IRSA with aws_role_name :
"agent_name": "production-runtime",
"name": "production-runtime",
"url": "bedrock/agentcore/arn:aws:bedrock-agentcore:us-east-1:123456789012:runtime/prod"
"aws_role_name": "arn:aws:iam::123456789012:role/AgentCoreInvocationRole",
"aws_session_name": "litellm-prod"
The proxy pod's IRSA role serves as the source identity for the AssumeRole call; the assumed role's CloudTrail entries reflect the agent invocation.
Per-user header passthrough ​
The standard A2A header forwarding mechanisms apply — see A2A Agent Authentication Headers for the full reference. All three methods work with AgentCore:
static_headers — always sent to AgentCore (e.g. a custom X-Tenant-Id )
extra_headers — admin-configured allowlist of client headers to forward
x-a2a-{agent_name_or_id}-{header} convention — caller-driven forwarding without admin config
Note that the SigV4 / Bearer auth handled by litellm_params is separate from the agent-level header forwarding above. Auth headers are computed per-request by the AWS signer; user passthrough headers are merged into the request after signing.
RBAC and trace IDs ​
All standard A2A controls apply:
Per-agent RBAC — Agent Permission Management . Returns HTTP 403 when the calling key/team isn't authorized for the AgentCore agent.
Access groups — tag the agent with one or more access groups in the LiteLLM dashboard, then grant the group to a team or key via object_permission.agent_access_groups . See Agent Access Groups .
Trace ID enforcement — set require_trace_id_on_calls_to_agent: true on litellm_params to require x-litellm-trace-id on every inbound call. See A2A Overview — Trace ID enforcement .
Further Reading ​
AWS Bedrock AgentCore Documentation
LiteLLM Authentication to Bedrock
LiteLLM A2A Gateway Overview
A2A Agent Authentication Headers
A2A Agent Permission Management
MCP AWS SigV4 — for the AgentCore-hosted MCP servers path (separate from the agent runtimes path)
Quick Start
LiteLLM Python SDK
LiteLLM Proxy
Provider-specific Parameters
Available Parameters
LiteLLM A2A Gateway
1. Register the agent
2. Invoke via A2A
Authentication
Per-user header passthrough
RBAC and trace IDs
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
