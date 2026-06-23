# Presidio PII Masking with LiteLLM - Complete Tutorial | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/presidio_pii_masking
- Final URL: https://docs.litellm.ai/docs/tutorials/presidio_pii_masking
- Canonical URL: https://docs.litellm.ai/docs/tutorials/presidio_pii_masking
- Fetched at: 2026-06-23T14:34:36Z
- Content type: text/html; charset=utf-8

## Description

This tutorial will guide you through setting up PII (Personally Identifiable Information) masking with Microsoft Presidio and LiteLLM Gateway. By the end of this tutorial, you'll have a production-ready setup that automatically detects and masks sensitive information in your LLM requests.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This tutorial will guide you through setting up PII (Personally Identifiable Information) masking with Microsoft Presidio and LiteLLM Gateway. By the end of this tutorial, you'll have a production-ready setup that automatically detects and masks sensitive information in your LLM requests.
What You'll Learn ​
Deploy Presidio containers for PII detection
Configure LiteLLM to automatically mask sensitive data
Test PII masking with real examples
Monitor and trace guardrail execution
Configure advanced features like output parsing and language support
Why Use PII Masking? ​
When working with LLMs, users may inadvertently share sensitive information like:
Credit card numbers
Email addresses
Phone numbers
Social Security Numbers
Medical information (PHI)
Personal names and addresses
PII masking automatically detects and redacts this information before it reaches the LLM, protecting user privacy and helping you comply with regulations like GDPR, HIPAA, and CCPA.
Prerequisites ​
Before starting this tutorial, ensure you have:
Docker installed on your machine
A LiteLLM API key or OpenAI API key for testing
Basic familiarity with YAML configuration
curl or a similar HTTP client for testing
Part 1: Deploy Presidio Containers ​
Presidio consists of two main services:
Presidio Analyzer : Detects PII in text
Presidio Anonymizer : Masks or redacts the detected PII
Step 1.1: Deploy with Docker ​
Create a docker-compose.yml file for Presidio:
version : '3.8'
services :
presidio-analyzer :
image : mcr.microsoft.com/presidio - analyzer : latest
ports :
- "5002:3000"
environment :
- GRPC_PORT=5001
networks :
- presidio - network
presidio-anonymizer :
image : mcr.microsoft.com/presidio - anonymizer : latest
- "5001:3000"
presidio-network :
driver : bridge
Step 1.2: Start the Containers ​
docker-compose up -d
Step 1.3: Verify Presidio is Running ​
Test the analyzer endpoint:
curl -X POST http://localhost:5002/analyze \
-H "Content-Type: application/json" \
-d '{
"text": "My email is john.doe@example.com",
"language": "en"
}'
You should see a response like:
[
{
"entity_type" : "EMAIL_ADDRESS" ,
"start" : 12 ,
"end" : 33 ,
"score" : 1.0
}
]
✅ Checkpoint : Your Presidio containers are now running and ready!
Part 2: Configure LiteLLM Gateway ​
Now let's configure LiteLLM to use Presidio for automatic PII masking.
Step 2.1: Create LiteLLM Configuration ​
Create a config.yaml file:
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "presidio-pii-guard"
guardrail : presidio
mode : "pre_call" # Run before LLM call
presidio_score_thresholds : # optional confidence score thresholds for detections
CREDIT_CARD : 0.8
EMAIL_ADDRESS : 0.6
pii_entities_config :
CREDIT_CARD : "MASK"
EMAIL_ADDRESS : "MASK"
PHONE_NUMBER : "MASK"
PERSON : "MASK"
US_SSN : "MASK"
Step 2.2: Set Environment Variables ​
export OPENAI_API_KEY="your-openai-key"
export PRESIDIO_ANALYZER_API_BASE="http://localhost:5002"
export PRESIDIO_ANONYMIZER_API_BASE="http://localhost:5001"
Step 2.3: Start LiteLLM Gateway ​
litellm --config config.yaml --port 4000 --detailed_debug
You should see output indicating the guardrails are loaded:
Loaded guardrails: ['presidio-pii-guard']
✅ Checkpoint : LiteLLM Gateway is running with PII masking enabled!
Part 3: Test PII Masking ​
Let's test the PII masking with various types of sensitive data.
Test 1: Basic PII Detection ​
Request with PII
What LLM Receives
Response
curl -X POST http://localhost:4000/chat/completions \
-H "Authorization: Bearer sk-1234" \
"model": "gpt-3.5-turbo",
"messages": [
"role": "user",
"content": "My name is John Smith, my email is john.smith@example.com, and my credit card is 4111-1111-1111-1111"
],
"guardrails": ["presidio-pii-guard"]
The LLM will receive the masked version:
My name is <PERSON>, my email is <EMAIL_ADDRESS>, and my credit card is <CREDIT_CARD>
"id" : "chatcmpl-123abc" ,
"choices" : [
"message" : {
"content" : "I can see you've provided some information. However, I noticed some sensitive data placeholders. For security reasons, I recommend not sharing actual personal information like credit card numbers." ,
"role" : "assistant"
} ,
"finish_reason" : "stop"
] ,
"model" : "gpt-3.5-turbo"
Test 2: Medical Information (PHI) ​
"content": "Patient Jane Doe, DOB 01/15/1980, MRN 123456, presents with symptoms of fever."
The patient name and medical record number will be automatically masked.
Test 3: No PII (Normal Request) ​
"content": "What is the capital of France?"
This request passes through unchanged since there's no PII detected.
✅ Checkpoint : You've successfully tested PII masking!
Part 4: Advanced Configurations ​
Blocking Sensitive Entities ​
Instead of masking, you can completely block requests containing specific PII types:
- guardrail_name : "presidio-block-guard"
mode : "pre_call"
US_SSN : "BLOCK" # Block any request with SSN
CREDIT_CARD : "BLOCK" # Block credit card numbers
MEDICAL_LICENSE : "BLOCK"
Test the blocking behavior:
{"role": "user", "content": "My SSN is 123-45-6789"}
"guardrails": ["presidio-block-guard"]
Expected response:
"error" : {
"message" : "Blocked PII entity detected: US_SSN by Guardrail: presidio-block-guard."
Output Parsing (Unmasking) ​
Enable output parsing to automatically replace masked tokens in LLM responses with original values:
- guardrail_name : "presidio-output-parse"
output_parse_pii : true # Enable output parsing
How it works:
User Input : "Hello, my name is Jane Doe. My number is 555-1234"
LLM Receives : "Hello, my name is <PERSON> . My number is <PHONE_NUMBER> "
LLM Response : "Nice to meet you, <PERSON> !"
User Receives : "Nice to meet you, Jane Doe!" ✨
Multi-language Support ​
Configure PII detection for different languages:
- guardrail_name : "presidio-spanish"
presidio_language : "es" # Spanish
- guardrail_name : "presidio-german"
presidio_language : "de" # German
You can also override language per request:
{"role": "user", "content": "Mi tarjeta de crédito es 4111-1111-1111-1111"}
"guardrails": ["presidio-spanish"],
"guardrail_config": {"language": "fr"}
Logging-Only Mode ​
Apply PII masking only to logs (not to actual LLM requests):
- guardrail_name : "presidio-logging"
mode : "logging_only" # Only mask in logs
This is useful when:
You want to allow PII in production requests
But need to comply with logging regulations
Integrating with Langfuse, Datadog, etc.
Part 5: Monitoring and Tracing ​
View Guardrail Execution on LiteLLM UI ​
If you're using the LiteLLM Admin UI, you can see detailed guardrail traces:
Navigate to the Logs page
Click on any request that used the guardrail
View detailed information:
Which entities were detected
Confidence scores for each detection
Guardrail execution duration
Original vs. masked content
Integration with Langfuse ​
If you're logging to Langfuse, guardrail information is automatically included:
litellm_settings :
success_callback : [ "langfuse" ]
environment_variables :
LANGFUSE_PUBLIC_KEY : "your-public-key"
LANGFUSE_SECRET_KEY : "your-secret-key"
Programmatic Access to Guardrail Metadata ​
You can access guardrail metadata in custom callbacks:
import litellm
def custom_callback ( kwargs , result , ** callback_kwargs ) :
# Access guardrail metadata
metadata = kwargs . get ( "metadata" , { } )
guardrail_results = metadata . get ( "guardrails" , { } )
print ( f"Masked entities: { guardrail_results } " )
litellm . callbacks = [ custom_callback ]
Part 6: Production Best Practices ​
1. Performance Optimization ​
Use parallel execution for pre-call guardrails:
- guardrail_name : "presidio-guard"
mode : "during_call" # Runs in parallel with LLM call
2. Configure Entity Types by Use Case ​
Healthcare Application:
US_SSN : "BLOCK"
DATE_TIME : "MASK" # May contain appointment dates
Financial Application:
CREDIT_CARD : "BLOCK"
US_BANK_NUMBER : "BLOCK"
Customer Support Application:
CREDIT_CARD : "BLOCK" # Should never be shared
3. High Availability Setup ​
For production deployments, run multiple Presidio instances:
presidio-analyzer-1 :
deploy :
replicas : 3
presidio-anonymizer-1 :
Use a load balancer (nginx, HAProxy) to distribute requests.
4. Custom Entity Recognition ​
For domain-specific PII (e.g., internal employee IDs), create custom recognizers:
Create custom_recognizers.json :
"supported_language" : "en" ,
"supported_entity" : "EMPLOYEE_ID" ,
"patterns" : [
"name" : "employee_id_pattern" ,
"regex" : "EMP-[0-9]{6}" ,
"score" : 0.9
Configure in LiteLLM:
- guardrail_name : "presidio-custom"
presidio_ad_hoc_recognizers : "./custom_recognizers.json"
EMPLOYEE_ID : "MASK"
5. Testing Strategy ​
Create test cases for your PII masking:
import pytest
from litellm import completion
def test_pii_masking_credit_card ( ) :
"""Test that credit cards are properly masked"""
response = completion (
model = "gpt-3.5-turbo" ,
messages = [ {
"role" : "user" ,
"content" : "My card is 4111-1111-1111-1111"
} ] ,
api_base = "http://localhost:4000" ,
metadata = {
"guardrails" : [ "presidio-pii-guard" ]
)
# Verify the card number was masked
metadata = response . get ( "_hidden_params" , { } ) . get ( "metadata" , { } )
assert "CREDIT_CARD" in str ( metadata . get ( "guardrails" , { } ) )
def test_pii_masking_allows_normal_text ( ) :
"""Test that normal text passes through"""
"content" : "What is the weather today?"
assert response . choices [ 0 ] . message . content is not None
Part 7: Troubleshooting ​
Issue: Guardrail failure: non-JSON response from Presidio ​
Symptom: You receive an error indicating expected application/json Content-Type but received text/html or similar.
Root cause: Your ingress controller or reverse proxy might be routing the /analyze or /anonymize POST request to a health endpoint (like /health or /presidio-analyzer/health ) which returns plain text instead of JSON.
Fix: Ensure your PRESIDIO_ANALYZER_API_BASE and PRESIDIO_ANONYMIZER_API_BASE are correctly pointing directly to the Presidio API endpoints, or that your ingress routes the path correctly without stripping it and inadvertently forwarding to a plain-text health check endpoint.
Verification: You can verify your endpoints using curl . It should return a JSON array, not text/html :
curl -sv -X POST http://your-analyzer-endpoint/analyze \
-d '{"text":"test","language":"en"}'
Issue: Presidio Not Detecting PII ​
Check 1: Language Configuration
# Verify language is set correctly
"text": "Meine E-Mail ist test@example.de",
"language": "de"
Check 2: Entity Types
Ensure the entity types you're looking for are in your config:
# Add all entity types you need
View all supported entity types
Issue: Presidio Containers Not Starting ​
Check logs:
docker-compose logs presidio-analyzer
docker-compose logs presidio-anonymizer
Common issues:
Port conflicts (5001, 5002 already in use)
Insufficient memory allocation
Docker network issues
Issue: High Latency ​
Solution 1: Use during_call mode
mode : "during_call" # Runs in parallel
Solution 2: Scale Presidio containers
Solution 3: Enable caching
cache : true
cache_params :
type : "redis"
Conclusion ​
Congratulations! 🎉 You've successfully set up PII masking with Presidio and LiteLLM. You now have:
✅ A production-ready PII masking solution
✅ Automatic detection of sensitive information
✅ Multiple configuration options (masking vs. blocking)
✅ Monitoring and tracing capabilities
✅ Multi-language support
✅ Best practices for production deployment
Next Steps ​
View all supported PII entity types
Explore other LiteLLM guardrails
Set up multiple guardrails
Configure per-key guardrails
Learn about custom guardrails
Additional Resources ​
Presidio Documentation
LiteLLM Guardrails Reference
LiteLLM GitHub Repository
Report Issues
Need help? Join our Discord community or open an issue on GitHub!
Suppressing False Positives ​
Presidio can sometimes trigger false positive detections. For example, short alphanumeric strings might be incorrectly flagged as US_DRIVER_LICENSE .
You can suppress these false positives using presidio_score_thresholds or presidio_entities_deny_list .
- guardrail_name : presidio - pii
presidio_analyzer_api_base : "http://localhost:5002/"
presidio_anonymizer_api_base : "http://localhost:5001/"
# Use high score thresholds to reduce false positives
presidio_score_thresholds :
US_DRIVER_LICENSE : 0.85
ALL : 0.5
# Or exclude certain entity types entirely from detection
presidio_entities_deny_list :
- US_DRIVER_LICENSE
What You'll Learn
Why Use PII Masking?
Prerequisites
Part 1: Deploy Presidio Containers
Step 1.1: Deploy with Docker
Step 1.2: Start the Containers
Step 1.3: Verify Presidio is Running
Part 2: Configure LiteLLM Gateway
Step 2.1: Create LiteLLM Configuration
Step 2.2: Set Environment Variables
Step 2.3: Start LiteLLM Gateway
Part 3: Test PII Masking
Test 1: Basic PII Detection
Test 2: Medical Information (PHI)
Test 3: No PII (Normal Request)
Part 4: Advanced Configurations
Blocking Sensitive Entities
Output Parsing (Unmasking)
Multi-language Support
Logging-Only Mode
Part 5: Monitoring and Tracing
View Guardrail Execution on LiteLLM UI
Integration with Langfuse
Programmatic Access to Guardrail Metadata
Part 6: Production Best Practices
1. Performance Optimization
2. Configure Entity Types by Use Case
3. High Availability Setup
4. Custom Entity Recognition
5. Testing Strategy
Part 7: Troubleshooting
Issue: Guardrail failure: non-JSON response from Presidio
Issue: Presidio Not Detecting PII
Issue: Presidio Containers Not Starting
Issue: High Latency
Conclusion
Next Steps
Additional Resources
Suppressing False Positives
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
