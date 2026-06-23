# Model Context Protocol – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/mcp
- Final URL: https://developers.openai.com/codex/mcp
- Canonical URL: https://developers.openai.com/codex/mcp
- Fetched at: 2026-06-23T14:12:38Z
- Content type: text/html; charset=utf-8

## Description

Give Codex access to third-party tools and context

## Extracted Text

Search the Codex docs
Search docs
Suggested
responses create reasoning_effort realtime prompt caching
Primary navigation
Get started
Overview
Quickstart
Models
Pricing
SDKs and CLI
OpenAI SDK
Agents SDK
OpenAI CLI
Latest: GPT-5.5
Prompt guidance
Core concepts
Text generation
Code generation
Images and vision
Audio and speech
Structured output
Function calling
Responses API
Using tools
Agent definitions
Models and providers
Running agents
Sandbox agents
Orchestration
Guardrails
Results and state
Integrations and observability
Evaluate agent workflows
Voice agents
ChatKit
Customize
Widgets
Actions
Advanced integrations
Tools
Web search
MCP and Connectors
Secure MCP Tunnel
Skills
Shell
Computer use
File search and retrieval
File search
Retrieval
Tool search
More tools
Apply Patch
Local shell
Image generation
Code interpreter
Run and scale
Conversation state
Background mode
Streaming
WebSocket mode
Webhooks
File inputs
Context management
Compaction
Counting tokens
Prompt caching
Prompting
Prompt engineering
Citation formatting
Migration guide
Reasoning
Reasoning models
Reasoning best practices
Evaluation
Red teaming
Realtime and audio
Live translation
Transcription
Realtime transcription
Speech to text
Speech generation
Realtime prompting guide
Connection methods
WebRTC
WebSocket
SIP
Realtime sessions
Managing conversations
Voice activity detection
Realtime with tools
Webhooks and server-side controls
Managing costs
Specialized models
Video generation
Deep research
Embeddings
Moderation
Going live
Production best practices
Workload identity federation
Kubernetes
AWS
Microsoft Azure
Google Cloud
GitHub Actions
SPIFFE
Deployment checklist
Amazon Bedrock
Latency optimization
Predicted Outputs
Priority processing
Cost optimization
Batch
Flex processing
Accuracy optimization
Safety
Safety best practices
Safety checks
Cybersecurity checks
Under 18 API Guidance
Legacy APIs
Agent Builder
Node reference
Safety in building agents
Evals
Getting started
Working with evals
Prompt optimizer
External models
Best practices
Graders
Fine-tuning
Optimization cycle
Supervised fine-tuning
Vision fine-tuning
Direct preference optimization
Reinforcement fine-tuning
RFT use cases
Assistants API
Deep dive
Resources
Terms and policies
Changelog
Your data
Permissions
Rate limits
IP egress ranges
Admin APIs
Deprecations
MCP for deep research
Developer mode
ChatGPT Actions
Introduction
Actions library
Authentication
Production
Data retrieval
Sending files
Docs Use cases
Getting Started
Explore use cases
Import to Codex
Concepts
Customization
Memories
Chronicle
Sandboxing
Auto-review
Subagents
Workflows
Cyber Safety
Glossary
Using Codex
App
Features
Settings
Review
Automations
Worktrees
Local Environments
In-app browser
Chrome extension
Computer Use
Appshots
Commands
Windows
Troubleshooting
IDE Extension
IDE Commands
Slash commands
CLI
Command Line Options
Web
Environments
Internet Access
Integrations
GitHub
Slack
Linear
Codex Security
Codex Security plugin
Run a security scan
Run a deep scan
Review code changes
Triage a backlog
Fix findings
Export and track findings
Codex Security cloud
Setup
Improving the threat model
FAQ
Configuration
Config File
Config Basics
Advanced Config
Config Reference
Environment Variables
Sample Config
Speed
Rules
Hooks
AGENTS.md
MCP
Plugins
Build plugins
Sites
Record & Replay
Administration
Access tokens
Agent approvals & security
Remote connections
Deployment
Enterprise
Admin Setup
Governance
Managed configuration
Automation
Non-interactive Mode
Codex SDK
App Server
MCP Server
GitHub Action
Learn
Videos
Community
Blog
Mastering Codex Remote for engineering
Using skills to accelerate OSS maintenance
View all
Cookbooks
Build an Agent Improvement Loop with Traces, Evals, and Codex
Build iterative repair loops with Codex
Building AI Teams
Releases
Feature Maturity
Open Source
Home
Collections
Apps SDK Workspace Agents Commerce Ads
Core Concepts
MCP Apps in ChatGPT
UX principles
UI guidelines
Plan
Research use cases
Define tools
Design components
Build
Set up your server
Build your ChatGPT UI
Authenticate users
Manage state
Monetize your app
Examples
Deploy
Deploy your app
Connect from ChatGPT
Test your integration
Submit your app
Conversion apps
Restaurant reservation spec
Product checkout spec
Guides
Optimize Metadata
Security & Privacy
App submission guidelines
Reference
Trigger workspace agent runs
Authenticate with Workspace Agent access tokens
File Upload
Products
API
Feeds
Promotions
Ads Overview
Measurement
JavaScript Pixel
Conversions API
Supported events
Advertiser API
Product feeds
Campaign Targeting
API Reference
Campaigns
Ad Groups
Ads
Ad Account
Insights
Files
Showcase Blog Cookbook Learn Community
API examples
All posts
Recent
How Perplexity Brought Voice Search to Millions Using the Realtime API
Designing delightful frontends with GPT-5.4
From prompts to products: One year of Responses
Topics
General
Apps SDK
Audio
Codex
Agents
Multimodal
Text
Optimization
ChatGPT
gpt-oss
Contribute
Cookbook on GitHub
OpenAI Developers plugin
Docs MCP
Categories
Demo apps
Audio & Voice
Scaling
Programs
Codex Ambassadors
Codex for Students
Codex for Open Source
Events
Meetups
Hackathon Support
Forum
Discord
API Dashboard
Copy Page
Model Context Protocol (MCP) connects models to tools and context. Use it to give Codex access to third-party documentation, or to let it interact with developer tools like your browser or Figma.
Codex supports MCP servers in both the CLI and the IDE extension.
Supported MCP features
STDIO servers : Servers that run as a local process (started by a command).
Environment variables
Streamable HTTP servers : Servers that you access at an address.
Bearer token authentication
OAuth authentication (run codex mcp login <server-name> for servers that support OAuth)
Server instructions : Codex reads the MCP instructions field returned during initialization and uses it as server-wide guidance alongside the server’s tools.
If you build or maintain an MCP server for Codex, use instructions for cross-tool workflows, constraints, and rate limits that apply across the server. Keep the first 512 characters self-contained so the most important guidance is available when Codex is deciding how to use the server.
Connect Codex to an MCP server
Codex stores MCP configuration in config.toml alongside other Codex configuration settings. By default this is ~/.codex/config.toml , but you can also scope MCP servers to a project with .codex/config.toml (trusted projects only).
The CLI and the IDE extension share this configuration. Once you configure your MCP servers, you can switch between the two Codex clients without redoing setup.
To configure MCP servers, choose one option:
Use the CLI : Run codex mcp to add and manage servers.
Edit config.toml : Update ~/.codex/config.toml (or a project-scoped .codex/config.toml in trusted projects) directly.
Configure with the CLI
Add an MCP server codex mcp add < server-nam e > --env VAR1=VALUE1 --env VAR2=VALUE2 -- < stdio server-comman d >
For example, to add Context7 (a free MCP server for developer documentation), you can run the following command:
codex mcp add context7 -- npx -y @upstash/context7-mcp Other CLI commands
To see all available MCP commands, you can run codex mcp --help .
Terminal UI (TUI)
In the codex TUI, use /mcp to see your active MCP servers.
Configure with config.toml
For more fine-grained control over MCP server options, edit ~/.codex/config.toml (or a project-scoped .codex/config.toml ). In the IDE extension, select MCP settings > Open config.toml from the gear menu.
Configure each MCP server with a [mcp_servers.<server-name>] table in the configuration file.
STDIO servers
command (required): The command that starts the server.
args (optional): Arguments to pass to the server.
env (optional): Environment variables to set for the server.
env_vars (optional): Environment variables to allow and forward.
cwd (optional): Working directory to start the server from.
experimental_environment (optional): Set to remote to start the stdio
server through a remote executor environment when one is available.
env_vars can contain plain variable names or objects with a source:
env_vars = [ "LOCAL_TOKEN" , { name = "REMOTE_TOKEN" , source = "remote" }]
String entries and source = "local" read from Codex’s local environment.
source = "remote" reads from the remote executor environment and requires
remote MCP stdio.
Streamable HTTP servers
url (required): The server address.
bearer_token_env_var (optional): Environment variable name for a bearer token to send in Authorization .
http_headers (optional): Map of header names to static values.
env_http_headers (optional): Map of header names to environment variable names (values pulled from the environment).
Other configuration options
startup_timeout_sec (optional): Timeout (seconds) for the server to start. Default: 10 .
tool_timeout_sec (optional): Timeout (seconds) for the server to run a tool. Default: 60 .
enabled (optional): Set false to disable a server without deleting it.
required (optional): Set true to make startup fail if this enabled server can’t initialize.
enabled_tools (optional): Tool allow list.
disabled_tools (optional): Tool deny list (applied after enabled_tools ).
default_tools_approval_mode (optional): Default approval behavior for
tools from this server. Supported values are auto , prompt , and
approve .
tools.<tool>.approval_mode (optional): Per-tool approval behavior override.
If your OAuth provider requires a fixed callback port, set the top-level mcp_oauth_callback_port in config.toml . If unset, Codex binds to an ephemeral port.
If your MCP OAuth flow must use a specific callback URL (for example, a remote Devbox ingress URL or a custom callback path), set mcp_oauth_callback_url . Codex uses this value as the base callback URL, then appends a server-specific callback ID to produce the OAuth redirect_uri it sends during login. Register the full derived redirect_uri with your OAuth provider, including the appended callback ID and any configured path, query, or port, rather than registering only the base host or unsuffixed path. Local callback URLs (for example localhost ) bind on the local interface; non-local callback URLs bind on 0.0.0.0 so the callback can reach the host.
If the MCP server advertises scopes_supported , Codex prefers those
server-advertised scopes during OAuth login. Otherwise, Codex falls back to the
scopes configured in config.toml .
config.toml examples [ mcp_servers . context7 ] command = "npx" args = [ "-y" , "@upstash/context7-mcp" ] env_vars = [ "LOCAL_TOKEN" ] [ mcp_servers . context7 . env ] MY_ENV_VAR = "MY_ENV_VALUE" # Optional MCP OAuth callback overrides (used by `codex mcp login`) mcp_oauth_callback_port = 5555 mcp_oauth_callback_url = "https://devbox.example.internal/callback" [ mcp_servers . figma ] url = "https://mcp.figma.com/mcp" bearer_token_env_var = "FIGMA_OAUTH_TOKEN" http_headers = { "X-Figma-Region" = "us-east-1" } [ mcp_servers . chrome_devtools ] url = "http://localhost:3000/mcp" enabled_tools = [ "open" , "screenshot" ] disabled_tools = [ "screenshot" ] # applied after enabled_tools default_tools_approval_mode = "prompt" startup_timeout_sec = 20 tool_timeout_sec = 45 enabled = true [ mcp_servers . chrome_devtools . tools . open ] approval_mode = "approve"
Plugin-provided MCP servers
Installed plugins can bundle MCP servers in their plugin manifest. Those
servers are launched from the plugin, so user config doesn’t set their
transport command. User config can still control on/off state and tool policy
under plugins.<plugin>.mcp_servers.<server> .
[ plugins . "sample@test" . mcp_servers . sample ] enabled = true default_tools_approval_mode = "prompt" enabled_tools = [ "read" , "search" ] [ plugins . "sample@test" . mcp_servers . sample . tools . search ] approval_mode = "approve"
Examples of useful MCP servers
The list of MCP servers keeps growing. Here are a few common ones:
OpenAI Docs MCP : Search and read OpenAI developer docs.
Context7 : Connect to up-to-date developer documentation.
Figma Local and Remote : Access your Figma designs.
Playwright : Control and inspect a browser using Playwright.
Chrome Developer Tools : Control and inspect Chrome.
Sentry : Access Sentry logs.
GitHub : Manage GitHub beyond what git supports (for example, pull requests and issues).
Ask AI
Loading docs agent...
