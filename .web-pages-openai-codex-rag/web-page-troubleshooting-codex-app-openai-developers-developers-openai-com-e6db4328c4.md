# Troubleshooting – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/troubleshooting
- Final URL: https://developers.openai.com/codex/app/troubleshooting
- Canonical URL: https://developers.openai.com/codex/app/troubleshooting
- Fetched at: 2026-06-23T14:11:51Z
- Content type: text/html; charset=utf-8

## Description

FAQ and fixes for common Codex app issues

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
Frequently Asked Questions
Files appear in the side panel that Codex didn’t edit
If your project is inside a Git repository, the review panel automatically
shows changes based on your project’s Git state, including changes that Codex
didn’t make.
In the review pane, you can switch between staged changes and changes not yet
staged, and compare your branch with main.
If you want to see only the changes of your last Codex turn, switch the diff
pane to the “Last turn changes” view.
Learn more about how to use the review pane .
Remove a project from the sidebar
To remove a project from the sidebar, hover over the name of your project, click
the three dots and choose “Remove.” To restore it, re-add the
project using the Add new project button next to Threads or using
Cmd + O .
Find archived threads
Archived threads can be found in the Settings . When you
unarchive a thread it will reappear in the original location of your sidebar.
Only some threads appear in the sidebar
The sidebar allows filtering of threads depending on the state of a project. If
you’re missing threads, click the filter icon next to the Threads label and
switch to Chronological. If you still don’t see the thread, open
Settings and check the archived chats or archived threads
section.
Code doesn’t run on a worktree
Worktrees are created in a different directory and inherit files checked into
Git by default. Depending on how you manage dependencies and tooling for your
project, you might have to run setup scripts on your worktree using a
local environment or copy ignored setup files
with .worktreeinclude .
Alternatively, you can check out the changes in your regular local project. See
the worktrees documentation to learn more.
App doesn’t pick up a teammate’s shared local environment
The local environment configuration must be inside the .codex folder at the
root of your project. If you are working in a monorepo with more than one
project, make sure you open the project in the directory that contains the
.codex folder.
Codex asks to access Apple Music
Depending on your task, Codex may need to navigate the file system. Certain
directories on macOS, including Music, Downloads, or Desktop, require
additional approval from the user. If Codex needs to read your home directory,
macOS prompts you to approve access to those folders.
Automations create many worktrees
Frequent automations can create many worktrees over time. Archive automation
runs you no longer need and avoid pinning runs unless you intend to keep their
worktrees.
Recover a prompt after selecting the wrong target
If you started a thread with the wrong target ( Local , Worktree , or Cloud ) by accident, you can cancel the current run and recover your previous prompt by pressing the up arrow key in the composer.
Feature is working in the Codex CLI but not in the Codex app
The Codex app and Codex CLI use the same underlying Codex agent and configuration but might rely on different versions of the agent at any time and some experimental features might land in the Codex CLI first.
To get the version of the Codex CLI on your system run:
codex --version
To get the version of Codex bundled with your Codex app run:
/Applications/Codex.app/Contents/Resources/codex --version
Feedback and logs
Type / into the message composer to provide feedback for the team. If
you trigger feedback in an existing conversation, you can choose to share the
existing session along with your feedback. After submitting your feedback,
you’ll receive a session ID that you can share with the team.
To report an issue:
Find existing issues on the Codex GitHub repo.
Open a new GitHub issue
More logs are available in the following locations:
App logs (macOS): ~/Library/Logs/com.openai.codex/YYYY/MM/DD
Session transcripts: $CODEX_HOME/sessions (default: ~/.codex/sessions )
Archived sessions: $CODEX_HOME/archived_sessions (default: ~/.codex/archived_sessions )
If you share logs, review them first to confirm they don’t contain sensitive
information.
Stuck states and recovery patterns
If a thread appears stuck:
Check whether Codex is waiting for an approval.
Open the terminal and run a basic command like git status .
Start a new thread with a smaller, more focused prompt.
If you cancel worktree creation by mistake and lose your prompt, press the up
arrow key in the composer to recover it.
Terminal issues
Terminal appears stuck
Close the terminal panel.
Reopen it with Cmd + J .
Re-run a basic command like pwd or git status .
If commands behave differently than expected, validate the current directory and
branch in the terminal first.
If it continues to be stuck, wait until your active Codex threads are completed and restart the app.
Fonts aren’t rendering correctly
Codex uses the same font for the review pane, integrated terminal and any other code displayed inside the app. You can configure the font inside the Settings pane as Code font .
Ask AI
Loading docs agent...
