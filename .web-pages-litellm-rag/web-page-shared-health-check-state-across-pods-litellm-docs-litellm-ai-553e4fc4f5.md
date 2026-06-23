# Shared Health Check State Across Pods | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/shared_health_check
- Final URL: https://docs.litellm.ai/docs/proxy/shared_health_check
- Canonical URL: https://docs.litellm.ai/docs/proxy/shared_health_check
- Fetched at: 2026-06-23T14:32:05Z
- Content type: text/html; charset=utf-8

## Description

This feature enables coordination of health checks across multiple LiteLLM proxy pods to avoid duplicate health checks and reduce costs.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This feature enables coordination of health checks across multiple LiteLLM proxy pods to avoid duplicate health checks and reduce costs.
Overview ​
When running multiple LiteLLM proxy pods (e.g., in Kubernetes), each pod typically runs its own independent health checks on every model. This can result in:
Duplicate health checks across pods
Increased costs for expensive models (e.g., Gemini 2.5-pro)
Redundant monitoring/logging noise
Inefficient resource usage
The shared health check state feature solves this by:
Coordinating health checks across pods using Redis
Caching results with configurable TTL
Using distributed locks to ensure only one pod runs health checks at a time
Allowing other pods to read cached results instead of running redundant checks
How It Works ​
1. Lock Acquisition ​
When a pod needs to run health checks:
It attempts to acquire a Redis lock
If successful, it runs the health checks
If failed, it waits briefly and checks for cached results
2. Result Caching ​
After running health checks:
Results are cached in Redis with a configurable TTL
Other pods can read these cached results
Cache includes timestamp and pod ID for tracking
3. Fallback Behavior ​
If Redis is unavailable or cache is expired:
Pods fall back to running health checks locally
System continues to function normally
Configuration ​
Enable Shared Health Check ​
Add to your proxy_config.yaml :
general_settings :
# Enable background health checks (required)
background_health_checks : true
# Enable shared health check state across pods
use_shared_health_check : true
# Health check interval (seconds)
health_check_interval : 300 # 5 minutes
# Redis configuration (required for shared health check)
litellm_settings :
cache : true
cache_params :
type : redis
host : your - redis - host
port : 6379
password : your - redis - password
Environment Variables ​
You can also configure using environment variables:
# Enable shared health check
export USE_SHARED_HEALTH_CHECK=true
# Health check TTL (seconds)
export DEFAULT_SHARED_HEALTH_CHECK_TTL=300
# Lock TTL (seconds)
export DEFAULT_SHARED_HEALTH_CHECK_LOCK_TTL=60
Requirements ​
Redis : Required for shared state coordination
Background Health Checks : Must be enabled ( background_health_checks: true )
Multiple Pods : Most beneficial with 2+ proxy instances
API Endpoints ​
Check Shared Health Check Status ​
GET /health/shared-status
Returns information about the shared health check coordination:
{
"shared_health_check_enabled" : true ,
"status" : {
"pod_id" : "pod_1703123456789" ,
"redis_available" : true ,
"lock_ttl" : 60 ,
"cache_ttl" : 300 ,
"lock_owner" : "pod_1703123456788" ,
"lock_in_progress" : true ,
"cache_available" : true ,
"cache_age_seconds" : 45.2 ,
"last_checked_by" : "pod_1703123456788"
}
Monitoring ​
Health Check Status ​
Monitor the shared health check status to ensure proper coordination:
curl -H "Authorization: Bearer your-api-key" \
http://your-proxy-host/health/shared-status
Logs ​
Look for these log messages:
INFO: Initialized shared health check manager
INFO: Pod pod_123 acquired health check lock
INFO: Pod pod_123 released health check lock
INFO: Cached health check results for 5 healthy and 0 unhealthy endpoints
DEBUG: Using cached health check results
Troubleshooting ​
Common Issues ​
1. Shared Health Check Not Working ​
Symptoms : Each pod still runs independent health checks
Solutions :
Verify Redis is configured and accessible
Check that use_shared_health_check: true is set
Ensure background_health_checks: true is enabled
Check Redis connectivity in logs
2. Redis Connection Issues ​
Symptoms : Health checks fall back to local execution
Verify Redis host, port, and credentials
Check network connectivity between pods and Redis
Monitor Redis server logs for errors
3. Lock Not Released ​
Symptoms : One pod holds the lock indefinitely
Lock has automatic TTL (default 60 seconds)
Check pod logs for lock release messages
Verify Redis TTL settings
Debug Mode ​
Enable debug logging to see detailed coordination:
set_verbose : true
Performance Impact ​
Benefits ​
Reduced API calls : Only one pod runs health checks per interval
Lower costs : Especially significant for expensive models
Better resource utilization : Less redundant work across pods
Cleaner monitoring : Reduced noise in logs and metrics
Overhead ​
Redis operations : Minimal overhead for lock/cache operations
Network latency : Small delay for Redis communication
Memory usage : Negligible additional memory usage
Best Practices ​
1. Redis Configuration ​
Use Redis with persistence enabled
Configure appropriate memory limits
Set up Redis monitoring and alerts
2. TTL Settings ​
Set health_check_interval to your desired check frequency
Use default TTL values unless you have specific requirements
Consider model-specific timeouts for expensive models
3. Monitoring ​
Monitor shared health check status endpoint
Set up alerts for Redis connectivity issues
Track health check costs and frequency
4. Scaling ​
Feature works with any number of pods
More pods = better coordination benefits
Consider Redis cluster for high availability
Example Configuration ​
Complete Example ​
# proxy_config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : gpt - 4
api_key : os.environ/OPENAI_API_KEY
model_info :
health_check_timeout : 30 # 30 second timeout for health checks
# Enable background health checks
# Enable shared health check coordination
# Health check interval (5 minutes)
health_check_interval : 300
# Health check details
health_check_details : true
# Redis configuration
host : redis - cluster.example.com
password : os.environ/REDIS_PASSWORD
ssl : true
Kubernetes Example ​
# deployment.yaml
apiVersion : apps/v1
kind : Deployment
metadata :
name : litellm - proxy
spec :
replicas : 3 # Multiple pods for coordination
template :
containers :
- name : litellm - proxy
image : docker.litellm.ai/berriai/litellm : latest
env :
- name : USE_SHARED_HEALTH_CHECK
value : "true"
- name : REDIS_HOST
value : "redis-service"
- name : REDIS_PASSWORD
valueFrom :
secretKeyRef :
name : redis - secret
key : password
Migration ​
From Independent Health Checks ​
Enable Redis : Ensure Redis is configured and accessible
Enable Background Health Checks : Set background_health_checks: true
Enable Shared Health Check : Set use_shared_health_check: true
Deploy : Update your proxy configuration
Monitor : Check /health/shared-status endpoint
Rollback ​
To disable shared health check:
use_shared_health_check : false
# background_health_checks can remain true for independent checks
Related Features ​
Background Health Checks
Redis Caching
High Availability Setup
Health Check Endpoints
Overview
How It Works
1. Lock Acquisition
2. Result Caching
3. Fallback Behavior
Configuration
Enable Shared Health Check
Environment Variables
Requirements
API Endpoints
Check Shared Health Check Status
Monitoring
Health Check Status
Logs
Troubleshooting
Common Issues
Debug Mode
Performance Impact
Benefits
Overhead
Best Practices
1. Redis Configuration
2. TTL Settings
3. Monitoring
4. Scaling
Example Configuration
Complete Example
Kubernetes Example
Migration
From Independent Health Checks
Rollback
Related Features
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
