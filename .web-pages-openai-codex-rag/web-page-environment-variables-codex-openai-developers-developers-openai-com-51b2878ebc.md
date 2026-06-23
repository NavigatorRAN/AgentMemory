# Environment variables – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/environment-variables
- Final URL: https://developers.openai.com/codex/environment-variables
- Canonical URL: https://developers.openai.com/codex/environment-variables
- Fetched at: 2026-06-23T14:12:20Z
- Content type: text/html; charset=utf-8

## Description

Environment variables supported by Codex

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
Codex uses config.toml for durable settings. Use environment variables for
shell-scoped overrides, automation secrets, installer behavior, or diagnostics.
This page lists stable public environment variables that Codex reads directly.
It does not list internal development variables, test variables, or
provider-specific secret names you choose yourself with
env_key .
Core locations
Variable Used by Default Description CODEX_HOME CLI, IDE extension, app-server, installers ~/.codex Sets the root for Codex state, including config, auth, logs, sessions, skills, and standalone package metadata. If you set it, the directory must already exist. CODEX_SQLITE_HOME CLI and app-server state CODEX_HOME Sets where SQLite-backed state is stored. The sqlite_home config option takes precedence. Relative paths resolve from the current working directory.
For more about the files stored under CODEX_HOME , see
Config and state locations .
Installer variables
These variables apply to the standalone install scripts served from
https://chatgpt.com/codex/install.sh and
https://chatgpt.com/codex/install.ps1 .
Variable Default Description CODEX_NON_INTERACTIVE false Set to 1 , true , or yes to skip installer prompts. Prompts use their default response, so use this for scripted installs and updates, not first-run setup. CODEX_INSTALL_DIR ~/.local/bin on macOS/Linux; %LOCALAPPDATA%\Programs\OpenAI\Codex\bin on Windows Changes where the visible codex command is installed. The standalone package cache still lives under CODEX_HOME/packages/standalone .
For unattended installs, set CODEX_NON_INTERACTIVE=1 on the shell that runs
the downloaded installer:
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE = 1 sh $ env: CODEX_NON_INTERACTIVE = 1 ; irm https: // chatgpt.com / codex / install.ps1 | iex
Authentication and network
Variable Used by Description CODEX_API_KEY codex exec Provides an API key for a single non-interactive run. This is only supported in codex exec ; set it inline rather than job-wide when running repository-controlled code. CODEX_ACCESS_TOKEN CLI, app-server, trusted automation Provides a ChatGPT or Codex access token for trusted automation. For persisted login, pipe it to codex login --with-access-token . CODEX_CA_CERTIFICATE HTTPS, login, and WebSocket clients Points to a PEM CA bundle for environments with corporate TLS interception or private root CAs. Takes precedence over SSL_CERT_FILE . SSL_CERT_FILE HTTPS, login, and WebSocket clients Fallback PEM CA bundle path when CODEX_CA_CERTIFICATE is unset.
For provider API keys, set
env_key in the model provider
configuration. Codex reads the variable named by that config, so the variable
name itself is not a fixed Codex environment variable.
For automation secret handling, see
Use API key auth .
For access token setup, see Access tokens .
Diagnostics
Variable Used by Description RUST_LOG CLI and app-server Controls Rust log filtering and verbosity. codex exec defaults to error output unless you set a more verbose value.
RUST_LOG accepts values such as error , warn , info , debug , and
trace . It also accepts more targeted Rust logging filters, such as
codex_core=debug,codex_tui=debug .
The interactive CLI records diagnostics in bounded local stores by default, but
the plaintext codex-tui.log file is opt-in. Set log_dir explicitly when you
need a plaintext log for troubleshooting:
RUST_LOG = debug codex -c log_dir=./.codex-log tail -F ./.codex-log/codex-tui.log
In non-interactive mode, codex exec prints messages inline instead of writing
to a separate TUI log file.
Ask AI
Loading docs agent...
