# Instructor | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/instructor
- Final URL: https://docs.litellm.ai/docs/tutorials/instructor
- Canonical URL: https://docs.litellm.ai/docs/tutorials/instructor
- Fetched at: 2026-06-23T14:34:19Z
- Content type: text/html; charset=utf-8

## Description

Combine LiteLLM with jxnl's instructor library for more robust structured outputs. Outputs are automatically validated into Pydantic types and validation errors are provided back to the model to increase the chance of a successful response in the retries.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Combine LiteLLM with jxnl's instructor library for more robust structured outputs. Outputs are automatically validated into Pydantic types and validation errors are provided back to the model to increase the chance of a successful response in the retries.
Usage (Sync) ​
import instructor
from litellm import completion
from pydantic import BaseModel
client = instructor . from_litellm ( completion )
class User ( BaseModel ) :
name : str
age : int
def extract_user ( text : str ) :
return client . chat . completions . create (
model = "gpt-4o-mini" ,
response_model = User ,
messages = [
{ "role" : "user" , "content" : text } ,
] ,
max_retries = 3 ,
)
user = extract_user ( "Jason is 25 years old" )
assert isinstance ( user , User )
assert user . name == "Jason"
assert user . age == 25
print ( f" { user = } " )
Usage (Async) ​
import asyncio
from litellm import acompletion
client = instructor . from_litellm ( acompletion )
async def extract ( text : str ) - > User :
return await client . chat . completions . create (
user = asyncio . run ( extract ( "Alice is 30 years old" ) )
assert user . name == "Alice"
assert user . age == 30
Usage (Sync)
Usage (Async)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
