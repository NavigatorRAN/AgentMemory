# Grafana Pyroscope CPU profiling | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/pyroscope_profiling
- Final URL: https://docs.litellm.ai/docs/proxy/pyroscope_profiling
- Canonical URL: https://docs.litellm.ai/docs/proxy/pyroscope_profiling
- Fetched at: 2026-06-23T14:31:53Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM proxy can send continuous CPU profiles to Grafana Pyroscope when enabled via environment variables. This is optional and off by default.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM proxy can send continuous CPU profiles to Grafana Pyroscope when enabled via environment variables. This is optional and off by default.
Quick start ​
Install the optional dependency (required only when enabling Pyroscope):
uv add pyroscope-io
Or install the proxy extra:
uv add "litellm[proxy]"
Set environment variables before starting the proxy:
Variable Required Description LITELLM_ENABLE_PYROSCOPE Yes (to enable) Set to true to enable Pyroscope profiling. PYROSCOPE_APP_NAME Yes (when enabled) Application name shown in the Pyroscope UI. PYROSCOPE_SERVER_ADDRESS Yes (when enabled) Pyroscope server URL (e.g. http://localhost:4040 ). PYROSCOPE_SAMPLE_RATE No Sample rate (integer). If unset, the pyroscope-io library default is used. PYROSCOPE_GRAFANA_USER No Grafana Cloud Pyroscope user/tenant ID. Required when PYROSCOPE_GRAFANA_API_TOKEN is set. PYROSCOPE_GRAFANA_API_TOKEN No Grafana Cloud API/access policy token. Used as the Pyroscope basic auth password.
Start the proxy ; profiling will begin automatically when the proxy starts.
export LITELLM_ENABLE_PYROSCOPE=true
export PYROSCOPE_APP_NAME=litellm-proxy
export PYROSCOPE_SERVER_ADDRESS=http://localhost:4040
litellm --config config.yaml
For Grafana Cloud Pyroscope, use the Profiles endpoint as PYROSCOPE_SERVER_ADDRESS
and set the Grafana Cloud credentials:
export PYROSCOPE_SERVER_ADDRESS=https://profiles-prod-<region>.grafana.net
export PYROSCOPE_GRAFANA_USER=<grafana-cloud-pyroscope-user>
export PYROSCOPE_GRAFANA_API_TOKEN=<grafana-cloud-api-or-access-policy-token>
View profiles in the Pyroscope (or Grafana) UI and select your PYROSCOPE_APP_NAME .
Notes ​
Optional dependency : pyroscope-io is an optional dependency. If it is not installed and LITELLM_ENABLE_PYROSCOPE=true , the proxy will log a warning and continue without profiling.
Platform support : The pyroscope-io package uses a native extension and is not available on all platforms (e.g. Windows is excluded by the package).
Other settings : See Configuration settings for all proxy environment variables.
Quick start
Notes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
