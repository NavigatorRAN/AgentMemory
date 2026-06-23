# Review – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/review
- Final URL: https://developers.openai.com/codex/app/review
- Canonical URL: https://developers.openai.com/codex/app/review
- Fetched at: 2026-06-23T14:11:48Z
- Content type: text/html; charset=utf-8

## Description

Review and iterate with Codex on changes inside the app

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
The review pane helps you understand what Codex changed, give targeted feedback, and decide what to keep.
It only works for projects that live inside a Git repository. If your project
isn’t a Git repository yet, the review pane will prompt you to create one.
What changes it shows
The review pane reflects the state of your Git repository, not just what Codex
edited. That means it will show:
Changes made by Codex
Changes you made yourself
Any other uncommitted changes in the repo
By default, the review pane focuses on uncommitted changes . You can also
switch the scope to:
All branch changes (diff against your base branch)
Last turn changes (just the most recent assistant turn)
When working locally, you can also toggle between Unstaged and Staged
changes.
Navigating the review pane
Clicking a file name typically opens that file in your chosen editor. You can choose the default editor in settings .
Clicking the file name background expands or collapses the diff.
Clicking a single line while holding Cmd pressed will open the line in your chosen editor.
If you are happy with a change you can stage the changes or revert changes you don’t like.
Inline comments for feedback
Inline comments let you attach feedback directly to specific lines in the diff.
This is often the fastest way to guide Codex to the right fix.
To leave an inline comment:
Open the review pane.
Hover the line you want to comment on.
Click the + button that appears.
Write your feedback and submit it.
After you finish leaving feedback, send a message back to the thread.
Because comments are line-specific, Codex can respond more precisely than with a
general instruction.
Codex treats inline comments as review guidance. After leaving comments, send a
follow-up message that makes your intent explicit, for example “Address the
inline comments and keep the scope minimal.”
Code review results
If you use /review to run a code review, comments will show up directly
inline in the review pane.
Pull request reviews
When Codex has GitHub access for your repository and the current project is on
the pull request branch, the Codex app can help you work through pull request
feedback without leaving the app. The sidebar shows pull request context and
feedback from reviewers, and the review pane shows comments alongside the diff
so you can ask Codex to address issues in the same thread.
Install the GitHub CLI ( gh ) and authenticate it with gh auth login so Codex
can load pull request context, review comments, and changed files. If gh is
missing or unauthenticated, pull request details may not appear in the sidebar
or review pane.
Use this flow when you want to keep the full fix loop in one place:
Open the review pane on the pull request branch.
Review the pull request context, comments, and changed files.
Ask Codex to fix the specific comments you want handled.
Inspect the resulting diff in the review pane.
Stage, commit, and push the changes to the PR branch when you are ready.
For GitHub-triggered reviews, see Use Codex in GitHub .
Staging and reverting files
The review pane includes Git actions so you can shape the diff before you
commit.
You can stage, unstage, or revert changes at these levels:
Entire diff : use the action buttons in the review header (for example,
“Stage all” or “Revert all”)
Per file : stage, unstage, or revert an individual file
Per hunk : stage, unstage, or revert a single hunk
Use staging when you want to accept part of the work, and revert when you want
to discard it.
Staged and unstaged states
Git can represent both staged and unstaged changes in the same file. When that
happens, it can look like the pane is showing “the same file twice” across
staged and unstaged views. That’s normal Git behavior.
Ask AI
Loading docs agent...
