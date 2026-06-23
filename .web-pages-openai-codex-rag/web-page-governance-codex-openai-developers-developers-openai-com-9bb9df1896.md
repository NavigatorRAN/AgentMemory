# Governance – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/enterprise/governance
- Final URL: https://developers.openai.com/codex/enterprise/governance
- Canonical URL: https://developers.openai.com/codex/enterprise/governance
- Fetched at: 2026-06-23T14:12:18Z
- Content type: text/html; charset=utf-8

## Description

Governance guidance for managing Codex in your organization

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
Governance and Observability
Codex gives enterprise teams visibility into adoption and impact, plus the auditability needed for security and compliance programs. Use the self-serve dashboard for day-to-day tracking, the Analytics API for programmatic reporting, and the Compliance API to export detailed logs into your governance stack.
Ways to track Codex usage
There are three ways to monitor Codex usage, depending on what you need:
Analytics Dashboard : quick visibility into adoption, usage, and code review impact.
Analytics API : pull structured daily metrics into your data warehouse or BI tools.
Compliance API : exports detailed activity logs for audit, monitoring, and investigations.
Analytics Dashboard
Dashboard views
The analytics dashboard allows ChatGPT workspace administrators and analytics viewers to track Codex adoption, usage, and Code Review feedback. Usage data can lag by up to 12 hours.
Codex provides date-range controls for daily and weekly views. Key charts include:
Active users by product surface, including CLI, IDE extension, cloud, desktop, and Code Review
Workspace and personal usage breakdowns, including credit and token usage by product surface or model
Product activity for threads and turns by client
User ranking table, with filters for client and sort options such as credits, threads, turns, text tokens, and current streak
Code Review activity, including PRs reviewed, issues by priority, comments, replies, reactions, and feedback sentiment
Skill invocations, agent identity usage, and access token usage when your workspace has those features
Data export
Administrators can also export Codex analytics data in CSV or JSON format. Codex provides the following export options:
Workspace usage, including daily active users, threads, turns, and credits by surface
Usage per user, including daily threads, turns, and credits across surfaces, with optional email addresses when allowed
Code Review details, including daily comments, reactions, replies, and priority-level findings
Analytics API
Use the Analytics API when you want to automate reporting, build internal dashboards, or join Codex metrics with your existing engineering data.
What it measures
The enterprise Analytics API returns daily or weekly UTC buckets for a workspace. It supports workspace-level and per-user usage, per-client breakdowns, Code Review throughput, Code Review comment priority, and user engagement with Code Review comments.
Endpoints
The base URL is https://api.chatgpt.com/v1/analytics/codex . All endpoints return paginated page objects with has_more and next_page .
Use start_time for the inclusive Unix timestamp at the beginning of the reporting window, end_time for the exclusive Unix timestamp at the end of the reporting window, group_by for day or week buckets, limit for page size, and page to continue from a previous response. Requests can look back up to 90 days.
Usage
GET /workspaces/{workspace_id}/usage
Returns totals for threads, turns, credits, and per-client usage in daily or weekly buckets.
Omit group to return per-user rows.
Set group=workspace to return workspace-wide rows.
Includes text input, cached input, and output token fields.
Code review activity
GET /workspaces/{workspace_id}/code_reviews
Returns pull request reviews completed by Codex.
Returns total comments generated by Codex.
Breaks comments down by P0, P1, and P2 priority.
User engagement with code review
GET /workspaces/{workspace_id}/code_review_responses
Returns replies and reactions to Codex comments.
Breaks reactions down into positive, negative, and other reactions.
Counts comments that received reactions, replies, or either form of engagement.
How it works
Analytics uses time windows and supports day or week grouping. Results are time-ordered and returned in pages with cursor-based pagination. Use an API key scoped to codex.enterprise.analytics.read .
Common use cases
Engineering observability dashboards
Adoption reporting for leadership updates
Usage governance and cost monitoring
Compliance API
Use the Compliance API when you need auditable records for security, legal, and governance workflows.
The Compliance API gives enterprises a way to export logs and metadata for Codex activity so you can connect that data to your existing audit, monitoring, and security workflows. It is designed for use with tools like eDiscovery, DLP, SIEM, or other compliance systems.
For Codex usage authenticated through ChatGPT, Compliance API exports provide audit records for Codex activity and can be used in investigations and compliance workflows. These audit logs are retained for up to 30 days. API-key-authenticated Codex usage follows your API organization settings and is not included in Compliance API exports.
What you can export
Activity logs
Prompt text sent to Codex
Responses Codex generated
Identifiers such as workspace, user, timestamp, and model
Token usage and related request metadata
Metadata for audit and investigation
Use record metadata to answer questions like:
Who ran a task
Who created or revoked an access token
When it ran
Which model was used
How much content was processed
Security investigations
Compliance reporting
Policy enforcement audits
Routing events into SIEM and eDiscovery pipelines
What it does not provide
Lines of code generated (a bit of a noisy proxy for productivity and can incentivize the wrong behavior)
Acceptance rate of suggestions (almost 100% since users usually accept the change first)
Code quality or performance KPIs
Recommended pattern
Most enterprises use a combination of:
Analytics Dashboard for self-serve monitoring and quick answers
Analytics API for automated reporting and BI integration
Compliance API for audit exports and investigations
Ask AI
Loading docs agent...
