# Quickstart – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/quickstart
- Final URL: https://developers.openai.com/codex/quickstart
- Canonical URL: https://developers.openai.com/codex/quickstart
- Fetched at: 2026-06-23T14:12:50Z
- Content type: text/html; charset=utf-8

## Description

Start using Codex in your IDE, CLI, or the cloud

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
Every ChatGPT plan includes Codex.
You can also use Codex with API credits by signing in with an OpenAI API key.
Choose an option
App Recommended IDE extension Codex in your IDE CLI Codex in your terminal Cloud Codex in your browser
The Codex app is available on macOS and Windows.
Most Codex app features are available on both platforms. Platform-specific
exceptions are noted in the relevant docs.
Download and install the Codex app
Download the Codex app for macOS or Windows. Choose the Intel build if you’re using an Intel-based Mac.
Download for macOS (Apple Silicon) Download for macOS (Intel)
Need a different operating system?
Download for Windows
Get notified for Linux
Open Codex and sign in
Once you downloaded and installed the Codex app, open it and sign in with your ChatGPT account or an OpenAI API key.
If you sign in with an OpenAI API key, some functionality might not be available .
Select a project
Choose a project folder that you want Codex to work in.
If you used the Codex app, CLI, or IDE Extension before you’ll see past projects that you worked on.
Send your first message
After choosing the project, make sure Local is selected to have Codex work on your machine and send your first message to Codex.
You can ask Codex anything about the project or your computer in general. Here are some examples:
Tell me about this project Copied Build a classic Snake game in this repo. Copied Find and fix bugs in my codebase with minimal, high-confidence changes. Copied
If you need more inspiration, explore Codex use cases .
If you’re new to Codex, read the best practices guide .
Install the Codex extension for your IDE.
Install the Codex extension
Download it for your editor:
Download for Visual Studio Code
Download for Cursor
Download for Windsurf
Download for Visual Studio Code Insiders
Open the Codex panel
Once installed, the Codex extension appears in the sidebar alongside your other extensions. It may be hidden in the collapsed section. You can move the Codex panel to the right side of the editor if you prefer.
Sign in and start your first task
Sign in with your ChatGPT account or an API key to get started.
Codex starts in Agent mode by default, which lets it read files, run commands, and write changes in your project directory.
Use Git checkpoints
Codex can modify your codebase, so consider creating Git checkpoints before and after each task so you can easily revert changes if needed.
Learn more about the Codex IDE extension
The Codex CLI is supported on macOS, Windows, and Linux.
Install the Codex CLI
On macOS or Linux, use the standalone installer:
curl -fsSL https://chatgpt.com/codex/install.sh | sh
On Windows, run:
powershell - ExecutionPolicy ByPass - c "irm https://chatgpt.com/codex/install.ps1 | iex"
For unattended installs, set CODEX_NON_INTERACTIVE=1 on the shell that
runs the downloaded installer. See
Environment variables
for details.
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE = 1 sh $ env: CODEX_NON_INTERACTIVE = 1 ; irm https: // chatgpt.com / codex / install.ps1 | iex
You can also install Codex CLI with npm or Homebrew:
npm install -g @openai/codex brew install --cask codex
Run codex and sign in
Run codex in your terminal to get started. You’ll be prompted to sign in with your ChatGPT account or an API key.
Ask Codex to work in your current directory
Once authenticated, you can ask Codex to perform tasks in the current directory.
Learn more about the Codex CLI
Use Codex in the cloud at chatgpt.com/codex .
Open Codex in your browser
Go to chatgpt.com/codex . You can also delegate a task to Codex by tagging @codex in a GitHub pull request comment (requires signing in to ChatGPT).
Set up an environment
Before starting your first task, set up an environment for Codex. Open the environment settings at chatgpt.com/codex and follow the steps to connect a GitHub repository.
Launch a task and monitor progress
Once your environment is ready, launch coding tasks from the Codex interface . You can monitor progress in real time by viewing logs, or let tasks run in the background.
Tell me about this project Copied Explain the top failure modes of my application's architecture. Copied Find and fix bugs in my codebase with minimal, high-confidence changes. Copied
Review changes and create a pull request
When a task completes, review the proposed changes in the diff view. You can iterate on the results or create a pull request directly in your GitHub repository.
Codex also provides a preview of the changes. You can accept the PR as is, or check out the branch locally to test the changes:
git fetch git checkout < branch-nam e >
Learn more about Codex cloud
Next steps
Learn more about the Codex app
Use the Codex app to work with your local projects.
Migrate to Codex
Move supported instruction files, MCP server configuration, skills, and
subagents into Codex.
Ask AI
Loading docs agent...
