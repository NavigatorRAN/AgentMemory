# Commands – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/commands
- Final URL: https://developers.openai.com/codex/app/commands
- Canonical URL: https://developers.openai.com/codex/app/commands
- Fetched at: 2026-06-23T14:11:44Z
- Content type: text/html; charset=utf-8

## Description

Reference for Codex app commands and keyboard shortcuts

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
Use these commands and keyboard shortcuts to navigate the Codex app.
Keyboard shortcuts
Action macOS shortcut General Command menu Cmd + Shift + P or Cmd + K Settings Cmd + , Keyboard shortcuts Cmd + / Open folder Cmd + O Navigate back Cmd + [ Navigate forward Cmd + ] Increase font size Cmd + + or Cmd + = Decrease font size Cmd + - or Cmd + _ Toggle sidebar Cmd + B Toggle diff panel Cmd + Option + B Toggle terminal Cmd + J Clear the terminal Ctrl + L Thread New thread Cmd + N or Cmd + Shift + O Search threads Cmd + G Find in thread Cmd + F Previous thread Cmd + Shift + [ Next thread Cmd + Shift + ] Dictation Ctrl + M
To find, customize, or reset shortcuts, open Settings > Keyboard Shortcuts .
You can search by command name or switch the search field into keystroke mode
and press the shortcut you want to find.
Search past threads and find in a thread
Use thread search ( Cmd / Ctrl + G ) to reopen a
past conversation. When expanded matching is available in your Codex desktop
app, it can also match conversation content and Git branch names, so you can
search for a phrase from the thread or a branch such as fix/login-redirect .
Use Find in thread ( Cmd + F ) after opening a thread
to find text within that current conversation. It doesn’t search across other
threads.
Slash commands let you control Codex without leaving the thread composer. Available commands vary based on your environment and access.
Use a slash command
In the thread composer, type / .
Select a command from the list, or keep typing to filter (for example, /status ).
You can also explicitly invoke skills by typing $ in the thread composer. See Skills .
Enabled skills also appear in the slash command list.
Available slash commands
Slash command Description /feedback Open the feedback dialog to submit feedback and optionally include logs. /goal Set a persistent goal for Codex to work toward; use /plan first to shape it. /init Generate an AGENTS.md scaffold for the current project. /mcp Open MCP status to view connected servers. /plan Toggle plan mode for multi-step planning. /review Start code review mode to review uncommitted changes or compare against a base branch. /status Show the thread ID, context usage, and rate limits.
Set or manage a goal with /goal
Use /goal in the app composer to start Goal mode. A goal is a persistent
objective that Codex works toward until it finishes the task, pauses, or needs
more input. To define the goal with Codex first, start with /plan , then set
the refined goal with /goal .
If /goal doesn’t appear in the slash command list, enable features.goals
in config.toml :
[ features ] goals = true
You can also run codex features enable goals from the CLI or ask Codex to run it.
When a goal is active, the app shows its progress above the composer. Use the
buttons in that progress row to pause or resume the goal, edit the goal text, or
clear the goal instead of typing another slash command. You can keep steering
Codex with follow-up messages while the goal runs.
For guidance on writing effective goals, see Goal mode .
Deep links
The Codex app registers the codex:// URL scheme so links can open specific parts of the app directly. Encode query string values before adding them to a URL.
Supported links
Use these canonical forms when you create links. The sections below list the full reference by link type.
Deep link Opens codex://threads/new A new local thread. codex://new?<query> A new local thread with at least one new-thread query parameter. codex://threads/<thread-id> A local thread. <thread-id> must be the thread’s session UUID. codex://settings Settings. codex://settings/connections/<connection-type> Computer, device, or SSH connection settings. codex://settings/connections/ssh/add?name=<ssh-config-host> Adds a host from your SSH config to Codex. codex://skills Skills. codex://automations Automations with the create flow open. codex://plugins/install/<plugin-name>?marketplace=<marketplace-name> The install flow for a plugin from a known marketplace. codex://plugins/<plugin-id> A plugin detail page. codex://plugins/<plugin-name>?marketplacePath=<absolute-marketplace-path> A local plugin detail page from a local marketplace. codex://pets/install?name=<pet-name>&imageUrl=<https-image-url> The pet install flow.
Threads
Use these links when you need to open an existing local thread or start a new one.
Deep link Opens codex://threads/<thread-id> A local thread. <thread-id> must be the thread’s session UUID. codex://threads/new A new local thread. codex://threads/new?<query> A new local thread with optional query parameters. codex://new?<query> A new local thread. Include at least one of prompt , path , or originUrl ; otherwise the link does nothing.
For codex://threads/new or codex://new , add any of these query parameters as needed; you can combine them in the same URL.
Query parameter Required What it does prompt=<text> No Sets the initial composer text. path=<absolute-path> No Opens the new thread in a local workspace. path must be an absolute path to a local directory. When valid, Codex uses that directory as the active workspace. originUrl=<git-remote-url> No Matches one of your current workspace roots by Git remote URL. If path is also present, Codex resolves path first.
Example: Show me some fun stats about how I’ve been using Codex
Use these links when you need to open Settings or a specific settings page.
Deep link Opens codex://settings Settings. codex://settings/browser-use Browser settings. codex://settings/computer-use/google-chrome Google Chrome settings for computer use. codex://settings/connections Remote connections settings. codex://settings/connections/computer Settings for controlling this Mac or PC from another device. codex://settings/connections/devices Settings for controlling other devices. codex://settings/connections/ssh SSH connection settings. codex://settings/connections/ssh/add?name=<ssh-config-host> Adds the named host alias as a Codex-managed connection, then opens SSH connection settings.
The name value must match a host alias in ~/.ssh/config . The link disables
automatic connection for the added host. If Codex can’t find the named host, it
opens SSH connection settings and shows an error.
Unsupported codex://settings/... paths open the main Settings page.
Use these links when you need to open Skills.
Deep link Opens codex://skills Skills.
Use these links when you need to open Automations.
Deep link Opens codex://automations Automations with the create flow open.
Plugin links use different forms depending on whether you are installing from a marketplace, opening a plugin, or working from a local marketplace.json . For plugin basics, see Plugins . For local or repo marketplace setup, see Build plugins .
Plugin install
Use this form to open the install flow for a plugin from a marketplace that Codex already knows about.
Deep link Opens codex://plugins/install/<plugin-name>?marketplace=<marketplace-name> The plugin detail or install flow for a plugin.
Query parameter Required What it does marketplace=<marketplace-name> Yes Identifies the marketplace. For an OpenAI-curated plugin, use openai-curated .
The install link accepts only the marketplace query parameter. If Codex can’t find the requested marketplace or plugin, it opens the Plugins page instead.
Plugin detail
Deep link Opens codex://plugins/<plugin-id> A plugin detail page.
<plugin-id> must identify the plugin. For an OpenAI-curated plugin, use the form <plugin-name>@openai-curated .
Codex-generated plugin links can also include these query parameters. Omit both when you write a link manually.
Query parameter Required What it does hostId=<host-id> No Identifies the Codex host that owns the plugin context, such as local or one of your configured remote connections. Codex provides these IDs. source=manage No Preserves the app’s plugin-management entry point. It’s not admin-only.
Example: Open the OpenAI Developers plugin
Local plugin
For local or repo marketplace setup, see Build plugins .
Deep link Opens codex://plugins/<plugin-name>?marketplacePath=<absolute-marketplace-path> A local plugin detail page from a local marketplace.
Query parameter Required What it does marketplacePath=<absolute-marketplace-path> Yes Absolute path to the local marketplace.json , for example /Users/alex/.agents/plugins/marketplace.json . mode=share No Opens the share flow for that local plugin.
Pets
Use these links to open the pet install flow when that feature is enabled.
Deep link Opens codex://pets/install?name=<pet-name>&imageUrl=<https-image-url> The pet install flow.
Query parameter Required What it does name=<pet-name> Yes Sets the pet name. imageUrl=<https-image-url> Yes Sets the pet image URL. imageUrl must be HTTPS. description=<text> No Sets the optional pet description.
See also
Ask AI
Loading docs agent...
