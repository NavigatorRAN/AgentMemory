# LiteLLM Content Filter (Built-in Guardrails) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/litellm_content_filter
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/litellm_content_filter
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/litellm_content_filter
- Fetched at: 2026-06-23T14:30:38Z
- Content type: text/html; charset=utf-8

## Description

Built-in guardrail for detecting and filtering sensitive information using regex patterns and keyword matching. No external dependencies required.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Built-in guardrail for detecting and filtering sensitive information using regex patterns and keyword matching. No external dependencies required.
When to use? Good for cases which do not require an ML model to detect sensitive information.
Overview ​
Property Details Description On-device guardrail for detecting and filtering sensitive information using regex patterns and keyword matching. Built into LiteLLM with no external dependencies. Guardrail Name litellm_content_filter Detection Methods Prebuilt regex patterns, custom regex, keyword matching Actions BLOCK (reject request), MASK (redact content) Supported Modes pre_call , post_call , during_call (streaming) Performance Fast - runs locally, no external API calls
Quick Start ​
LiteLLM UI ​
Step 1: Select LiteLLM Content Filter ​
Click "Add New Guardrail" and select "LiteLLM Content Filter" as your guardrail provider.
Step 2: Configure Pattern Detection ​
Select the prebuilt entities you want to block or mask. In this example, we select "Email" to detect and block email addresses.
If you need to block a custom entity, you can add a custom regex pattern by clicking "Add custom regex".
Step 3: Add Blocked Keywords ​
Enter specific keywords you want to block. This is useful if you have policies to block certain words or phrases.
Step 4: Test Your Guardrail ​
After creating the guardrail, navigate to "Test Playground" to test it. Select the guardrail you just created.
Test examples:
Blocked keyword test : Entering "hi blue" will trigger the block since we set "blue" as a blocked keyword
Pattern detection test : Entering "Hi ishaan@berri.ai " will trigger the email pattern detector
LiteLLM Config.yaml Setup ​
Step 1: Define Guardrails in config.yaml ​
Harmful Content Detection
PII Protection
Combined
config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "harmful-content-filter"
guardrail : litellm_content_filter
mode : "pre_call"
# Enable harmful content categories
categories :
- category : "harmful_self_harm"
enabled : true
action : "BLOCK"
severity_threshold : "medium"
- category : "harmful_violence"
- category : "harmful_illegal_weapons"
- guardrail_name : "content-filter-pre"
# Prebuilt patterns for common PII
patterns :
- pattern_type : "prebuilt"
pattern_name : "us_ssn"
pattern_name : "email"
action : "MASK"
# Custom blocked keywords
blocked_words :
- keyword : "confidential"
description : "Sensitive internal information"
- guardrail_name : "comprehensive-filter"
# Harmful content categories
severity_threshold : "high"
# PII patterns
# Custom keywords
Step 2: Start LiteLLM Gateway ​
litellm --config config.yaml
Step 3: Test Request ​
SSN Blocked
Email Masked
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "My SSN is 123-45-6789"}
],
"guardrails": ["content-filter-pre"]
}'
Response: HTTP 400 Error
{
"error" : {
"message" : {
"error" : "Content blocked: us_ssn pattern detected" ,
"pattern" : "us_ssn"
} ,
"code" : "400"
}
{"role": "user", "content": "Contact me at john@example.com"}
The request is sent to the LLM with the email masked:
Contact me at [EMAIL_REDACTED]
Configuration ​
Supported Modes ​
pre_call - Run before LLM call, filters input messages
post_call - Run after LLM call, filters output responses
during_call - Run during streaming, filters each chunk in real-time
Actions ​
BLOCK - Reject the request with HTTP 400 error
MASK - Replace sensitive content with redaction tags (e.g., [EMAIL_REDACTED] )
Prebuilt Patterns ​
Available Patterns ​
Pattern Name Description Example us_ssn US Social Security Numbers 123-45-6789 email Email addresses user@example.com phone Phone numbers +1-555-123-4567 visa Visa credit cards 4532-1234-5678-9010 mastercard Mastercard credit cards 5425-2334-3010-9903 amex American Express cards 3782-822463-10005 aws_access_key AWS access keys AKIAIOSFODNN7EXAMPLE aws_secret_key AWS secret keys wJalrXUtnFEMI/K7MDENG/bPxRfi... github_token GitHub tokens example-github-token-123
Using Prebuilt Patterns ​
- guardrail_name : "pii-filter"
pattern_name : "aws_access_key"
Custom Regex Patterns ​
Define your own regex patterns for domain-specific sensitive data:
- guardrail_name : "custom-patterns"
# Custom employee ID format
- pattern_type : "regex"
pattern : '\b[A-Z]{3}-\d{4}\b'
name : "employee_id"
# Custom project code format
pattern : 'PROJECT-\d{6}'
name : "project_code"
Keyword Filtering ​
Block or mask specific keywords:
- guardrail_name : "keyword-filter"
description : "Internal confidential information"
- keyword : "proprietary"
description : "Proprietary company data"
- keyword : "secret_project"
Loading Keywords from File ​
For large keyword lists, use a YAML file:
- guardrail_name : "keyword-file-filter"
blocked_words_file : "/path/to/sensitive_keywords.yaml"
sensitive_keywords.yaml
- keyword : "project_apollo"
description : "Confidential project codename"
- keyword : "internal_api"
description : "Internal API references"
- keyword : "customer_database"
description : "Protected database name"
Streaming Support ​
Content filter works with streaming responses by checking each chunk:
- guardrail_name : "streaming-filter"
mode : "during_call" # Check each streaming chunk
import openai
client = openai . OpenAI (
api_key = "sk-1234" ,
base_url = "http://localhost:4000"
)
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Tell me about yourself" } ] ,
stream = True ,
extra_body = { "guardrails" : [ "streaming-filter" ] }
for chunk in response :
print ( chunk . choices [ 0 ] . delta . content )
# Emails automatically masked in real-time
Image Content Filtering ​
Content filter can analyze images by generating descriptions and applying filters to the text descriptions.
warning
This can introduce significant latency to the request - depending on the speed of the vision-capable model.
This is because, each request containing images will be sent to the vision-capable model to generate a description.
- model_name : gpt - 4 - vision
model : openai/gpt - 4 - vision - preview
- guardrail_name : "image-filter"
image_model : "gpt-4-vision" # value is `model_name` of the vision-capable model
# Apply same filters to image descriptions
How It Works ​
Image is sent to the vision model to generate a text description
Content filters are applied to the description
If harmful content is detected, request is blocked with context about the image
Example:
model = "gpt-4-vision" ,
messages = [ {
"role" : "user" ,
"content" : [
{ "type" : "text" , "text" : "What's in this image?" } ,
{ "type" : "image_url" , "image_url" : { "url" : "https://example.com/image.jpg" } }
]
} ] ,
extra_body = { "guardrails" : [ "image-filter" ] }
If the image description contains filtered content, you'll get:
"error" : "Content blocked: harmful_violence category keyword 'weapon' detected (severity: high) (Image description): The image shows..."
Customizing Redaction Tags ​
When using the MASK action, sensitive content is replaced with redaction tags. You can customize how these tags appear.
Default Behavior ​
Patterns: Each pattern type gets its own tag based on the pattern name
Input: "My email is john@example.com and SSN is 123-45-6789"
Output: "My email is [EMAIL_REDACTED] and SSN is [US_SSN_REDACTED]"
Keywords: All keywords use the same generic tag
Input: "This is confidential and proprietary information"
Output: "This is [KEYWORD_REDACTED] and [KEYWORD_REDACTED] information"
Customizing Tags ​
Use pattern_redaction_format and keyword_redaction_tag to change the redaction format:
- guardrail_name : "custom-redaction"
pattern_redaction_format : "***{pattern_name}***" # Use {pattern_name} placeholder
keyword_redaction_tag : "***REDACTED***"
Output:
Input: "Email john@example.com, SSN 123-45-6789, confidential data"
Output: "Email ***EMAIL***, SSN ***US_SSN***, ***REDACTED*** data"
Key Points:
pattern_redaction_format must include {pattern_name} placeholder
Pattern names are automatically uppercased (e.g., email → EMAIL )
keyword_redaction_tag is a fixed string (no placeholders)
Content Categories ​
Prebuilt categories use keyword matching to detect harmful content, bias, and inappropriate advice. Keywords are matched with word boundaries (single words) or as substrings (multi-word phrases), case-insensitive.
Available Categories ​
Category Description Harmful Content harmful_self_harm Self-harm, suicide, eating disorders harmful_violence Violence, criminal planning, attacks harmful_illegal_weapons Illegal weapons, explosives, dangerous materials Bias Detection bias_gender Gender-based discrimination, stereotypes bias_sexual_orientation LGBTQ+ discrimination, homophobia, transphobia bias_racial Racial/ethnic discrimination, stereotypes bias_religious Religious discrimination, stereotypes Denied Advice denied_financial_advice Personalized financial advice, investment recommendations denied_medical_advice Medical advice, diagnosis, treatment recommendations denied_legal_advice Legal advice, representation, legal strategy
Bias Detection Considerations
Bias detection is complex and context-dependent . Rule-based systems catch explicit discriminatory language but may generate false positives on legitimate discussions. Start with high severity thresholds and test thoroughly. For mission-critical bias detection, consider combining with AI-based guardrails (e.g., HiddenLayer, Lakera).
- guardrail_name : "content-filter"
severity_threshold : "medium" # Blocks medium+ severity
- category : "bias_gender"
severity_threshold : "high" # Only explicit discrimination
- category : "denied_financial_advice"
Severity Thresholds:
"high" - Only blocks high severity items
"medium" - Blocks medium and high severity (default)
"low" - Blocks all severity levels
Custom Category Files ​
Override default categories with custom keyword lists:
category_file : "/path/to/custom.yaml"
custom.yaml
category_name : "harmful_self_harm"
description : "Custom self-harm detection"
default_action : "BLOCK"
keywords :
- keyword : "suicide"
severity : "high"
- keyword : "harm myself"
exceptions :
- "suicide prevention"
- "mental health"
Use Cases ​
1. Harmful Content Detection ​
Block or detect requests containing harmful, illegal, or dangerous content:
2. Bias and Discrimination Detection ​
Detect and block biased, discriminatory, or hateful content across multiple dimensions:
# Gender-based discrimination
# LGBTQ+ discrimination
- category : "bias_sexual_orientation"
# Racial/ethnic discrimination
- category : "bias_racial"
severity_threshold : "high" # Only explicit to reduce false positives
# Religious discrimination
- category : "bias_religious"
Sensitivity Tuning:
For bias detection, severity thresholds are critical to balance safety and legitimate discourse:
# Conservative (low false positives, may miss subtle bias)
severity_threshold : "high" # Only blocks explicit discriminatory language
# Balanced (recommended)
severity_threshold : "medium" # Blocks stereotypes and explicit discrimination
# Strict (high safety, may have more false positives)
severity_threshold : "low" # Blocks all potentially problematic content
3. PII Protection ​
Block or mask personally identifiable information before sending to LLMs:
2. Credential Detection ​
Prevent API keys and secrets from being exposed:
pattern_name : "github_token"
3. Sensitive Internal Data Protection ​
Block or mask references to confidential internal projects, codenames, or proprietary information:
- keyword : "project_titan"
description : "Internal system references"
For large lists of sensitive terms, use a file:
blocked_words_file : "/path/to/sensitive_terms.yaml"
4. Safe AI for Consumer Applications ​
Combining harmful content and bias detection for consumer-facing AI:
- guardrail_name : "safe-consumer-ai"
# Harmful content - strict
# Bias detection - balanced
severity_threshold : "high" # Avoid blocking legitimate gender discussions
severity_threshold : "high" # Education and news may discuss race
Perfect for:
Chatbots and virtual assistants
Educational AI tools
Customer service AI
Content generation platforms
Public-facing AI applications
5. Compliance ​
Ensure regulatory compliance by filtering sensitive data types:
# Categories checked first (high priority)
# Category keywords are matched first
# Then regex patterns
pattern_name : "visa"
Overview
Quick Start
LiteLLM UI
Step 1: Select LiteLLM Content Filter
Step 2: Configure Pattern Detection
Step 3: Add Blocked Keywords
Step 4: Test Your Guardrail
LiteLLM Config.yaml Setup
Step 1: Define Guardrails in config.yaml
Step 2: Start LiteLLM Gateway
Step 3: Test Request
Configuration
Supported Modes
Actions
Prebuilt Patterns
Available Patterns
Using Prebuilt Patterns
Custom Regex Patterns
Keyword Filtering
Loading Keywords from File
Streaming Support
Image Content Filtering
How It Works
Customizing Redaction Tags
Default Behavior
Customizing Tags
Content Categories
Available Categories
Custom Category Files
Use Cases
1. Harmful Content Detection
2. Bias and Discrimination Detection
3. PII Protection
2. Credential Detection
3. Sensitive Internal Data Protection
4. Safe AI for Consumer Applications
5. Compliance
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
