# Splunk Observability Cloud (OpenTelemetry) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/splunk_observability_cloud
- Final URL: https://docs.litellm.ai/docs/observability/splunk_observability_cloud
- Canonical URL: https://docs.litellm.ai/docs/observability/splunk_observability_cloud
- Fetched at: 2026-06-23T14:25:37Z
- Content type: text/html; charset=utf-8

## Description

Send LiteLLM traces to Splunk Observability Cloud using the built-in otel callback and standard OpenTelemetry OTLP environment variables.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Send LiteLLM traces to Splunk Observability Cloud using the built-in otel callback and standard OpenTelemetry OTLP environment variables.
LiteLLM uses the same OpenTelemetry path as the OpenTelemetry integration . Splunk’s OTLP/HTTP trace ingest URL uses /v2/trace/otlp (not /v1/traces ); LiteLLM normalizes generic collector URLs but preserves Splunk-style /v2/trace/otlp endpoints so spans reach Splunk correctly.
Video walkthrough ​
Or watch on Loom .
Prerequisites ​
Splunk Observability Cloud account and an ingest access token (used as X-SF-Token ).
Your realm (for example eu1 , us0 ) from the Splunk Observability Cloud UI or docs.
LiteLLM Proxy ​
Same flow as integrations like Datadog Logs : configure config.yaml , then set environment variables, then start the proxy.
Step 1: In config.yaml , enable the OpenTelemetry callback:
litellm_settings :
callbacks : [ "otel" ]
Step 2: Set the OTLP environment variables below.
You can load them from the process environment, a .env file, or the proxy environment_variables block in config.yaml ( config fields ).
Purpose Variable Trace ingest URL (Splunk OTLP/HTTP) OTEL_EXPORTER_OTLP_ENDPOINT — e.g. https://ingest.<realm>.observability.splunkcloud.com/v2/trace/otlp Auth OTEL_EXPORTER_OTLP_HEADERS or OTEL_HEADERS — e.g. X-SF-Token=<your-access-token> (comma-separated key=value pairs for multiple headers) Protocol OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf for OTLP/HTTP (use grpc only if you target a gRPC OTLP endpoint) Optional resource naming OTEL_SERVICE_NAME , OTEL_ENVIRONMENT_NAME , etc.
Precedence: OTEL_EXPORTER_OTLP_PROTOCOL is read before legacy OTEL_EXPORTER . If both are set, the OTLP protocol variable wins. OTEL_EXPORTER_OTLP_ENDPOINT is preferred over OTEL_ENDPOINT when both are set.
OTEL_EXPORTER_OTLP_ENDPOINT="https://ingest.eu1.observability.splunkcloud.com/v2/trace/otlp"
OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
OTEL_EXPORTER_OTLP_HEADERS="X-SF-Token=<your-ingest-access-token>"
OTEL_SERVICE_NAME="litellm-proxy"
Step 3: Start the proxy:
litellm --config /path/to/config.yaml
Verify traces ​
In Splunk Observability Cloud, open APM / Traces (product names may vary by version).
Filter by service name ( OTEL_SERVICE_NAME , default litellm if unset).
Optionally set OTEL_DEBUG=True in LiteLLM’s environment to surface exporter issues in logs (see OpenTelemetry troubleshooting ).
See also ​
OpenTelemetry — Tracing LLMs
Splunk Observability Cloud — OTLP exporter (vendor docs)
Video walkthrough
Prerequisites
LiteLLM Proxy
Verify traces
See also
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
