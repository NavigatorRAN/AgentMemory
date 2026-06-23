# Use Codex in Linear | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/integrations/linear
- Final URL: https://developers.openai.com/codex/integrations/linear
- Canonical URL: https://developers.openai.com/codex/integrations/linear
- Fetched at: 2026-06-23T14:12:35Z
- Content type: text/html; charset=utf-8

## Description

Run Codex tasks from Linear issues

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
Use Codex in Linear to delegate work from issues. Assign an issue to Codex or mention @Codex in a comment, and Codex creates a cloud task and replies with progress and results.
Codex in Linear is available on paid plans (see Pricing ).
If you’re on an Enterprise plan, ask your ChatGPT workspace admin to turn on Codex cloud tasks in workspace settings and enable Codex for Linear in connector settings .
Set up the Linear integration
Set up Codex cloud tasks by connecting GitHub in Codex and creating an environment for the repository you want Codex to work in.
Go to Codex settings and install Codex for Linear for your workspace.
Link your Linear account by mentioning @Codex in a comment thread on a Linear issue.
Delegate work to Codex
You can delegate in two ways:
Assign an issue to Codex
After you install the integration, you can assign issues to Codex the same way you assign them to teammates. Codex starts work and posts updates back to the issue.
Mention @Codex in comments
You can also mention @Codex in comment threads to delegate work or ask questions. After Codex replies, follow up in the thread to continue the same session.
After Codex starts working on an issue, it chooses an environment and repo to work in.
To pin a specific repo, include it in your comment, for example: @Codex fix this in openai/codex .
To track progress:
Open Activity on the issue to see progress updates.
Open the task link to follow along in more detail.
When the task finishes, Codex posts a summary and a link to the completed task so you can create a pull request.
How Codex chooses an environment and repo
Linear suggests a repository based on the issue context. Codex selects the environment that best matches that suggestion. If the request is ambiguous, it falls back to the environment you used most recently.
The task runs against the default branch of the first repository listed in that environment’s repo map. Update the repo map in Codex if you need a different default or more repositories.
If no suitable environment or repository is available, Codex will reply in Linear with instructions on how to fix the issue before retrying.
Automatically assign issues to Codex
You can assign issues to Codex automatically using triage rules:
In Linear, go to Settings .
Under Your teams , select your team.
In the workflow settings, open Triage and turn it on.
In Triage rules , create a rule and choose Delegate > Codex (and any other properties you want to set).
Linear assigns new issues that enter triage to Codex automatically.
When you use triage rules, Codex runs tasks using the account of the issue creator.
Data usage, privacy, and security
When you mention @Codex or assign an issue to it, Codex receives your issue content to understand your request and create a task.
Data handling follows OpenAI’s Privacy Policy , Terms of Use , and other applicable policies .
For more on security, see the Codex security documentation .
Codex uses large language models that can make mistakes. Always review answers and diffs.
Tips and troubleshooting
Missing connections : If Codex can’t confirm your Linear connection, it replies in the issue with a link to connect your account.
Unexpected environment choice : Reply in the thread with the environment you want (for example, @Codex please run this in openai/codex ).
Wrong part of the code : Add more context in the issue, or give explicit instructions in your @Codex comment.
More help : See the OpenAI Help Center .
Connect Linear for local tasks (MCP)
If you’re using the Codex app, CLI, or IDE Extension and want Codex to access Linear issues locally, configure Codex to use the Linear Model Context Protocol (MCP) server.
To learn more, check out the Linear MCP docs .
The setup steps for the MCP server are the same regardless of whether you use the IDE extension or the CLI since both share the same configuration.
Use the CLI (recommended)
If you have the CLI installed, run:
codex mcp add linear --url https://mcp.linear.app/mcp
This prompts you to sign in with your Linear account and connect it to Codex.
Configure manually
Open ~/.codex/config.toml in your editor.
Add the following:
[ mcp_servers . linear ] url = "https://mcp.linear.app/mcp"
Run codex mcp login linear to log in.
Ask AI
Loading docs agent...
