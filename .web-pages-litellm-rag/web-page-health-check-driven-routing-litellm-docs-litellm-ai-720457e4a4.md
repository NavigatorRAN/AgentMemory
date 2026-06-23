# Health Check Driven Routing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/health_check_routing
- Final URL: https://docs.litellm.ai/docs/proxy/health_check_routing
- Canonical URL: https://docs.litellm.ai/docs/proxy/health_check_routing
- Fetched at: 2026-06-23T14:31:09Z
- Content type: text/html; charset=utf-8

## Description

Route traffic away from unhealthy deployments before users hit errors. Background health checks run on a configurable interval, and any deployment that fails gets removed from the routing pool proactively, not after a user request already failed.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Route traffic away from unhealthy deployments before users hit errors. Background health checks run on a configurable interval, and any deployment that fails gets removed from the routing pool proactively, not after a user request already failed.
Architecture ​
What problem does this solve? ​
By default, LiteLLM routes traffic to all deployments and only stops sending to a broken one after it has already failed a user request. The cooldown system is reactive.
Health check driven routing makes this proactive : a background loop pings every deployment on a configurable interval. If a deployment fails its health check, it gets removed from the routing pool immediately, before a user request lands on it.
When you also set allowed_fails_policy , you control exactly how many health check failures of each error type (auth errors, rate limits, timeouts) are needed before a deployment enters cooldown. This avoids false positives from transient noise.
Setup ​
Step 1: Enable background health checks ​
Background health checks are off by default. Turn them on in general_settings :
general_settings :
background_health_checks : true
health_check_interval : 60 # seconds between each full check cycle
Step 2: Enable health check routing ​
health_check_interval : 60
enable_health_check_routing : true # ← route away from unhealthy deployments
At this point, any deployment that fails its health check is immediately excluded from routing until the next check cycle clears it.
Step 3: Add a policy to control how many failures trigger cooldown ​
Without a policy, the first health check failure marks a deployment as unhealthy. If you want more tolerance (e.g., only act after 2 consecutive auth failures), use allowed_fails_policy :
model_list :
- model_name : claude - sonnet
litellm_params :
model : anthropic/claude - sonnet - 4 - 5
api_key : os.environ/ANTHROPIC_API_KEY
api_key : os.environ/ANTHROPIC_API_KEY_SECONDARY
health_check_interval : 30
enable_health_check_routing : true
router_settings :
cooldown_time : 60 # how long a deployment stays in cooldown
allowed_fails_policy :
AuthenticationErrorAllowedFails : 1 # cooldown after 2nd auth failure
TimeoutErrorAllowedFails : 3 # cooldown after 4th timeout
When allowed_fails_policy is set, the binary health check filter is bypassed. Only the cooldown system controls routing exclusion, and it only fires after your configured threshold is crossed.
Step 4 (optional): Ignore transient errors ​
429 (rate limit) and 408 (timeout) from a health check usually mean the deployment is temporarily overloaded, not broken. To prevent these from affecting routing at all:
health_check_ignore_transient_errors : true # 429 and 408 never affect routing
With this on, only hard failures (401, 404, 5xx) from health checks contribute to cooldown.
Full example ​
- model_name : gpt - 4o
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
api_key : os.environ/OPENAI_API_KEY_SECONDARY
model : azure/gpt - 4o
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
health_check_ignore_transient_errors : true
cooldown_time : 60
AuthenticationErrorAllowedFails : 0 # cooldown immediately on auth failure
TimeoutErrorAllowedFails : 2 # cooldown after 3 timeouts
RateLimitErrorAllowedFails : 5 # cooldown after 6 rate limits (if not ignoring transients)
Configuration reference ​
Setting Where Default Description enable_health_check_routing general_settings false Route away from deployments that fail health checks background_health_checks general_settings false Must be true for health check routing to work health_check_interval general_settings 300 Seconds between full health check cycles health_check_staleness_threshold general_settings interval x 2 Seconds before cached health state is ignored health_check_ignore_transient_errors general_settings false Ignore 429 and 408 from health checks; these never affect routing cooldown_time router_settings 5 Seconds a deployment stays in cooldown after threshold is crossed allowed_fails_policy router_settings null Per-error-type failure thresholds before cooldown (see below)
allowed_fails_policy fields ​
Field Error type HTTP status AuthenticationErrorAllowedFails Bad API key 401 TimeoutErrorAllowedFails Request timeout 408 RateLimitErrorAllowedFails Rate limit exceeded 429 BadRequestErrorAllowedFails Malformed request 400 ContentPolicyViolationErrorAllowedFails Content filtered 400
The value is the number of failures tolerated before cooldown. 0 means cooldown on the first failure. 2 means cooldown on the third.
Things to keep in mind ​
Counter TTL must be longer than the health check interval. allowed_fails_policy works by incrementing a failed_calls counter per deployment. That counter expires after cooldown_time seconds. If cooldown_time is shorter than health_check_interval , the counter resets between every check cycle and failures never accumulate. Set cooldown_time greater than health_check_interval when using allowed_fails_policy .
cooldown_time : 60 # must be > health_check_interval (30s here)
AllowedFails: N means cooldown on the (N+1)th failure. The counter check is updated_fails > allowed_fails , so 0 triggers on the 1st failure, 1 on the 2nd, 2 on the 3rd.
AllowedFails Cooldown triggers after 0 1st failure 1 2nd failure 2 3rd failure
Without allowed_fails_policy , the first failure is enough. The first failed health check immediately excludes the deployment from routing. Use allowed_fails_policy when you want tolerance for flaky checks.
If all deployments are unhealthy, the filter is bypassed. Traffic keeps flowing rather than returning no deployment at all. Requests will fail, but the router keeps trying.
Health check failures and request failures share the same counters. When allowed_fails_policy is set, both sources increment the same failed_calls counter. A deployment at 1 health check failure that then receives 1 failing request will hit the threshold for AllowedFails: 1 and enter cooldown.
Debugging ​
Run the proxy with --detailed_debug and look for these log lines:
After each health check cycle (written at DEBUG level):
health_check_routing_state_updated healthy=2 unhealthy=1
When a health check failure increments the counter and triggers cooldown (DEBUG level):
checks 'should_run_cooldown_logic'
Attempting to add <deployment_id> to cooldown list
When safety net fires because all deployments are in cooldown:
All deployments in cooldown via health-check routing, bypassing cooldown filter
When safety net fires because all deployments are unhealthy (binary filter, no allowed_fails_policy ):
All deployments marked unhealthy by health checks, bypassing health filter
Architecture
What problem does this solve?
Setup
Step 1: Enable background health checks
Step 2: Enable health check routing
Step 3: Add a policy to control how many failures trigger cooldown
Step 4 (optional): Ignore transient errors
Full example
Configuration reference
allowed_fails_policy fields
Things to keep in mind
Debugging
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
