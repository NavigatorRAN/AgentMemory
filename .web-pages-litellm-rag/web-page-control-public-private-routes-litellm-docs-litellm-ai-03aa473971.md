# Control Public & Private Routes | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/public_routes
- Final URL: https://docs.litellm.ai/docs/proxy/public_routes
- Canonical URL: https://docs.litellm.ai/docs/proxy/public_routes
- Fetched at: 2026-06-23T14:31:50Z
- Content type: text/html; charset=utf-8

## Description

Requires a LiteLLM Enterprise License. Get a free trial.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
Requires a LiteLLM Enterprise License. Get a free trial .
Control which routes require authentication and which routes are publicly accessible.
Route Types ​
Route Type Requires Auth Description public_routes No Routes accessible without any authentication admin_only_routes Yes (Admin only) Routes only accessible by Proxy Admin allowed_routes Yes Routes exposed on the proxy. If not set, all routes are exposed
Quick Start ​
Make Routes Public ​
Allow specific routes to be accessed without authentication:
general_settings :
master_key : sk - 1234
public_routes : [ "LiteLLMRoutes.public_routes" , "/spend/calculate" ]
Restrict Routes to Admin Only ​
Restrict certain routes to only be accessible by Proxy Admin:
admin_only_routes : [ "/key/generate" , "/key/delete" ]
Limit Available Routes ​
Only expose specific routes on the proxy:
allowed_routes : [ "/chat/completions" , "/embeddings" , "LiteLLMRoutes.public_routes" ]
Usage Examples ​
Define Public, Admin Only, and Allowed Routes ​
admin_only_routes : [ "/key/generate" ]
allowed_routes : [ "/chat/completions" , "/spend/calculate" , "LiteLLMRoutes.public_routes" ]
LiteLLMRoutes.public_routes is an ENUM corresponding to the default public routes on LiteLLM. View the source .
Testing ​
Test public_routes
Test admin_only_routes
Test allowed_routes
curl --request POST \
--url 'http://localhost:4000/spend/calculate' \
--header 'Content-Type: application/json' \
--data '{
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hey, how'\''s it going?"}]
}'
This endpoint works without an Authorization header.
Successful Request (Admin)
curl --location 'http://0.0.0.0:4000/key/generate' \
--header 'Authorization: Bearer <your-master-key>' \
--data '{}'
Unsuccessful Request (Non-Admin)
--header 'Authorization: Bearer <virtual-key-from-non-admin>' \
--data '{"user_role": "internal_user"}'
Expected Response
{
"error" : {
"message" : "user not allowed to access this route. Route=/key/generate is an admin only route" ,
"type" : "auth_error" ,
"param" : "None" ,
"code" : "403"
}
Successful Request
curl http://localhost:4000/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "fake-openai-endpoint",
"messages": [
{"role": "user", "content": "Hello, Claude"}
]
Unsuccessful Request (Route Not Allowed)
curl --location 'http://0.0.0.0:4000/embeddings' \
"model": "text-embedding-ada-002",
"input": ["write a litellm poem"]
"message" : "Route /embeddings not allowed" ,
Advanced: Wildcard Patterns ​
Use wildcard patterns to match multiple routes at once.
Syntax ​
Pattern Description Example /path/* Matches any route starting with /path/ /api/* matches /api/users , /api/users/123
Examples ​
Make All Routes Under a Path Public ​
public_routes :
- "LiteLLMRoutes.public_routes"
- "/api/v1/*" # All routes under /api/v1/
- "/health/*" # All health check routes
Restrict Admin Routes with Wildcards ​
admin_only_routes :
- "/admin/*" # All admin routes
- "/internal/*" # All internal routes
Testing Wildcard Routes ​
Config:
- "/public/*"
Test:
# This works without auth (matches /public/*)
curl http://localhost:4000/public/status
# This also works without auth (matches /public/*)
curl http://localhost:4000/public/health/detailed
# This requires auth (doesn't match /public/*)
curl http://localhost:4000/private/data
Route Types
Quick Start
Make Routes Public
Restrict Routes to Admin Only
Limit Available Routes
Usage Examples
Define Public, Admin Only, and Allowed Routes
Testing
Advanced: Wildcard Patterns
Syntax
Examples
Testing Wildcard Routes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
