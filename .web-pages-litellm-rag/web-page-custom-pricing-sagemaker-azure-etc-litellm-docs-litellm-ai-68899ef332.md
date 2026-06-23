# Custom Pricing - SageMaker, Azure, etc | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/sdk_custom_pricing
- Final URL: https://docs.litellm.ai/docs/sdk_custom_pricing
- Canonical URL: https://docs.litellm.ai/docs/sdk_custom_pricing
- Fetched at: 2026-06-23T14:32:55Z
- Content type: text/html; charset=utf-8

## Description

Register custom pricing for sagemaker completion model.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Register custom pricing for sagemaker completion model.
For cost per second pricing, you just need to register input_cost_per_second .
# !uv add boto3
from litellm import completion , completion_cost
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = ""
def test_completion_sagemaker ( ) :
try :
print ( "testing sagemaker" )
response = completion (
model = "sagemaker/berri-benchmarking-Llama-2-70b-chat-hf-4" ,
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] ,
input_cost_per_second = 0.000420 ,
)
# Add any assertions here to check the response
print ( response )
cost = completion_cost ( completion_response = response )
print ( cost )
except Exception as e :
raise Exception ( f"Error occurred: { e } " )
Cost Per Token (e.g. Azure) ​
## set ENV variables
os . environ [ "AZURE_API_KEY" ] = ""
os . environ [ "AZURE_API_BASE" ] = ""
os . environ [ "AZURE_API_VERSION" ] = ""
def test_completion_azure_model ( ) :
print ( "testing azure custom pricing" )
# azure call
model = "azure/<your_deployment_name>" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
input_cost_per_token = 0.005 ,
output_cost_per_token = 1 ,
test_completion_azure_model ( )
Cost Per Token (e.g. Azure)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
