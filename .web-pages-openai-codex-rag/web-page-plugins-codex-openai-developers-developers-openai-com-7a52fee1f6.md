# Plugins – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/plugins
- Final URL: https://developers.openai.com/codex/plugins
- Canonical URL: https://developers.openai.com/codex/plugins
- Fetched at: 2026-06-23T14:12:45Z
- Content type: text/html; charset=utf-8

## Description

Use plugins in Codex to add reusable workflows with skills and app integrations

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
Plugins bundle skills, app integrations, and MCP servers into reusable
workflows for Codex.
Extend what Codex can do, for example:
Install the Codex Security plugin to scan authorized code and confirm
plausible vulnerability findings.
Install the Gmail plugin to let Codex read and manage Gmail.
Install the Google Drive plugin to work across Drive, Docs, Sheets, and
Slides.
Install the Slack plugin to summarize channels or draft replies.
Install Sites to create and deploy hosted websites,
web apps, and games.
A plugin can contain:
Skills: reusable instructions for specific kinds of work. Codex can load
them when needed so it follows the right steps and uses the right references
or helper scripts for a task.
Apps: connections to tools like GitHub, Slack, or Google Drive, so
Codex can read information from those tools and take actions in them.
MCP servers: services that give Codex access to more tools or shared
information, often from systems outside your local project.
You can share plugins by publishing them through a marketplace source, such as a
repo marketplace for a project or team. See Build plugins
for marketplace setup, packaging, and distribution guidance.
Use and install plugins
Plugin Directory in the Codex app
Open Plugins in the Codex app to browse and install curated plugins.
The plugin directory groups plugins into categories:
Curated by OpenAI: highlighted plugins available to all Codex users.
Shared with you: plugins shared by other members of your ChatGPT
workspace.
Created by you: plugins you created or added to your own workspace.
Plugin directory in the CLI
In Codex CLI, run the following command to open the plugins list:
codex /plugins
The CLI plugin browser groups plugins by marketplace. Use the marketplace tabs
to switch sources, open a plugin to inspect details, install or uninstall
marketplace entries, and press Space on an installed plugin to toggle
its enabled state.
Install and use a plugin
Once you open the plugin directory:
Search or browse for a plugin, then open its details.
Select the install button. In the app, select the plus button or
Add to Codex . In the CLI, select Install plugin .
If the plugin needs an external app, connect it when prompted. Some plugins
ask you to authenticate during install. Others wait until the first time you
use them.
After installation, start a new thread and ask Codex to use the plugin.
After you install a plugin, you can use it directly in the prompt window:
Describe the task directly
Ask for the outcome you want, such as “Summarize unread Gmail threads
from today” or “Pull the latest launch notes from Google Drive.”
Use this when you want Codex to choose the right installed tools for the
task.
Choose a specific plugin
Type @ to invoke the plugin or one of its bundled skills
explicitly.
Use this when you want to be specific about which plugin or skill Codex
should use. See Codex app commands and
Skills .
How permissions and data sharing work
Installing a plugin makes its workflows available in Codex, but your existing
approval settings still apply. Any
connected external services remain subject to their own authentication,
privacy, and data-sharing policies.
Bundled skills are available as soon as you install the plugin.
If a plugin includes apps, Codex may prompt you to install or sign in to
those apps in ChatGPT during setup or the first time you use them.
If a plugin includes MCP servers, they may require extra setup or
authentication before you can use them.
When Codex sends data through a bundled app, that app’s terms and privacy
policy apply.
Remove or turn off a plugin
To remove a plugin, reopen it from the plugin browser and select
Uninstall plugin .
Uninstalling a plugin removes the plugin bundle from Codex, but bundled apps
stay installed until you manage them in ChatGPT.
If you want to keep a plugin installed but turn it off, set its entry in
~/.codex/config.toml to enabled = false , then restart Codex:
[ plugins . "gmail@openai-curated" ] enabled = false
Build your own plugin
If you want to create, test, or distribute your own plugin, see
Build plugins . That page covers local scaffolding,
manual marketplace setup, workspace sharing, plugin manifests, and packaging
guidance.
Plugin guides
Record & Replay : Show Codex a workflow
once and turn it into a reusable skill.
Codex Security plugin quickstart : Install the
plugin, scan authorized code, and review the result.
Ask AI
Loading docs agent...
