# Record & Replay – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/record-and-replay
- Final URL: https://developers.openai.com/codex/record-and-replay
- Canonical URL: https://developers.openai.com/codex/record-and-replay
- Fetched at: 2026-06-23T14:12:51Z
- Content type: text/html; charset=utf-8

## Description

Show Codex a workflow once and turn it into a reusable skill

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
Record & Replay is available on macOS. Initial availability excludes the
European Economic Area, the United Kingdom, and Switzerland. Computer Use must
also be available and enabled.
Record & Replay lets you demonstrate a workflow on your
Mac and turn it into a reusable skill. Use it when the workflow is repetitive,
depends on your preferences, or is easier to show than to describe in a prompt.
For example, you might record how you file an expense, book a parking space,
create a correctly configured issue, publish a video, or download a recurring
report. Codex can package the pattern into a skill that you can use again with
Computer Use, browser actions, connected plugins, or a combination of them.
Before you start
Pick a workflow that you already know how to complete. Record & Replay works
best when the steps are stable and the success criteria are clear.
Start a recording
Open Plugins in the Codex app.
Open the + menu.
Select Record a skill .
Review the suggested prompt, give Codex any helpful context, and submit it.
When Codex asks for permission to record your actions, approve the request
once you are ready to demonstrate the workflow.
Perform the workflow on your Mac.
When you are done, stop recording from the menu bar, overlay, or tell Codex
that you are done.
During recording, Codex observes the actions and window content needed to learn
the workflow. Recording continues until you stop it. Keep the recording focused
on the task you want Codex to learn.
After you stop recording, Codex inspects the captured workflow and drafts a
skill. The skill explains when to use the workflow, what inputs it needs, what
steps to follow, and how to verify the result. You can also ask Codex to
refine the skill further.
Replay the workflow
Start a new thread and ask Codex to use the generated skill. Give it the
values that are different this time, such as the file to upload, the issue to
create, or the date range for the report.
Codex uses the skill as reusable context for the task. It can then complete the
workflow with the tools available in the current environment, including
Computer Use, browser actions, and installed plugins.
Tips for better recordings
Keep the demonstration short and complete.
Let Codex know your goal and any specific inputs that might vary between
skill uses before you start recording.
Use realistic inputs, but avoid secrets and sensitive data.
Refine the skill after recording to call out hidden preferences that matter,
such as naming conventions, field defaults, or decision points.
Stop recording when the workflow is complete instead of continuing into
unrelated cleanup.
When to build another plugin
Record & Replay is a fast way to create a skill from a demonstrated workflow.
If you want to distribute a separate stable package across a team, bundle
multiple skills, include app integrations, add MCP servers, or manage install
metadata, package that workflow as its own plugin. See
Build plugins .
I don’t see Record & Replay
If your organization manages Codex with requirements.toml , the
[features].computer_use requirement controls Record & Replay too. Setting
computer_use = false makes both features unavailable.
Ask AI
Loading docs agent...
