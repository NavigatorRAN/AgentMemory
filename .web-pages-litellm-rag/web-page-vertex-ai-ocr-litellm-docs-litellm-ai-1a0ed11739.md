# Vertex AI OCR | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_ocr
- Final URL: https://docs.litellm.ai/docs/providers/vertex_ocr
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_ocr
- Fetched at: 2026-06-23T14:29:16Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Vertex AI OCR provides document intelligence capabilities powered by Mistral, enabling text extraction from PDFs and images Provider Route on LiteLLM vertex_ai/ Supported Operations /ocr Link to Provider Doc Vertex AI ↗
Extract text from documents and images using Vertex AI's OCR models, powered by Mistral.
Quick Start ​
LiteLLM SDK ​
SDK Usage
import litellm
import os
# Set environment variables
os . environ [ "VERTEXAI_PROJECT" ] = "your-project-id"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
# OCR with PDF URL
response = litellm . ocr (
model = "vertex_ai/mistral-ocr-2505" ,
document = {
"type" : "document_url" ,
"document_url" : "https://example.com/document.pdf"
}
)
# Access extracted text
for page in response . pages :
print ( page . text )
LiteLLM PROXY ​
proxy_config.yaml
model_list :
- model_name : vertex - ocr
litellm_params :
model : vertex_ai/mistral - ocr - 2505
vertex_project : os.environ/VERTEXAI_PROJECT
vertex_location : os.environ/VERTEXAI_LOCATION
vertex_credentials : path/to/service - account.json # Optional
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
"model": "vertex-ocr",
"document": {
"type": "document_url",
"document_url": "https://arxiv.org/pdf/2201.04234"
}'
Authentication ​
Vertex AI OCR supports multiple authentication methods:
Service Account JSON ​
Service Account Auth
document = { "type" : "document_url" , "document_url" : "https://..." } ,
vertex_project = "your-project-id" ,
vertex_location = "us-central1" ,
vertex_credentials = "path/to/service-account.json"
Application Default Credentials ​
Default Credentials
# Relies on GOOGLE_APPLICATION_CREDENTIALS environment variable
vertex_location = "us-central1"
Document Types ​
Vertex AI OCR supports both PDFs and images.
PDF Documents ​
PDF OCR
} ,
Image Documents ​
Image OCR
"type" : "image_url" ,
"image_url" : "https://example.com/image.png"
Base64 Encoded Documents ​
Base64 PDF
import base64
# Read and encode PDF
with open ( "document.pdf" , "rb" ) as f :
pdf_base64 = base64 . b64encode ( f . read ( ) ) . decode ( )
model = "vertex_ai/mistral-ocr-2505" , # This doesn't work for deepseek
"document_url" : f"data:application/pdf;base64, { pdf_base64 } "
Supported Parameters ​
All Parameters
document = { # Required: Document to process
"document_url" : "https://..."
vertex_project = "your-project-id" , # Required: GCP project ID
vertex_location = "us-central1" , # Optional: Defaults to us-central1
vertex_credentials = "path/to/key.json" , # Optional: Service account key
include_image_base64 = True , # Optional: Include base64 images
pages = [ 0 , 1 , 2 ] , # Optional: Specific pages to process
image_limit = 10 # Optional: Limit number of images
Response Format ​
Response Structure
# Response has the following structure
response . pages # List of pages with extracted text
response . model # Model used
response . object # "ocr"
response . usage_info # Token usage information
# Access page content
print ( f"Page { page . page_number } :" )
Async Support ​
Async Usage
response = await litellm . aocr (
Cost Tracking ​
LiteLLM automatically tracks costs for Vertex AI OCR:
Cost per page : $0.0005 (based on $1.50 per 1,000 pages)
View Cost
vertex_project = "your-project-id"
# Access cost information
print ( f"Cost: $ { response . _hidden_params . get ( 'response_cost' , 0 ) } " )
Important Notes ​
URL Conversion
Vertex AI Mistral OCR endpoints don't have internet access. LiteLLM automatically converts public URLs to base64 data URIs before sending requests to Vertex AI.
Regional Availability
Mistral OCR is available in multiple regions. Specify vertex_location to use a region closer to your data:
us-central1 (default)
europe-west1
asia-southeast1
Deepseek OCR is only available in global region.
Supported Models ​
mistral-ocr-2505 - Latest Mistral OCR model on Vertex AI
deepseek-ocr-maas - Lates Deepseek OCR model on Vertex AI
Use the Vertex AI provider prefix: vertex_ai/<model-name>
Overview
Quick Start
LiteLLM SDK
LiteLLM PROXY
Authentication
Service Account JSON
Application Default Credentials
Document Types
PDF Documents
Image Documents
Base64 Encoded Documents
Supported Parameters
Response Format
Async Support
Cost Tracking
Important Notes
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
