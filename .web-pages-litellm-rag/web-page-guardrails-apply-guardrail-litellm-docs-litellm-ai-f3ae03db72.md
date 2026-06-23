# /guardrails/apply_guardrail | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/apply_guardrail
- Final URL: https://docs.litellm.ai/docs/apply_guardrail
- Canonical URL: https://docs.litellm.ai/docs/apply_guardrail
- Fetched at: 2026-06-23T14:22:49Z
- Content type: text/html; charset=utf-8

## Description

Use this endpoint to directly call a guardrail configured on your LiteLLM instance. This is useful when you have services that need to directly call a guardrail.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this endpoint to directly call a guardrail configured on your LiteLLM instance. This is useful when you have services that need to directly call a guardrail.
Supported Guardrail Types ​
This endpoint supports various guardrail types including:
Presidio - PII detection and masking
Bedrock - AWS Bedrock guardrails for content moderation
Lakera - AI safety guardrails
PANW Prisma AIRS - Threat detection, DLP, and policy enforcement
Custom guardrails - User-defined guardrails
Configuration ​
Bedrock Guardrail Configuration ​
To use Bedrock guardrails with the apply_guardrail endpoint, configure your guardrail in your LiteLLM config.yaml:
guardrails :
- guardrail_name : "bedrock-content-guard"
litellm_params :
guardrail : bedrock
mode : "pre_call"
guardrailIdentifier : "your-guardrail-id" # Your actual Bedrock guardrail ID
guardrailVersion : "DRAFT" # or your version number
aws_region_name : "us-east-1" # Your AWS region
aws_role_name : "your-role-arn" # Your AWS role with Bedrock permissions
default_on : true
Required AWS Setup:
Create a Bedrock guardrail in AWS Console
Get the guardrail ID and version
Ensure your AWS credentials have Bedrock permissions
Configure the guardrail in your LiteLLM config
Usage ​
Presidio PII Guardrail
Bedrock Guardrail
In this example mask_pii is a Presidio guardrail configured on LiteLLM.
Example calling the endpoint
curl -X POST 'http://localhost:4000/guardrails/apply_guardrail' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer your-api-key' \
-d '{
"guardrail_name": "mask_pii",
"text": "My name is John Doe and my email is john@example.com",
"language": "en",
"entities": ["NAME", "EMAIL"]
}'
In this example bedrock-content-guard is a Bedrock guardrail configured on LiteLLM.
"guardrail_name": "bedrock-content-guard",
"text": "This is potentially harmful content that should be blocked",
"language": "en"
Note : For Bedrock guardrails, the entities parameter is not used as Bedrock handles content moderation based on its own policies.
Request Format ​
The request body should follow the ApplyGuardrailRequest format.
Example Request Body ​
{
"guardrail_name" : "mask_pii" ,
"text" : "My name is John Doe and my email is john@example.com" ,
"language" : "en" ,
"entities" : [ "NAME" , "EMAIL" ]
}
Required Fields ​
guardrail_name (string):
The identifier for the guardrail to apply (e.g., "mask_pii").
text (string):
The input text to process through the guardrail.
Optional Fields ​
language (string):
The language of the input text (e.g., "en" for English).
entities (array of strings):
Specific entities to process or filter (e.g., ["NAME", "EMAIL"]).
Response Format ​
The response will contain the processed text after applying the guardrail.
Example Response ​
Presidio Response
Bedrock Response
"response_text" : "My name is [REDACTED] and my email is [REDACTED]"
"response_text" : "This is potentially harmful content that should be blocked"
Note : If Bedrock guardrail blocks the content, the endpoint will return an error with the blocking reason.
Response Fields ​
response_text (string):
The text after applying the guardrail.
Error Responses ​
If a guardrail blocks content (e.g., Bedrock guardrail), the endpoint will return an error:
"detail" : "Content blocked by Bedrock guardrail: Content violates policy"
Supported Guardrail Types
Configuration
Bedrock Guardrail Configuration
Usage
Request Format
Response Format
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
