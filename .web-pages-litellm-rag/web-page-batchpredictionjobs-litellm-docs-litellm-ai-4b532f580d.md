# /batchPredictionJobs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/vertex_batch_passthrough
- Final URL: https://docs.litellm.ai/docs/vertex_batch_passthrough
- Canonical URL: https://docs.litellm.ai/docs/vertex_batch_passthrough
- Fetched at: 2026-06-23T14:34:52Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Vertex AI batch prediction jobs through passthrough endpoints, allowing you to create and manage batch jobs directly through the proxy server.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Vertex AI batch prediction jobs through passthrough endpoints, allowing you to create and manage batch jobs directly through the proxy server.
Features ​
Batch Job Creation : Create batch prediction jobs using Vertex AI models
Cost Tracking : Automatic cost calculation and usage tracking for batch operations
Status Monitoring : Track job status and retrieve results
Model Support : Works with all supported Vertex AI models (Gemini, Text Embedding)
Cost Tracking Support ​
Feature Supported Notes Cost Tracking ✅ Automatic cost calculation for batch operations Usage Monitoring ✅ Track token usage and costs across batch jobs Logging ✅ Supported
Quick Start ​
Configure your model in the proxy configuration:
model_list :
- model_name : gemini - 1.5 - flash
litellm_params :
model : vertex_ai/gemini - 1.5 - flash
vertex_project : your - project - id
vertex_location : us - central1
vertex_credentials : path/to/service - account.json
Create a batch job :
curl -X POST "http://localhost:4000/v1/projects/your-project/locations/us-central1/batchPredictionJobs" \
-H "Authorization: Bearer your-api-key" \
-H "Content-Type: application/json" \
-d '{
"displayName": "my-batch-job",
"model": "projects/your-project/locations/us-central1/publishers/google/models/gemini-1.5-flash",
"inputConfig": {
"gcsSource": {
"uris": ["gs://my-bucket/input.jsonl"]
},
"instancesFormat": "jsonl"
"outputConfig": {
"gcsDestination": {
"outputUriPrefix": "gs://my-bucket/output/"
"predictionsFormat": "jsonl"
}
}'
Monitor job status :
curl -X GET "http://localhost:4000/v1/projects/your-project/locations/us-central1/batchPredictionJobs/job-id" \
-H "Authorization: Bearer your-api-key"
Model Configuration ​
When configuring models for batch operations, use these naming conventions:
model_name : Base model name (e.g., gemini-1.5-flash )
model : Full LiteLLM identifier (e.g., vertex_ai/gemini-1.5-flash )
Supported Models ​
gemini-1.5-flash / vertex_ai/gemini-1.5-flash
gemini-1.5-pro / vertex_ai/gemini-1.5-pro
gemini-2.0-flash / vertex_ai/gemini-2.0-flash
gemini-2.0-pro / vertex_ai/gemini-2.0-pro
Advanced Usage ​
Batch Job with Custom Parameters ​
"displayName": "advanced-batch-job",
"model": "projects/your-project/locations/us-central1/publishers/google/models/gemini-1.5-pro",
"uris": ["gs://my-bucket/advanced-input.jsonl"]
"outputUriPrefix": "gs://my-bucket/advanced-output/"
"labels": {
"environment": "production",
"team": "ml-engineering"
List All Batch Jobs ​
curl -X GET "http://localhost:4000/v1/projects/your-project/locations/us-central1/batchPredictionJobs" \
Cancel a Batch Job ​
curl -X POST "http://localhost:4000/v1/projects/your-project/locations/us-central1/batchPredictionJobs/job-id:cancel" \
Cost Tracking Details ​
LiteLLM provides comprehensive cost tracking for Vertex AI batch operations:
Token Usage : Tracks input and output tokens for each batch request
Cost Calculation : Automatically calculates costs based on current Vertex AI pricing
Usage Aggregation : Aggregates costs across all requests in a batch job
Real-time Monitoring : Monitor costs as batch jobs progress
The cost tracking works seamlessly with the generateContent API and provides detailed insights into your batch processing expenses.
Error Handling ​
Common error scenarios and their solutions:
Error Description Solution INVALID_ARGUMENT Invalid model or configuration Verify model name and project settings PERMISSION_DENIED Insufficient permissions Check Vertex AI IAM roles RESOURCE_EXHAUSTED Quota exceeded Check Vertex AI quotas and limits NOT_FOUND Job or resource not found Verify job ID and project configuration
Best Practices ​
Use appropriate batch sizes : Balance between processing efficiency and resource usage
Monitor job status : Regularly check job status to handle failures promptly
Set up alerts : Configure monitoring for job completion and failures
Optimize costs : Use cost tracking to identify optimization opportunities
Test with small batches : Validate your setup with small test batches first
Related Documentation ​
Vertex AI Provider Documentation
General Batches API Documentation
Cost Tracking and Monitoring
Features
Cost Tracking Support
Quick Start
Model Configuration
Supported Models
Advanced Usage
Batch Job with Custom Parameters
List All Batch Jobs
Cancel a Batch Job
Cost Tracking Details
Error Handling
Best Practices
Related Documentation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
