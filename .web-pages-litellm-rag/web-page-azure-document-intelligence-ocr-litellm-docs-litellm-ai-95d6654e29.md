# Azure Document Intelligence OCR | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_document_intelligence
- Final URL: https://docs.litellm.ai/docs/providers/azure_document_intelligence
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_document_intelligence
- Fetched at: 2026-06-23T14:27:06Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Azure Document Intelligence (formerly Form Recognizer) provides advanced document analysis capabilities including text extraction, layout analysis, and structure recognition Provider Route on LiteLLM azure_ai/doc-intelligence/ Supported Operations /ocr Link to Provider Doc Azure Document Intelligence ↗
Extract text and analyze document structure using Azure Document Intelligence's powerful prebuilt models.
Quick Start ​
LiteLLM SDK ​
SDK Usage
import litellm
import os
# Set environment variables
os . environ [ "AZURE_DOCUMENT_INTELLIGENCE_API_KEY" ] = "your-api-key"
os . environ [ "AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT" ] = "https://your-resource.cognitiveservices.azure.com"
# OCR with PDF URL
response = litellm . ocr (
model = "azure_ai/doc-intelligence/prebuilt-layout" ,
document = {
"type" : "document_url" ,
"document_url" : "https://example.com/document.pdf"
}
)
# Access extracted text
for page in response . pages :
print ( f"Page { page . index } :" )
print ( page . markdown )
LiteLLM PROXY ​
proxy_config.yaml
model_list :
- model_name : azure - doc - intel
litellm_params :
model : azure_ai/doc - intelligence/prebuilt - layout
api_key : os.environ/AZURE_DOCUMENT_INTELLIGENCE_API_KEY
api_base : os.environ/AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT
model_info :
mode : ocr
Start Proxy
litellm --config proxy_config.yaml
Call OCR via Proxy
cURL Request
curl -X POST http://localhost:4000/ocr \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-api-key" \
-d '{
"model": "azure-doc-intel",
"document": {
"type": "document_url",
"document_url": "https://arxiv.org/pdf/2201.04234"
}'
How It Works ​
Azure Document Intelligence uses an asynchronous API pattern. LiteLLM AI Gateway handles the request/response transformation and polling automatically.
Complete Flow Diagram ​
What LiteLLM Does For You ​
When you call litellm.ocr() via SDK or /ocr via Proxy:
Request Transformation : Converts Mistral OCR format → Azure Document Intelligence format
Submits Document : Sends transformed request to Azure DI API
Handles 202 Response : Captures the Operation-Location URL from response headers
Automatic Polling :
Polls the operation URL at intervals specified by retry-after header (default: 2 seconds)
Continues until status is succeeded or failed
Respects Azure's rate limiting via retry-after headers
Response Transformation : Converts Azure DI format → Mistral OCR format
Returns Result : Sends unified Mistral format response to client
Polling Configuration:
Default timeout: 120 seconds
Configurable via AZURE_OPERATION_POLLING_TIMEOUT environment variable
Uses sync ( time.sleep() ) or async ( await asyncio.sleep() ) based on call type
info
Typical processing time : 2-10 seconds depending on document size and complexity
Supported Models ​
Azure Document Intelligence offers several prebuilt models optimized for different use cases:
prebuilt-layout (Recommended) ​
Best for general document OCR with structure preservation.
SDK
Proxy Config
Layout Model - SDK
- model_name : azure - layout
Usage:
-d '{"model": "azure-layout", "document": {"type": "document_url", "document_url": "https://example.com/doc.pdf"}}'
Features:
Text extraction with markdown formatting
Table detection and extraction
Document structure analysis
Paragraph and section recognition
Pricing: $10 per 1,000 pages
prebuilt-read ​
Optimized for reading text from documents - fastest and most cost-effective.
Read Model - SDK
model = "azure_ai/doc-intelligence/prebuilt-read" ,
- model_name : azure - read
model : azure_ai/doc - intelligence/prebuilt - read
-d '{"model": "azure-read", "document": {"type": "document_url", "document_url": "https://example.com/doc.pdf"}}'
Fast text extraction
Optimized for reading-heavy documents
Basic structure recognition
Pricing: $1.50 per 1,000 pages
prebuilt-document ​
General-purpose document analysis with key-value pairs.
Document Model - SDK
model = "azure_ai/doc-intelligence/prebuilt-document" ,
- model_name : azure - document
model : azure_ai/doc - intelligence/prebuilt - document
-d '{"model": "azure-document", "document": {"type": "document_url", "document_url": "https://example.com/doc.pdf"}}'
Document Types ​
Azure Document Intelligence supports various document formats.
PDF Documents ​
PDF OCR
Image Documents ​
Image OCR
"type" : "image_url" ,
"image_url" : "https://example.com/image.png"
Supported image formats: JPEG, PNG, BMP, TIFF
Base64 Encoded Documents ​
Base64 PDF
import base64
# Read and encode PDF
with open ( "document.pdf" , "rb" ) as f :
pdf_base64 = base64 . b64encode ( f . read ( ) ) . decode ( )
"document_url" : f"data:application/pdf;base64, { pdf_base64 } "
Response Format ​
Response Structure
# Response has the following structure
response . pages # List of pages with extracted text
response . model # Model used
response . object # "ocr"
response . usage_info # Token usage information
# Access page content
# Page dimensions (in pixels)
if page . dimensions :
print ( f"Width: { page . dimensions . width } px" )
print ( f"Height: { page . dimensions . height } px" )
Async Support ​
Async Usage
import asyncio
async def process_document ( ) :
response = await litellm . aocr (
return response
# Run async function
response = asyncio . run ( process_document ( ) )
Cost Tracking ​
LiteLLM automatically tracks costs for Azure Document Intelligence OCR:
Model Cost per 1,000 Pages prebuilt-read $1.50 prebuilt-layout $10.00 prebuilt-document $10.00
View Cost
document = { "type" : "document_url" , "document_url" : "https://..." }
# Access cost information
print ( f"Cost: $ { response . _hidden_params . get ( 'response_cost' , 0 ) } " )
Additional Resources ​
Azure Document Intelligence Documentation
Pricing Details
Supported File Formats
LiteLLM OCR Documentation
Overview
Quick Start
LiteLLM SDK
LiteLLM PROXY
How It Works
Complete Flow Diagram
What LiteLLM Does For You
Supported Models
prebuilt-layout (Recommended)
prebuilt-read
prebuilt-document
Document Types
PDF Documents
Image Documents
Base64 Encoded Documents
Response Format
Async Support
Cost Tracking
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
