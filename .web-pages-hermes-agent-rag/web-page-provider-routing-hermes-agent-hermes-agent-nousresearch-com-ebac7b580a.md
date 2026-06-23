# Provider Routing | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/features/provider-routing
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/features/provider-routing
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/features/provider-routing
- Fetched at: 2026-06-23T14:16:30Z
- Content type: text/html; charset=utf-8

## Description

Configure OpenRouter provider preferences to optimize for cost, speed, or quality.

## Extracted Text

Skip to main content
On this page
When using OpenRouter as your LLM provider, Hermes Agent supports provider routing — fine-grained control over which underlying AI providers handle your requests and how they're prioritized.
OpenRouter routes requests to many providers (e.g., Anthropic, Google, AWS Bedrock, Together AI). Provider routing lets you optimize for cost, speed, quality, or enforce specific provider requirements.
tip
Traffic routed through Nous Portal still respects per-model routing and priority configs — and Portal subscribers get 10% off token-billed providers.
Configuration ​
Add a provider_routing section to your ~/.hermes/config.yaml :
provider_routing :
sort : "price" # How to rank providers
only : [ ] # Whitelist: only use these providers
ignore : [ ] # Blacklist: never use these providers
order : [ ] # Explicit provider priority order
require_parameters : false # Only use providers that support all parameters
data_collection : null # Control data collection ("allow" or "deny")
info
Provider routing only applies when using OpenRouter. It has no effect with direct provider connections (e.g., connecting directly to the Anthropic API).
Options ​
sort ​
Controls how OpenRouter ranks available providers for your request.
Value Description "price" Cheapest provider first "throughput" Fastest tokens-per-second first "latency" Lowest time-to-first-token first
sort : "price"
only ​
Whitelist of provider names. When set, only these providers will be used. All others are excluded.
only :
- "Anthropic"
- "Google"
ignore ​
Blacklist of provider names. These providers will never be used, even if they offer the cheapest or fastest option.
ignore :
- "Together"
- "DeepInfra"
order ​
Explicit priority order. Providers listed first are preferred. Unlisted providers are used as fallbacks.
order :
- "AWS Bedrock"
require_parameters ​
When true , OpenRouter will only route to providers that support all parameters in your request (like temperature , top_p , tools , etc.). This avoids silent parameter drops.
require_parameters : true
data_collection ​
Controls whether providers can use your prompts for training. Options are "allow" or "deny" .
data_collection : "deny"
Practical Examples ​
Optimize for Cost ​
Route to the cheapest available provider. Good for high-volume usage and development:
Optimize for Speed ​
Prioritize low-latency providers for interactive use:
sort : "latency"
Optimize for Throughput ​
Best for long-form generation where tokens-per-second matters:
sort : "throughput"
Lock to Specific Providers ​
Ensure all requests go through a specific provider for consistency:
Avoid Specific Providers ​
Exclude providers you don't want to use (e.g., for data privacy):
- "Lepton"
Preferred Order with Fallbacks ​
Try your preferred providers first, fall back to others if unavailable:
How It Works ​
Provider routing preferences are passed to the OpenRouter API via the extra_body.provider field on every API call. This applies to both:
CLI mode — configured in ~/.hermes/config.yaml , loaded at startup
Gateway mode — same config file, loaded when the gateway starts
The routing config is read from config.yaml and passed as parameters when creating the AIAgent :
providers_allowed ← from provider_routing.only
providers_ignored ← from provider_routing.ignore
providers_order ← from provider_routing.order
provider_sort ← from provider_routing.sort
provider_require_parameters ← from provider_routing.require_parameters
provider_data_collection ← from provider_routing.data_collection
You can combine multiple options. For example, sort by price but exclude certain providers and require parameter support:
ignore : [ "Together" ]
Default Behavior ​
When no provider_routing section is configured (the default), OpenRouter uses its own default routing logic, which generally balances cost and availability automatically.
Provider Routing vs. Fallback Models
Provider routing controls which sub-providers within OpenRouter handle your requests. For automatic failover to an entirely different provider when your primary model fails, see Fallback Providers .
Configuration
Options
sort
only
ignore
order
require_parameters
data_collection
Practical Examples
Optimize for Cost
Optimize for Speed
Optimize for Throughput
Lock to Specific Providers
Avoid Specific Providers
Preferred Order with Fallbacks
How It Works
Default Behavior
