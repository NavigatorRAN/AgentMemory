# SDK – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/sdk
- Final URL: https://developers.openai.com/codex/sdk
- Canonical URL: https://developers.openai.com/codex/sdk
- Fetched at: 2026-06-23T14:12:54Z
- Content type: text/html; charset=utf-8

## Description

Programmatically control local Codex agents

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
If you use Codex through the Codex CLI, the IDE extension, or Codex Web, you can also control it programmatically.
Use the SDK when you need to:
Control Codex as part of your CI/CD pipeline
Create your own agent that can engage with Codex to perform complex engineering tasks
Build Codex into your own internal tools and workflows
Integrate Codex within your own application
TypeScript library
The TypeScript library provides a way to control Codex from within your application that’s more comprehensive and flexible than non-interactive mode.
Use the library server-side; it requires Node.js 18 or later.
Installation
To get started, install the Codex SDK using npm :
npm install @openai/codex-sdk
Usage
Start a thread with Codex and run it with your prompt.
import { Codex } from "@openai/codex-sdk" ; const codex = new Codex (); const thread = codex. startThread (); const result = await thread. run ( "Make a plan to diagnose and fix the CI failures" ); console. log (result);
Call run() again to continue on the same thread, or resume a past thread by providing a thread ID.
// running the same thread const result = await thread. run ( "Implement the plan" ); console. log (result); // resuming past thread const threadId = "<thread-id>" ; const thread2 = codex. resumeThread (threadId); const result2 = await thread2. run ( "Pick up where you left off" ); console. log (result2);
For more details, check out the TypeScript repo .
Python library
The Python SDK controls the local Codex app-server over JSON-RPC. It requires Python 3.10 or later. Published SDK builds include a pinned Codex CLI runtime dependency.
To install the SDK run:
pip install openai-codex
Published SDK builds automatically use their pinned runtime. Pass CodexConfig(codex_bin=...) only when you intentionally want to run against a specific local Codex executable.
While the Python SDK is in beta, pip install openai-codex selects the latest
published beta build. After a stable SDK release exists, use
pip install --pre openai-codex to opt in to newer prerelease builds.
Start Codex, create a thread, and run a prompt:
from openai_codex import Codex, Sandbox with Codex() as codex: thread = codex.thread_start( model = "gpt-5.4" , sandbox = Sandbox.workspace_write, ) result = thread.run( "Make a plan to diagnose and fix the CI failures" ) print (result.final_response)
Use AsyncCodex when your application is already asynchronous:
import asyncio from openai_codex import AsyncCodex async def main () -> None : async with AsyncCodex() as codex: thread = await codex.thread_start( model = "gpt-5.4" ) result = await thread.run( "Implement the plan" ) print (result.final_response) asyncio.run(main())
Sandbox presets
Use the same Sandbox presets when creating a thread or changing its filesystem
access for a later turn:
from openai_codex import Codex, Sandbox with Codex() as codex: thread = codex.thread_start( sandbox = Sandbox.workspace_write) thread.run( "Make the requested change." ) review = thread.run( "Review the diff only." , sandbox = Sandbox.read_only)
Available presets:
Sandbox.read_only : Read files without allowing writes.
Sandbox.workspace_write : Read files and write inside the workspace and configured writable roots.
Sandbox.full_access : Run without filesystem access restrictions.
When you omit sandbox= , app-server uses its configured default. A sandbox
passed to run(...) or turn(...) applies to that turn and later turns
on the thread.
For more details, check out the Python repo .
Ask AI
Loading docs agent...
