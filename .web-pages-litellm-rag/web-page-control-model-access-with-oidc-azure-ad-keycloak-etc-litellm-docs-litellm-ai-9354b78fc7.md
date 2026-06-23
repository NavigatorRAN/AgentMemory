# Control Model Access with OIDC (Azure AD/Keycloak/etc.) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/jwt_auth_arch
- Final URL: https://docs.litellm.ai/docs/proxy/jwt_auth_arch
- Canonical URL: https://docs.litellm.ai/docs/proxy/jwt_auth_arch
- Fetched at: 2026-06-23T14:31:12Z
- Content type: text/html; charset=utf-8

## Description

✨ JWT Auth is on LiteLLM Enterprise

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
✨ JWT Auth is on LiteLLM Enterprise
Enterprise Pricing
Get free 7-day trial key
Example Token ​
Azure AD
Keycloak
{
"sub": "1234567890",
"name": "John Doe",
"email": "john.doe@example.com",
"roles": ["basic_user"] # 👈 ROLE
}
"resource_access": {
"litellm-test-client-id": {
Proxy Configuration ​
general_settings :
enable_jwt_auth : True
litellm_jwtauth :
user_roles_jwt_field : "roles" # the field in the JWT that contains the roles
user_allowed_roles : [ "basic_user" ] # roles that map to an 'internal_user' role on LiteLLM
enforce_rbac : true # if true, will check if the user has the correct role to access the model
role_permissions : # control what models are allowed for each role
- role : internal_user
models : [ "anthropic-claude" ]
model_list :
- model : anthropic - claude
litellm_params :
model : claude - 3 - 5 - haiku - 20241022
- model : openai - gpt - 4o
model : gpt - 4o
user_roles_jwt_field : "resource_access.litellm-test-client-id.roles" # the field in the JWT that contains the roles
How it works ​
Specify JWT_PUBLIC_KEY_URL - This is the public keys endpoint of your OpenID provider. For Azure AD it's https://login.microsoftonline.com/{tenant_id}/discovery/v2.0/keys . For Keycloak it's {keycloak_base_url}/realms/{your-realm}/protocol/openid-connect/certs .
Map JWT roles to LiteLLM roles - Done via user_roles_jwt_field and user_allowed_roles
Currently just internal_user is supported for role mapping.
Specify model access:
role_permissions : control what models are allowed for each role.
role : the LiteLLM role to control access for. Allowed roles = ["internal_user", "proxy_admin", "team"]
models : list of models that the role is allowed to access.
model_list : parent list of models on the proxy. Learn more
Model Checks: The proxy will run validation checks on the received JWT. Code
Example Token
Proxy Configuration
How it works
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
