# Appshots – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/appshots
- Final URL: https://developers.openai.com/codex/appshots
- Canonical URL: https://developers.openai.com/codex/appshots
- Fetched at: 2026-06-23T14:11:54Z
- Content type: text/html; charset=utf-8

## Description

Give Codex context from any Mac app

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
Appshots let you send the frontmost app window to a Codex thread. Use them when
you’re actively working in another app on your computer and want to provide
Codex with your current context so it can help you with the task.
Appshots are available in the Codex app on macOS. Press both Command keys, or
your custom Appshots hotkey, to take one.
What appshots capture
An appshot captures the frontmost window only. It can include:
An image of the visible window.
Available text from that window, including visible text and text the app makes
available outside the visible scroll area.
After you add an appshot to a thread, it behaves like a Codex attachment. Codex
stores appshots locally in the session file, like files or images you attach
manually.
When to use appshots
Use appshots when Codex needs context from a Mac app before it can act.
Examples:
Share an API reference page and ask Codex to write a script that uses it.
Share an email or calendar view and ask Codex to draft the next step.
Share an image editor, design, or preview window and ask Codex to revise the
related assets or code.
Share an error, settings panel, or app state that’s easier to show than
describe.
Take an appshot
Open the Codex app on your Mac.
Open the app and window you want to share.
Press both Command keys, or the custom hotkey you configured in Codex
settings.
Allow macOS permissions if Codex asks.
Ask Codex to perform a task with the appshot.
By default, Codex starts a new thread for the appshot. If you interacted with a
Codex thread in the last 60 seconds, Codex adds the appshot to that recent
thread instead. Taking consecutive appshots adds them to the same thread.
You can change the Appshots hotkey in Codex settings.
Permissions and safety
Codex may ask for permissions before it can take appshots:
Screen & System Audio Recording lets Codex capture an image of the
frontmost window.
Accessibility lets Codex read available text from the frontmost window.
Taking an appshot shares the captured image and available text with Codex.
Avoid taking appshots of sensitive content unless the task requires that
content.
Review appshots the same way you would review sharing screenshots and documents
with Codex.
Limits and troubleshooting
Appshots are a Codex app feature. Create them from the Codex app on macOS. If
you resume a thread in the CLI that already contains an appshot, the attachment
is part of the thread history, but the CLI can’t create a new appshot.
For some apps and websites, including Google Docs, Gmail, Google Sheets, and
Google Slides, Codex may receive only the visible screenshot and may not receive
the full document or off-screen text. If you have the matching plugin installed,
Codex can use that plugin to access the relevant app content and help with your
request.
If appshots don’t work:
Open System Settings > Privacy & Security .
Check Screen & System Audio Recording and Accessibility for Codex
Computer Use.
Restart Codex and try again.
Ask AI
Loading docs agent...
