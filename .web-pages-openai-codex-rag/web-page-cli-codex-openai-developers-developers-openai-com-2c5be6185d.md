# CLI – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/cli
- Final URL: https://developers.openai.com/codex/cli
- Canonical URL: https://developers.openai.com/codex/cli
- Fetched at: 2026-06-23T14:11:59Z
- Content type: text/html; charset=utf-8

## Description

Pair with Codex in your terminal

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
Codex CLI is OpenAI’s coding agent that you can run locally from your terminal. It can read, change, and run code on your machine in the selected directory.
It’s open source and built in Rust for speed and efficiency.
ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about what’s included .
CLI setup
Choose your install option
macOS/Linux Windows npm Homebrew
1
Install
Install the Codex CLI with the standalone installer for macOS and Linux.
macOS/Linux install command
curl -fsSL https://chatgpt.com/codex/install.sh | sh Copy
For unattended installs, set CODEX_NON_INTERACTIVE=1 on the shell that runs the downloaded installer. See Environment variables for details.
macOS/Linux unattended install command
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh Copy
2
Run
Run Codex in a terminal. It can inspect your repository, edit files, and run commands.
Run Codex command
codex Copy
The first time you run Codex, you'll be prompted to sign in. Authenticate with your ChatGPT account or an API key.
See the pricing page if you're not sure which plans include Codex access.
3
Upgrade
New versions of the Codex CLI are released regularly. See the changelog for release notes. To upgrade a standalone install, rerun the installer:
macOS/Linux upgrade command
The Codex CLI is available on macOS, Windows, and Linux. On Windows, run Codex
natively in PowerShell with the Windows sandbox, or use WSL2 when you need a
Linux-native environment. For setup details, see the
Windows setup guide .
If you’re new to Codex, read the best practices guide .
Work with the Codex CLI
Run Codex interactively
Run codex to start an interactive terminal UI (TUI) session.
Control model and reasoning
Use /model to switch between available models or adjust reasoning levels.
Image inputs
Attach screenshots or design specs so Codex reads them alongside your prompt.
Generate or edit images directly in the CLI, and attach references when you want Codex to iterate on an existing asset.
Run local code review
Get your code reviewed by a separate Codex agent before you commit or push your changes.
Use subagents
Use subagents to parallelize complex tasks.
Use Codex to search the web and get up-to-date information for your task.
Codex Cloud tasks
Launch a Codex Cloud task, choose environments, and apply the resulting diffs without leaving your terminal.
Scripting Codex
Automate repeatable workflows by scripting Codex with the exec command.
Model Context Protocol
Give Codex access to additional third-party tools and context with Model Context Protocol (MCP).
Approval modes
Choose the approval mode that matches your comfort level before Codex edits or runs commands.
Ask AI
Loading docs agent...
