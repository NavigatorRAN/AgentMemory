# [New] Fallback Management Endpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/fallback_management
- Final URL: https://docs.litellm.ai/docs/proxy/fallback_management
- Canonical URL: https://docs.litellm.ai/docs/proxy/fallback_management
- Fetched at: 2026-06-23T14:30:15Z
- Content type: text/html; charset=utf-8

## Description

Dedicated endpoints for managing model fallbacks separately from the general configuration.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Dedicated endpoints for managing model fallbacks separately from the general configuration.
Overview ​
These endpoints allow you to configure, retrieve, and delete fallback models without modifying the entire proxy configuration. This provides a cleaner and safer way to manage fallbacks compared to using the /config/update endpoint.
Prerequisites ​
Database storage must be enabled: Set STORE_MODEL_IN_DB=True in your environment
Models must exist in the router before configuring fallbacks
Endpoints ​
POST /fallback ​
Create or update fallbacks for a specific model.
Request Body:
{
"model" : "gpt-3.5-turbo" ,
"fallback_models" : [ "gpt-4" , "claude-3-haiku" ] ,
"fallback_type" : "general"
}
Parameters:
model (string, required): The primary model name to configure fallbacks for
fallback_models (array of strings, required): List of fallback model names in priority order
fallback_type (string, optional): Type of fallback. Options:
"general" (default): Standard fallbacks for any error
"context_window" : Fallbacks for context window exceeded errors
"content_policy" : Fallbacks for content policy violations
Response:
"fallback_type" : "general" ,
"message" : "Fallback configuration created successfully"
Example using cURL:
curl -X POST "http://localhost:4000/fallback" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "gpt-3.5-turbo",
"fallback_models": ["gpt-4", "claude-3-haiku"],
"fallback_type": "general"
}'
Example using Python:
import requests
response = requests . post (
"http://localhost:4000/fallback" ,
headers = {
"Authorization" : "Bearer sk-1234" ,
"Content-Type" : "application/json"
} ,
json = {
)
print ( response . json ( ) )
GET /fallback/{model} ​
Get fallback configuration for a specific model.
model (path parameter, required): The model name to get fallbacks for
fallback_type (query parameter, optional): Type of fallback to retrieve (default: "general")
curl -X GET "http://localhost:4000/fallback/gpt-3.5-turbo?fallback_type=general" \
-H "Authorization: Bearer sk-1234"
response = requests . get (
"http://localhost:4000/fallback/gpt-3.5-turbo" ,
headers = { "Authorization" : "Bearer sk-1234" } ,
params = { "fallback_type" : "general" }
DELETE /fallback/{model} ​
Delete fallback configuration for a specific model.
model (path parameter, required): The model name to delete fallbacks for
fallback_type (query parameter, optional): Type of fallback to delete (default: "general")
"message" : "Fallback configuration deleted successfully"
curl -X DELETE "http://localhost:4000/fallback/gpt-3.5-turbo?fallback_type=general" \
response = requests . delete (
Test fallback ​
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
"messages": [
"role": "user",
"content": "ping"
],
"mock_testing_fallbacks": true
'
Validation ​
The endpoints perform the following validations:
Model Existence : Verifies that the primary model exists in the router
Fallback Model Existence : Ensures all fallback models exist in the router
No Self-Fallback : Prevents a model from being its own fallback
No Duplicates : Ensures no duplicate models in the fallback list
Database Enabled : Requires STORE_MODEL_IN_DB=True to be set
Error Responses ​
400 Bad Request ​
"detail" : {
"error" : "Invalid fallback models: ['non-existent-model']" ,
"available_models" : [ "gpt-3.5-turbo" , "gpt-4" , "claude-3-haiku" ]
404 Not Found ​
"error" : "Model 'gpt-3.5-turbo' not found in router" ,
"available_models" : [ "gpt-4" , "claude-3-haiku" ]
500 Internal Server Error ​
"error" : "Router not initialized"
Fallback Types Explained ​
General Fallbacks ​
Used for any type of error that occurs during model invocation. This is the most common type of fallback.
Use Case: When a model is unavailable, rate-limited, or returns an error.
Context Window Fallbacks ​
Specifically triggered when a context window exceeded error occurs.
Use Case: When the input is too long for the primary model, fallback to a model with a larger context window.
"fallback_models" : [ "gpt-4-32k" , "claude-3-opus" ] ,
"fallback_type" : "context_window"
Content Policy Fallbacks ​
Specifically triggered when content policy violations occur.
Use Case: When the primary model rejects content due to safety filters, fallback to a model with different content policies.
"model" : "gpt-4" ,
"fallback_models" : [ "claude-3-haiku" ] ,
"fallback_type" : "content_policy"
Benefits Over /config/update ​
Safety : Only modifies fallback configuration, won't accidentally change other settings
Simplicity : Focused API with clear validation messages
Granularity : Manage fallbacks per model and per type
Validation : Comprehensive checks ensure configuration is valid before applying
Clarity : Clear error messages with available models listed
Notes ​
Fallbacks are triggered after the configured number of retries fails
Fallbacks are attempted in the order specified in fallback_models
The maximum number of fallbacks attempted is controlled by the router's max_fallbacks setting
Changes take effect immediately and are persisted to the database
Overview
Prerequisites
Endpoints
POST /fallback
GET /fallback/{model}
DELETE /fallback/{model}
Test fallback
Validation
Error Responses
400 Bad Request
404 Not Found
500 Internal Server Error
Fallback Types Explained
General Fallbacks
Context Window Fallbacks
Content Policy Fallbacks
Benefits Over /config/update
Notes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
