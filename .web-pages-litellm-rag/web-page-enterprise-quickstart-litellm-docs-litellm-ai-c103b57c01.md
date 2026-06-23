# ✨ Enterprise Quickstart | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/learn/enterprise_quickstart
- Final URL: https://docs.litellm.ai/docs/learn/enterprise_quickstart
- Canonical URL: https://docs.litellm.ai/docs/learn/enterprise_quickstart
- Fetched at: 2026-06-23T14:24:22Z
- Content type: text/html; charset=utf-8

## Description

Deploy LiteLLM Enterprise, validate the LLM/MCP/Agent gateway end-to-end, enforce budgets, and enable key enterprise controls.

## Extracted Text

Skip to main content
On this page
Use this guide if you are on an Enterprise trial to evaluate LiteLLM as a unified LLM, MCP, and Agent gateway with enterprise controls and budget enforcement.
info
Free trial : 30-day enterprise license
Talk to us : Book a demo
SSO is free for up to 5 users. Beyond that, an enterprise license is required.
Full feature catalog : Enterprise
Deploy + Shared Setup ​
All gateway and budget tests share one deployment and one org/team/key. Do this section first.
Prerequisites ​
An LLM provider API key (OpenAI, Azure, Anthropic, etc.)
Postgres — required for Admin UI, virtual keys, MCP/Agent registries, and budget tracking
Your Enterprise license key
A deployment target: Docker Compose , Kubernetes ( kubectl ), or Helm
Docker Compose
Kubernetes
Helm
Follow the Docker Compose tab in the Getting Started Tutorial. Condensed steps:
docker pull ghcr.io/berriai/litellm-database:main-latest
curl -O https://raw.githubusercontent.com/BerriAI/litellm/main/docker-compose.yml
Create .env :
LITELLM_MASTER_KEY="sk-1234"
LITELLM_SALT_KEY="sk-salt-change-me"
LITELLM_LICENSE="eyJ..."
OPENAI_API_KEY="your-api-key"
Create config.yaml :
config.yaml
model_list :
- model_name : gpt - 5.5
litellm_params :
model : openai/gpt - 5.5
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "prometheus" ]
general_settings :
master_key : os.environ/LITELLM_MASTER_KEY
database_url : "postgresql://llmproxy:dbpassword9090@db:5432/litellm"
store_model_in_db : true
docker compose up
Deploy with raw manifests when you manage your own Postgres and want full control over the resources. You need an existing Postgres reachable from the cluster. Step 1. Create a ConfigMap for config.yaml ​
litellm-config.yaml
apiVersion : v1
kind : ConfigMap
metadata :
name : litellm - config
data :
config.yaml : |
model_list:
- model_name: gpt-5.5
litellm_params:
model: openai/gpt-5.5
api_key: os.environ/OPENAI_API_KEY
kubectl apply -f litellm-config.yaml
Step 2. Create a Secret for keys ​
kubectl create secret generic litellm-secrets \
--from-literal=LITELLM_MASTER_KEY="sk-1234" \
--from-literal=LITELLM_SALT_KEY="sk-salt-change-me" \
--from-literal=LITELLM_LICENSE="eyJ..." \
--from-literal=OPENAI_API_KEY="your-api-key" \
--from-literal=DATABASE_URL="postgresql://user:pass@host:5432/litellm"
Step 3. Create deployment.yaml ​
deployment.yaml
apiVersion : apps/v1
kind : Deployment
name : litellm - deployment
spec :
replicas : 1
selector :
matchLabels :
app : litellm
template :
labels :
containers :
- name : litellm
image : docker.litellm.ai/berriai/litellm - database : main - stable
imagePullPolicy : Always
ports :
- containerPort : 4000
envFrom :
- secretRef :
name : litellm - secrets
args :
- "--config"
- "/app/proxy_config.yaml"
volumeMounts :
- name : config - volume
mountPath : /app/proxy_config.yaml
subPath : config.yaml
readOnly : true
livenessProbe :
httpGet :
path : /health/liveliness
port : 4000
initialDelaySeconds : 120
periodSeconds : 15
readinessProbe :
path : /health/readiness
volumes :
configMap :
kubectl apply -f deployment.yaml
Step 4. Create service.yaml ​
service.yaml
kind : Service
name : litellm - service
- protocol : TCP
targetPort : 4000
type : NodePort
kubectl apply -f service.yaml
Step 5. Start the server ​
kubectl port-forward service/litellm-service 4000:4000
Your LiteLLM Gateway is now running on http://0.0.0.0:4000 .
[BETA] The LiteLLM Helm chart is BETA. If you run into issues or have feedback, let us know at github.com/BerriAI/litellm/issues .
The Helm chart can provision Postgres for you ( db.deployStandalone: true ) or point at an existing database ( db.useExisting ). See the chart README and the full values.yaml . Step 1. Clone the repository ​
git clone https://github.com/BerriAI/litellm.git
Step 2. Create a Secret for your license + provider keys ​
kubectl create secret generic litellm-env-secret \
--from-literal=OPENAI_API_KEY="your-api-key"
--from-literal=DATABASE_URL="postgres://user@password:5432"
Step 3. Create values-enterprise.yaml ​
Layer your enterprise settings onto the chart. environmentSecrets injects the Secret above as env vars, which proxy_config then references with os.environ/<NAME> .
values-enterprise.yaml
masterkey : sk - 1234
environmentSecrets :
- litellm - env - secret
db :
deployStandalone : true
proxyConfigMap :
create : true
proxy_config :
Bring your own database — to point at an existing Postgres instead of letting the chart provision one, replace the db block:
useExisting : true
endpoint : my - postgres.default.svc.cluster.local
database : litellm
url : postgresql : //user : pass@my - postgres : 5432/litellm
secret :
name : litellm - db - secret
usePasswordSecret : true
Step 4. Deploy with Helm ​
Run from the root of the cloned litellm repo:
helm install \
-f values-enterprise.yaml \
mydeploy \
deploy/charts/litellm-helm
Step 5. Expose the service to localhost ​
kubectl port-forward service/mydeploy-litellm-helm 4000:4000
Your LiteLLM Gateway is now running on http://127.0.0.1:4000 .
Verify Enterprise Edition ​
Open http://localhost:4000/ — Swagger should show "Enterprise Edition" in the description. See the Enterprise license FAQ .
Open the Admin UI at http://localhost:4000/ui and sign in with your master key.
Shared tenant setup ​
Complete these steps in the Admin UI before starting the gateway tracks.
Step Action Why 1 Create an Organization and a Team Organizations are used as top-level entities (Department of Computer Science), which contain multiple Teams (Robotics Club, Frontend Engineering team) 2 Invite Internal Users Add multiple users within a team and to govern spend 2 Set team max_budget (e.g. $10 , duration 30d ) Creates a hard spend envelope early so you can verify budget enforcement and over-budget behavior after running LLM calls. 3 Create a team-scoped virtual key with model access Give admins and internal users access to team models and enforce budgets. Track spend for individual teams.
→ Multi-tenant Architecture · Virtual Keys
1. LLM Gateway ​
Prove LiteLLM routes LLM requests through your virtual key, tracks spend, and enforces RBAC.
Steps ​
Confirm model gpt-5.5 (or your model) appears in model_list (config or Admin UI → Models).
Test with your master key :
curl -X POST 'http://localhost:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-5.5",
"messages": [{"role": "user", "content": "Hello from LiteLLM Enterprise Gateway"}]
}'
Use your team virtual key — repeat the same request with the key from shared setup.
Verify response — expect 200 OK ; assistant text is in choices[0].message.content .
Verify logs — open Logs tab; confirm key, team, model, latency, and spend appear.
Verify team spend — open Teams tab → select your team; confirm spend incremented toward max_budget .
→ Virtual Keys
→ Gateway Quickstart
→ Role-Based Access Control
2. MCP Gateway ​
Prove LiteLLM registers MCP servers, enforces per-key access, routes tool calls, and tracks MCP cost.
Register MCP server — Admin UI → MCP Servers → Add New MCP Server:
Name: deepwiki
URL: https://mcp.deepwiki.com/mcp
Transport: HTTP
Or add to config.yaml :
mcp_servers :
- server_name : deepwiki
url : https : //mcp.deepwiki.com/mcp
transport : http
available_on_public_internet : true
Assign to team/key — under MCP Settings on the virtual key or team, allow the deepwiki server. See MCP Permission Management .
List tools — confirm tools appear in Admin UI under MCP Servers → MCP Tools .
Invoke via /v1/chat/completions :
curl -X POST 'http://localhost:4000/v1/chat/completions' \
-H 'Authorization: Bearer sk-team-key' \
"messages": [{"role": "user", "content": "TLDR of BerriAI/litellm repo"}],
"tools": [{
"type": "mcp",
"server_url": "litellm_proxy/deepwiki",
"server_label": "deepwiki",
"require_approval": "never"
}]
Verify response — contains tool output and an assistant summary.
Verify logs — Logs tab shows MCP tool call with namespaced tool name and cost.
→ MCP Overview · MCP Permission Management · Using your MCP
3. Agent Gateway ​
Prove LiteLLM registers A2A agents, enforces per-key access, invokes agents, and tracks agent-attributed spend.
Deploy a sample agent — use Multi-agent collaboration using A2A (simple deployable A2A agent with streaming support).
Register in Admin UI — Agents tab → Add Agent → enter name and URL.
Assign to team/key — under Agent Settings on the virtual key, allow the agent. See Agent Permission Management .
List agents :
curl -H 'Authorization: Bearer sk-team-key' \
'http://localhost:4000/v1/agents'
Invoke via the A2A SDK:
invoke_a2a_agent.py
import httpx , asyncio
from uuid import uuid4
from a2a . client import A2ACardResolver , A2AClient
from a2a . types import MessageSendParams , SendMessageRequest
LITELLM_BASE_URL = "http://localhost:4000"
LITELLM_VIRTUAL_KEY = "sk-team-key"
async def main ( ) :
headers = { "Authorization" : f"Bearer { LITELLM_VIRTUAL_KEY } " }
async with httpx . AsyncClient ( headers = headers ) as client :
agents = ( await client . get ( f" { LITELLM_BASE_URL } /v1/agents" ) ) . json ( )
agent_id = agents [ 0 ] [ "agent_id" ]
base_url = f" { LITELLM_BASE_URL } /a2a/ { agent_id } "
resolver = A2ACardResolver ( httpx_client = client , base_url = base_url )
a2a_client = A2AClient (
httpx_client = client ,
agent_card = await resolver . get_agent_card ( ) ,
)
response = await a2a_client . send_message (
SendMessageRequest (
id = str ( uuid4 ( ) ) ,
params = MessageSendParams (
message = {
"role" : "user" ,
"parts" : [ { "kind" : "text" , "text" : "Hello, what can you do?" } ] ,
"messageId" : uuid4 ( ) . hex ,
}
) ,
print ( response . model_dump ( mode = "json" , exclude_none = True , indent = 2 ) )
asyncio . run ( main ( ) )
Verify logs — Logs tab shows key, team, latency, and agent-attributed cost. Cost counts toward team/key spend from Section 0.
→ Agent Gateway Overview · Invoking A2A Agents · Agent Cost Tracking
4. Budgets & Spend ​
Budget enforcement runs on all three gateways through the same virtual key — one control plane governs LLM, MCP, and Agent spend.
4a. Key budget + rate limits ​
Create a test key with a tight budget and RPM limit:
curl -X POST 'http://localhost:4000/key/generate' \
"max_budget": 0.01,
"rpm_limit": 1,
"team_id": "<your-team-id>"
First request with the new key → 200 OK .
Second request within the same minute → rate limit error (RPM exceeded).
Confirm key spend in Admin UI under Virtual Keys .
→ Virtual Keys · Docker Quick Start — RPM test
4b. Team budget ​
Team max_budget was set in Section 0. After completing Sections 1–3:
Open Teams tab → select your PoC team.
Confirm spend accumulated across LLM, MCP, and Agent calls.
Optional negative test — set team max_budget very low (e.g. $0.0001 ), make one LLM call, confirm budget-exceeded error.
→ Multi-tenant Architecture
4c. Tag budget ​
Add tag_budget_config to config.yaml and restart the proxy:
tag_budget_config :
poc:chat-app :
max_budget : 0.000000000001
budget_duration : 1d
Make a tagged request:
"messages": [{"role": "user", "content": "Hello"}],
"metadata": {"tags": ["poc:chat-app"]}
First call succeeds; second call with the same tag fails with a budget-exceeded error.
Query tag spend:
curl -X GET 'http://localhost:4000/spend/tags' \
-H 'Authorization: Bearer sk-1234'
Verify: response lists poc:chat-app with total_spend and log_count .
Explore next: Projects · Temporary budget increases · Soft budget alerts · Spend reports · Budget Routing · Enterprise Spend Tracking
5. Enterprise Controls ​
Layer security and compliance on top of working gateways and budgets.
Audit logs ​
Enable via store_audit_logs: true under litellm_settings of your config.yml . Delete a virtual key via API or UI, then check the Audit Logs tab.
→ Audit Logs
Team/key guardrails ​
Guardrails → create a guardrail (secret detection or content moderation)
Policies → attach the guardrail to a team or key
Send a request that should be blocked; confirm the guardrail fires
→ Guardrail Policies
→ Guardrails Quick Start
SSO for Admin UI ​
SSO controls Admin UI login — separate from API auth (virtual keys or JWT). Register this redirect URI in your IdP:
https://<your-proxy-base-url>/sso/callback
Google
Microsoft
Okta / Generic OIDC
GOOGLE_CLIENT_ID="<your-client-id>"
GOOGLE_CLIENT_SECRET="<your-client-secret>"
PROXY_BASE_URL="https://<your-proxy-base-url>"
MICROSOFT_CLIENT_ID="<your-client-id>"
MICROSOFT_CLIENT_SECRET="<your-client-secret>"
MICROSOFT_TENANT="<your-tenant-id>"
GENERIC_CLIENT_ID="<your-client-id>"
GENERIC_CLIENT_SECRET="<your-client-secret>"
GENERIC_AUTHORIZATION_ENDPOINT="https://<your-idp>/oauth2/v1/authorize"
GENERIC_TOKEN_ENDPOINT="https://<your-idp>/oauth2/v1/token"
GENERIC_USERINFO_ENDPOINT="https://<your-idp>/oauth2/v1/userinfo"
Verify: sign in to the Admin UI through your identity provider.
Also available: Custom SSO · CLI SSO · SCIM provisioning
→ SSO for Admin UI
JWT/OIDC Auth ​
Authenticate application requests with your identity provider's JWT tokens instead of static virtual keys.
→ JWT-based Authentication
Secret manager ​
Point LiteLLM at your secret manager so provider keys are read from vault instead of config files.
→ Secret Managers Overview
7. Additional Enterprise Value ​
💰
Governance & Cost
Tag budgets, soft budget alerts, spend reports, and temporary budget increases.
📡
Observability
Team-based logging, log export to GCS/Azure Blob, per-team Langfuse routing.
🌐
AI Hub
Public branded page of available models and agents for your users.
🏗️
Control Plane
Multi-region control plane and data plane architecture.
🔒
Data Security
SOC 2, ISO 27001, data regions, and compliance FAQs.
✨
Full Enterprise Catalog
Complete feature reference, deployment options, and support SLAs.
8. Need Help? ​
Every Enterprise license includes a dedicated Slack or Teams channel with our engineering team. Reach out to us support@berri.ai and we'll be more than happy to help you!
See Professional Support .
Deploy + Shared Setup
Prerequisites
Verify Enterprise Edition
Shared tenant setup
1. LLM Gateway
Steps
2. MCP Gateway
3. Agent Gateway
4. Budgets & Spend
4a. Key budget + rate limits
4b. Team budget
4c. Tag budget
5. Enterprise Controls
Audit logs
Team/key guardrails
SSO for Admin UI
JWT/OIDC Auth
Secret manager
7. Additional Enterprise Value
8. Need Help?
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
