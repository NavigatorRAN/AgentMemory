# Auto-review – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/concepts/sandboxing/auto-review
- Final URL: https://developers.openai.com/codex/concepts/sandboxing/auto-review
- Canonical URL: https://developers.openai.com/codex/concepts/sandboxing/auto-review
- Fetched at: 2026-06-23T14:12:09Z
- Content type: text/html; charset=utf-8

## Description

How Codex routes sandbox-boundary approvals through a reviewer agent

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
Auto-review replaces manual approval at the sandbox boundary with a separate
reviewer agent. The main Codex agent still runs inside the same sandbox, with
the same approval policy and the same network and filesystem limits. The
difference is who reviews eligible escalation requests.
Auto-review only applies when approvals are interactive. In practice, that
means approval_policy = "on-request" or a granular approval policy that
still surfaces the relevant prompt category. With approval_policy = "never" ,
there is nothing to review.
How auto-review works
At a high level, the flow is:
The main agent works inside read-only or workspace-write .
When it needs to cross the sandbox boundary, it requests approval.
If approvals_reviewer = "auto_review" , Codex routes that approval request
to a separate reviewer agent instead of stopping for a person.
The reviewer decides whether the action should run and returns a rationale.
If the action is approved, execution continues. If it is denied, the main
agent is instructed to find a materially safer path or stop and ask the
user.
Auto-review is a reviewer swap, not a permission grant. It does not expand
writable_roots , enable network access, or weaken protected paths. It only
changes how Codex handles actions that already need approval.
When it triggers
Auto-review evaluates approval requests that would otherwise pause for a human.
These include:
Shell or exec tool calls that request escalated sandbox permissions.
Network requests blocked by the current sandbox or policy.
File edits outside the allowed writable roots.
MCP or app tool calls that require approval based on their tool annotations
or configured approval mode.
Browser Use access to a new website or domain.
Auto-review does not run for routine actions already allowed inside the
sandbox. If a command can run under the active sandbox_mode , or a tool call
stays within the allowed policy, the main agent continues without review.
Computer Use is a separate case. App approvals for Computer Use still surface
directly to the user, so Auto-review does not replace those app-level prompts.
What auto-review blocks
At a high level, Auto-review is designed to block actions such as:
sending private data, secrets, or credentials to untrusted destinations
probing for credentials, tokens, cookies, or session material
broad or persistent security weakening
destructive actions with significant risk of irreversible damage
The exact policy lives in the open-source Codex repository:
policy_template.md
and
policy.md .
That policy can be customized per enterprise with guardian_policy_config or
per user with local [auto_review].policy .
What the reviewer sees
The reviewer is itself a Codex agent with a narrower job than the main agent:
decide whether a specific boundary-crossing action should run.
The reviewer sees a compact transcript plus the exact approval request. That
typically includes user messages, surfaced assistant updates, relevant tool
calls and tool outputs, and the action now being proposed for approval. It can
also perform read-only checks to gather missing context, but it does so rarely.
Hidden assistant reasoning is not included. Auto-review sees retained
conversation items and tool evidence, not private chain-of-thought.
Denials and failure behavior
An explicit denial is not treated like an ordinary sandbox error. Codex returns
the review rationale to the main agent and adds a stronger instruction:
Do not pursue the same outcome via workaround, indirect execution, or policy
circumvention.
Continue only with a materially safer alternative.
Otherwise, stop and ask the user.
Codex also applies a rejection circuit breaker per turn. In the current
open-source implementation, Auto-review interrupts the turn after 3
consecutive denials or 10 denials within a rolling window of the last 50
reviews in the same turn.
Any non-denial resets the consecutive-denial counter. When the breaker trips,
Codex emits a warning and aborts the current turn with an interrupt rather than
letting the agent loop on more escalation attempts.
Timeouts are surfaced separately from explicit denials, and the main agent is
informed that a timeout alone is not proof that the action is unsafe.
There is also an explicit override path for denied actions. In the current
open-source TUI, run /approve to open the Auto-review Denials picker, then
select one recent denied action to approve for one retry. Codex records up to 10
recent denials per thread. That approval is narrow: it applies to the exact
denied action, not similar future actions; it is recorded for one retry in the
same context; and the retry still goes through Auto-review. Under the hood,
Codex injects a developer-scoped approval marker for that exact action. The
reviewer then sees that explicit user override as context, but it still follows
policy and can deny again if policy says the user cannot overwrite that class of
denial.
For setup details, see
Managed configuration .
The default reviewer policy is in the open-source Codex repository:
core/src/guardian/policy.md .
Enterprises can replace its tenant-specific section with
guardian_policy_config in managed requirements. Individual users can also set
a local
[auto_review].policy
in their config.toml , but managed requirements take precedence:
[ auto_review ] policy = """ YOUR POLICY GOES HERE """
To customize the policy, copy the whole default policy wording first, then
iterate based on your individual risk profile.
Reduce review volume without weakening security
Auto-review works best when the sandbox already covers your common safe
workflows. If too many mundane actions need review, fix the boundary first
instead of teaching the reviewer to approve noisy escalations forever.
In practice, the highest-leverage changes are:
Add narrow
writable_roots
for scratch directories or neighboring repos you intentionally use.
Add narrowly scoped prefix rules . Prefer precise command
prefixes such as ["cargo", "test"] or ["pnpm", "run", "lint"] over broad
patterns such as ["python"] or ["curl"] . Broad rules often erase the very
boundary Auto-review is meant to guard.
Auto-review session transcripts are retained under ~/.codex/sessions by
default, so you can ask Codex to analyze past traffic there before changing
policy or permissions.
Limits
Auto-review improves the default operating point for long-running agentic work,
but it is not a deterministic security guarantee.
It only evaluates actions that ask to cross a boundary.
It can still make mistakes, especially in adversarial or unusual contexts.
It should complement, not replace, good sandbox design, monitoring, and
organization-specific policy.
For the research rationale and published evaluation results, see the
Alignment Research post on Auto-review .
Ask AI
Loading docs agent...
