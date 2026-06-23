# Code review in GitHub – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/integrations/github
- Final URL: https://developers.openai.com/codex/integrations/github
- Canonical URL: https://developers.openai.com/codex/integrations/github
- Fetched at: 2026-06-23T14:12:34Z
- Content type: text/html; charset=utf-8

## Description

Set up Codex code review for GitHub pull requests, request reviews with @codex review, enable automatic reviews, and customize review guidelines.

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
Use Codex code review to get another high-signal review pass on GitHub pull
requests. Codex reviews the pull request diff, follows your repository guidance,
and posts a standard GitHub code review focused on serious issues.
Before you start
Make sure you have:
Codex cloud set up for the repository you want to review.
Access to Codex code review settings .
An AGENTS.md file if you want Codex to follow repository-specific review guidance.
Set up Codex code review
Set up Codex cloud .
Go to Codex settings .
Turn on Code review for your repository.
Request a Codex review
In a pull request comment, mention @codex review .
Wait for Codex to react (👀) and post a review.
Codex posts a review on the pull request, just like a teammate would. In
GitHub, Codex flags only P0 and P1 issues so review comments stay focused on
high-priority risks.
Enable automatic reviews
If you want Codex to review every pull request automatically, turn on
Automatic reviews in Codex settings .
Codex will post a review whenever someone opens a new PR for review, without
needing an @codex review comment.
Customize what Codex reviews
Codex searches your repository for AGENTS.md files and follows any Review guidelines you include.
To set guidelines for a repository, add or update a top-level AGENTS.md with a section like this:
## Review guidelines - Don't log PII. - Verify that authentication middleware wraps every route.
Codex applies guidance from the closest AGENTS.md to each changed file. You can place more specific instructions deeper in the tree when particular packages need extra scrutiny.
For a one-off focus, add it to your pull request comment:
@codex review for security regressions
If you want Codex to flag typos in documentation, add guidance in AGENTS.md
(for example, “Treat typos in docs as P1.”).
Act on review findings
After Codex posts a review, you can ask it to fix issues in the same pull
request by leaving another comment:
@codex fix the P1 issue
Codex starts a cloud task with the pull request as context and can push a fix
back to the branch when it has permission to do so.
Give Codex other tasks
If you mention @codex in a comment with anything other than review , Codex starts a cloud task using your pull request as context.
@codex fix the CI failures
Troubleshoot code review
If Codex doesn’t react or post a review:
Confirm you turned on Code review for the repository in Codex settings .
Confirm the pull request belongs to a repository with Codex cloud set up.
Use the exact trigger @codex review in a pull request comment.
For automatic reviews, check that you turned on Automatic reviews and that
the pull request event matches your review trigger settings.
Ask AI
Loading docs agent...
