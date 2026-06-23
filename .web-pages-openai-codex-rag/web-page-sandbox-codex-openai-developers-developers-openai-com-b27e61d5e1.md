# Sandbox – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/concepts/sandboxing
- Final URL: https://developers.openai.com/codex/concepts/sandboxing
- Canonical URL: https://developers.openai.com/codex/concepts/sandboxing
- Fetched at: 2026-06-23T14:12:08Z
- Content type: text/html; charset=utf-8

## Description

How Codex uses sandboxes across the Codex app, IDE, and CLI

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
The sandbox is the boundary that lets Codex act autonomously without giving it
unrestricted access to your machine. When Codex runs local commands in the
Codex app , IDE extension , or CLI , those commands run inside a
constrained environment instead of running with full access by default.
That environment defines what Codex can do on its own, such as which files it
can modify and whether commands can use the network. When a task stays inside
those boundaries, Codex can keep moving without stopping for confirmation. When
it needs to go beyond them, Codex falls back to the approval flow.
Sandboxing and approvals are different controls that work together. The
sandbox defines technical boundaries. The approval policy decides when Codex
must stop and ask before crossing them.
What the sandbox does
The sandbox applies to spawned commands, not just to Codex’s built-in file
operations. If Codex runs tools like git , package managers, or test runners,
those commands inherit the same sandbox boundaries.
Codex uses platform-native enforcement on each OS. The implementation differs
between macOS, Linux, WSL2, and native Windows, but the idea is the same across
surfaces: give the agent a bounded place to work so routine tasks can run
autonomously inside clear limits.
Why it matters
The sandbox reduces approval fatigue. Instead of asking you to confirm every
low-risk command, Codex can read files, make edits, and run routine project
commands within the boundary you already approved.
It also gives you a clearer trust model for agentic work. You aren’t just
trusting the agent’s intentions; you are trusting that the agent is operating
inside enforced limits. That makes it easier to let Codex work independently
while still knowing when it will stop and ask for help.
Codex applies sandboxing automatically when you use the default permissions
mode.
Prerequisites
On macOS , sandboxing works out of the box using the built-in Seatbelt
framework.
On Windows , Codex uses the native Windows
sandbox when you run in PowerShell and the
Linux sandbox implementation when you run in WSL2.
On Linux and WSL2 , install bubblewrap with your package manager first:
Choose an option
Ubuntu/Debian Fedora
sudo apt install bubblewrap
sudo dnf install bubblewrap
Codex uses the first bwrap executable it finds on PATH . If no bwrap
executable is available, Codex falls back to a bundled helper, but that helper
requires support for unprivileged user namespace creation. Installing the
distribution package that provides bwrap keeps this setup reliable.
Codex surfaces a startup warning when bwrap is missing or when the helper
can’t create the needed user namespace. On distributions that restrict this
AppArmor setting, prefer loading the bwrap AppArmor profile so bwrap can
keep working without disabling the restriction globally.
Ubuntu AppArmor note: On Ubuntu 25.04, installing bubblewrap from
Ubuntu’s package repository should work without extra AppArmor setup. The
bwrap-userns-restrict profile ships in the apparmor package at
/etc/apparmor.d/bwrap-userns-restrict .
On Ubuntu 24.04, Codex may still warn that it can’t create the needed user
namespace after bubblewrap is installed. Copy and load the extra profile:
sudo apt update sudo apt install apparmor-profiles apparmor-utils sudo install -m 0644 \ /usr/share/apparmor/extra-profiles/bwrap-userns-restrict \ /etc/apparmor.d/bwrap-userns-restrict sudo apparmor_parser -r /etc/apparmor.d/bwrap-userns-restrict
apparmor_parser -r loads the profile into the kernel without a reboot. You
can also reload all AppArmor profiles:
sudo systemctl reload apparmor.service
If that profile is unavailable or does not resolve the issue, you can disable
the AppArmor unprivileged user namespace restriction with:
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns= 0
How you control it
Most people start with the permissions controls in the product.
In the Codex app and IDE, you choose a mode from the permissions selector under
the composer or chat input. That selector lets you rely on Codex’s default
permissions, switch to full access, or use your custom configuration.
Ask Codex anything.
Default permissions
Default permissions Auto-review Full access Custom (config.toml)
5.5 High
Codex can read and edit files in the current workspace and run routine local commands. It asks before using the internet or going beyond the workspace boundary.
Sandbox workspace-write
Approvals policy on-request
Reviewer user
In the CLI, use /permissions
to switch modes during a session.
Configure defaults
If you want Codex to start with the same behavior every time, use a custom
configuration. Codex stores those defaults in config.toml , its local settings
file. Config basics explains how it works, and the
Configuration reference documents the exact keys for
sandbox_mode , approval_policy , approvals_reviewer , and
sandbox_workspace_write.writable_roots . Use those settings to decide how much
autonomy Codex gets by default, which directories it can write to, when it
should pause for approval, and who reviews eligible approval requests.
At a high level, the common sandbox modes are:
read-only : Codex can inspect files, but it can’t edit files or run
commands without approval.
workspace-write : Codex can read files, edit within the workspace, and run
routine local commands inside that boundary. This is the default low-friction
mode for local work.
danger-full-access : Codex runs without sandbox restrictions. This removes
the filesystem and network boundaries and should be used only when you want
Codex to act with full access.
The common approval policies are:
untrusted : Codex asks before running commands that aren’t in its trusted
set.
on-request : Codex works inside the sandbox by default and asks when it
needs to go beyond that boundary.
never : Codex doesn’t stop for approval prompts.
When approvals are interactive, you can also choose who reviews them with
approvals_reviewer :
user : approval prompts surface to the user. This is the default.
auto_review : eligible approval prompts go to a reviewer agent (see
Auto-review ).
Full access means using sandbox_mode = "danger-full-access" together with
approval_policy = "never" . By contrast, the lower-risk local automation
preset is sandbox_mode = "workspace-write" together with
approval_policy = "on-request" , or the matching CLI flags
--sandbox workspace-write --ask-for-approval on-request . You can then keep
approvals_reviewer = "user" for manual approvals or set
approvals_reviewer = "auto_review" for automatic approval review.
If you need Codex to work across more than one directory, writable roots let
you extend the places it can modify without removing the sandbox entirely. If
you need a broader or narrower trust boundary, adjust the default sandbox mode
and approval policy instead of relying on one-off exceptions.
When a workflow needs a specific exception, use rules . Rules
let you allow, prompt, or forbid command prefixes outside the sandbox, which is
often a better fit than broadly expanding access. For a higher-level overview
of approvals and sandbox behavior in the app, see
Codex app features , and for the
IDE-specific settings entry points, see Codex IDE extension settings .
Automatic review, when available, does not change the sandbox boundary. It is
one possible approvals_reviewer for approval requests at that boundary, such
as sandbox escalations, blocked network access, or side-effecting tool calls
that still need approval. Actions already allowed inside the sandbox run
without extra review. For the reviewer lifecycle, trigger types, denial
semantics, and configuration details, see
Auto-review .
Platform details live in the platform-specific docs. For native Windows setup,
behavior, and troubleshooting, see Windows . For admin
requirements and organization-level constraints on sandboxing and approvals, see
Agent approvals & security .
Ask AI
Loading docs agent...
