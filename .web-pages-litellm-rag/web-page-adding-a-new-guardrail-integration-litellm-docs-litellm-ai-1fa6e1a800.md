# Adding a New Guardrail Integration | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/adding_provider/simple_guardrail_tutorial
- Final URL: https://docs.litellm.ai/docs/adding_provider/simple_guardrail_tutorial
- Canonical URL: https://docs.litellm.ai/docs/adding_provider/simple_guardrail_tutorial
- Fetched at: 2026-06-23T14:22:41Z
- Content type: text/html; charset=utf-8

## Description

You're going to create a class that checks text before it goes to the LLM or after it comes back. If it violates your rules, you block it.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
You're going to create a class that checks text before it goes to the LLM or after it comes back. If it violates your rules, you block it.
How It Works ​
Request with guardrail:
curl --location 'http://localhost:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "gpt-4",
"messages": [{"role": "user", "content": "How do I hack a system?"}],
"guardrails": ["my-guardrail"]
}'
Your guardrail checks input, then output. If something's wrong, raise an exception.
Build Your Guardrail ​
Create Your Directory ​
mkdir -p litellm/proxy/guardrails/guardrail_hooks/my_guardrail
cd litellm/proxy/guardrails/guardrail_hooks/my_guardrail
Two files: my_guardrail.py (main class) and __init__.py (initialization).
Write the Main Class ​
my_guardrail.py :
Follow from Custom Guardrail tutorial.
Create the Init File ​
__init__.py :
from typing import TYPE_CHECKING
from litellm . types . guardrails import SupportedGuardrailIntegrations
from . my_guardrail import MyGuardrail
if TYPE_CHECKING :
from litellm . types . guardrails import Guardrail , LitellmParams
def initialize_guardrail ( litellm_params : "LitellmParams" , guardrail : "Guardrail" ) :
import litellm
_my_guardrail_callback = MyGuardrail (
api_base = litellm_params . api_base ,
api_key = litellm_params . api_key ,
guardrail_name = guardrail . get ( "guardrail_name" , "" ) ,
event_hook = litellm_params . mode ,
default_on = litellm_params . default_on ,
)
litellm . logging_callback_manager . add_litellm_callback ( _my_guardrail_callback )
return _my_guardrail_callback
guardrail_initializer_registry = {
SupportedGuardrailIntegrations . MY_GUARDRAIL . value : initialize_guardrail ,
}
guardrail_class_registry = {
SupportedGuardrailIntegrations . MY_GUARDRAIL . value : MyGuardrail ,
Register Your Guardrail Type ​
Add to litellm/types/guardrails.py :
class SupportedGuardrailIntegrations ( str , Enum ) :
LAKERA = "lakera_prompt_injection"
APORIA = "aporia"
BEDROCK = "bedrock_guardrails"
PRESIDIO = "presidio"
ZSCALER_AI_GUARD = "zscaler_ai_guard"
MY_GUARDRAIL = "my_guardrail"
Usage ​
Config File ​
model_list :
- model_name : gpt - 4
litellm_params :
model : gpt - 4
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : my_guardrail
guardrail : my_guardrail
mode : during_call
api_key : os.environ/MY_GUARDRAIL_API_KEY
api_base : https : //api.myguardrail.com
Per-Request ​
"messages": [{"role": "user", "content": "Test message"}],
"guardrails": ["my_guardrail"]
Testing ​
Add unit tests inside test_litellm/ folder.
How It Works
Build Your Guardrail
Create Your Directory
Write the Main Class
Create the Init File
Register Your Guardrail Type
Usage
Config File
Per-Request
Testing
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
