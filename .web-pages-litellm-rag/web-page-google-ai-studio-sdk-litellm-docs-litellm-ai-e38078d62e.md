# Google AI Studio SDK | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/google_ai_studio
- Final URL: https://docs.litellm.ai/docs/pass_through/google_ai_studio
- Canonical URL: https://docs.litellm.ai/docs/pass_through/google_ai_studio
- Fetched at: 2026-06-23T14:25:52Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Google AI Studio - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Google AI Studio - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ✅ supports all models on /generateContent endpoint Logging ✅ works across all integrations End-user Tracking ❌ Tell us if you need this Streaming ✅
Just replace https://generativelanguage.googleapis.com with LITELLM_PROXY_BASE_URL/gemini
Example Usage ​
curl
Google GenAI JS SDK
curl 'http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:countTokens?key=sk-anything' \
-H 'Content-Type: application/json' \
-d '{
"contents": [{
"parts":[{
"text": "The quick brown fox jumps over the lazy dog."
}]
}'
const { GoogleGenAI } = require ( "@google/genai" ) ;
const ai = new GoogleGenAI ( {
apiKey : "sk-1234" , // litellm proxy API key
httpOptions : {
baseUrl : "http://localhost:4000/gemini" , // http://<proxy-base-url>/gemini
} ,
} ) ;
async function main ( ) {
try {
const response = await ai . models . generateContent ( {
model : "gemini-2.5-flash" ,
contents : "Explain how AI works" ,
console . log ( response . text ) ;
} catch ( error ) {
console . error ( 'Error:' , error ) ;
}
// For streaming responses
async function main_streaming ( ) {
const response = await ai . models . generateContentStream ( {
for await ( const chunk of response ) {
process . stdout . write ( chunk . text ) ;
main ( ) ;
// main_streaming();
Supports ALL Google AI Studio Endpoints (including streaming).
See All Google AI Studio Endpoints
Quick Start ​
Let's call the Gemini /countTokens endpoint
Add Gemini API Key to your environment
export GEMINI_API_KEY=""
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
Let's call the Google AI Studio token counting endpoint
http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:countTokens?key=anything' \
Examples ​
Anything after http://0.0.0.0:4000/gemini is treated as a provider-specific route, and handled accordingly.
Key Changes:
Original Endpoint Replace With https://generativelanguage.googleapis.com http://0.0.0.0:4000/gemini (LITELLM_PROXY_BASE_URL=" http://0.0.0.0:4000 ") key=$GOOGLE_API_KEY key=anything (use key=LITELLM_VIRTUAL_KEY if Virtual Keys are setup on proxy)
Example 1: Counting tokens ​
LiteLLM Proxy Call ​
curl http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:countTokens?key=anything \
-X POST \
}],
Direct Google AI Studio Call ​
curl https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:countTokens?key=$GOOGLE_API_KEY \
Example 2: Generate content ​
curl "http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:generateContent?key=anything" \
"parts":[{"text": "Write a story about a magic backpack."}]
}' 2> /dev/null
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$GOOGLE_API_KEY" \
Example 3: Caching ​
curl -X POST "http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash-001:generateContent?key=anything" \
"contents": [
{
"text": "Please summarize this transcript"
"role": "user"
},
],
"cachedContent": "'$CACHE_NAME'"
curl -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-001:generateContent?key=$GOOGLE_API_KEY" \
Example 4: Video Generation with Veo ​
Generate videos using Google's Veo model through LiteLLM pass-through routes.
→ Complete Veo Video Generation Guide
Advanced ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Google AI Studio key, but still letting them use Google AI Studio endpoints.
Use with Virtual Keys ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-d '{}'
Expected Response
...
"key": "sk-1234ewknldferwedojwojw"
http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:countTokens?key=sk-1234ewknldferwedojwojw' \
Send tags in request headers ​
Use this if you want tags to be tracked in the LiteLLM DB and on logging callbacks.
Pass tags in request headers as a comma separated list. In the example below the following tags will be tracked
tags: ["gemini-js-sdk", "pass-through-endpoint"]
curl 'http://0.0.0.0:4000/gemini/v1beta/models/gemini-1.5-flash:generateContent?key=sk-anything' \
-H 'tags: gemini-js-sdk,pass-through-endpoint' \
apiKey : "sk-1234" ,
headers : {
"tags" : "gemini-js-sdk,pass-through-endpoint" ,
Quick Start
Examples
Example 1: Counting tokens
Example 2: Generate content
Example 3: Caching
Example 4: Video Generation with Veo
Advanced
Use with Virtual Keys
Send tags in request headers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
