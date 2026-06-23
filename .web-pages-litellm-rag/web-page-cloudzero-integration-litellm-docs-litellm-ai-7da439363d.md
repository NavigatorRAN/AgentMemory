# CloudZero Integration | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/cloudzero
- Final URL: https://docs.litellm.ai/docs/observability/cloudzero
- Canonical URL: https://docs.litellm.ai/docs/observability/cloudzero
- Fetched at: 2026-06-23T14:25:00Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM provides an integration with CloudZero's AnyCost API, allowing you to export your LLM usage data to CloudZero for cost tracking analysis.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM provides an integration with CloudZero's AnyCost API, allowing you to export your LLM usage data to CloudZero for cost tracking analysis.
Overview ​
Property Details Description Export LiteLLM usage data to CloudZero AnyCost API for cost tracking and analysis callback name cloudzero Supported Operations • Automatic hourly data export
• Manual data export
• Dry run testing
• Cost and token usage tracking Data Format CloudZero Billing Format (CBF) with proper resource tagging Export Frequency Hourly (configurable via CLOUDZERO_EXPORT_INTERVAL_MINUTES )
Environment Variables ​
Variable Required Description Example CLOUDZERO_API_KEY Yes Your CloudZero API key cz_api_xxxxxxxxxx CLOUDZERO_CONNECTION_ID Yes CloudZero connection ID for data submission conn_xxxxxxxxxx CLOUDZERO_TIMEZONE No Timezone for date handling (default: UTC) America/New_York CLOUDZERO_EXPORT_INTERVAL_MINUTES No Export frequency in minutes (default: 60) 60
Setup ​
End to End Video Walkthrough ​
This video walks through the entire process of setting up LiteLLM with CloudZero integration and viewing LiteLLM exported usage data in CloudZero.
Step 1: Configure Environment Variables ​
Set your CloudZero credentials in your environment:
export CLOUDZERO_API_KEY="cz_api_xxxxxxxxxx"
export CLOUDZERO_CONNECTION_ID="conn_xxxxxxxxxx"
export CLOUDZERO_TIMEZONE="UTC" # Optional, defaults to UTC
Step 2: Enable CloudZero Integration ​
Add the CloudZero callback to your LiteLLM configuration YAML file:
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : sk - xxxxxxx
litellm_settings :
callbacks : [ "cloudzero" ] # Enable CloudZero integration
Step 3: Start LiteLLM Proxy ​
Start your LiteLLM proxy with the configuration:
litellm --config /path/to/config.yaml
Setup on UI ​
1. Click "Settings"
2. Click "Logging & Alerts"
3. Click "CloudZero Cost Tracking"
4. Click "Add CloudZero Integration"
5. Enter your CloudZero API Key.
6. Enter your CloudZero Connection ID.
7. Click "Create"
8. Test your payload with "Run Dry Run Simulation"
10. Click "Export Data Now" to export to CLoudZero
Testing Your Setup ​
Dry Run Export ​
Call the dry run endpoint to test your CloudZero configuration without sending data to CloudZero. This endpoint will not send any data to CloudZero, but will return the data that would be exported.
curl -X POST "http://localhost:4000/cloudzero/dry-run" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"limit": 10
}' | jq
Expected Response:
{
"message" : "CloudZero dry run export completed successfully." ,
"status" : "success" ,
"dry_run_data" : {
"usage_data" : [ ... ] ,
"cbf_data" : [ ... ] ,
"summary" : {
"total_cost" : 0.05 ,
"total_tokens" : 1250 ,
"total_records" : 10
}
Manual Export ​
Call the export endpoint to send data immediately to CloudZero. We suggest setting a small limit to test the export. This will only export the last 10 records to CloudZero. Note: Cloudzero can take up to 15 minutes to process the exported data.
curl -X POST "http://localhost:4000/cloudzero/export" \
"message" : "CloudZero export completed successfully" ,
"status" : "success"
Data Export Details ​
Automatic Export Schedule ​
Frequency : Every 60 minutes (configurable via CLOUDZERO_EXPORT_INTERVAL_MINUTES )
Data Processing : LiteLLM automatically processes and exports usage data hourly
CloudZero Processing : CloudZero typically takes 10-15 minutes to process data from LiteLLM
Data Format ​
LiteLLM exports data in CloudZero Billing Format (CBF) with the following structure:
"time/usage_start" : "2024-01-15T14:00:00Z" ,
"cost/cost" : 0.002 ,
"usage/amount" : 150 ,
"usage/units" : "tokens" ,
"resource/id" : "czrn:litellm:openai:cross-region:team-123:llm-usage:gpt-4o" ,
"resource/service" : "litellm" ,
"resource/account" : "team-123" ,
"resource/region" : "cross-region" ,
"resource/usage_family" : "llm-usage" ,
"resource/tag:provider" : "openai" ,
"resource/tag:model" : "gpt-4o" ,
"resource/tag:prompt_tokens" : "100" ,
"resource/tag:completion_tokens" : "50"
Resource Tagging ​
LiteLLM automatically creates comprehensive resource tags for cost attribution:
Provider Tags : openai , anthropic , azure , etc.
Model Tags : Specific model names like gpt-4o , claude-3-sonnet
Team/User Tags : Team IDs and user IDs for cost allocation
Token Breakdown : Separate tracking of prompt and completion tokens
Usage Metrics : Total tokens consumed per request
Advanced Configuration ​
Custom Export Frequency ​
Change the export frequency (not recommended to go below 60 minutes):
export CLOUDZERO_EXPORT_INTERVAL_MINUTES=120 # Export every 2 hours
Custom Time Range Export ​
Export data for a specific time range:
"start_time_utc": "2024-01-15T00:00:00Z",
"end_time_utc": "2024-01-15T23:59:59Z",
"operation": "replace_hourly"
Troubleshooting ​
Common Issues ​
Missing Credentials Error
CloudZero configuration missing. Please set CLOUDZERO_API_KEY and CLOUDZERO_CONNECTION_ID environment variables.
Solution : Ensure both environment variables are set with valid values.
Connection Issues
Verify your CloudZero API key is valid
Check that the connection ID exists in your CloudZero account
Ensure your proxy has internet access to reach CloudZero's API
No Data in CloudZero
CloudZero can take 10-15 minutes to process data
Check that your LiteLLM proxy is generating usage data
Use the dry-run endpoint to verify data is being formatted correctly
Related Links ​
CloudZero Documentation
CloudZero AnyCost API
Overview
Environment Variables
Setup
End to End Video Walkthrough
Step 1: Configure Environment Variables
Step 2: Enable CloudZero Integration
Step 3: Start LiteLLM Proxy
Setup on UI
Testing Your Setup
Dry Run Export
Manual Export
Data Export Details
Automatic Export Schedule
Data Format
Resource Tagging
Advanced Configuration
Custom Export Frequency
Custom Time Range Export
Troubleshooting
Common Issues
Related Links
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
