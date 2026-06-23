# Custom HTTP Handler | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/http_handler_config
- Final URL: https://docs.litellm.ai/docs/completion/http_handler_config
- Canonical URL: https://docs.litellm.ai/docs/completion/http_handler_config
- Fetched at: 2026-06-23T14:23:10Z
- Content type: text/html; charset=utf-8

## Description

Configure custom aiohttp sessions for better performance and control in LiteLLM completions.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Configure custom aiohttp sessions for better performance and control in LiteLLM completions.
Overview ​
You can now inject custom aiohttp.ClientSession instances into LiteLLM for:
Custom connection pooling and timeouts
Corporate proxy and SSL configurations
Performance optimization
Request monitoring
Basic Usage ​
Default (No Changes Required) ​
import litellm
# Works exactly as before
response = await litellm . acompletion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Hello!" } ]
)
Custom Session ​
import aiohttp
from litellm . llms . custom_httpx . aiohttp_handler import BaseLLMAIOHTTPHandler
# Create optimized session
session = aiohttp . ClientSession (
timeout = aiohttp . ClientTimeout ( total = 180 ) ,
connector = aiohttp . TCPConnector ( limit = 300 , limit_per_host = 75 )
# Replace global handler
litellm . base_llm_aiohttp_handler = BaseLLMAIOHTTPHandler ( client_session = session )
# All completions now use your session
response = await litellm . acompletion ( model = "gpt-3.5-turbo" , messages = [ . . . ] )
Common Patterns ​
FastAPI Integration ​
from contextlib import asynccontextmanager
from fastapi import FastAPI
@asynccontextmanager
async def lifespan ( app : FastAPI ) :
# Startup
connector = aiohttp . TCPConnector ( limit = 300 )
litellm . base_llm_aiohttp_handler = BaseLLMAIOHTTPHandler (
client_session = session
yield
# Shutdown
await session . close ( )
app = FastAPI ( lifespan = lifespan )
@app . post ( "/chat" )
async def chat ( messages : list [ dict ] ) :
return await litellm . acompletion ( model = "gpt-3.5-turbo" , messages = messages )
Corporate Proxy ​
import ssl
# Custom SSL context
ssl_context = ssl . create_default_context ( )
ssl_context . load_cert_chain ( 'cert.pem' , 'key.pem' )
# Proxy session
connector = aiohttp . TCPConnector ( ssl = ssl_context ) ,
trust_env = True # Use environment proxy settings
High Performance ​
# Optimized for high throughput
timeout = aiohttp . ClientTimeout ( total = 300 ) ,
connector = aiohttp . TCPConnector (
limit = 1000 , # High connection limit
limit_per_host = 200 , # Per host limit
ttl_dns_cache = 600 , # DNS cache
keepalive_timeout = 60 , # Keep connections alive
enable_cleanup_closed = True
Constructor Options ​
BaseLLMAIOHTTPHandler (
client_session = None , # Custom aiohttp.ClientSession
transport = None , # Advanced transport control
connector = None , # Custom aiohttp.BaseConnector
Resource Management ​
User sessions : You manage the lifecycle (call await session.close() )
Auto-created sessions : Automatically cleaned up by the handler
100% backward compatible : Existing code works unchanged
Configuration Tips ​
Development ​
timeout = aiohttp . ClientTimeout ( total = 60 ) ,
connector = aiohttp . TCPConnector ( limit = 50 )
Production ​
limit = 1000 ,
limit_per_host = 200 ,
keepalive_timeout = 60
Overview
Basic Usage
Default (No Changes Required)
Custom Session
Common Patterns
FastAPI Integration
Corporate Proxy
High Performance
Constructor Options
Resource Management
Configuration Tips
Development
Production
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
