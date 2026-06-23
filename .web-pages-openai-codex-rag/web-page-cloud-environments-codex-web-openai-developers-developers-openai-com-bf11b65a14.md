# Cloud environments – Codex web | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/cloud/environments
- Final URL: https://developers.openai.com/codex/cloud/environments
- Canonical URL: https://developers.openai.com/codex/cloud/environments
- Fetched at: 2026-06-23T14:12:04Z
- Content type: text/html; charset=utf-8

## Description

Customize dependencies and tools for Codex

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
Use environments to control what Codex installs and runs during cloud tasks. For example, you can add dependencies, install tools like linters and formatters, and set environment variables.
Configure environments in Codex settings .
How Codex cloud tasks run
Here’s what happens when you submit a task:
Codex creates a container and checks out your repo at the selected branch or commit SHA.
Codex runs your setup script, plus an optional maintenance script when a cached container is resumed.
Codex applies your internet access settings. Setup scripts run with internet access. Agent internet access is off by default, but you can enable limited or unrestricted access if needed. See agent internet access .
The agent runs terminal commands in a loop. It edits code, runs checks, and tries to validate its work. If your repo includes AGENTS.md , the agent uses it to find project-specific lint and test commands.
When the agent finishes, it shows its answer and a diff of any files it changed. You can open a PR or ask follow-up questions.
Default universal image
The Codex agent runs in a default container image called universal , which comes pre-installed with common languages, packages, and tools.
In environment settings, select Set package versions to pin versions of Python, Node.js, and other runtimes.
For details on what’s installed, see
openai/codex-universal for a
reference Dockerfile and an image that can be pulled and tested locally.
While codex-universal comes with languages pre-installed for speed and convenience, you can also install additional packages to the container using setup scripts .
Environment variables and secrets
Environment variables are set for the full duration of the task (including setup scripts and the agent phase).
Secrets are similar to environment variables, except:
They are stored with an additional layer of encryption and are only decrypted for task execution.
They are only available to setup scripts. For security reasons, secrets are removed before the agent phase starts.
Automatic setup
For projects using common package managers ( npm , yarn , pnpm , pip , pipenv , and poetry ), Codex can automatically install dependencies and tools.
Manual setup
If your development setup is more complex, you can also provide a custom setup script. For example:
# Install type checker pip install pyright # Install dependencies poetry install --with test pnpm install
Setup scripts run in a separate Bash session from the agent, so commands like
export do not persist into the agent phase. To persist environment
variables, add them to ~/.bashrc or configure them in environment settings.
Container caching
Codex caches container state for up to 12 hours to speed up new tasks and follow-ups.
When an environment is cached:
Codex clones the repository and checks out the default branch.
Codex runs the setup script and caches the resulting container state.
When a cached container is resumed:
Codex checks out the branch specified for the task.
Codex runs the maintenance script (optional). This is useful when the setup script ran on an older commit and dependencies need to be updated.
Codex automatically invalidates the cache if you change the setup script, maintenance script, environment variables, or secrets. If your repo changes in a way that makes the cached state incompatible, select Reset cache on the environment page.
For Business and Enterprise users, caches are shared across all users who have
access to the environment. Invalidating the cache will affect all users of the
environment in your workspace.
Internet access and network proxy
Internet access is available during the setup script phase to install dependencies. During the agent phase, internet access is off by default, but you can configure limited or unrestricted access. See agent internet access .
Environments run behind an HTTP/HTTPS network proxy for security and abuse prevention purposes. All outbound internet traffic passes through this proxy.
Ask AI
Loading docs agent...
