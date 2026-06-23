# Routing & Load Balancing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/routing-load-balancing
- Final URL: https://docs.litellm.ai/docs/routing-load-balancing
- Canonical URL: https://docs.litellm.ai/docs/routing-load-balancing
- Fetched at: 2026-06-23T14:32:50Z
- Content type: text/html; charset=utf-8

## Description

Learn how to load balance, route, and set fallbacks for your LLM requests

## Extracted Text

Skip to main content
📄️ Router - Load Balancing
LiteLLM manages:
📄️ [BETA] Adaptive Router
Beta feature. Share feedback on Discord or Slack.
📄️ [BETA] Request Prioritization
Beta feature. Use for testing only.
📄️ Auto Routing
LiteLLM can auto select the best model for a request based on rules you define.
📄️ Proxy - Load Balancing
Load balance multiple instances of the same model
📄️ UI - Router Settings for Keys and Teams
Configure router settings at the key and team level to achieve granular control over routing behavior, fallbacks, retries, and other router configurations. This enables you to customize routing behavior for specific keys or teams without affecting global settings.
📄️ Budget Routing
LiteLLM Supports setting the following budgets:
📄️ Fallbacks
If a call fails after num_retries, fallback to another model group.
📄️ [New] Fallback Management Endpoints
Dedicated endpoints for managing model fallbacks separately from the general configuration.
📄️ Tag Based Routing
Route requests based on tags.
📄️ Timeouts
The timeout set in router is for the entire length of the call, and is passed down to the completion() call level as well.
📄️ Provider specific Wildcard routing
Proxy all models from a provider
📄️ Health Check Driven Routing
Route traffic away from unhealthy deployments before users hit errors. Background health checks run on a configurable interval, and any deployment that fails gets removed from the routing pool proactively, not after a user request already failed.
