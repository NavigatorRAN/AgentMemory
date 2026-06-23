# Caching - In-Memory, Redis, s3, gcs, Redis Semantic Cache, Disk | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/caching/all_caches
- Final URL: https://docs.litellm.ai/docs/caching/all_caches
- Canonical URL: https://docs.litellm.ai/docs/caching/all_caches
- Fetched at: 2026-06-23T14:22:56Z
- Content type: text/html; charset=utf-8

## Description

See Code

## Extracted Text

Skip to main content
On this page
Copy as Markdown
See Code
info
For Proxy Server? Doc here: Caching Proxy Server
For OpenAI/Anthropic Prompt Caching, go here
Initialize Cache - In Memory, Redis, s3 Bucket, gcs Bucket, Redis Semantic, Disk Cache, Qdrant Semantic ​
redis-cache
gcs-cache
s3-cache
azure-blob-cache
redis-semantic cache
qdrant-semantic cache
valkey-semantic cache
in memory cache
disk cache
Install redis
uv add redis
For the hosted version you can setup your own Redis DB here: https://redis.io/try-free/
Basic Redis Cache
import litellm
from litellm import completion
from litellm . caching . caching import Cache
litellm . cache = Cache ( type = "redis" , host = < host > , port = < port > , password = < password > )
# Make completion calls
response1 = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ]
)
response2 = completion (
# response1 == response2, response 1 is cached
GCP IAM Redis Authentication
For GCP Memorystore Redis with IAM authentication:
uv add google-cloud-iam
# For Redis Cluster with GCP IAM
from litellm . caching . redis_cluster_cache import RedisClusterCache
litellm . cache = RedisClusterCache (
startup_nodes = [
{ "host" : "10.128.0.2" , "port" : 6379 } ,
{ "host" : "10.128.0.2" , "port" : 11008 } ,
] ,
gcp_service_account = "projects/-/serviceAccounts/your-sa@project.iam.gserviceaccount.com" ,
ssl = True ,
ssl_cert_reqs = None ,
ssl_check_hostname = False ,
Environment Variables for GCP IAM Redis
You can also set these as environment variables:
export REDIS_HOST="10.128.0.2"
export REDIS_PORT="6379"
export REDIS_GCP_SERVICE_ACCOUNT="projects/-/serviceAccounts/your-sa@project.iam.gserviceaccount.com"
export REDIS_SSL="False"
Then simply initialize:
litellm . cache = Cache ( type = "redis" )
Use REDIS_* environment variables as the primary mechanism for configuring all Redis client library parameters. This approach automatically maps environment variables to Redis client kwargs and is the suggested way to toggle Redis settings.
warning
If you need to pass non-string Redis parameters (integers, booleans, complex objects), avoid REDIS_* environment variables as they may fail during Redis client initialization. Instead, pass them directly as kwargs to the Cache() constructor.
Set environment variables
GCS_BUCKET_NAME="my-cache-bucket"
GCS_PATH_SERVICE_ACCOUNT="/path/to/service_account.json"
litellm . cache = Cache ( type = "gcs" , gcs_bucket_name = "my-cache-bucket" , gcs_path_service_account = "/path/to/service_account.json" )
Install boto3
uv add boto3
Set AWS environment variables
AWS_ACCESS_KEY_ID = "AKI*******"
AWS_SECRET_ACCESS_KEY = "WOl*****"
# pass s3-bucket name
litellm . cache = Cache ( type = "s3" , s3_bucket_name = "cache-bucket-litellm" , s3_region_name = "us-west-2" )
Install azure-storage-blob and azure-identity
uv add azure-storage-blob azure-identity
from azure . identity import DefaultAzureCredential
# pass Azure Blob Storage account URL and container name
litellm . cache = Cache ( type = "azure-blob" , azure_account_url = "https://example.blob.core.windows.net" , azure_blob_container = "litellm" )
Install redisvl client
uv add redisvl==0.4.1
random_number = random . randint (
1 , 100000
) # add a random number to ensure it's always adding / reading from cache
print ( "testing semantic caching" )
litellm . cache = Cache (
type = "redis-semantic" ,
host = os . environ [ "REDIS_HOST" ] ,
port = os . environ [ "REDIS_PORT" ] ,
password = os . environ [ "REDIS_PASSWORD" ] ,
similarity_threshold = 0.8 , # similarity threshold for cache hits, 0 == no similarity, 1 = exact matches, 0.5 == 50% similarity
ttl = 120 ,
redis_semantic_cache_embedding_model = "text-embedding-ada-002" , # this model is passed to litellm.embedding(), any litellm.embedding() model is supported here
messages = [
{
"role" : "user" ,
"content" : f"write a one sentence poem about: { random_number } " ,
}
max_tokens = 20 ,
print ( f"response1: { response1 } " )
random_number = random . randint ( 1 , 100000 )
print ( f"response2: { response1 } " )
assert response1 . id == response2 . id
You can set up your own cloud Qdrant cluster by following this: https://qdrant.tech/documentation/quickstart-cloud/
To set up a Qdrant cluster locally follow: https://qdrant.tech/documentation/quickstart/
type = "qdrant-semantic" ,
qdrant_api_base = os . environ [ "QDRANT_API_BASE" ] ,
qdrant_api_key = os . environ [ "QDRANT_API_KEY" ] ,
qdrant_collection_name = "your_collection_name" , # any name of your collection
similarity_threshold = 0.7 , # similarity threshold for cache hits, 0 == no similarity, 1 = exact matches, 0.5 == 50% similarity
qdrant_quantization_config = "binary" , # can be one of 'binary', 'product' or 'scalar' quantizations that is supported by qdrant
qdrant_semantic_cache_embedding_model = "text-embedding-ada-002" , # this model is passed to litellm.embedding(), any litellm.embedding() model is supported here
qdrant_semantic_cache_vector_size = 1536 , # vector size for the embedding model, must match the dimensionality of the embedding model used
print ( f"response2: { response2 } " )
Use this when your vector store is a Valkey instance running the valkey-search module, for example AWS ElastiCache for Valkey . RediSearch and RedisVL are not required; LiteLLM drives valkey-search directly over the Redis protocol.
Requirements
The valkey-search module must be loaded on the server (run MODULE LIST and look for search , or FT._LIST ). On AWS ElastiCache, vector search is available on node-based Valkey 8.2+ clusters ; a cluster-mode-disabled node group is supported and is the recommended target, and a primary with read replicas is fine since only horizontal sharding is unsupported. ElastiCache Serverless does not support vector search , so a serverless endpoint will not work here. Multi-shard (cluster-mode-enabled) endpoints are not supported by this backend, since the async client cannot route the FT.* search commands across shards; scale vertically instead.
To run a Valkey instance with valkey-search locally, the valkey/valkey-bundle image ships the module:
docker run -d -p 6379:6379 valkey/valkey-bundle:8.1
type = "valkey-semantic" ,
host = os . environ [ "VALKEY_HOST" ] ,
port = os . environ [ "VALKEY_PORT" ] ,
password = os . environ . get ( "VALKEY_PASSWORD" ) , # omit for passwordless / IAM-auth clusters
valkey_semantic_cache_embedding_model = "text-embedding-ada-002" , # this model is passed to litellm.embedding(), any litellm.embedding() model is supported here
valkey_semantic_cache_index_name = "litellm_semantic_cache_index" , # optional, defaults to litellm_semantic_cache_index
VALKEY_HOST , VALKEY_PORT , and VALKEY_PASSWORD fall back to REDIS_HOST , REDIS_PORT , and REDIS_PASSWORD if they are not set. For ElastiCache with encryption in transit (TLS), either pass ssl=True alongside host and port, or pass a full redis_url="rediss://..." .
Quick Start ​
litellm . cache = Cache ( )
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ] ,
caching = True
Install the disk caching extra:
uv add "litellm[caching]"
Then you can use the disk cache as follows.
litellm . cache = Cache ( type = "disk" )
If you run the code two times, response1 will use the cache from the first run that was stored in a cache file.
Switch Cache On / Off Per LiteLLM Call ​
LiteLLM supports 4 cache-controls:
no-cache : Optional(bool) When True , Will not return a cached response, but instead call the actual endpoint.
no-store : Optional(bool) When True , Will not cache the response.
ttl : Optional(int) - Will cache the response for the user-defined amount of time (in seconds).
s-maxage : Optional(int) Will only accept cached responses that are within user-defined range (in seconds).
Let us know if you need more
No-Cache
No-Store
ttl
s-maxage
Example usage no-cache - When True , Will not return a cached response
response = litellm . completion (
"content" : "hello who are you"
cache = { "no-cache" : True } ,
Example usage no-store - When True , Will not cache the response.
cache = { "no-store" : True } ,
Example usage ttl - cache the response for 10 seconds
cache = { "ttl" : 10 } ,
Example usage s-maxage - Will only accept cached responses for 60 seconds
cache = { "s-maxage" : 60 } ,
Cache Context Manager - Enable, Disable, Update Cache ​
Use the context manager for easily enabling, disabling & updating the litellm cache
Enabling Cache ​
Quick Start Enable
litellm . enable_cache ( )
Advanced Params
litellm . enable_cache (
type : Optional [ Literal [ "local" , "redis" , "s3" , "gcs" , "disk" ] ] = "local" ,
host : Optional [ str ] = None ,
port : Optional [ str ] = None ,
password : Optional [ str ] = None ,
supported_call_types : Optional [
List [ Literal [ "completion" , "acompletion" , "embedding" , "aembedding" , "atranscription" , "transcription" ] ]
] = [ "completion" , "acompletion" , "embedding" , "aembedding" , "atranscription" , "transcription" ] ,
** kwargs ,
Disabling Cache ​
Switch caching off
litellm . disable_cache ( )
Updating Cache Params (Redis Host, Port etc) ​
Update the Cache params
litellm . update_cache (
Custom Cache Keys: ​
Define function to return cache key
# this function takes in *args, **kwargs and returns the key you want to use for caching
def custom_get_cache_key ( * args , ** kwargs ) :
# return key to use for your cache:
key = kwargs . get ( "model" , "" ) + str ( kwargs . get ( "messages" , "" ) ) + str ( kwargs . get ( "temperature" , "" ) ) + str ( kwargs . get ( "logit_bias" , "" ) )
print ( "key for cache" , key )
return key
Set your function as litellm.cache.get_cache_key
cache = Cache ( type = "redis" , host = os . environ [ 'REDIS_HOST' ] , port = os . environ [ 'REDIS_PORT' ] , password = os . environ [ 'REDIS_PASSWORD' ] )
cache . get_cache_key = custom_get_cache_key # set get_cache_key function for your cache
litellm . cache = cache # set litellm.cache to your cache
How to write custom add/get cache functions ​
1. Init Cache ​
cache = Cache ( )
2. Define custom add/get cache functions ​
def add_cache ( self , result , * args , ** kwargs ) :
your logic
def get_cache ( self , * args , ** kwargs ) :
3. Point cache add/get functions to your add/get functions ​
cache . add_cache = add_cache
cache . get_cache = get_cache
Cache Initialization Parameters ​
def __init__ (
self ,
type : Optional [ Literal [ "local" , "redis" , "redis-semantic" , "valkey-semantic" , "s3" , "gcs" , "disk" ] ] = "local" ,
ttl : Optional [ float ] = None ,
default_in_memory_ttl : Optional [ float ] = None ,
# redis cache params
namespace : Optional [ str ] = None ,
default_in_redis_ttl : Optional [ float ] = None ,
redis_flush_size = None ,
# GCP IAM Redis authentication params
gcp_service_account : Optional [ str ] = None ,
gcp_ssl_ca_certs : Optional [ str ] = None ,
ssl : Optional [ bool ] = None ,
ssl_cert_reqs : Optional [ Union [ str , None ] ] = None ,
ssl_check_hostname : Optional [ bool ] = None ,
# redis semantic cache params
similarity_threshold : Optional [ float ] = None ,
redis_semantic_cache_embedding_model : str = "text-embedding-ada-002" ,
redis_semantic_cache_index_name : Optional [ str ] = None ,
# valkey semantic cache params (valkey-search module, e.g. ElastiCache for Valkey)
valkey_semantic_cache_embedding_model : str = "text-embedding-ada-002" ,
valkey_semantic_cache_index_name : Optional [ str ] = None ,
# s3 Bucket, boto3 configuration
s3_bucket_name : Optional [ str ] = None ,
s3_region_name : Optional [ str ] = None ,
s3_api_version : Optional [ str ] = None ,
s3_path : Optional [ str ] = None , # if you wish to save to a specific path
s3_use_ssl : Optional [ bool ] = True ,
s3_verify : Optional [ Union [ bool , str ] ] = None ,
s3_endpoint_url : Optional [ str ] = None ,
s3_aws_access_key_id : Optional [ str ] = None ,
s3_aws_secret_access_key : Optional [ str ] = None ,
s3_aws_session_token : Optional [ str ] = None ,
s3_config : Optional [ Any ] = None ,
# disk cache params
disk_cache_dir = None ,
# qdrant cache params
qdrant_api_base : Optional [ str ] = None ,
qdrant_api_key : Optional [ str ] = None ,
qdrant_collection_name : Optional [ str ] = None ,
qdrant_quantization_config : Optional [ str ] = None ,
qdrant_semantic_cache_embedding_model = "text-embedding-ada-002" ,
qdrant_semantic_cache_vector_size : Optional [ int ] = None ,
** kwargs
) :
Logging ​
Cache hits are logged in success events as kwarg["cache_hit"] .
Here's an example of accessing it:
from litellm . integrations . custom_logger import CustomLogger
from litellm import completion , acompletion , Cache
# create custom callback for success_events
class MyCustomHandler ( CustomLogger ) :
async def async_log_success_event ( self , kwargs , response_obj , start_time , end_time ) :
print ( f"On Success" )
print ( f"Value of Cache hit: {kwargs['cache_hit']" } )
async def test_async_completion_azure_caching ( ) :
# set custom callback
customHandler_caching = MyCustomHandler ( )
litellm . callbacks = [ customHandler_caching ]
# init cache
litellm . cache = Cache ( type = "redis" , host = os . environ [ 'REDIS_HOST' ] , port = os . environ [ 'REDIS_PORT' ] , password = os . environ [ 'REDIS_PASSWORD' ] )
unique_time = time . time ( )
response1 = await litellm . acompletion ( model = "azure/chatgpt-v-2" ,
messages = [ {
"content" : f"Hi 👋 - i'm async azure { unique_time } "
} ] ,
caching = True )
await asyncio . sleep ( 1 )
print ( f"customHandler_caching.states pre-cache hit: { customHandler_caching . states } " )
response2 = await litellm . acompletion ( model = "azure/chatgpt-v-2" ,
await asyncio . sleep ( 1 ) # success callbacks are done in parallel
Initialize Cache - In Memory, Redis, s3 Bucket, gcs Bucket, Redis Semantic, Disk Cache, Qdrant Semantic
Quick Start
Switch Cache On / Off Per LiteLLM Call
Cache Context Manager - Enable, Disable, Update Cache
Enabling Cache
Disabling Cache
Updating Cache Params (Redis Host, Port etc)
Custom Cache Keys:
How to write custom add/get cache functions
1. Init Cache
2. Define custom add/get cache functions
3. Point cache add/get functions to your add/get functions
Cache Initialization Parameters
Logging
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
