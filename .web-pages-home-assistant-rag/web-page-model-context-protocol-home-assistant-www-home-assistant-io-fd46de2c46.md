---
source_url: "https://www.home-assistant.io/integrations/mcp"
final_url: "https://www.home-assistant.io/integrations/mcp"
canonical_url: "https://www.home-assistant.io/integrations/mcp/"
source_handle: "web:www-home-assistant-io:fd46de2c4693"
source_section: "integrations-mcp"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ddcf5f68ab475ddbc156878033e6f1a16313908e61e6e172031aab82613437d4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Model Context Protocol - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mcp
- Final URL: https://www.home-assistant.io/integrations/mcp
- Canonical URL: https://www.home-assistant.io/integrations/mcp/
- Fetched at: 2026-06-28T02:58:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the Model Context Protocol with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Architecture overview
Supported functionality
Tools
Authorization
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Model Context Protocol is an open protocol that
standardizes how applications provide context to LLMs. The Model Context Protocol integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more]
enables using MCP Servers in Home Assistant for providing additional tools to use with a
conversation agent . For example, you can add an MCP server that
supports memory functionality, or that can search the web using functionality not already
available in Home Assistant.
Controlling Home Assistant is done by providing MCP clients access to the Assist API of Home
Assistant. You can control what devices and entities it can access from the exposed entities page .
You will need an MCP server .
If your MCP server only supports the stdio protocol, you will also need an additional
MCP proxy (such as mcp-proxy ) to expose
the server over SSE .
If your MCP server requires authentication, then you will need an OAuth Client ID and Secret.
To add the Model Context Protocol integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Model Context Protocol .
Follow the instructions on screen to complete the setup.
The integration provides the following configuration options:
SSE Server URL
The URL for the SSE endpoint of the MCP server. For example, http://example/sse .
Client ID
If the server requires authentication, enter the OAuth Client ID for the MCP server in the Application Credentials
Client Secret
If the server requires authentication, enter the OAuth Client Secret for the MCP server in the Application Credentials.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can provide additional functionality for LLM conversation agents
(for example Anthropic , Google Generative AI , Ollama , Open AI ).
Home Assistant acts as a client to the MCP server you specify. Home Assistant will
poll the MCP server SSE endpoint and query the list of available tools. The tools are
made available for use by Home Assistant conversation agents, similar to the Assist API.
See the Model Context Protocol Introduction
for more details on the protocol.
The Home Assistant Model Context Protocol integration acts as a client using the
Server-Sent Events (SSE) transport
allowing streaming client-to-server communication. Most MCP clients today only support
stdio transport,
and directly run an MCP server as a local command line tool. You can
use an MCP proxy server like mcp-proxy
to enable Home Assistant to access an MCP SSE server.
Once the integration is configured, you also need to configure the conversation
agent to use the tools.
MCP Tools enable LLMs to
perform actions through Home Assistant. The tools used by the configured LLM API
are exposed.
The Model Context Protocol supports OAuth, and allows you to give Home Assistant
access to restricted MCP servers. You can enter the MCP Servers Application Credentials when configuring
the MCP integration.
The Home Assistant Model Context Protocol integration currently only supports a
subset of MCP features:
Feature Supported by Home Assistant Prompts ❌ Tools ✅ Resources ❌ Sampling ❌ Notifications ❌
See Model Context Protocol: Debugging for
general tips on debugging MCP. If you are developing your own MCP server and having trouble making it work
with Home Assistant, you can also use the MCP Inspector
to verify that your MCP server is working correctly.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Conversation
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Model Context Protocol integration was introduced in Home Assistant 2025.2, and it's used by
224 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Voice
Back to top
