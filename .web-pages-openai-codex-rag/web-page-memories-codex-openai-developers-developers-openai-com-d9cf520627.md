# Memories – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/memories
- Final URL: https://developers.openai.com/codex/memories
- Canonical URL: https://developers.openai.com/codex/memories
- Fetched at: 2026-06-23T14:12:39Z
- Content type: text/html; charset=utf-8

## Description

How Codex carries useful context forward across threads

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
Memories are off by default. In the European Economic Area, the United
Kingdom, and Switzerland, Codex uses or generates memories only after you
enable them in Codex settings, or set memories = true in the [features]
table in ~/.codex/config.toml .
Memories let Codex carry useful context from earlier threads into future work.
After you enable memories, Codex can remember stable preferences, recurring
workflows, tech stacks, project conventions, and known pitfalls so you don’t
need to repeat the same context in every thread.
Keep required team guidance in AGENTS.md or checked-in documentation. Treat
memories as a helpful local recall layer, not as the only source for rules that
must always apply.
Chronicle helps Codex recover recent working
context from your screen to build up memory.
Enable memories
In the Codex app, enable Memories in settings.
For config-based setup, add the feature flag to config.toml :
[ features ] memories = true
See Config basics for where Codex stores user-level
configuration and how Codex loads ~/.codex/config.toml .
How memories work
After you enable memories, Codex can turn useful context from eligible prior
threads into local memory files. Codex skips active or short-lived sessions,
redacts secrets from generated memory fields, and updates memories in the
background instead of immediately at the end of every thread.
Memories may not update right away when a thread ends. Codex waits until a
thread has been idle long enough to avoid summarizing work that’s still in
progress.
Memory generation can also skip a background pass when your Codex rate-limit
remaining percentage is below the configured threshold, so Codex doesn’t spend
quota when you’re near a limit.
Memory storage
Codex stores memories under your Codex home directory. By default, that’s
~/.codex . See Config and state locations
for how Codex uses CODEX_HOME .
The main memory files live under ~/.codex/memories/ and include summaries,
durable entries, recent inputs, and supporting evidence from prior threads.
Treat these files as generated state. You can inspect them when troubleshooting
or before sharing your Codex home directory, but don’t rely on editing them by
hand as your primary control surface.
Control memories per thread
In the Codex app and Codex TUI, use /memories to control memory behavior for
the current thread. Thread-level choices let you decide whether the current
thread can use existing memories and whether Codex can use the thread to
generate future memories.
Thread-level choices don’t change your global memory settings.
Enable memories in the Codex app settings, or set memories = true in the
[features] section of config.toml .
For config file locations and the full list of memory-related settings, see the
configuration reference .
Common memory-specific settings include:
memories.generate_memories : controls whether newly created threads can be
stored as memory-generation inputs.
memories.use_memories : controls whether Codex injects existing memories into
future sessions.
memories.disable_on_external_context : when true , keeps threads that used
external context such as MCP tool calls, web search, or tool search out of
memory generation. The older memories.no_memories_if_mcp_or_web_search key
is still accepted as an alias.
memories.min_rate_limit_remaining_percent : controls the minimum remaining
Codex rate-limit percentage required before memory generation starts.
memories.extract_model : overrides the model used for per-thread memory
extraction.
memories.consolidation_model : overrides the model used for global memory
consolidation.
Review memories
Don’t store secrets in memories. Codex redacts secrets from generated memory
fields, but you should still review memory files before sharing your Codex home
directory or generated memory artifacts.
Ask AI
Loading docs agent...
