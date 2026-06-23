# Prompting – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/prompting
- Final URL: https://developers.openai.com/codex/prompting
- Canonical URL: https://developers.openai.com/codex/prompting
- Fetched at: 2026-06-23T14:12:49Z
- Content type: text/html; charset=utf-8

## Description

Interacting with the Codex agent

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
Prompts
You interact with Codex by sending prompts (user messages) that describe what you want it to do.
Example prompts:
Explain how the transform module works and how other modules use it. Add a new command-line option `--json` that outputs JSON.
When you submit a prompt, Codex works in a loop: it calls the model and then performs the actions indicated by the model output, such as file reads, file edits, and tool calls. This process ends when the task is complete or you cancel it.
As with ChatGPT, Codex is only as effective as the instructions you give it. Here are some tips we find helpful when prompting Codex:
Codex produces higher-quality outputs when it can verify its work. Include steps to reproduce an issue, validate a feature, and run linting and pre-commit checks.
Codex handles complex work better when you break it into smaller, focused steps. Smaller tasks are easier for Codex to test and for you to review. If you’re not sure how to split a task up, ask Codex to propose a plan.
For more ideas about prompting Codex, refer to workflows .
Threads
A thread is a single session: your prompt plus the model outputs and tool calls that follow. A thread can include multiple prompts. For example, your first prompt might ask Codex to implement a feature, and a follow-up prompt might ask it to add tests.
A thread is said to be “running” when Codex is actively working on it. You can run multiple threads at once, but avoid having two threads modify the same files. You can also resume a thread later by continuing it with another prompt.
Threads can run either locally or in the cloud:
Local threads run on your machine. Codex can read and edit your files and run commands, so you can see what changes and use your existing tools. To reduce the risk of unwanted changes outside your workspace, local threads run in a sandbox .
Cloud threads run in an isolated environment . Codex clones your repository and checks out the branch it’s working on. Cloud threads are useful when you want to run work in parallel or delegate tasks from another device. To use cloud threads with your repo, push your code to GitHub first. You can also delegate tasks from your local machine , which includes your current working state.
In the Codex app, you can also start a chat without choosing a project. Chats
aren’t tied to a saved repository or project folder. Use them for research,
planning, connected-tool workflows, or other work where Codex shouldn’t start
from a codebase. Chats use a Codex-managed threads directory under your Codex
home as their working location. By default, that location is ~/.codex/threads .
To change the base location for this state, set CODEX_HOME ; see
Config and state locations .
Context
When you submit a prompt, include context that Codex can use, such as references to relevant files and images. The Codex IDE extension automatically includes the list of open files and the selected text range as context.
As the agent works, it also gathers context from file contents, tool output, and an ongoing record of what it has done and what it still needs to do.
All information in a thread must fit within the model’s context window , which varies by model. Codex monitors and reports the remaining space. For longer tasks, Codex may automatically compact the context by summarizing relevant information and discarding less relevant details. With repeated compaction, Codex can continue working on complex tasks over many steps.
Goal mode
Goal mode gives Codex a persistent objective to work toward across a longer
task. Use it when the work may take many steps, or when Codex needs a clear
definition of done that it can keep checking as it works.
When you set a goal, the goal text acts as both the starting prompt and the
completion criteria. Codex uses it to decide what to do next and whether the
task is complete. Start Goal mode with /goal in the Codex
app , IDE
extension , or CLI .
If /goal doesn’t appear in the slash command list, enable features.goals
in config.toml :
[ features ] goals = true
You can also run codex features enable goals from the CLI or ask Codex to run it.
In the Codex app, progress appears above the composer with controls to pause,
resume, edit, or clear the goal.
Write goals so Codex can tell whether it has succeeded. Good goals include a
specific outcome, measurable target, or test criteria. For example:
Migrate this codebase from JavaScript to TypeScript. The app should compile in strict mode without explicit `any` type definitions. Reduce the time to interactive of the home page to below 1 second.
If the goal is hard to define up front, start with /plan and ask Codex to
shape it before implementation. You can also ask Codex to interview you and
draft a goal with clear success criteria.
You can continue steering Codex after the goal starts. Send follow-up messages
to adjust constraints, such as asking Codex to use a particular library or
avoid a specific approach. Use side chats when you want a status recap or
explanation without interrupting the main task. For long-running work, pause
the goal before you lose connectivity, then resume or edit it when you are
ready to continue.
Ask AI
Loading docs agent...
