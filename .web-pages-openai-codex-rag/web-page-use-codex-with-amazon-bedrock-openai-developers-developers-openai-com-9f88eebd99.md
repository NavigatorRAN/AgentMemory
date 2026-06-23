# Use Codex with Amazon Bedrock | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/amazon-bedrock
- Final URL: https://developers.openai.com/codex/amazon-bedrock
- Canonical URL: https://developers.openai.com/codex/amazon-bedrock
- Fetched at: 2026-06-23T14:11:38Z
- Content type: text/html; charset=utf-8

## Description

Configure Codex to use OpenAI models available through Amazon Bedrock.

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
Configure Codex to use OpenAI models available through Amazon Bedrock. In this
setup, Codex runs locally and sends model requests to Bedrock using
AWS-managed authentication and access controls.
How it works
When you configure Codex with Amazon Bedrock as the model provider, the
OpenAI-hosted Responses API isn’t in the request path. Codex sends model
requests to Amazon Bedrock, and Bedrock provides an OpenAI-compatible Responses
API implementation for supported OpenAI models.
Authentication is AWS-native. Users authenticate with a Bedrock API key or AWS
IAM credentials. They do not use ChatGPT sign-in or OPENAI_API_KEY for this
provider.
Before you start
Make sure you have:
Access to supported OpenAI models in Amazon Bedrock.
An AWS Region where the selected model is available.
Authentication for the Amazon Bedrock Mantle path configured for the AWS
account.
Configure Codex
Add the amazon-bedrock model provider for the Amazon Bedrock Mantle path to
~/.codex/config.toml . Supplying a model is optional. Select a supported model
explicitly when needed.
model_provider = "amazon-bedrock"
This guide covers the Amazon Bedrock Mantle path in supported commercial AWS
Regions. Codex doesn’t support Bedrock Mantle endpoints in AWS GovCloud
Regions.
Authentication options
Codex supports two Bedrock authentication paths. It checks them in this order:
Bedrock API key.
AWS SDK credential chain.
Option 1: Bedrock API key
Set the Bedrock API key in the environment Codex reads. You must specify a
Region when using API-key authentication.
export AWS_BEARER_TOKEN_BEDROCK =< your-bedrock-api-key > export AWS_REGION = us-east-2
Option 2: AWS SDK credentials
Use this path when your organization manages Bedrock access through the AWS SDK
credential chain. Codex can use these standard AWS SDK credential sources:
Shared AWS config and credentials files.
aws configure
Environment variables.
export AWS_ACCESS_KEY_ID =< your-access-key-id > export AWS_SECRET_ACCESS_KEY =< your-secret-access-key > export AWS_SESSION_TOKEN =< your-session-token >
AWS Management Console credentials.
aws login
AWS SSO or a named profile.
aws sso login --profile codex-bedrock export AWS_PROFILE = codex-bedrock
Federated identity configured with credential_process . For corporate SSO or
OIDC federation, configure the AWS profile outside Codex and let the AWS SDK
resolve credentials. Put browser login, token exchange, caching, and refresh
in your AWS profile’s credential_process helper.
Desktop app and VS Code extension
Desktop apps and IDE extensions may not inherit environment variables from the
shell. Put required values in ~/.codex/.env , then restart the app or
extension.
Verify setup
In Codex CLI, open /status and confirm Codex is using the
amazon-bedrock model provider.
In the desktop app or VS Code extension, start a new session after restarting
the app.
Confirm the selected model is available in the configured AWS Region and that
the AWS identity has permission to access it.
Supported models
Use exact model IDs:
openai.gpt-5.5 openai.gpt-5.4
Model availability varies by AWS Region. Before selecting a model, see model
support by AWS
Region .
Feature availability
This configuration supports local Codex workflows. Some features that depend on
OpenAI-hosted cloud services, hosted tools, or cloud-managed discovery aren’t
currently available.
Fast Mode isn’t available with Amazon Bedrock. Fast Mode uses priority
processing, and the initial Amazon Bedrock offering supports on-demand
inference only.
Detailed feature availability
Feature Amazon Bedrock Access and surfaces Codex web — Codex app for local tasks Codex CLI IDE extension Codex SDK, codex exec , and scriptable workflows Models and multimodal Bedrock-backed inference with supported OpenAI models Fast mode — Image generation and editing — Voice dictation — Web search — Local features Local code review with /review Auto-review for approval requests Sandboxing and permission controls Project and standalone app automations Automations Worktrees and built-in Git tools Local environments and repeatable actions Appshots Browser and remote control In-app browser previews and comments Browser Use automation Limited* Chrome extension browser control Limited* Computer Use Limited* SSH remote connections Mobile remote control — Customization and extensions Custom instructions with AGENTS.md Skills Plugins Limited† Plugin sharing — App connectors — MCP Subagents and custom agents Memories Limited* Chronicle — Cloud and integrations Codex cloud tasks — Sites — GitHub issue and PR delegation with @codex — GitHub code review and automatic PR reviews — Slack cloud integration — Linear cloud integration — Admin, security, and analytics SAML SSO, MFA, and workspace user management — requirements.toml managed config Cloud-managed config policies — Codex RBAC and custom roles — SCIM, EKM, and domain verification — Enterprise retention and residency controls — No training on API or business data by default Analytics dashboard — Analytics API — Compliance API and audit logs — Codex Security for connected GitHub repositories —
* Feature is currently limited to only specific regions. Check
the individual feature documentation to learn more about geo restrictions.
† Local plugin bundles are supported when their capabilities do
not require ChatGPT authentication. OpenAI-curated plugin discovery and
features that depend on app connectors or cloud-hosted sharing aren’t
available.
If setup fails, check the following:
The model ID exactly matches a supported model.
You specify an AWS Region where the model is available.
The Bedrock API key or AWS credentials are valid and not expired.
The AWS identity has permission to access the selected Bedrock model.
AWS_BEARER_TOKEN_BEDROCK isn’t set to an expired or unintended key.
For desktop app or VS Code extension usage, required environment variables
are present in ~/.codex/.env .
Support boundaries
OpenAI Support can help with Codex client setup, configuration, local CLI
behavior, desktop app behavior, IDE extension behavior, and the local Codex
product experience.
For AWS credentials, IAM permissions, Bedrock model access, quotas, billing,
regional availability, Bedrock request failures, AWS service logs, or Bedrock
service behavior, contact the customer’s AWS administrator or AWS Support.
Ask AI
Loading docs agent...
