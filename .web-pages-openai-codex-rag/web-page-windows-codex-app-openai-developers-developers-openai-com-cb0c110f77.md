# Windows – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/windows
- Final URL: https://developers.openai.com/codex/app/windows
- Canonical URL: https://developers.openai.com/codex/app/windows
- Fetched at: 2026-06-23T14:11:52Z
- Content type: text/html; charset=utf-8

## Description

Use the Codex app on Windows with native sandbox and PowerShell support

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
The Codex app for Windows gives you one interface for
working across projects, running parallel agent threads, and reviewing results.
The Windows app supports core workflows such as worktrees, automations, Git
functionality, the in-app browser, artifact previews, plugins, and skills.
It runs natively on Windows using PowerShell and the
Windows sandbox , or you can configure it to
run in Windows Subsystem for Linux 2 (WSL2) .
Download the Codex app
Download the Codex app for Windows.
Then follow the quickstart to get started.
For enterprises, administrators can deploy the app with Microsoft Store app
distribution through enterprise management tools.
If you prefer a command-line install path, or need an alternative to opening
the Microsoft Store UI, run:
winget install Codex - s msstore
Native sandbox
The Codex app on Windows supports a native Windows sandbox when the agent runs in PowerShell, and uses Linux sandboxing when you run the agent in Windows Subsystem for Linux 2 (WSL2) . To apply sandbox protections in either mode, set sandbox permissions to Default permissions in the Composer before sending messages to Codex.
Running Codex in full access mode means Codex is not limited to your project
directory and might perform unintentional destructive actions that can lead to
data loss. Keep sandbox boundaries in place and use rules for
targeted exceptions, or set your approval policy to
never to have
Codex attempt to solve problems without asking for escalated permissions,
based on your approval and security setup .
Customize for your dev setup
Preferred editor
Choose a default app for Open , such as Visual Studio, VS Code, or another
editor. You can override that choice per project. If you already picked a
different app from the Open menu for a project, that project-specific
choice takes precedence.
Integrated terminal
You can also choose the default integrated terminal. Depending on what you have
installed, options include:
PowerShell
Command Prompt
Git Bash
WSL
This change applies only to new terminal sessions. If you already have an
integrated terminal open, restart the app or start a new thread before
expecting the new default terminal to appear.
Windows Subsystem for Linux (WSL)
By default, the Codex app uses the Windows-native agent. That means the agent
runs commands in PowerShell. The app can still work with projects that live in
Windows Subsystem for Linux 2 (WSL2) by using the wsl CLI when needed.
If you want to add a project from the WSL filesystem, click Add new project
or press Ctrl + O , then type \\wsl$\ into the File
Explorer window. From there, choose your Linux distribution and the folder you
want to open.
If you plan to keep using the Windows-native agent, prefer storing projects on
your Windows filesystem and accessing them from WSL through
/mnt/<drive>/... . This setup is more reliable than opening projects
directly from the WSL filesystem.
If you want the agent itself to run in WSL2, open Settings ,
switch the agent from Windows native to WSL, and restart the app . The
change doesn’t take effect until you restart. Your projects should remain in
place after restart.
WSL1 was supported through Codex 0.114 . Starting in Codex 0.115 , the Linux
sandbox moved to bubblewrap , so WSL1 is no longer supported.
You configure the integrated terminal independently from the agent. See
Customize for your dev setup for the
terminal options. You can keep the agent in WSL and still use PowerShell in the
terminal, or use WSL for both, depending on your workflow.
Useful developer tools
Codex works best when a few common developer tools are already installed:
Git : Powers the review panel in the Codex app and lets you inspect or
revert changes.
Node.js : A common tool that the agent uses to perform tasks more
efficiently.
Python : A common tool that the agent uses to perform tasks more
.NET SDK : Useful when you want to build native Windows apps.
GitHub CLI : Powers GitHub-specific functionality in the Codex app.
Install them with the default Windows package manager winget by pasting this
into the integrated terminal or
asking Codex to install them:
winget install -- id Git.Git winget install -- id OpenJS.NodeJS.LTS winget install -- id Python.Python. 3.14 winget install -- id Microsoft.DotNet.SDK. 10 winget install -- id GitHub.cli
After installing GitHub CLI, run gh auth login to enable GitHub features in
the app.
If you need a different Python or .NET version, change the package IDs to the
version you want.
Troubleshooting and FAQ
Run commands with elevated permissions
If you need Codex to run commands with elevated permissions, start the Codex app
itself as an administrator. After installation, open the Start menu, find
Codex, and choose Run as administrator. The Codex agent inherits that
permission level.
PowerShell execution policy blocks commands
If you have never used tools such as Node.js or npm in PowerShell before, the
Codex agent or integrated terminal may hit execution policy errors.
This can also happen if Codex creates PowerShell scripts for you. In that case,
you may need a less restrictive execution policy before PowerShell will run
them.
An error may look something like this:
npm.ps1 cannot be loaded because running scripts is disabled on this system.
A common fix is to set the execution policy to RemoteSigned :
Set-ExecutionPolicy - ExecutionPolicy RemoteSigned
For details and other options, check Microsoft’s
execution policy guide
before changing the policy.
Local environment scripts on Windows
If your local environment uses cross-platform
commands such as npm scripts, you can keep one shared setup script or
set of actions for every platform.
If you need Windows-specific behavior, create Windows-specific setup scripts or
Windows-specific actions.
Actions run in the environment used by your integrated terminal. See
Customize for your dev setup .
Local setup scripts run in the agent environment: WSL if the agent uses WSL,
and PowerShell otherwise.
Share config, auth, and sessions with WSL
The Windows app uses the same Codex home directory as native Codex on Windows:
%USERPROFILE%\.codex .
If you also run the Codex CLI inside WSL, the CLI uses the Linux home
directory by default, so it doesn’t automatically share configuration, cached
auth, or session history with the Windows app.
To share them, use one of these approaches:
Sync WSL ~/.codex with %USERPROFILE%\.codex on your file system.
Point WSL at the Windows Codex home directory by setting CODEX_HOME :
export CODEX_HOME = /mnt/c/Users/ < windows-user > /.codex
If you want that setting in every shell, add it to your WSL shell profile, such
as ~/.bashrc or ~/.zshrc .
Git features are unavailable
If you don’t have Git installed natively on Windows, the app can’t use some
features. Install it with winget install Git.Git from PowerShell or cmd.exe .
Git isn’t detected for projects opened from \\wsl$
For now, if you want to use the Windows-native agent with a project also
accessible from WSL, the most reliable workaround is to store the project
on the native Windows drive and access it in WSL through /mnt/<drive>/... .
Cmder isn’t listed in the open dialog
If Cmder is installed but doesn’t show in Codex’s open dialog, add it to the
Windows Start Menu: right-click Cmder and choose Add to Start , then
restart Codex or reboot.
Ask AI
Loading docs agent...
