# Config basics – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/config-basic
- Final URL: https://developers.openai.com/codex/config-basic
- Canonical URL: https://developers.openai.com/codex/config-basic
- Fetched at: 2026-06-23T14:12:12Z
- Content type: text/html; charset=utf-8

## Description

Learn the basics of configuring your local Codex client

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
Codex reads configuration details from more than one location. Your personal defaults live in ~/.codex/config.toml , and you can add project overrides with .codex/config.toml files. For security, Codex loads project .codex/ layers only when you trust the project.
Codex configuration file
Codex stores user-level configuration at ~/.codex/config.toml . To scope settings to a specific project or subfolder, add a .codex/config.toml file in your repo.
To open the configuration file from the Codex IDE extension, select the gear icon in the top-right corner, then select Codex Settings > Open config.toml .
The CLI and IDE extension share the same configuration layers. You can use them to:
Set the default model and provider.
Configure approval policies and sandbox settings .
Configure MCP servers .
Configuration precedence
Codex resolves values in this order (highest precedence first):
CLI flags and --config overrides
Project config files: .codex/config.toml , ordered from the project root down to your current working directory (closest wins; trusted projects only)
Profile files selected with --profile profile-name ( ~/.codex/profile-name.config.toml )
User config: ~/.codex/config.toml
System config (if present): /etc/codex/config.toml on Unix
Built-in defaults
Use that precedence to set shared defaults in config.toml and keep profile files focused on the values that differ.
If you mark a project as untrusted, Codex skips project-scoped .codex/ layers, including project-local config, hooks, and rules. User and system config still load, including user/global hooks and rules.
For one-off overrides via -c / --config (including TOML quoting rules), see Advanced Config .
On managed machines, your organization may also enforce constraints via
requirements.toml (for example, disallowing approval_policy = "never" or
sandbox_mode = "danger-full-access" ). See Managed
configuration and Admin-enforced
requirements .
Common configuration options
Here are a few options people change most often:
Default model
Choose the model Codex uses by default in the CLI and IDE.
model = "gpt-5.5"
Approval prompts
Control when Codex pauses to ask before running generated commands.
approval_policy = "on-request"
For behavior differences between untrusted , on-request , and never , see Run without approval prompts and Common sandbox and approval combinations .
Sandbox level
Adjust how much filesystem and network access Codex has while executing commands.
sandbox_mode = "workspace-write"
For mode-by-mode behavior (including protected .git / .codex paths and network defaults), see Sandbox and approvals , Protected paths in writable roots , and Network access .
Permission profiles
Codex also supports named permission profiles for reusable filesystem and
network policies. Built-in profiles are :read-only , :workspace , and
:danger-full-access . Custom profiles use [permissions.<name>] tables and a
matching default_permissions value. See Permissions .
Windows sandbox mode
When running Codex natively on Windows, set the native sandbox mode to elevated in the windows table. Use unelevated only if you don’t have administrator permissions or if elevated setup fails.
[ windows ] sandbox = "elevated" # Recommended # sandbox = "unelevated" # Fallback if admin permissions/setup are unavailable Web search mode
Codex enables web search by default for local tasks and serves results from a web search cache. The cache is an OpenAI-maintained index of web results, so cached mode returns pre-indexed results instead of fetching live pages. This reduces exposure to prompt injection from arbitrary live content, but you should still treat web results as untrusted. If you are using --yolo or another full access sandbox setting , web search defaults to live results. Choose a mode with web_search :
"cached" (default) serves results from the web search cache.
"live" fetches the most recent data from the web (same as --search ).
"disabled" turns off the web search tool.
web_search = "cached" # default; serves results from the web search cache # web_search = "live" # fetch the most recent data from the web (same as --search) # web_search = "disabled" Reasoning effort
Tune how much reasoning effort the model applies when supported.
model_reasoning_effort = "high" Communication style
Set a default communication style for supported models.
personality = "friendly" # or "pragmatic" or "none"
You can override this later in an active session with /personality or per thread/turn when using the app-server APIs.
TUI keymap
Customize terminal shortcuts under tui.keymap . Selected composer actions fall back to matching tui.keymap.global bindings; context-specific bindings take precedence when supported. An empty list unbinds the action.
[ tui . keymap . global ] open_transcript = "ctrl-t" [ tui . keymap . composer ] submit = [ "enter" , "ctrl-m" ] [ tui . keymap . chat ] interrupt_turn = "f12" Command environment
Control which environment variables Codex forwards to spawned commands.
[ shell_environment_policy ] include_only = [ "PATH" , "HOME" ] Log directory
Override where Codex writes local log files. Setting log_dir explicitly also
enables the opt-in plaintext TUI log, codex-tui.log , in that directory.
log_dir = "/absolute/path/to/codex-logs"
For one-off runs, you can also set it from the CLI:
codex -c log_dir=./.codex-log
Feature flags
Use the [features] table in config.toml to toggle optional and experimental capabilities.
[ features ] shell_snapshot = true # Speed up repeated commands
Supported features
Key Default Maturity Description apps false Experimental Enable ChatGPT Apps/connectors support codex_git_commit false Experimental Enable Codex-generated git commits and commit attribution trailers hooks true Stable Enable lifecycle hooks from hooks.json or inline [hooks] . See Hooks . fast_mode true Stable Enable Fast mode selection and the service_tier = "fast" path memories false Stable Enable Memories multi_agent true Stable Enable subagent collaboration tools personality true Stable Enable personality selection controls shell_snapshot true Stable Snapshot your shell environment to speed up repeated commands shell_tool true Stable Enable the default shell tool unified_exec true except Windows Stable Use the unified PTY-backed exec tool undo false Stable Enable undo via per-turn git ghost snapshots web_search true Deprecated Legacy toggle; prefer the top-level web_search setting web_search_cached false Deprecated Legacy toggle that maps to web_search = "cached" when unset web_search_request false Deprecated Legacy toggle that maps to web_search = "live" when unset
The Maturity column uses feature maturity labels such as Experimental, Beta,
and Stable. See Feature Maturity for how to
interpret these labels.
Omit feature keys to keep their defaults.
For lifecycle hook configuration, see Hooks .
Enabling features
In config.toml , add feature_name = true under [features] .
From the CLI, run codex --enable feature_name .
To enable more than one feature, run codex --enable feature_a --enable feature_b .
To disable a feature, set the key to false in config.toml .
Ask AI
Loading docs agent...
