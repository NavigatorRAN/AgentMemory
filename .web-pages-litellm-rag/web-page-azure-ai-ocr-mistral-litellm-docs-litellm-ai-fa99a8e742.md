# Azure AI OCR (Mistral) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_ocr
- Final URL: https://docs.litellm.ai/docs/providers/azure_ocr
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_ocr
- Fetched at: 2026-06-23T14:27:08Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Azure AI OCR provides document intelligence capabilities powered by Mistral, enabling text extraction from PDFs and images Provider Route on LiteLLM azure_ai/ Supported Operations /ocr Link to Provider Doc Azure AI ↗
Extract text from documents and images using Azure AI's OCR models, powered by Mistral.
Quick Start ​
LiteLLM SDK ​
SDK Usage
import litellm
import os
# Set environment variables
os . environ [ "AZURE_AI_API_KEY" ] = ""
os . environ [ "AZURE_AI_API_BASE" ] = ""
# OCR with PDF URL
response = litellm . ocr (
model = "azure_ai/mistral-document-ai-2505" ,
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
- model_name : azure - ocr
litellm_params :
model : azure_ai/mistral - document - ai - 2505
api_key : "os.environ/AZURE_AI_API_KEY"
api_base : "os.environ/AZURE_AI_API_BASE"
model_info :
mode : ocr
Document Types ​
Azure AI OCR supports both PDFs and images.
PDF Documents ​
PDF OCR
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
"document_url" : f"data:application/pdf;base64, { pdf_base64 } "
Supported Parameters ​
All Parameters
document = { # Required: Document to process
"document_url" : "https://..."
} ,
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
Important Notes ​
URL Conversion
Azure AI OCR endpoints don't have internet access. LiteLLM automatically converts public URLs to base64 data URIs before sending requests to Azure AI.
Supported Models ​
mistral-document-ai-2505 - Latest Mistral OCR model on Azure AI
Use the Azure AI provider prefix: azure_ai/<model-name>
Overview
Quick Start
LiteLLM SDK
LiteLLM PROXY
Document Types
PDF Documents
Image Documents
Base64 Encoded Documents
Supported Parameters
Response Format
Async Support
Important Notes
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
