# Caching | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/caching
- Final URL: https://docs.litellm.ai/docs/proxy/caching
- Canonical URL: https://docs.litellm.ai/docs/proxy/caching
- Fetched at: 2026-06-23T14:29:43Z
- Content type: text/html; charset=utf-8

## Description

For OpenAI/Anthropic Prompt Caching, go here

## Extracted Text

Skip to main content
On this page
Copy as Markdown
note
For OpenAI/Anthropic Prompt Caching, go here
Cache LLM Responses. LiteLLM's caching system stores and reuses LLM responses to save costs and
reduce latency. When you make the same request twice, the cached response is returned instead of
calling the LLM API again.
Supported Caches ​
In Memory Cache
Disk Cache
Redis Cache
Qdrant Semantic Cache
Redis Semantic Cache
Valkey Semantic Cache
S3 Bucket Cache
GCS Bucket Cache
Virtual Key Authentication Cache (Redis) ​
When the proxy verifies a virtual key (customer API key), results are cached so the database is not queried on every request. By default that cache lives only in each worker process —so after a deploy, new pods or extra Uvicorn workers each warm their own cache and can trigger more DB reads until warmed.
Set litellm_settings.enable_redis_auth_cache: true to mirror virtual-key auth data into the same Redis instance configured under litellm_settings.cache / cache_params . Workers and replicas then share cached auth entries across the cluster.
Requirements
litellm_settings.cache must be true (Redis for the proxy is initialized during cache setup). See All settings .
cache_params.type must be redis (or Redis Cluster, per your cache config); the auth cache attaches to that Redis client. See supported cache_params .
Optionally set general_settings.user_api_key_cache_ttl (seconds): TTL applies to both the in-memory and Redis tiers when Redis auth caching is enabled, so stale keys expire consistently.
Example:
litellm_settings :
cache : true
enable_redis_auth_cache : true
cache_params :
type : redis
host : os.environ/REDIS_HOST
port : 6379
general_settings :
user_api_key_cache_ttl : 300 # optional; seconds
tip
Startup logs distinguish the two modes: with enable_redis_auth_cache: true , you should see a message that virtual-key lookups are shared across workers.
Quick Start ​
redis cache
Qdrant Semantic cache
Valkey Semantic cache
s3 cache
gcs cache
redis semantic cache
Caching can be enabled by adding the cache key in the config.yaml Step 1: Add cache to the config.yaml ​
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : gpt - 3.5 - turbo
- model_name : text - embedding - ada - 002
model : text - embedding - ada - 002
set_verbose : True
cache : True # set cache responses to True, litellm defaults to using a redis cache
[OPTIONAL] Step 1.5: Add redis namespaces, default ttl ​ Namespace ​
If you want to create some folder for your keys, you can set a namespace, like this:
cache_params : # set cache params for redis
namespace : "litellm.caching.caching"
and keys will be stored like:
litellm.caching.caching:<hash>
Redis Cluster ​
Set on config.yaml
Set on .env
- model_name : "*"
model : "*"
cache : True
redis_startup_nodes : [ { "host" : "127.0.0.1" , "port" : "7001" } ]
You can configure redis cluster in your .env by setting REDIS_CLUSTER_NODES in your .env
Example REDIS_CLUSTER_NODES value
REDIS_CLUSTER_NODES = "[{"host": "127.0.0.1", "port": "7001"}, {"host": "127.0.0.1", "port": "7003"}, {"host": "127.0.0.1", "port": "7004"}, {"host": "127.0.0.1", "port": "7005"}, {"host": "127.0.0.1", "port": "7006"}, {"host": "127.0.0.1", "port": "7007"}]"
Example python script for setting redis cluster nodes in .env:
# List of startup nodes
startup_nodes = [
{ "host" : "127.0.0.1" , "port" : "7001" } ,
{ "host" : "127.0.0.1" , "port" : "7003" } ,
{ "host" : "127.0.0.1" , "port" : "7004" } ,
{ "host" : "127.0.0.1" , "port" : "7005" } ,
{ "host" : "127.0.0.1" , "port" : "7006" } ,
{ "host" : "127.0.0.1" , "port" : "7007" } ,
]
# set startup nodes in environment variables
os . environ [ "REDIS_CLUSTER_NODES" ] = json . dumps ( startup_nodes )
print ( "REDIS_CLUSTER_NODES" , os . environ [ "REDIS_CLUSTER_NODES" ] )
Redis Sentinel ​
type : "redis"
service_name : "mymaster"
sentinel_nodes : [ [ "localhost" , 26379 ] ]
sentinel_password : "password" # [OPTIONAL]
You can configure redis sentinel in your .env by setting REDIS_SENTINEL_NODES in your .env
Example REDIS_SENTINEL_NODES value
REDIS_SENTINEL_NODES='[["localhost", 26379]]'
REDIS_SERVICE_NAME = "mymaster"
REDIS_SENTINEL_PASSWORD = "password"
sentinel_nodes = [ [ "localhost" , 26379 ] ]
os . environ [ "REDIS_SENTINEL_NODES" ] = json . dumps ( sentinel_nodes )
print ( "REDIS_SENTINEL_NODES" , os . environ [ "REDIS_SENTINEL_NODES" ] )
TTL ​
ttl : 600 # will be cached on redis for 600s
# default_in_memory_ttl: Optional[float], default is None. time in seconds.
# default_in_redis_ttl: Optional[float], default is None. time in seconds.
SSL ​
just set REDIS_SSL="True" in your .env, and LiteLLM will pick this up.
REDIS_SSL="True"
For quick testing, you can also use REDIS_URL, eg.:
REDIS_URL="rediss://.."
but we don't recommend using REDIS_URL in prod. We've noticed a performance difference between
using it vs. redis_host, port, etc. GCP IAM Authentication ​
For GCP Memorystore Redis with IAM authentication, install the required dependency:
IAM authentication for redis is only supported via GCP and only on Redis Clusters for now.
uv add google-cloud-iam
For Redis Cluster with GCP IAM:
redis_startup_nodes :
[ { "host" : "10.128.0.2" , "port" : 6379 } , { "host" : "10.128.0.2" , "port" : 11008 } ]
gcp_service_account : "projects/-/serviceAccounts/your-sa@project.iam.gserviceaccount.com"
ssl : true
ssl_cert_reqs : null
ssl_check_hostname : false
You can configure GCP IAM Redis authentication in your .env:
For Redis Cluster:
REDIS_CLUSTER_NODES='[{"host": "10.128.0.2", "port": 6379}, {"host": "10.128.0.2", "port": 11008}]'
REDIS_GCP_SERVICE_ACCOUNT="projects/-/serviceAccounts/your-sa@project.iam.gserviceaccount.com"
REDIS_GCP_SSL_CA_CERTS="./server-ca.pem"
REDIS_SSL_CERT_REQS="None"
REDIS_SSL_CHECK_HOSTNAME="False"
GCP Authentication Setup
Make sure your GCP credentials are configured:
# Option 1: Service account key file
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account-key.json"
# Option 2: If running on GCP compute instance with service account attached
# No additional setup needed
Step 2: Add Redis Credentials to .env ​
Set either REDIS_URL or the REDIS_HOST in your os environment, to enable caching.
REDIS_URL = "" # REDIS_URL='redis://username:password@hostname:port/database'
## OR ##
REDIS_HOST = "" # REDIS_HOST='redis-18841.c274.us-east-1-3.ec2.cloud.redislabs.com'
REDIS_PORT = "" # REDIS_PORT='18841'
REDIS_PASSWORD = "" # REDIS_PASSWORD='liteLlmIsAmazing'
REDIS_USERNAME = "" # REDIS_USERNAME='my-redis-username' [OPTIONAL] if your redis server requires a username
REDIS_SSL = "True" # REDIS_SSL='True' to enable SSL by default is False
Additional kwargs
info
Use REDIS_* environment variables to configure all Redis client library parameters. This is the suggested mechanism for toggling Redis settings as it automatically maps environment variables to Redis client kwargs.
You can pass in any additional redis.Redis arg, by storing the variable + value in your os
environment, like this:
REDIS_<redis-kwarg-name> = ""
For example:
REDIS_SSL = "True"
REDIS_SSL_CERT_REQS = "None"
REDIS_CONNECTION_POOL_KWARGS = '{"max_connections": 20}'
warning
Note : For non-string Redis parameters (like integers, booleans, or complex objects), avoid using REDIS_* environment variables as they may fail during Redis client initialization. Instead, use cache_kwargs in your router configuration for such parameters.
See how it's read from the environment Step 3: Run proxy with config ​
$ litellm --config /path/to/config.yaml
- model_name : fake - openai - endpoint
model : openai/fake
api_key : fake - key
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
- model_name : openai - embedding
model : openai/text - embedding - 3 - small
api_key : os.environ/OPENAI_API_KEY
type : qdrant - semantic
qdrant_semantic_cache_embedding_model : openai - embedding # the model should be defined on the model_list
qdrant_collection_name : test_collection
qdrant_quantization_config : binary
qdrant_semantic_cache_vector_size : 1536 # vector size must match embedding model dimensionality
similarity_threshold : 0.8 # similarity threshold for semantic cache
Step 2: Add Qdrant Credentials to your .env ​
QDRANT_API_KEY = "16rJUMBRx*************"
QDRANT_API_BASE = "https://5392d382-45*********.cloud.qdrant.io"
Step 3: Run proxy with config ​
Step 4. Test it ​
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "fake-openai-endpoint",
"messages": [
{"role": "user", "content": "Hello"}
}'
Expect to see x-litellm-semantic-similarity in the response headers when semantic caching is
one
Semantic caching on a Valkey instance running the valkey-search module, such as AWS ElastiCache for Valkey. RediSearch and RedisVL are not required.
The valkey-search module must be loaded (check with MODULE LIST / FT._LIST ). On AWS ElastiCache, vector search needs a node-based Valkey 8.2+ cluster ; a cluster-mode-disabled node group is supported and recommended, and a primary with read replicas is fine since only horizontal sharding is unsupported. ElastiCache Serverless does not support vector search . Multi-shard (cluster-mode-enabled) endpoints are not supported here, so use a cluster-mode-disabled endpoint and scale vertically.
Step 1: Add cache to the config.yaml ​
type : valkey - semantic
host : os.environ/VALKEY_HOST
port : os.environ/VALKEY_PORT
valkey_semantic_cache_embedding_model : openai - embedding # the model should be defined on the model_list
valkey_semantic_cache_index_name : litellm_semantic_cache_index # optional
Step 2: Add Valkey Credentials to your .env ​
VALKEY_HOST = "your-valkey-host"
VALKEY_PORT = "6379"
VALKEY_PASSWORD = "your-password" # omit for passwordless / IAM-auth clusters
For ElastiCache with encryption in transit (TLS), add ssl: true under cache_params , or set cache_params.redis_url to a rediss:// URL instead of host and port. To run valkey-search locally, docker run -d -p 6379:6379 valkey/valkey-bundle:8.1 . Step 3: Run proxy with config ​
cache : True # set cache responses to True
cache_params : # set cache params for s3
type : s3
s3_bucket_name : cache - bucket - litellm # AWS Bucket Name for S3
s3_region_name : us - west - 2 # AWS Region Name for S3
s3_aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID # us os.environ/<variable name> to pass environment variables. This is AWS Access Key ID for S3
s3_aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY # AWS Secret Access Key for S3
s3_endpoint_url : https : //s3.amazonaws.com # [OPTIONAL] S3 endpoint URL, if you want to use Backblaze/cloudflare s3 buckets
Step 2: Run proxy with config ​
cache_params : # set cache params for gcs
type : gcs
gcs_bucket_name : cache - bucket - litellm # GCS Bucket Name for caching
gcs_path_service_account : os.environ/GCS_PATH_SERVICE_ACCOUNT # use os.environ/<variable name> to pass environment variables. This is the path to your GCS service account JSON file
gcs_path : cache/ # [OPTIONAL] GCS path prefix for cache objects
Step 2: Add GCS Credentials to .env ​
Set the GCS environment variables in your .env file:
GCS_BUCKET_NAME="your-gcs-bucket-name"
GCS_PATH_SERVICE_ACCOUNT="/path/to/service-account.json"
- model_name : azure - embedding - model
model : azure/azure - embedding - model
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
api_version : "2023-07-01-preview"
type : "redis-semantic"
redis_semantic_cache_embedding_model : azure - embedding - model # set this to a model_name set in model_list
type : local
type : disk
disk_cache_dir : /tmp/litellm - cache # OPTIONAL, default to ./.litellm_cache
Usage ​
Basic ​
/chat/completions
/embeddings
Send the same request twice:
curl http://0.0.0.0:4000/v1/chat/completions \
"model": "gpt-3.5-turbo",
"messages": [{"role": "user", "content": "write a poem about litellm!"}],
"temperature": 0.7
curl --location 'http://0.0.0.0:4000/embeddings' \
--header 'Content-Type: application/json' \
--data ' {
"model": "text-embedding-ada-002",
"input": ["write a litellm poem"]
Dynamic Cache Controls ​
Parameter Type Description ttl Optional(int) Will cache the response for the user-defined amount of time (in seconds) s-maxage Optional(int) Will only accept cached responses that are within user-defined range (in seconds) no-cache Optional(bool) Will not store the response in cache. no-store Optional(bool) Will not cache the response namespace Optional(str) Will cache the response under a user-defined namespace
Each cache parameter can be controlled on a per-request basis. Here are examples for each parameter:
ttl ​
Set how long (in seconds) to cache a response.
OpenAI Python SDK
curl
from openai import OpenAI
client = OpenAI (
api_key = "your-api-key" ,
base_url = "http://0.0.0.0:4000"
)
chat_completion = client . chat . completions . create (
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
model = "gpt-3.5-turbo" ,
extra_body = {
"cache" : {
"ttl" : 300 # Cache response for 5 minutes
}
curl http://localhost:4000/v1/chat/completions \
"cache": {"ttl": 300},
s-maxage ​
Only accept cached responses that are within the specified age (in seconds).
"s-maxage" : 600 # Only use cache if less than 10 minutes old
"cache": {"s-maxage": 600},
no-cache ​
Force a fresh response, bypassing the cache.
"no-cache" : True # Skip cache check, get fresh response
"cache": {"no-cache": true},
no-store ​
Will not store the response in cache.
"no-store" : True # Don't cache this response
"cache": {"no-store": true},
namespace ​
Store the response under a specific cache namespace.
"namespace" : "my-custom-namespace" # Store in custom namespace
"cache": {"namespace": "my-custom-namespace"},
Set cache for proxy, but not on the actual llm api call ​
Use this if you just want to enable features like rate limiting, and loadbalancing across multiple
instances.
Set supported_call_types: [] to disable caching on the actual api call.
supported_call_types : [ ]
Debugging Caching - /cache/ping ​
LiteLLM Proxy exposes a /cache/ping endpoint to test if the cache is working as expected
Usage
curl --location 'http://0.0.0.0:4000/cache/ping' -H "Authorization: Bearer sk-1234"
Expected Response - when cache healthy
{
"status": "healthy",
"cache_type": "redis",
"ping_response": true,
"set_cache_response": "success",
"litellm_cache_params": {
"supported_call_types": "['completion', 'acompletion', 'embedding', 'aembedding', 'atranscription', 'transcription']",
"type": "redis",
"namespace": "None"
},
"redis_cache_params": {
"redis_client": "Redis<ConnectionPool<Connection<host=redis-16337.c322.us-east-1-2.ec2.cloud.redislabs.com,port=16337,db=0>>>",
"redis_kwargs": "{'url': 'redis://:******@redis-16337.c322.us-east-1-2.ec2.cloud.redislabs.com:16337'}",
"async_redis_conn_pool": "BlockingConnectionPool<Connection<host=redis-16337.c322.us-east-1-2.ec2.cloud.redislabs.com,port=16337,db=0>>",
"redis_version": "7.2.0"
Advanced ​
Control Call Types Caching is on for - ( /chat/completion , /embeddings , etc.) ​
By default, caching is on for all call types. You can control which call types caching is on for by
setting supported_call_types in cache_params
Cache will only be on for the call types specified in supported_call_types
supported_call_types :
[ "acompletion" , "atext_completion" , "aembedding" , "atranscription" ]
# /chat/completions, /completions, /embeddings, /audio/transcriptions
Set Cache Params on config.yaml ​
cache_params : # cache_params are optional
type : "redis" # The type of cache to initialize. Can be "local", "redis", "s3", or "gcs". Defaults to "local".
host : "localhost" # The host address for the Redis cache. Required if type is "redis".
port : 6379 # The port number for the Redis cache. Required if type is "redis".
password : "your_password" # The password for the Redis cache. Required if type is "redis".
# Optional configurations
Deleting Cache Keys - /cache/delete ​
In order to delete a cache key, send a request to /cache/delete with the keys you want to delete
Example
curl -X POST "http://0.0.0.0:4000/cache/delete" \
-d '{"keys": ["586bf3f3c1bf5aecb55bd9996494d3bbc69eb58397163add6d49537762a7548d", "key2"]}'
# {"status":"success"}
Viewing Cache Keys from responses ​
You can view the cache_key in the response headers, on cache hits the cache key is sent as the
x-litellm-cache-key response headers
curl -i --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"user": "ishan",
"role": "user",
"content": "what is litellm"
],
Response from litellm proxy
date : Thu , 04 Apr 2024 17 : 37 : 21 GMT
content-type : application/json
x-litellm-cache-key : 586bf3f3c1bf5aecb55bd9996494d3bbc69eb58397163add6d49537762a7548d
"id" : "chatcmpl-9ALJTzsBlXR9zTxPvzfFFtFbFtG6T" ,
"choices" : [
"finish_reason" : "stop" ,
"index" : 0 ,
"message" : {
"content" : "I'm sorr.."
"role" : "assistant"
] ,
"created" : 1712252235 ,
**Set Caching Default Off - Opt in only ** ​
Set mode: default_off for caching
# default off mode
mode : default_off # 👈 Key change cache is default_off
Opting in to cache when cache is default off
import os
client = OpenAI ( api_key = < litellm - api - key > , base_url = "http://0.0.0.0:4000" )
messages = [
"role" : "user" ,
"content" : "Say this is a test" ,
extra_body = { # OpenAI python accepts extra args in extra_body
"cache" : { "use-cache" : True }
"cache": {"use-cache": True}
{"role": "user", "content": "Say this is a test"}
Redis max_connections ​
You can set the max_connections parameter in your cache_params for Redis. This is passed directly to the Redis client and controls the maximum number of simultaneous connections in the pool. If you see errors like No connection available , try increasing this value:
max_connections : 100
Supported cache_params on proxy config.yaml ​
# ttl
ttl : Optional [ float ]
default_in_memory_ttl : Optional [ float ]
default_in_redis_ttl : Optional [ float ]
max_connections : Optional [ Int ]
# Type of cache (options: "local", "redis", "s3", "gcs")
# List of litellm call types to cache for
# Options: "completion", "acompletion", "embedding", "aembedding"
# Redis cache parameters
host : localhost # Redis server hostname or IP address
port : "6379" # Redis server port (as a string)
password : secret_password # Redis server password
namespace : Optional [ str ] = None ,
# GCP IAM Authentication for Redis
gcp_service_account : "projects/-/serviceAccounts/your-sa@project.iam.gserviceaccount.com" # GCP service account for IAM authentication
gcp_ssl_ca_certs : "./server-ca.pem" # Path to SSL CA certificate file for GCP Memorystore Redis
ssl : true # Enable SSL for secure connections
ssl_cert_reqs : null # Set to null for self-signed certificates
ssl_check_hostname : false # Set to false for self-signed certificates
# S3 cache parameters
s3_bucket_name : your_s3_bucket_name # Name of the S3 bucket
s3_region_name : us - west - 2 # AWS region of the S3 bucket
s3_api_version : 2006-03-01 # AWS S3 API version
s3_use_ssl : true # Use SSL for S3 connections (options: true, false)
s3_verify : true # SSL certificate verification for S3 connections (options: true, false)
s3_endpoint_url : https : //s3.amazonaws.com # S3 endpoint URL
s3_aws_access_key_id : your_access_key # AWS Access Key ID for S3
s3_aws_secret_access_key : your_secret_key # AWS Secret Access Key for S3
s3_aws_session_token : your_session_token # AWS Session Token for temporary credentials
# GCS cache parameters
gcs_bucket_name : your_gcs_bucket_name # Name of the GCS bucket
gcs_path_service_account : /path/to/service - account.json # Path to GCS service account JSON file
Provider-Specific Optional Parameters Caching ​
By default, LiteLLM only includes standard OpenAI parameters in cache keys. However, some providers (like Vertex AI) use additional parameters that affect the output but aren't included in the standard cache key generation.
Enable Provider-Specific Parameter Caching ​
Add this setting to your config.yaml to include provider-specific optional parameters in cache keys:
enable_caching_on_provider_specific_optional_params : True # Include provider-specific params in cache keys
Advanced - user api key cache ttl ​
Configure how long the in-memory cache stores the key object (prevents db requests)
user_api_key_cache_ttl : <your - number > #time in seconds
By default this value is set to 60s.
Supported Caches
Virtual Key Authentication Cache (Redis)
Quick Start
Basic
Dynamic Cache Controls
ttl
s-maxage
no-cache
no-store
namespace
Set cache for proxy, but not on the actual llm api call
Debugging Caching - /cache/ping
Advanced
Control Call Types Caching is on for - ( /chat/completion , /embeddings , etc.)
Set Cache Params on config.yaml
Deleting Cache Keys - /cache/delete
**Set Caching Default Off - Opt in only **
Redis max_connections
Supported cache_params on proxy config.yaml
Provider-Specific Optional Parameters Caching
Enable Provider-Specific Parameter Caching
Advanced - user api key cache ttl
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
