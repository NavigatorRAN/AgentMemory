# Features – Codex IDE | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/ide/features
- Final URL: https://developers.openai.com/codex/ide/features
- Canonical URL: https://developers.openai.com/codex/ide/features
- Fetched at: 2026-06-23T14:12:30Z
- Content type: text/html; charset=utf-8

## Description

What you can do with the Codex IDE extension

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
The Codex IDE extension gives you access to Codex directly in VS Code, Cursor, Windsurf, and other VS Code-compatible editors. It uses the same agent as the Codex CLI and shares the same configuration.
Prompting Codex
Use Codex in your editor to chat, edit, and preview changes seamlessly. When Codex has context from open files and selected code, you can write shorter prompts and get faster, more relevant results.
You can reference any file in your editor by tagging it in your prompt like this:
Use @example.tsx as a reference to add a new page named "Resources" to the app that contains a list of resources defined in @resources.ts
Switch between models
You can switch models with the switcher under the chat input.
Adjust reasoning effort
You can adjust reasoning effort to control how long Codex thinks before responding. Higher effort can help on complex tasks, but responses take longer. Higher effort also uses more tokens and can consume your rate limits faster, especially with higher-capability models.
Use the same model switcher shown above, and choose low , medium , or high for each model. Start with medium , and only switch to high when you need more depth.
Choose an approval mode
By default, Codex runs in Agent mode. In this mode, Codex can read files, make edits, and run commands in the working directory automatically. Codex still needs your approval to work outside the working directory or access the network.
When you just want to chat, or you want to plan before making changes, switch to Chat with the switcher under the chat input.
If you need Codex to read files, make edits, and run commands with network access without approval, use Agent (Full Access) . Exercise caution before doing so.
Cloud delegation
You can offload larger jobs to Codex in the cloud, then track progress and review results without leaving your IDE.
Set up a cloud environment for Codex .
Pick your environment and select Run in the cloud .
You can have Codex run from main (useful for starting new ideas), or run from your local changes (useful for finishing a task).
When you start a cloud task from a local conversation, Codex remembers the conversation context so it can pick up where you left off.
Cloud task follow-up
The Codex extension makes previewing cloud changes straightforward. You can ask for follow-ups to run in the cloud, but often you’ll want to apply the changes locally to test and finish. When you continue the conversation locally, Codex also retains context to save you time.
You can also view the cloud tasks in the Codex cloud interface .
Codex ships with a first-party web search tool. For local tasks in the Codex IDE Extension, Codex enables web search by default and serves results from a web search cache. The cache is an OpenAI-maintained index of web results, so cached mode returns pre-indexed results instead of fetching live pages. This reduces exposure to prompt injection from arbitrary live content, but you should still treat web results as untrusted. If you configure your sandbox for full access , web search defaults to live results. See Config basics to disable web search or switch to live results that fetch the most recent data.
You’ll see web_search items in the transcript or codex exec --json output whenever Codex looks something up.
Drag and drop images into the prompt
You can drag and drop images into the prompt composer to include them as context.
Hold down Shift while dropping an image. VS Code otherwise prevents extensions from accepting a drop.
Ask Codex to generate or edit images without leaving your editor. This is useful for UI assets, layouts, illustrations, sprite sheets, and quick placeholders while you work. Add a reference image to the prompt when you want Codex to transform or extend an existing asset.
You can ask in natural language or explicitly invoke the image generation skill by including $imagegen in your prompt.
Built-in image generation uses gpt-image-2 , counts toward your general Codex usage limits, and uses included limits 3-5x faster on average than similar turns without image generation, depending on image quality and size. For details, see Pricing . For prompting tips and model details, see the image generation guide .
For larger batches of image generation, set OPENAI_API_KEY in your environment variables and ask Codex to generate images through the API so API pricing applies instead.
See also
Codex IDE extension settings
Ask AI
Loading docs agent...
