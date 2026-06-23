# Use Codex in Slack | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/integrations/slack
- Final URL: https://developers.openai.com/codex/integrations/slack
- Canonical URL: https://developers.openai.com/codex/integrations/slack
- Fetched at: 2026-06-23T14:12:36Z
- Content type: text/html; charset=utf-8

## Description

Ask Codex to run tasks from channels and threads

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
Use Codex in Slack to kick off coding tasks from channels and threads. Mention @Codex with a prompt, and Codex creates a cloud task and replies with the results.
Set up the Slack app
Set up Codex cloud tasks . You need a Plus, Pro, Business, Enterprise, or Edu plan (see ChatGPT pricing ), a connected GitHub account, and at least one environment .
Go to Codex settings and install the Slack app for your workspace. Depending on your Slack workspace policies, an admin may need to approve the install.
Add @Codex to a channel. If you haven’t added it yet, Slack prompts you when you mention it.
Start a task
In a channel or thread, mention @Codex and include your prompt. Codex can reference earlier messages in the thread, so you often don’t need to restate context.
(Optional) Specify an environment or repository in your prompt, for example: @Codex fix the above in openai/codex .
Wait for Codex to react (👀) and reply with a link to the task. When it finishes, Codex posts the result and, depending on your settings, an answer in the thread.
How Codex chooses an environment and repo
Codex reviews the environments you have access to and selects the one that best matches your request. If the request is ambiguous, it falls back to the environment you used most recently.
The task runs against the default branch of the first repository listed in that environment’s repo map. Update the repo map in Codex if you need a different default or more repositories.
If no suitable environment or repository is available, Codex will reply in Slack with instructions on how to fix the issue before retrying.
Enterprise data controls
By default, Codex replies in the thread with an answer, which can include information from the environment it ran in.
To prevent this, an Enterprise admin can clear Allow Codex Slack app to post answers on task completion in ChatGPT workspace settings . When an admin turns off answers, Codex replies only with a link to the task.
Data usage, privacy, and security
When you mention @Codex , Codex receives your message and thread history to understand your request and create a task.
Data handling follows OpenAI’s Privacy Policy , Terms of Use , and other applicable policies .
For more on security, see the Codex security documentation .
Codex uses large language models that can make mistakes. Always review answers and diffs.
Tips and troubleshooting
Missing connections : If Codex can’t confirm your Slack or GitHub connection, it replies with a link to reconnect.
Unexpected environment choice : Reply in the thread with the environment you want (for example, Please run this in openai/openai (applied) ), then mention @Codex again.
Long or complex threads : Summarize key details in your latest message so Codex doesn’t miss context buried earlier in the thread.
Workspace posting : Some Enterprise workspaces restrict posting final answers. In those cases, open the task link to view progress and results.
More help : See the OpenAI Help Center .
Ask AI
Loading docs agent...
