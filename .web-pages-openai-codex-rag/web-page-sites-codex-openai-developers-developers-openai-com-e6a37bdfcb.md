# Sites – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/sites
- Final URL: https://developers.openai.com/codex/sites
- Canonical URL: https://developers.openai.com/codex/sites
- Fetched at: 2026-06-23T14:12:55Z
- Content type: text/html; charset=utf-8

## Description

Build and deploy hosted sites from Codex with the Sites plugin

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
Sites lets Codex create, save, deploy, and inspect websites, web apps, and
games hosted by OpenAI. Use the Sites plugin when you want to turn a prompt
or a compatible existing project into a hosted site without setting up a
separate deployment workflow.
Every Sites deployment URL is a production deployment. If you want to review a
build before it becomes live, ask Codex to save a version without deploying
it.
Get started with Sites
Sites is in preview and currently available for ChatGPT Business and Enterprise
workspaces, with more plans rolling out later. For ChatGPT Enterprise
workspaces, an admin must turn it on through role-based access control (RBAC)
before members can use it. Compare support by plan in
Feature availability .
Enable Sites for an Enterprise workspace
If you use ChatGPT Enterprise, ask your workspace admin to open the RBAC
controls in ChatGPT admin settings and
turn on Sites for the appropriate role. ChatGPT Business workspaces can skip
this step because Sites is enabled by default.
Add the Sites plugin
If Sites isn’t already available, open Plugins in the Codex app, find
Sites , and add it to Codex. Start a new thread after installing a plugin.
Start a Sites task
In a thread, describe the site you want to create or publish. You can name
the plugin explicitly with @Sites , especially when your task should end in
a hosted deployment.
Review whether to save or deploy
Ask Codex to validate the site’s build. Then tell it either to save a
deployable version for review or to deploy the approved saved version.
Return to deployed sites
Open Sites in the app sidebar to return to your Sites projects. You can
also ask Codex to inspect saved versions, check deployment status, or change
who can access a deployed site.
Prompt Sites for common tasks
For a new website, dashboard, or internal tool, include the audience, core
experience, and required data:
@Sites Build a project request dashboard for my operations team. Let team members submit requests, see who owns each one, update the status, and filter the list. Require people to sign in with their workspace account, and keep the request data saved between visits.
For an existing project, ask Sites to prepare and publish the current app:
@Sites Deploy this project. Check whether it is compatible with Sites, make any required changes, and give me the deployment URL.
When a site needs durable application data or uploaded files, say so in the
request:
@Sites Add persistent player scores and avatar uploads to this game. Use the appropriate Sites storage and deploy the updated game.
Browse the Sites showcase for deployed internal apps and
the full prompts used to create them.
Understand projects, versions, and deployments
A Sites project links a local source project to hosting managed through Sites.
Codex stores that linkage and optional storage binding names in
.openai/hosting.json . A newly created local starter can begin without a
project_id ; Sites adds one after it provisions the hosted project.
For example, a provisioned site that uses a relational database binding and no
file storage can contain:
{ "project_id" : "<project-id>" , "d1" : "DB" , "r2" : null }
Sites publishing has two separate stages:
Save a version. Codex builds the deployable site and associates that
version with the source Git commit used for the build. Use this stage when
you want a reviewable deployment candidate.
Deploy a version. Codex publishes a saved version and reports the
production URL when deployment succeeds. Use this only when you intend for
the selected audience to access the site.
Ask Codex to list or inspect saved versions when you need to identify a
previous deployment candidate.
Choose a supported site shape
Sites hosts projects that build Cloudflare Worker-compatible output as ES
modules. For new projects, the Sites workflow can start with its recommended
site starter. For an existing site, ask Codex to confirm that the project’s
build can produce compatible deployment artifacts before you request a
deployment.
Tell Codex about the product behavior you need so it can select the appropriate
site shape:
Site need What to ask Sites for Content-led website or landing page A site with no persistent application state unless the experience requires it Saved records, user progress, or game scores D1, a relational database for durable structured data Images, documents, audio, video, or other uploads R2, object storage for files Uploaded files with searchable metadata D1 for metadata and R2 for file contents Internal site that needs the current workspace user’s identity Workspace-authenticated user identity Public sign-in or an external identity provider An authentication-enabled Sites project
Don’t request durable storage for temporary presentation state, such as a
theme choice or a dismissed banner. Do request it for product data that people
expect the hosted site to remember.
Control access and secrets
Set the audience before you share a deployed URL. For a new site, keep access
limited to the owner and workspace admins until you have reviewed the content,
data handling, and expected audience.
You can ask Sites to apply one of these access modes:
Access mode Who can access the site Owner and admins ( admins_only ) The site owner and workspace admins Workspace ( workspace_all ) All active users in the workspace Custom ( custom ) Specific active users or workspace groups that you choose; Sites continues to allow the owner
For example:
@Sites Change this deployed site's access to everyone in my workspace after showing me the current site and confirming the deployment URL.
Configure runtime environment values
Open Sites in the app sidebar and select a project to add, update, or remove
hosted environment variables and secrets in the Sites panel. Don’t store these
values in .openai/hosting.json . Keep local .env and .env.example files
aligned with the keys needed for local development, and don’t commit secret
values.
When you add, update, or remove hosted environment values, ask Codex to
redeploy the approved saved version so the next deployment uses the updated
configuration.
Review before you share
Before you deploy or widen access:
Review the source changes and any database migrations in the Codex
review pane .
Confirm that the build succeeded and that the selected saved version is the
version you intend to publish.
Check that only the intended audience can access the site.
Confirm that you configured runtime secret values through Sites and didn’t
commit them in source files.
After deployment, ask Codex to confirm deployment status and the production
URL before you share it.
Related documentation
Plugins explains how to install and invoke Codex plugins.
Codex app introduces app navigation and project threads.
Review and ship changes explains how to inspect source
changes before publishing them.
Ask AI
Loading docs agent...
