# ✨ IP Address Filtering | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/ip_address
- Final URL: https://docs.litellm.ai/docs/proxy/ip_address
- Canonical URL: https://docs.litellm.ai/docs/proxy/ip_address
- Fetched at: 2026-06-23T14:31:11Z
- Content type: text/html; charset=utf-8

## Description

You need a LiteLLM License to unlock this feature. Grab time, to get one today!

## Extracted Text

Skip to main content
Copy as Markdown
info
You need a LiteLLM License to unlock this feature. Grab time , to get one today!
Restrict which IP's can call the proxy endpoints.
general_settings :
allowed_ips : [ "192.168.1.1" ]
Expected Response (if IP not listed)
{
"error": {
"message": "Access forbidden: IP address not allowed.",
"type": "auth_error",
"param": "None",
"code": 403
}
