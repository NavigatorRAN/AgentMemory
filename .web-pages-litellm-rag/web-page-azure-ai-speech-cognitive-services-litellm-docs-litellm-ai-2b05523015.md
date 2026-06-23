# Azure AI Speech (Cognitive Services) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_ai_speech
- Final URL: https://docs.litellm.ai/docs/providers/azure_ai_speech
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_ai_speech
- Fetched at: 2026-06-23T14:27:04Z
- Content type: text/html; charset=utf-8

## Description

Azure AI Speech is Azure's Cognitive Services text-to-speech API, separate from Azure OpenAI. It provides high-quality neural voices with broader language support and advanced speech customization.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Azure AI Speech is Azure's Cognitive Services text-to-speech API, separate from Azure OpenAI. It provides high-quality neural voices with broader language support and advanced speech customization.
When to use this vs Azure OpenAI TTS:
Azure AI Speech - More languages, neural voices, SSML support, speech customization
Azure OpenAI TTS - OpenAI models, integrated with Azure OpenAI services
Overview ​
Property Details Description Azure AI Speech is Azure's Cognitive Services text-to-speech API, separate from Azure OpenAI. It provides high-quality neural voices with broader language support and advanced speech customization. Provider Route on LiteLLM azure/speech/
Quick Start ​
LiteLLM SDK
SDK Usage
from litellm import speech
from pathlib import Path
import os
os . environ [ "AZURE_TTS_API_KEY" ] = "your-cognitive-services-key"
speech_file_path = Path ( __file__ ) . parent / "speech.mp3"
response = speech (
model = "azure/speech/azure-tts" ,
voice = "alloy" ,
input = "Hello, this is Azure AI Speech" ,
api_base = "https://eastus.tts.speech.microsoft.com" ,
api_key = os . environ [ "AZURE_TTS_API_KEY" ] ,
)
response . stream_to_file ( speech_file_path )
LiteLLM Proxy
proxy_config.yaml
model_list :
- model_name : azure - speech
litellm_params :
model : azure/speech/azure - tts
api_base : https : //eastus.tts.speech.microsoft.com
api_key : os.environ/AZURE_TTS_API_KEY
Setup ​
Create an Azure Cognitive Services resource in the Azure Portal
Get your API key from the resource
Note your region (e.g., eastus , westus , westeurope )
Use the regional endpoint: https://{region}.tts.speech.microsoft.com
Cost Tracking (Pricing) ​
LiteLLM automatically tracks costs for Azure AI Speech based on the number of characters processed.
Available Models ​
Model Voice Type Cost per 1M Characters azure/speech/azure-tts Neural $15 azure/speech/azure-tts-hd Neural HD $30
How Costs are Calculated ​
Azure AI Speech charges based on the number of characters in your input text. LiteLLM automatically:
Counts the number of characters in your input parameter
Calculates the cost based on the model pricing
Returns the cost in the response object
View Request Cost
input = "Hello, this is a test message" ,
# Access the calculated cost
cost = response . _hidden_params . get ( "response_cost" )
print ( f"Request cost: $ { cost } " )
Verify Azure Pricing ​
To check the latest Azure AI Speech pricing:
Visit the Azure Pricing Calculator
Set Service to "AI Services"
Set API to "Azure AI Speech"
Select Text to Speech and your region
View the current pricing per million characters
Note: Pricing may vary by region and Azure subscription type.
Voice Mapping ​
LiteLLM automatically maps OpenAI voice names to Azure Neural voices:
OpenAI Voice Azure Neural Voice Description alloy en-US-JennyNeural Neutral and balanced echo en-US-GuyNeural Warm and upbeat fable en-GB-RyanNeural Expressive and dramatic onyx en-US-DavisNeural Deep and authoritative nova en-US-AmberNeural Friendly and conversational shimmer en-US-AriaNeural Bright and cheerful
Supported Parameters ​
All Parameters
voice = "alloy" , # Required: Voice selection
input = "text to convert" , # Required: Input text
speed = 1.0 , # Optional: 0.25 to 4.0 (default: 1.0)
response_format = "mp3" , # Optional: mp3, opus, wav, pcm
api_key = "your-key" ,
Response Formats ​
Format Azure Output Format Sample Rate mp3 audio-24khz-48kbitrate-mono-mp3 24kHz opus ogg-48khz-16bit-mono-opus 48kHz wav riff-24khz-16bit-mono-pcm 24kHz pcm raw-24khz-16bit-mono-pcm 24kHz
Passing Raw SSML ​
LiteLLM automatically detects when your input contains SSML (by checking for <speak> tags) and passes it through to Azure without any transformation. This gives you complete control over speech synthesis.
When to use raw SSML:
Using the <lang> element with multilingual voices to translate text (e.g., English text → Spanish speech)
Complex SSML structures with multiple voices or prosody changes
Fine-grained control over pronunciation, breaks, emphasis, and other speech features
LiteLLM SDK ​
Raw SSML for Multilingual Translation
# Use <lang> element to convert English text to Spanish speech
# The <lang> element forces the output language regardless of input text language
language_code = "es-ES"
text = "Hello, how are you today?" # English text
voice = "en-US-AvaMultilingualNeural"
ssml = f"""<speak version="1.0"
xmlns="http://www.w3.org/2001/10/synthesis"
xmlns:mstts="http://www.w3.org/2001/mstts"
xml:lang=" { language_code } ">
<voice name=" { voice } ">
<lang xml:lang=" { language_code } "> { text } </lang>
</voice>
</speak>"""
voice = voice ,
input = ssml , # LiteLLM auto-detects SSML and sends as-is
response . stream_to_file ( "speech.mp3" )
Raw SSML with Complex Features
# Complex SSML with multiple prosody adjustments
ssml = """<speak version='1.0' xmlns='http://www.w3.org/2001/10/synthesis'
xmlns:mstts='https://www.w3.org/2001/mstts' xml:lang='en-US'>
<voice name='en-US-JennyNeural'>
<mstts:express-as style='cheerful' styledegree='2'>
<prosody rate='+20%' pitch='high'>
Welcome to our service!
</prosody>
</mstts:express-as>
<break time='500ms'/>
<prosody rate='-10%'>
How can I help you today?
voice = "en-US-JennyNeural" ,
input = ssml , # LiteLLM detects <speak> and passes through unchanged
LiteLLM Proxy ​
curl http://0.0.0.0:4000/v1/audio/speech \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "azure-speech",
"voice": "en-US-AvaMultilingualNeural",
"input": "<speak version=\"1.0\" xmlns=\"http://www.w3.org/2001/10/synthesis\" xmlns:mstts=\"http://www.w3.org/2001/mstts\" xml:lang=\"es-ES\"><voice name=\"en-US-AvaMultilingualNeural\"><lang xml:lang=\"es-ES\">Hello, how are you today?</lang></voice></speak>"
}' \
--output speech.mp3
Sending Azure-Specific Params ​
Azure AI Speech supports advanced SSML features through optional parameters:
style : Speaking style (e.g., "cheerful", "sad", "angry", "whispering")
styledegree : Style intensity (0.01 to 2)
role : Voice role (e.g., "Girl", "Boy", "SeniorFemale", "SeniorMale")
lang : Language code for multilingual voices (e.g., "es-ES", "fr-FR", "hi-IN")
Custom Azure Voice ​
Custom Azure Voice
voice = "en-US-AndrewNeural" , # Use Azure voice directly
input = "Hello, this is a test" ,
response_format = "mp3"
Speaking Style ​
Speaking Style
voice = "en-US-JennyNeural" , # Must be a voice that supports styles
input = "Who are you? What is chicken dinner?" ,
style = "whispering" , # Azure-specific: cheerful, sad, angry, whispering, etc.
Style with Degree and Role ​
Style with Degree and Role
voice = "en-US-AriaNeural" ,
input = "Good morning! How are you today?" ,
style = "cheerful" , # Azure-specific: Speaking style
styledegree = "2" , # Azure-specific: 0.01 to 2 (intensity)
role = "SeniorFemale" , # Azure-specific: Girl, Boy, SeniorFemale, etc.
Language Override for Multilingual Voices ​
Language Override
voice = "en-US-AvaMultilingualNeural" , # Multilingual voice
input = "आप कौन हैं? चिकन डिनर क्या है?" , # Hindi text
lang = "hi-IN" , # Azure-specific: Override language
LiteLLM AI Gateway (CURL) ​
First, ensure you have set up your proxy config as shown in the LiteLLM Proxy setup above.
Using the model name from your config:
- model_name : azure - speech # This is what you'll use in your API calls
"voice": "en-US-AndrewNeural",
"input": "Hello, this is a test"
"input": "Who are you? What is chicken dinner?",
"voice": "en-US-JennyNeural",
"style": "whispering"
"voice": "en-US-AriaNeural",
"input": "Good morning! How are you today?",
"style": "cheerful",
"styledegree": "2",
"role": "SeniorFemale"
Language Override ​
"input": "आप कौन हैं? चिकन डिनर क्या है?",
"lang": "hi-IN"
Azure-Specific Parameters Reference ​
Parameter Description Example Values Notes style Speaking style cheerful , sad , angry , excited , friendly , hopeful , shouting , terrified , unfriendly , whispering Only supported by certain voices. See Azure voice styles documentation styledegree Style intensity 0.01 to 2 Higher values = more intense. Default is 1 role Voice role Girl , Boy , YoungAdultFemale , YoungAdultMale , OlderAdultFemale , OlderAdultMale , SeniorFemale , SeniorMale Only supported by certain voices lang Language code es-ES , fr-FR , de-DE , hi-IN , etc. For multilingual voices. Overrides the default language
Async Support ​
Async Usage
import asyncio
from litellm import aspeech
async def generate_speech ( ) :
response = await aspeech (
input = "Hello from async" ,
asyncio . run ( generate_speech ( ) )
Regional Endpoints ​
Replace {region} with your Azure resource region:
US East: https://eastus.tts.speech.microsoft.com
US West: https://westus.tts.speech.microsoft.com
Europe West: https://westeurope.tts.speech.microsoft.com
Asia Southeast: https://southeastasia.tts.speech.microsoft.com
Full list of regions
Advanced Features ​
Custom Neural Voices ​
You can use any Azure Neural voice by passing the full voice name:
Custom Voice
voice = "en-US-AriaNeural" , # Direct Azure voice name
input = "Using a specific neural voice" ,
Browse available voices in the Azure Speech Gallery .
Error Handling ​
Error Handling
from litellm . exceptions import APIError
try :
input = "Test message" ,
except APIError as e :
print ( f"Azure Speech error: { e } " )
Reference ​
Azure Speech Service Documentation
Text-to-Speech REST API
Overview
Quick Start
Setup
Cost Tracking (Pricing)
Available Models
How Costs are Calculated
Verify Azure Pricing
Voice Mapping
Supported Parameters
Response Formats
Passing Raw SSML
Sending Azure-Specific Params
LiteLLM AI Gateway (CURL)
Azure-Specific Parameters Reference
Async Support
Regional Endpoints
Advanced Features
Custom Neural Voices
Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
