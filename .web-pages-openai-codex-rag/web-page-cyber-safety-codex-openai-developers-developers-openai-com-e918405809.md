# Cyber Safety – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/concepts/cyber-safety
- Final URL: https://developers.openai.com/codex/concepts/cyber-safety
- Canonical URL: https://developers.openai.com/codex/concepts/cyber-safety
- Fetched at: 2026-06-23T14:12:07Z
- Content type: text/html; charset=utf-8

## Description

Cybersecurity safeguards and trusted access for Codex users

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
GPT-5.3-Codex is the first model we are treating as High cybersecurity capability under our Preparedness Framework , which requires additional safeguards. These safeguards include training the model to refuse clearly malicious requests like stealing credentials.
In addition to safety training, automated classifier-based monitors detect signals of suspicious cyber activity and route high-risk traffic to a less cyber-capable model (GPT-5.2). We expect a very small portion of traffic to be affected by these mitigations, and are working to refine our policies, classifiers, and in-product notifications.
Why we’re doing this
Over recent months, we’ve seen meaningful gains in model performance on cybersecurity tasks, benefiting both developers and security professionals. As our models improve at cybersecurity-related tasks like vulnerability discovery, we’re taking a precautionary approach: expanding protections and enforcement to support legitimate research while slowing misuse.
Cyber capabilities are inherently dual-use. The same knowledge and techniques that underpin important defensive work — penetration testing, vulnerability research, high-scale scanning, malware analysis, and threat intelligence — can also enable real-world harm.
These capabilities and techniques need to be available and easier to use in contexts where they can be used to improve security. Our Trusted Access for Cyber pilot enables individuals and organizations to continue using models for potentially high-risk cybersecurity activity without disruption.
How it works
Developers and security professionals doing cybersecurity-related work or similar activity that could be mistaken by automated detection systems may have requests rerouted to GPT-5.2 as a fallback. We expect a very small portion of traffic to affected by mitigations, and are actively working to calibrate our policies and classifiers.
The latest alpha version of the Codex CLI includes in-product messaging for
when requests are rerouted. This messaging will be supported in all clients in
the next few days.
Accounts impacted by mitigations can regain access to GPT-5.3-Codex by joining the Trusted Access program below.
We recognize that joining Trusted Access may not be a good fit for everyone, so we plan to move from account-level safety checks to request-level checks in most cases as we scale these mitigations and strengthen cyber resilience.
Trusted Access for Cyber
We are piloting “trusted access” which allows developers to retain advanced capabilities while we continue to calibrate policies and classifiers for general availability. Our goal is for very few users to need to join Trusted Access for Cyber .
To use models for potentially high-risk cybersecurity work:
Users can verify their identity at chatgpt.com/cyber
Enterprises can request trusted access for their entire team by default through their OpenAI representative
Security researchers and teams who may need access to even more cyber-capable or permissive models to accelerate legitimate defensive work can express interest in our invite-only program⁠ . Users with trusted access must still abide by our Usage Policies⁠ and Terms of Use⁠ .
False positives
Legitimate or non-cybersecurity activity may occasionally be flagged. When rerouting occurs, the responding model will be visible in API request logs and in with an in-product notice in the CLI, soon all surfaces. If you’re experiencing rerouting that you believe is incorrect, please report via /feedback for false positives.
Ask AI
Loading docs agent...
