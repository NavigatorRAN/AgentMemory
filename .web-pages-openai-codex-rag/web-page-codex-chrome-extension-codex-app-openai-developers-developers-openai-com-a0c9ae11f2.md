# Codex Chrome extension – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/chrome-extension
- Final URL: https://developers.openai.com/codex/app/chrome-extension
- Canonical URL: https://developers.openai.com/codex/app/chrome-extension
- Fetched at: 2026-06-23T14:11:43Z
- Content type: text/html; charset=utf-8

## Description

Use Chrome with Codex while managing browser permissions, website approvals, and browsing data

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
The Codex Chrome extension lets Codex use Chrome for browser tasks that need
your signed-in browser state. Use it when Codex needs to read or act on sites
such as LinkedIn, Salesforce, Gmail, or internal tools.
For local development servers, file-backed previews, and public pages that do
not require sign-in, use the in-app browser first. The
in-app browser keeps preview and verification work inside Codex without using
your Chrome profile.
Codex can also switch between tools as a task requires, using plugins when a
dedicated integration is available, Chrome when it needs logged-in browser
context, and the in-app browser for localhost.
Treat page content as untrusted context, and review the website before allowing Codex to continue.
Set up Chrome from Plugins
Set up the extension from Codex:
Open Codex and go to Plugins .
Add the Chrome plugin.
Follow the setup flow. It guides you through installing the Codex Chrome
extension
and approving Chrome’s permission prompts.
Open Chrome and confirm the Codex extension shows Connected .
After the plugin setup is complete, start a new Codex thread. Codex can suggest
Chrome when a task needs a signed-in website. You can also invoke it directly in
a prompt:
@Chrome open Salesforce and update the account from these call notes.
If Chrome isn’t already open, Codex can open it. Chrome browser tasks run in
Chrome tab groups so the work for a thread stays grouped together.
Control website access
By default, Codex asks before it interacts with each new website. Codex bases
the prompt on the website host, such as example.com .
When Codex asks to use a website, you can choose the option that matches the
task and your risk tolerance:
Allow the website for the current chat.
Always allow the host so Codex can use that website again without asking.
Decline the website.
Manage the allowlist and blocklist
In Computer Use settings, you can manage an allowlist and blocklist for
domains. The allowlist contains domains Codex can use without asking again. The
blocklist contains domains Codex shouldn’t use.
Removing a domain from the allowlist means Codex asks again before using it.
Removing a domain from the blocklist means Codex can ask again instead of
treating the domain as blocked.
Always allow browser content
Elevated Risk
If you turn on always allow browser content, Codex no longer asks for
confirmation before using websites.
Browser history
Browser history can include sensitive telemetry, internal URLs, search terms,
and activity from Chrome sessions on signed-in devices. If you allow Codex to
access browser history, relevant history entries can become part of the context
Codex uses for the task. Malicious or misleading page content can increase the
risk that Codex copies this data somewhere unintended.
Codex asks when it wants to use browser history. Codex scopes history access to
the request, and history doesn’t have an always-allow option.
Data and security
Chrome extension permissions
Chrome asks you to accept extension permissions when you install the extension.
The permission prompt may include:
Access the page debugger
Read and change all your data on all websites
Read and change your browsing history on all your signed-in devices
Display notifications
Read and change your bookmarks
Manage your downloads
Communicate with cooperating native applications
View and manage your tab groups
These Chrome permissions make the extension capable of operating browser
workflows. Codex still uses its own confirmations, settings, allowlists, and
blocklists before using websites or browser history during a task.
Browser use follows your Codex Memories setting. If Memories is on, Codex can
use relevant saved memories while working in Chrome. If Memories is off, browser
use doesn’t use memories.
What OpenAI stores from browsing
OpenAI doesn’t store a separate complete record of your Chrome actions from the
extension. OpenAI stores browser activity only when it becomes part of the Codex
context, such as text Codex reads from a page, screenshots, tool calls,
summaries, messages, or other content included in the thread.
Your ChatGPT and Codex data controls apply to content processed in context.
Avoid sending secrets or highly sensitive data through browser tasks unless
they’re required and you are present to review each prompt.
If Codex can’t connect to Chrome, first confirm the website Codex is trying to
access isn’t in the blocklist in Settings. If the website isn’t blocked, work
through these checks:
Open the Codex extension from the Chrome toolbar or Chrome’s extensions
menu. Make sure it shows Connected . If it shows disconnected or mentions
a missing native host, remove and re-add the Chrome plugin from Plugins
in Codex, then follow the setup flow again.
In Codex, open Plugins and confirm that the Chrome plugin is on. If the
plugin is off, turn it on and try the task again.
Make sure you are using the same Chrome profile where the Codex extension is
installed. If you use more than one Chrome profile, install and enable the
extension in the active profile.
Start a new Codex thread and try the Chrome task again. This can clear a
thread-specific connection state.
Restart Chrome and Codex, then try again. If the extension still doesn’t
connect, uninstall the Codex Chrome extension, remove and re-add the Chrome
plugin from Plugins , and follow the setup flow again.
If the extension shows Connected but Codex still can’t use Chrome, run
/feedback in the Codex app and include the thread ID when you contact
support.
Upload Files
If a Chrome task needs to upload a file from your computer, allow the Codex
extension to access file URLs in Chrome:
In Chrome, open the extensions icon in the toolbar, then click Manage
Extensions .
On the Codex extension card, click Details .
Turn on Allow access to file URLs .
After you change the setting, start the Chrome task again.
Ask AI
Loading docs agent...
