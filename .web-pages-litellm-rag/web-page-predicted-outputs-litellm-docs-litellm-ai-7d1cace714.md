# Predicted Outputs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/predict_outputs
- Final URL: https://docs.litellm.ai/docs/completion/predict_outputs
- Canonical URL: https://docs.litellm.ai/docs/completion/predict_outputs
- Fetched at: 2026-06-23T14:23:22Z
- Content type: text/html; charset=utf-8

## Description

| Property | Details |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Property Details Description Use this when most of the output of the LLM is known ahead of time. For instance, if you are asking the model to rewrite some text or code with only minor changes, you can reduce your latency significantly by using Predicted Outputs, passing in the existing content as your prediction. Supported providers openai Link to OpenAI doc on Predicted Outputs Predicted Outputs ↗ Supported from LiteLLM Version v1.51.4
Using Predicted Outputs ​
LiteLLM Python SDK
LiteLLM Proxy Server
In this example we want to refactor a piece of C# code, and convert the Username property to Email instead:
import litellm
os . environ [ "OPENAI_API_KEY" ] = "your-api-key"
code = """
/// <summary>
/// Represents a user with a first name, last name, and username.
/// </summary>
public class User
{
/// Gets or sets the user's first name.
public string FirstName { get; set; }
/// Gets or sets the user's last name.
public string LastName { get; set; }
/// Gets or sets the user's username.
public string Username { get; set; }
}
"""
completion = litellm . completion (
model = "gpt-4o-mini" ,
messages = [
"role" : "user" ,
"content" : "Replace the Username property with an Email property. Respond only with code, and with no markdown formatting." ,
} ,
{ "role" : "user" , "content" : code } ,
] ,
prediction = { "type" : "content" , "content" : code } ,
)
print ( completion )
Define models on config.yaml
model_list :
- model_name : gpt - 4o - mini # OpenAI gpt-4o-mini
litellm_params :
model : openai/gpt - 4o - mini
api_key : os.environ/OPENAI_API_KEY
Run proxy server
litellm --config config.yaml
Test it using the OpenAI Python SDK
from openai import OpenAI
client = OpenAI (
api_key = "LITELLM_PROXY_KEY" , # sk-1234
base_url = "LITELLM_PROXY_BASE" # http://0.0.0.0:4000
completion = client . chat . completions . create (
Using Predicted Outputs
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
