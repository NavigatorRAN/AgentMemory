# Prompt Formatting | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/prompt_formatting
- Final URL: https://docs.litellm.ai/docs/completion/prompt_formatting
- Canonical URL: https://docs.litellm.ai/docs/completion/prompt_formatting
- Fetched at: 2026-06-23T14:23:26Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM automatically translates the OpenAI ChatCompletions prompt format, to other models. You can control this by setting a custom prompt template for a model as well.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM automatically translates the OpenAI ChatCompletions prompt format, to other models. You can control this by setting a custom prompt template for a model as well.
Huggingface Models ​
LiteLLM supports Huggingface Chat Templates , and will automatically check if your huggingface model has a registered chat template (e.g. Mistral-7b ).
For popular models (e.g. meta-llama/llama2), we have their templates saved as part of the package.
Stored Templates
Model Name Works for Models Completion Call mistralai/Mistral-7B-Instruct-v0.1 mistralai/Mistral-7B-Instruct-v0.1 completion(model='huggingface/mistralai/Mistral-7B-Instruct-v0.1', messages=messages, api_base="your_api_endpoint") meta-llama/Llama-2-7b-chat All meta-llama llama2 chat models completion(model='huggingface/meta-llama/Llama-2-7b', messages=messages, api_base="your_api_endpoint") tiiuae/falcon-7b-instruct All falcon instruct models completion(model='huggingface/tiiuae/falcon-7b-instruct', messages=messages, api_base="your_api_endpoint") mosaicml/mpt-7b-chat All mpt chat models completion(model='huggingface/mosaicml/mpt-7b-chat', messages=messages, api_base="your_api_endpoint") codellama/CodeLlama-34b-Instruct-hf All codellama instruct models completion(model='huggingface/codellama/CodeLlama-34b-Instruct-hf', messages=messages, api_base="your_api_endpoint") WizardLM/WizardCoder-Python-34B-V1.0 All wizardcoder models completion(model='huggingface/WizardLM/WizardCoder-Python-34B-V1.0', messages=messages, api_base="your_api_endpoint") Phind/Phind-CodeLlama-34B-v2 All phind-codellama models completion(model='huggingface/Phind/Phind-CodeLlama-34B-v2', messages=messages, api_base="your_api_endpoint")
Jump to code
Format Prompt Yourself ​
You can also format the prompt yourself. Here's how:
import litellm
# Create your own custom prompt template
litellm . register_prompt_template (
model = "togethercomputer/LLaMA-2-7B-32K" ,
initial_prompt_value = "You are a good assistant" # [OPTIONAL]
roles = {
"system" : {
"pre_message" : "[INST] <<SYS>>\n" , # [OPTIONAL]
"post_message" : "\n<</SYS>>\n [/INST]\n" # [OPTIONAL]
} ,
"user" : {
"pre_message" : "[INST] " , # [OPTIONAL]
"post_message" : " [/INST]" # [OPTIONAL]
"assistant" : {
"pre_message" : "\n" # [OPTIONAL]
"post_message" : "\n" # [OPTIONAL]
}
final_prompt_value = "Now answer as best you can:" # [OPTIONAL]
)
def test_huggingface_custom_model ( ) :
model = "huggingface/togethercomputer/LLaMA-2-7B-32K"
response = completion ( model = model , messages = messages , api_base = "https://my-huggingface-endpoint" )
print ( response [ 'choices' ] [ 0 ] [ 'message' ] [ 'content' ] )
return response
test_huggingface_custom_model ( )
This is currently supported for Huggingface, TogetherAI, Ollama, and Petals.
Other providers either have fixed prompt templates (e.g. Anthropic), or format it themselves (e.g. Replicate). If there's a provider we're missing coverage for, let us know!
All Providers ​
Here's the code for how we format all providers. Let us know how we can improve this further
Provider Model Name Code Anthropic claude-instant-1 , claude-instant-1.2 , claude-2 Code OpenAI Text Completion text-davinci-003 , text-curie-001 , text-babbage-001 , text-ada-001 , babbage-002 , davinci-002 , Code Replicate all model names starting with replicate/ Code Cohere command-nightly , command , command-light , command-medium-beta , command-xlarge-beta , command-r-plus Code Huggingface all model names starting with huggingface/ Code OpenRouter all model names starting with openrouter/ Code AI21 j2-mid , j2-light , j2-ultra Code VertexAI text-bison , text-bison@001 , chat-bison , chat-bison@001 , chat-bison-32k , code-bison , code-bison@001 , code-gecko@001 , code-gecko@latest , codechat-bison , codechat-bison@001 , codechat-bison-32k Code Bedrock all model names starting with bedrock/ Code Sagemaker sagemaker/jumpstart-dft-meta-textgeneration-llama-2-7b Code TogetherAI all model names starting with together_ai/ Code AlephAlpha all model names starting with aleph_alpha/ Code Palm all model names starting with palm/ Code NLP Cloud all model names starting with palm/ Code Petals all model names starting with petals/ Code
Huggingface Models
Format Prompt Yourself
All Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
