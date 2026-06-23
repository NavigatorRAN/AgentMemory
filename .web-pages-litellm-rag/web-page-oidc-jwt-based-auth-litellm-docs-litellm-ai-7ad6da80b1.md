# OIDC - JWT-based Auth | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/token_auth
- Final URL: https://docs.litellm.ai/docs/proxy/token_auth
- Canonical URL: https://docs.litellm.ai/docs/proxy/token_auth
- Fetched at: 2026-06-23T14:32:16Z
- Content type: text/html; charset=utf-8

## Description

Use JWT's to auth admins / users / projects into the proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use JWT's to auth admins / users / projects into the proxy.
info
✨ JWT-based Auth is on LiteLLM Enterprise
Enterprise Pricing
Contact us here to get a free trial
JWT → Virtual Key Mapping
Want per-user model restrictions, spend limits, and rate limits without distributing API keys? See JWT → Virtual Key Mapping — enterprise-grade granular access control for JWT-authenticated users (e.g. Claude Code + SSO).
Usage ​
Step 1. Setup Proxy ​
JWT_PUBLIC_KEY_URL : This is the public keys endpoint of your OpenID provider. Typically it's {openid-provider-base-url}/.well-known/openid-configuration/jwks . For Keycloak it's {keycloak_base_url}/realms/{your-realm}/protocol/openid-connect/certs .
JWT_AUDIENCE : This is the audience used for decoding the JWT. If not set, the decode step will not verify the audience.
export JWT_PUBLIC_KEY_URL="" # "https://demo.duendesoftware.com/.well-known/openid-configuration/jwks"
enable_jwt_auth in your config. This will tell the proxy to check if a token is a jwt token.
general_settings :
master_key : sk - 1234
enable_jwt_auth : True
model_list :
- model_name : azure - gpt - 3.5
litellm_params :
model : azure/<your - deployment - name >
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
api_version : "2023-07-01-preview"
Step 2. Create JWT with scopes ​
admin
project
Create a client scope called litellm_proxy_admin in your OpenID provider (e.g. Keycloak).
Grant your user, litellm_proxy_admin scope when generating a JWT.
curl --location ' 'https://demo.duendesoftware.com/connect/token'' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id={CLIENT_ID}' \
--data-urlencode 'client_secret={CLIENT_SECRET}' \
--data-urlencode 'username=test-{USERNAME}' \
--data-urlencode 'password={USER_PASSWORD}' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'scope=litellm_proxy_admin' # 👈 grant this scope
Create a JWT for your project on your OpenID provider (e.g. Keycloak).
--data-urlencode 'client_id={CLIENT_ID}' \ # 👈 project id
--data-urlencode 'grant_type=client_credential' \
Step 3. Test your JWT ​
/key/generate
/chat/completions
curl --location '{proxy_base_url}/key/generate' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiI...' \
--header 'Content-Type: application/json' \
--data '{}'
curl --location 'http://0.0.0.0:4000/v1/chat/completions' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1...' \
--data '{"model": "azure-gpt-3.5", "messages": [ { "role": "user", "content": "What's the weather like in Boston today?" } ]}'
Advanced ​
Multiple OIDC providers ​
Use this if you want LiteLLM to validate your JWT against multiple OIDC providers (e.g. Google Cloud, GitHub Auth)
Set JWT_PUBLIC_KEY_URL in your environment to a comma-separated list of URLs for your OIDC providers.
export JWT_PUBLIC_KEY_URL="https://demo.duendesoftware.com/.well-known/openid-configuration/jwks,https://accounts.google.com/.well-known/openid-configuration/jwks"
Kubernetes ServiceAccount Authentication ​
Use Kubernetes ServiceAccount tokens to authenticate workloads running in your cluster. This is useful when you want pods to authenticate to LiteLLM using their native Kubernetes identity.
Prerequisites ​
Your Kubernetes cluster must have ServiceAccount token projection enabled (default in Kubernetes 1.20+)
Your cluster's OIDC issuer must be accessible (for EKS, GKE, AKS this is automatic)
Step 1: Configure the OIDC Discovery URL ​
Set JWT_PUBLIC_KEY_URL to your cluster's OIDC discovery endpoint:
Amazon EKS
Google GKE
Azure AKS
Self-Managed
# Get your EKS OIDC issuer URL
aws eks describe-cluster --name <cluster-name> --query "cluster.identity.oidc.issuer" --output text
# Set the JWKS URL (append /keys to the issuer URL)
export JWT_PUBLIC_KEY_URL="https://oidc.eks.<region>.amazonaws.com/id/<id>/keys"
# GKE uses Google's OIDC provider
export JWT_PUBLIC_KEY_URL="https://container.googleapis.com/v1/projects/<project>/locations/<location>/clusters/<cluster>/jwks"
# Get your AKS OIDC issuer URL
az aks show --name <cluster-name> --resource-group <resource-group> --query "oidcIssuerProfile.issuerUrl" -o tsv
# Set the JWKS URL
export JWT_PUBLIC_KEY_URL="<issuer-url>/openid/v1/jwks"
# For self-managed clusters, check your API server's --service-account-issuer flag
# The JWKS endpoint is typically at:
export JWT_PUBLIC_KEY_URL="https://<api-server>/openid/v1/jwks"
Step 2: Configure LiteLLM ​
Configure LiteLLM to extract identity information from Kubernetes ServiceAccount tokens:
litellm_jwtauth :
# Use namespace as team identifier (resolves via team_alias in DB)
team_alias_jwt_field : "kubernetes\.io.namespace"
Step 3: Create ServiceAccount and Configure Pod ​
Create a ServiceAccount with an associated secret and configure your pod to use the token:
apiVersion : v1
kind : ServiceAccount
metadata :
name : my - llm - client
namespace : my - app
---
kind : Secret
name : my - llm - client - token
annotations :
kubernetes.io/service-account.name : my - llm - client
type : kubernetes.io/service - account - token
kind : Pod
name : llm - client - pod
spec :
serviceAccountName : my - llm - client
containers :
- name : app
image : my - app : latest
env :
- name : LITELLM_TOKEN
valueFrom :
secretKeyRef :
key : token
Set the expected audience in LiteLLM:
export JWT_AUDIENCE="https://kubernetes.default.svc"
Step 4: Create Team for Namespace ​
Create a team in LiteLLM that matches the namespace (using team_alias ):
curl -X POST 'http://0.0.0.0:4000/team/new' \
-H 'Authorization: Bearer <PROXY_MASTER_KEY>' \
-H 'Content-Type: application/json' \
-d '{
"team_alias": "my-app",
"team_id": "my-app",
"models": ["gpt-4", "claude-sonnet-4-20250514"]
}'
Step 5: Use the Token ​
From within the pod, the token is available in the LITELLM_TOKEN environment variable:
# Make a request to LiteLLM using the env var
curl -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H "Authorization: Bearer $LITELLM_TOKEN" \
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hello!"}]
Example: ServiceAccount Token Structure ​
A Kubernetes ServiceAccount token looks like this:
{
"aud" : [ "litellm-proxy" ] ,
"exp" : 1234567890 ,
"iat" : 1234567890 ,
"iss" : "https://oidc.eks.us-west-2.amazonaws.com/id/EXAMPLE" ,
"kubernetes.io" : {
"namespace" : "my-app" ,
"pod" : {
"name" : "llm-client-pod" ,
"uid" : "pod-uid"
} ,
"serviceaccount" : {
"name" : "my-llm-client" ,
"uid" : "sa-uid"
}
"nbf" : 1234567890 ,
"sub" : "system:serviceaccount:my-app:my-llm-client"
Advanced: Map Namespace to Team Using Name Resolution ​
Use the team_alias_jwt_field to automatically resolve namespaces to teams:
user_id_jwt_field : "sub"
# Map the namespace to team_alias in the database
user_id_upsert : true
This way, pods in namespace production automatically get associated with the team that has team_alias: production .
Set Accepted JWT Scope Names ​
Change the string in JWT 'scopes', that litellm evaluates to see if a user has admin access.
admin_jwt_scope : "litellm-proxy-admin"
Tracking End-Users / Internal Users / Team / Org ​
Set the field in the jwt token, which corresponds to a litellm user / team / org.
Note: All JWT fields support dot notation to access nested claims (e.g., "user.sub" , "resource_access.client.roles" ).
team_id_jwt_field : "client_id" # 👈 CAN BE ANY FIELD (supports dot notation for nested claims)
user_id_jwt_field : "sub" # 👈 CAN BE ANY FIELD (supports dot notation for nested claims)
org_id_jwt_field : "org_id" # 👈 CAN BE ANY FIELD (supports dot notation for nested claims)
end_user_id_jwt_field : "customer_id" # 👈 CAN BE ANY FIELD (supports dot notation for nested claims)
Expected JWT (flat structure):
"client_id" : "my-unique-team" ,
"sub" : "my-unique-user" ,
"org_id" : "my-unique-org"
Or with nested structure using dot notation:
"user" : {
"email" : "user@example.com"
"tenant" : {
"team_id" : "my-unique-team"
"organization" : {
"id" : "my-unique-org"
Configuration for nested example:
user_id_jwt_field : "user.sub"
user_email_jwt_field : "user.email"
team_id_jwt_field : "tenant.team_id"
org_id_jwt_field : "organization.id"
Now litellm will automatically update the spend for the user/team/org in the db for each call.
Resolve by Name (Alias) Instead of ID ​
Sometimes your JWT token contains human-readable names instead of database IDs. LiteLLM can resolve these names to IDs by looking them up in the database.
Use Case: Your IDP provides team/org names in the JWT, but LiteLLM needs the actual database IDs for spend tracking and access control.
# Name-based fields (resolved via database lookup)
team_alias_jwt_field : "team_alias" # Resolves team by team_alias in DB
org_alias_jwt_field : "org_alias" # Resolves org by organization_alias in DB
Expected JWT:
"sub" : "user-123" ,
"team_alias" : "engineering-team" ,
"org_alias" : "acme-corp"
How It Works:
LiteLLM extracts the name from the configured JWT field
Looks up the entity in the database by its alias field:
Teams: team_alias column in LiteLLM_TeamTable
Organizations: organization_alias column in LiteLLM_OrganizationTable
Uses the resolved ID for spend tracking and access control
Precedence: ID fields always take precedence over name fields. If both team_id_jwt_field and team_alias_jwt_field are configured and both values exist in the JWT, the ID will be used.
# Example: ID takes precedence
team_id_jwt_field : "team_id" # Used if present in JWT
team_alias_jwt_field : "team_alias" # Fallback if team_id not present
Nested Fields: Name fields also support dot notation for nested claims:
team_alias_jwt_field : "organization.team.name"
org_alias_jwt_field : "company.name"
Important Notes:
The entity (team/org) must already exist in the database with the matching alias
Aliases should be unique - if multiple entities share the same alias, an error will be returned
Name resolution adds a database lookup, so using IDs directly is slightly more performant
JWT Scopes ​
Here's what scopes on JWT-Auth tokens look like
Can be a list
scope: ["litellm-proxy-admin",...]
Can be a space-separated string
scope: "litellm-proxy-admin ..."
Control model access with Teams ​
Specify the JWT field that contains the team ids, that the user belongs to.
team_ids_jwt_field : "groups"
user_id_upsert : true # add user_id to the db if they don't exist
enforce_team_based_model_access : true # don't allow users to access models unless the team has access
This is assuming your token looks like this:
...,
"sub": "my-unique-user",
"groups": ["team_id_1", "team_id_2"]
Create the teams on LiteLLM
curl -X POST '<PROXY_BASE_URL>/team/new' \
-D '{
"team_alias": "team_1",
"team_id": "team_id_1" # 👈 MUST BE THE SAME AS THE SSO GROUP ID
Test the flow
SSO for UI: See Walkthrough
OIDC Auth for API: See Walkthrough
Flow ​
Validate if user id is in the DB (LiteLLM_UserTable)
Validate if any of the groups are in the DB (LiteLLM_TeamTable)
Validate if any group has model access
If all checks pass, allow the request
Select Team via Request Header ​
When a JWT token contains multiple teams (via team_ids_jwt_field ), you can explicitly select which team to use for a request by passing the x-litellm-team-id header.
-H 'Authorization: Bearer <your-jwt-token>' \
-H 'x-litellm-team-id: team_id_2' \
"messages": [{"role": "user", "content": "Hello"}]
Validation:
The team ID in the header must exist in the JWT's team_ids_jwt_field list or match team_id_jwt_field
If an invalid team is specified, a 403 error is returned
If no header is provided, LiteLLM auto-selects the first team with access to the requested model
Fall back to DB team when JWT claims don't resolve ​
By default, when team_id_jwt_field or team_ids_jwt_field is configured and the JWT carries a claim value that does not map to any LiteLLM team, LiteLLM raises an error — the claim is treated as authoritative.
For deployments where the IdP team claim is advisory (e.g. machine tokens whose groups claim lives in a separate namespace from LiteLLM team_id s), opt in to a fallback: if the configured claim is present but unresolved, LiteLLM defers to the user's single LiteLLM team (when the user belongs to exactly one team in the DB).
team_claim_fallback : true # 👈 opt in
Behavior:
Trigger Default ( team_claim_fallback: false ) Opt-in ( team_claim_fallback: true ) team_id claim resolves to a real team 200 / use team 200 / use team team_id claim present, team missing in DB raise defer → fallback to user's single DB team team_alias claim resolves 200 / use team 200 / use team groups claim resolves and team grants model 200 200 groups claim resolves but team lacks model 403 (preserved) 403 (preserved) groups claim present, none resolve to a real team 403 defer → fallback to user's single DB team no claim at all (single-team fallback baseline) 200 / fallback 200 / fallback
Security envelope: the fallback only resolves when the user belongs to exactly one LiteLLM team in the DB; non-404 errors (e.g. "No DB Connected" ) always propagate. Keep the default ( false ) if your IdP team claims are authoritative for authorization.
Custom JWT Validate ​
Validate a JWT Token using custom logic, if you need an extra way to verify if tokens are valid for LiteLLM Proxy.
1. Setup custom validate function ​
from typing import Literal
def my_custom_validate ( token : str ) - > Literal [ True ] :
"""
Only allow tokens with tenant-id == "my-unique-tenant", and claims == ["proxy-admin"]
allowed_tenants = [ "my-unique-tenant" ]
allowed_claims = [ "proxy-admin" ]
if token [ "tenant_id" ] not in allowed_tenants :
raise Exception ( "Invalid JWT token" )
if token [ "claims" ] not in allowed_claims :
return True
2. Setup config.yaml ​
team_id_jwt_field : "tenant_id"
user_id_upsert : True
custom_validate : custom_validate.my_custom_validate # 👈 custom validate function
3. Test the flow ​
Expected JWT
"tenant_id": "INVALID_TENANT",
"claims": ["proxy-admin"]
Expected Response
"error": "Invalid JWT token"
Allowed Routes ​
Configure which routes a JWT can access via the config.
By default:
Admins: can access only management routes ( /team/* , /key/* , /user/* )
Teams: can access only openai routes ( /chat/completions , etc.)+ info routes ( /*/info )
See Code
Admin Routes
admin_allowed_routes : [ "/v1/embeddings" ]
Team Routes
...
team_id_jwt_field : "litellm-team" # 👈 Set field in the JWT token that stores the team ID
team_allowed_routes : [ "/v1/chat/completions" ] # 👈 Set accepted routes
Allowing other provider routes for Teams ​
To enable team JWT tokens to access Anthropic-style endpoints such as /v1/messages , update team_allowed_routes in your litellm_jwtauth configuration. team_allowed_routes supports the following values:
Named route groups from LiteLLMRoutes (e.g., openai_routes , anthropic_routes , info_routes , mapped_pass_through_routes ).
Below is a quick reference for the route groups you can use and example representative routes from each group. If you need the exhaustive list, see the LiteLLMRoutes enum in litellm/proxy/_types.py for the authoritative list.
Route Group What it contains Representative routes openai_routes OpenAI-compatible REST endpoints (chat, completion, embeddings, images, responses, models, etc.) /v1/chat/completions , /v1/completions , /v1/embeddings , /v1/images/generations , /v1/models anthropic_routes Anthropic-style endpoints ( /v1/messages and related) /v1/messages , /v1/messages/count_tokens , /v1/skills mapped_pass_through_routes Provider-specific pass-through route prefixes (e.g., Anthropic when proxied via /anthropic ). Use with mapped_pass_through_routes for provider wildcard mapping /anthropic/* , /vertex-ai/* , /bedrock/* passthrough_routes_wildcard Wildcard mapping for providers (e.g., /anthropic/* ) - precomputed wildcard list used by the proxy /anthropic/* , /vllm/* google_routes Google-specific (e.g., Vertex / Batching endpoints) /v1beta/models/{model_name}:generateContent mcp_routes Internal MCP management endpoints /mcp/tools , /mcp/tools/call info_routes Read-only & info endpoints used by the UI /key/info , /team/info , /v1/models management_routes Admin-only management endpoints (create/update/delete user/team/model) /team/new , /key/generate , /model/new spend_tracking_routes Budget/spend related endpoints /spend/logs , /spend/keys , /spend/users public_routes Public and unauthenticated endpoints / , /routes , /.well-known/litellm-ui-config
Note: llm_api_routes is the union of OpenAI, Anthropic, Google, pass-through and other LLM routes ( openai_routes + anthropic_routes + google_routes + mapped_pass_through_routes + passthrough_routes_wildcard + apply_guardrail_routes + mcp_routes + litellm_native_routes ).
Defaults (what the proxy uses if you don't override them in litellm_jwtauth ):
admin_jwt_scope : litellm_proxy_admin
admin_allowed_routes (default): management_routes , spend_tracking_routes , global_spend_tracking_routes , info_routes
team_allowed_routes (default): openai_routes , info_routes
public_allowed_routes (default): public_routes
Example: Allow team JWTs to call Anthropic /v1/messages (either by route group or by explicit route string):
team_ids_jwt_field : "team_ids"
team_allowed_routes : [ "openai_routes" , "info_routes" , "anthropic_routes" ]
Or selectively allow the exact Anthropic message endpoint only:
team_allowed_routes : [ "/v1/messages" , "info_routes" ]
Caching Public Keys ​
Control how long public keys are cached for (in seconds).
public_key_ttl : 600 # 👈 KEY CHANGE
Custom JWT Field ​
Set a custom field in which the team_id exists. By default, the 'client_id' field is checked.
team_id_jwt_field : "client_id" # 👈 KEY CHANGE
Block Teams ​
To block all requests for a certain team id, use /team/block
Block Team
curl --location 'http://0.0.0.0:4000/team/block' \
--header 'Authorization: Bearer <admin-token>' \
--data '{
"team_id": "litellm-test-client-id-new" # 👈 set team id
Unblock Team
curl --location 'http://0.0.0.0:4000/team/unblock' \
Upsert Users + Allowed Email Domains ​
Allow users who belong to a specific email domain, automatic access to the proxy.
Note: user_allowed_email_domain is optional. If not specified, all users will be allowed regardless of their email domain.
user_email_jwt_field : "email" # 👈 checks 'email' field in jwt payload
user_allowed_email_domain : "my-co.com" # 👈 OPTIONAL - allows user@my-co.com to call proxy
user_id_upsert : true # 👈 upserts the user to db, if valid email but not in db
OIDC UserInfo Endpoint ​
Use this when your JWT/access token doesn't contain user-identifying information. LiteLLM will call your identity provider's UserInfo endpoint to fetch user details.
When to Use ​
Your JWT is opaque (not self-contained) or lacks user claims
You need to fetch fresh user information from your identity provider
Your access tokens don't include email, roles, or other identifying data
Configuration ​
config.yaml
# Enable OIDC UserInfo endpoint
oidc_userinfo_enabled : true
oidc_userinfo_endpoint : "https://your-idp.com/oauth2/userinfo"
oidc_userinfo_cache_ttl : 300 # Cache for 5 minutes (default: 300)
# Map fields from UserInfo response
user_email_jwt_field : "email"
user_roles_jwt_field : "roles"
Flow Diagram ​
Example: Azure AD ​
oidc_userinfo_endpoint : "https://graph.microsoft.com/oidc/userinfo"
Example: Keycloak ​
oidc_userinfo_endpoint : "https://keycloak.example.com/realms/your-realm/protocol/openid-connect/userinfo"
user_roles_jwt_field : "resource_access.your-client.roles"
Route JWT-Shaped Machine Tokens to OAuth2 ​
Use this when:
enable_jwt_auth: true for standard JWT validation
machine tokens are JWT-shaped and should be routed to OAuth2 based on claims
routing_overrides supports two operating modes:
Selective mode : set enable_oauth2_auth: false to send only matching JWTs to OAuth2 on LLM + info routes
Global mode : set enable_oauth2_auth: true to also enable OAuth2 on LLM + info routes
enable_jwt_auth : true
enable_oauth2_auth : false
routing_overrides :
- iss : "machine-issuer.example.com"
client_id : "MID_LITELLM"
path : "oauth2"
Matching behavior ​
A rule matches when all configured selectors match the corresponding token claims (AND semantics).
Supported selectors: iss (required), client_id (optional), scope (optional), aud (optional).
Selector values can be a single string or a list of strings (the claim must match at least one entry, using the rules below).
Wildcards: selectors may use shell-style * and ? . Matching is case-sensitive —use the same casing your IdP emits in JWT claims.
scope claim as a space-delimited string: OAuth/OIDC often sends scope as one string (e.g. openid profile App:LiteLLM ). LiteLLM splits that string only when matching the scope selector , so a configured value like App:LiteLLM can match. iss , aud , and client_id are never split on spaces ; the full claim string is used (routing uses unverified claims only for path selection; final auth still validates the token).
If no rule matches, LiteLLM continues with standard JWT validation.
Example: scope and wildcard client_id ​
scope : "App:LiteLLM"
client_id : "*MID_LITELLM"
List-based override example ​
- iss : [ "machine-issuer.example.com" , "backup-issuer.example.com" ]
client_id : [ "MID_LITELLM" , "MID_BACKUP" ]
aud : [ "api://litellm" , "api://fallback" ]
[BETA] Control Access with OIDC Roles ​
Allow JWT tokens with supported roles to access the proxy.
Let users and teams access the proxy, without needing to add them to the DB.
Very important, set enforce_rbac: true to ensure that the RBAC system is enabled.
Note: This is in beta and might change unexpectedly.
object_id_jwt_field : "oid" # can be either user / team, inferred from the role mapping
roles_jwt_field : "roles"
role_mappings :
- role : litellm.api.consumer
internal_role : "team"
enforce_rbac : true # 👈 VERY IMPORTANT
role_permissions : # default model + endpoint permissions for a role.
- role : team
models : [ "anthropic-claude" ]
routes : [ "/v1/chat/completions" ]
environment_variables :
JWT_AUDIENCE : "api://LiteLLM_Proxy" # ensures audience is validated
object_id_jwt_field : The field in the JWT token that contains the object id. This id can be either a user id or a team id. Use this instead of user_id_jwt_field and team_id_jwt_field . If the same field could be both. Supports dot notation for nested claims (e.g., "profile.object_id" ).
roles_jwt_field : The field in the JWT token that contains the roles. This field is a list of roles that the user has. Supports dot notation for nested fields - e.g., resource_access.litellm-test-client-id.roles .
Additional JWT Field Configuration Options:
team_ids_jwt_field : Field containing team IDs (as a list). Supports dot notation (e.g., "groups" , "teams.ids" ).
user_email_jwt_field : Field containing user email. Supports dot notation (e.g., "email" , "user.email" ).
end_user_id_jwt_field : Field containing end-user ID for cost tracking. Supports dot notation (e.g., "customer_id" , "customer.id" ).
role_mappings : A list of role mappings. Map the received role in the JWT token to an internal role on LiteLLM.
JWT_AUDIENCE : The audience of the JWT token. This is used to validate the audience of the JWT token. Set via an environment variable.
Example Token ​
"aud": "api://LiteLLM_Proxy",
"oid": "eec236bd-0135-4b28-9354-8fc4032d543e",
"roles": ["litellm.api.consumer"]
Role Mapping Spec ​
role : The expected role in the JWT token.
internal_role : The internal role on LiteLLM that will be used to control access.
Supported internal roles:
team : Team object will be used for RBAC spend tracking. Use this for tracking spend for a 'use case'.
internal_user : User object will be used for RBAC spend tracking. Use this for tracking spend for an 'individual user'.
proxy_admin : Proxy admin will be used for RBAC spend tracking. Use this for granting admin access to a token.
Architecture Diagram (Control Model Access) ​
[BETA] Control Model Access with Scopes ​
Control which models a JWT can access. Set enforce_scope_based_access: true to enforce scope-based access control.
1. Setup config.yaml with scope mappings. ​
- model_name : anthropic - claude
model : anthropic/claude - 3 - 5 - sonnet
api_key : os.environ/ANTHROPIC_API_KEY
- model_name : gpt - 3.5 - turbo - testing
model : gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
team_id_jwt_field : "client_id" # 👈 set the field in the JWT token that contains the team id
team_id_upsert : true # 👈 upsert the team to db, if team id is not found in db
scope_mappings :
- scope : litellm.api.consumer
- scope : litellm.api.gpt_3_5_turbo
models : [ "gpt-3.5-turbo-testing" ]
enforce_scope_based_access : true # 👈 enforce scope-based access control
enforce_rbac : true # 👈 enforces only a Team/User/ProxyAdmin can access the proxy.
Scope Mapping Spec ​
scope : The scope to be used for the JWT token.
models : The models that the JWT token can access. Value is the model_name in model_list . Note: Wildcard routes are not currently supported.
2. Create a JWT with the correct scopes. ​
Expected Token:
"scope": ["litellm.api.consumer", "litellm.api.gpt_3_5_turbo"] # can be a list or a space-separated string
3. Test the flow. ​
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Authorization: Bearer eyJhbGci...' \
"model": "gpt-3.5-turbo-testing",
"messages": [
"role": "user",
"content": "Hey, how'\''s it going 1234?"
]
[BETA] Sync User Roles and Teams with IDP ​
Automatically sync user roles and team memberships from your Identity Provider (IDP) to LiteLLM's database. This ensures that user permissions and team memberships in LiteLLM stay in sync with your IDP.
Use Cases ​
Role Synchronization : Automatically update user roles in LiteLLM when they change in your IDP
Team Membership Sync : Keep team memberships in sync between your IDP and LiteLLM
Centralized Access Management : Manage all user permissions through your IDP while maintaining LiteLLM functionality
Setup ​
1. Configure JWT Role Mapping ​
Map roles from your JWT token to LiteLLM user roles:
sync_user_role_and_teams : true # 👈 Enable sync functionality
jwt_litellm_role_map : # 👈 Map JWT roles to LiteLLM roles
- jwt_role : "ADMIN"
litellm_role : "proxy_admin"
- jwt_role : "USER"
litellm_role : "internal_user"
- jwt_role : "VIEWER"
2. JWT Role Mapping Spec ​
jwt_role : The role name as it appears in your JWT token. Supports wildcard patterns using fnmatch (e.g., "ADMIN_*" matches "ADMIN_READ" , "ADMIN_WRITE" , etc.)
litellm_role : The corresponding LiteLLM user role
Supported LiteLLM Roles:
proxy_admin : Full administrative access
internal_user : Standard user access
internal_user_view_only : Read-only access
3. Example JWT Token ​
"roles" : [ "ADMIN" ] ,
"groups" : [ "team-alpha" , "team-beta" ] ,
"exp" : 1234567890
How It Works ​
When a user makes a request with a JWT token:
Role Sync :
LiteLLM checks if the user's role in the JWT matches their role in the database
If different, the user's role is updated in LiteLLM's database
Uses the jwt_litellm_role_map to convert JWT roles to LiteLLM roles
Team Membership Sync :
Compares team memberships from the JWT token with the user's current teams in LiteLLM
Adds the user to new teams found in the JWT
Removes the user from teams not present in the JWT
Database Updates :
Updates happen automatically during the authentication process
No manual intervention required
Configuration Options ​
# Required fields
# Sync configuration
sync_user_role_and_teams : true
# Role mapping
jwt_litellm_role_map :
- jwt_role : "AI_ADMIN_*" # Wildcard pattern
- jwt_role : "AI_USER"
Important Notes ​
Performance : Sync operations happen during authentication, which may add slight latency
Database Access : Requires database access for user and team updates
Team Creation : Teams mentioned in JWT tokens must exist in LiteLLM before sync can assign users to them
Wildcard Support : JWT role patterns support wildcard matching using fnmatch
Testing the Sync Feature ​
Create a test user with initial role :
curl -X POST 'http://0.0.0.0:4000/user/new' \
"user_id": "user-123",
"user_role": "internal_user"
Make a request with JWT containing different role :
-H 'Authorization: Bearer <JWT_WITH_ADMIN_ROLE>' \
"model": "claude-sonnet-4-20250514",
Verify the role was updated :
curl -X GET 'http://0.0.0.0:4000/user/info?user_id=user-123' \
-H 'Authorization: Bearer <PROXY_MASTER_KEY>'
[BETA] JWT-to-Virtual-Key Mapping ​
Map JWT identities to LiteLLM virtual keys so that JWT-authenticated users get per-user budgets, rate limits, model access controls, and spend tracking.
When a JWT comes in, LiteLLM looks up a configured claim (e.g. email , sub ) in a mapping table. If a mapping exists, the request is treated as if it arrived with the corresponding virtual key — all virtual key features apply.
Add virtual_key_claim_field to your JWT auth config:
virtual_key_claim_field : "email" # JWT claim to look up (supports dot notation)
virtual_key_mapping_cache_ttl : 300 # Cache TTL in seconds (default: 300)
Managing Mappings ​
All endpoints require admin auth ( Authorization: Bearer <master_key> ).
Create a mapping — link a JWT claim value to an existing virtual key:
curl -X POST http://localhost:4000/jwt/key/mapping/new \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
"jwt_claim_name": "email",
"jwt_claim_value": "user@example.com",
"key": "sk-virtual-key-from-key-generate"
List mappings (paginated):
curl http://localhost:4000/jwt/key/mapping/list?page=1&size=50 \
-H "Authorization: Bearer sk-1234"
Get a specific mapping:
curl "http://localhost:4000/jwt/key/mapping/info?id=<mapping-id>" \
Update a mapping:
curl -X POST http://localhost:4000/jwt/key/mapping/update \
"id": "<mapping-id>",
"description": "Updated description",
"is_active": true
Delete a mapping:
curl -X POST http://localhost:4000/jwt/key/mapping/delete \
-d '{"id": "<mapping-id>"}'
A request arrives with a JWT bearer token
LiteLLM validates the JWT signature
Extracts the configured claim (e.g. email → user@example.com )
Looks up the claim value in the LiteLLM_JWTKeyMapping table
If a mapping exists, the request proceeds as if the mapped virtual key was used — budgets, rate limits, model access, and spend tracking all apply
If no mapping exists, falls back to standard JWT auth (team-level controls)
Error Codes ​
Code Meaning 409 Duplicate mapping — a mapping for that claim name + value already exists 400 The provided key does not match an existing virtual key 404 Mapping not found (for update/delete/info) 403 Non-admin user attempted a mapping operation
All JWT Params ​
Usage
Step 1. Setup Proxy
Step 2. Create JWT with scopes
Step 3. Test your JWT
Advanced
Multiple OIDC providers
Kubernetes ServiceAccount Authentication
Set Accepted JWT Scope Names
Tracking End-Users / Internal Users / Team / Org
Resolve by Name (Alias) Instead of ID
JWT Scopes
Control model access with Teams
Flow
Select Team via Request Header
Fall back to DB team when JWT claims don't resolve
Custom JWT Validate
Allowed Routes
Allowing other provider routes for Teams
Caching Public Keys
Custom JWT Field
Block Teams
Upsert Users + Allowed Email Domains
OIDC UserInfo Endpoint
When to Use
Configuration
Flow Diagram
Example: Azure AD
Example: Keycloak
Route JWT-Shaped Machine Tokens to OAuth2
Matching behavior
Example: scope and wildcard client_id
List-based override example
[BETA] Control Access with OIDC Roles
Example Token
Role Mapping Spec
Architecture Diagram (Control Model Access)
[BETA] Control Model Access with Scopes
1. Setup config.yaml with scope mappings.
2. Create a JWT with the correct scopes.
3. Test the flow.
[BETA] Sync User Roles and Teams with IDP
Use Cases
Setup
How It Works
Configuration Options
Important Notes
Testing the Sync Feature
[BETA] JWT-to-Virtual-Key Mapping
Managing Mappings
Error Codes
All JWT Params
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
