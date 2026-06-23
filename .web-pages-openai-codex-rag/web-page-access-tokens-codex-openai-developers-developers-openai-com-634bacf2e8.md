# Access tokens – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/enterprise/access-tokens
- Final URL: https://developers.openai.com/codex/enterprise/access-tokens
- Canonical URL: https://developers.openai.com/codex/enterprise/access-tokens
- Fetched at: 2026-06-23T14:12:16Z
- Content type: text/html; charset=utf-8

## Description

Create and manage access tokens for Codex programmatic workflows

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
Codex access tokens are ChatGPT access tokens scoped to Codex permissions that let trusted automation run Codex local with a ChatGPT workspace identity. Use them when a script, scheduled job, or CI runner needs repeatable, non-interactive Codex access.
Codex access tokens are currently supported for ChatGPT Business and
Enterprise workspaces.
Access tokens are created in the ChatGPT admin console at Access tokens . They are tied to the ChatGPT user and workspace that create them, and Codex uses them as agent identities for programmatic local workflows.
If a Platform API key works for your automation, keep using API key auth. Use
Codex access tokens when the workflow specifically needs ChatGPT workspace
access, ChatGPT-managed Codex entitlements, or enterprise workspace controls.
Need to trigger a published ChatGPT workspace agent from your own system? Use
a Workspace Agent access token for the Workspace Agents API instead. Codex
access tokens authenticate Codex local workflows; they do not authenticate
workspace agent trigger calls. See Authenticate with Workspace Agent access
tokens .
How access tokens work
Use an access token when Codex needs to run without a user completing a browser sign-in. The token represents the ChatGPT workspace user who created it, so runs can use that user’s Codex access and appear in workspace governance data.
Codex checks the token when a run starts and ties the run to that workspace identity. Treat the token like any other automation secret: store it in a secret manager, keep it out of logs, and rotate it regularly.
Use access tokens for:
codex exec jobs that run from trusted automation.
Local scripts that need repeatable, non-interactive Codex runs.
Enterprise workflows where usage should be associated with a ChatGPT workspace user instead of an API organization key.
Main risks to avoid:
Leaked secrets: anyone with the token can start Codex runs as the token creator. Store tokens in a secret manager, keep them out of logs, and rotate them regularly.
Untrusted runners: public CI, forked pull requests, or shared machines can expose tokens to people outside your workspace. Use access tokens only on trusted runners.
Shared identities: one person’s token reused across unrelated teams makes ownership and audit trails harder to interpret. Create tokens for a specific workflow owner.
Stale credentials: long-lived tokens can remain active after the workflow changes. Prefer finite expirations and revoke tokens that are no longer used.
Wrong credential type: Codex access tokens are for Codex local workflows. Use Workspace Agent access tokens to trigger published ChatGPT workspace agents, and use Platform API keys for general OpenAI API calls.
Enable access token creation
Use the access token permission in workspace settings to turn on access token creation for allowed members.
Go to Workspace Settings > Permissions & roles .
In the Access tokens section, turn on Allow users to create access tokens if all allowed members should be able to create access tokens.
If members need to use those tokens with the Codex app, CLI, or IDE extension, make sure Allow members to use Codex Local is also turned on in the Codex Local section.
Keep access token creation limited to people or service owners who understand where the token will be stored, which automation will use it, and how it will be rotated.
Set an access token expiration limit
Workspace owners and admins can set the longest expiration that members can choose when they create a Codex access token. Go to Workspace Settings > Permissions & roles , then set Access token expiration limit in the Codex Local section.
The limit applies to new access tokens. Existing tokens keep their current expiration.
Create an access token
Use the Access tokens page to name the token and choose when it expires.
Go to Access tokens .
Select Create .
Enter a descriptive name, such as release-ci or nightly-docs-check .
Choose an expiration. Prefer a finite expiration such as 7, 30, 60, or 90 days. If you choose No expiration , rotate the token on a regular schedule.
Copy the generated access token immediately. You cannot view it again after you close the modal.
Store the token in your secret manager or CI secret store.
The shortest custom expiration is one day. Revoked and expired tokens cannot be used to start new Codex runs.
Use an access token with Codex CLI
For ephemeral automation, store the token in CODEX_ACCESS_TOKEN and run Codex normally:
export CODEX_ACCESS_TOKEN = "<access-token>" codex exec --json "review this repository and summarize the top risks"
For a persistent local login, pipe the token to codex login --with-access-token :
printf '%s' " $CODEX_ACCESS_TOKEN " | codex login --with-access-token codex exec "summarize the last release diff"
codex login --with-access-token stores an agent identity credential in Codex auth storage. If you prefer not to persist credentials on the machine, use the CODEX_ACCESS_TOKEN environment variable instead.
Rotate or revoke a token
Rotate access tokens the same way you rotate other automation secrets:
Create a replacement token.
Update the secret in the runner, scheduler, or secret manager.
Run a smoke test with the new token.
Revoke the old token from Access tokens .
From the Access tokens page, workspace owners and admins can revoke any workspace token. Members with access token permission can revoke only the tokens they created.
Permission model
Access token creation is controlled by the workspace’s access token permission, which is separate from the general Codex local permission. A member can have access to the Codex app, CLI, or IDE extension without being allowed to create access tokens.
Capability Workspace owners and admins Member with access token permission Member without access token permission Open Access tokens Yes Yes No Create access tokens Yes, for their own ChatGPT workspace identity Yes, for their own ChatGPT workspace identity No List access tokens Workspace list, including who created each token Only tokens they created No Revoke access tokens from the Access tokens page Any token in the workspace Only tokens they created No page access Grant or remove access token permission Yes No No Manage other Codex enterprise settings Yes, based on admin role and Codex admin permissions No, unless separately granted No
In short: workspace owners and admins manage access at the workspace level. Members need the access token permission to create and manage their own tokens, but the permission does not grant admin rights or access to other members’ tokens.
The access tokens page returns 404 or forbidden
Ask a workspace owner or admin to confirm that your role includes Allow users to create access tokens and that Allow members to use Codex Local is enabled if you plan to use the token with Codex.
codex login --with-access-token fails
Confirm that you copied the generated access token, not a browser session token or Platform API key. Also confirm that the token has not expired or been revoked.
Related docs
Non-interactive mode
Admin setup
Ask AI
Loading docs agent...
