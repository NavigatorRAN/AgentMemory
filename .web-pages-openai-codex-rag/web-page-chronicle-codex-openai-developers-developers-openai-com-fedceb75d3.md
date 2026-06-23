# Chronicle – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/memories/chronicle
- Final URL: https://developers.openai.com/codex/memories/chronicle
- Canonical URL: https://developers.openai.com/codex/memories/chronicle
- Fetched at: 2026-06-23T14:12:40Z
- Content type: text/html; charset=utf-8

## Description

Build Codex memories from recent screen context.

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
Chronicle is in an opt-in research preview . It is only available for
ChatGPT Pro subscribers on macOS. Please review the Privacy and
Security section for details and to understand the
current risks before enabling.
Chronicle augments Codex memories with context from your screen. When you prompt
Codex, those memories can help it understand what you’ve been working on with
less need for you to restate context.
Chronicle is available as an opt-in research preview in the Codex app on macOS.
It requires macOS Screen Recording and Accessibility permissions. Before
enabling, be aware that Chronicle uses rate limits quickly, increases risk of
prompt injection, and stores memories unencrypted on your device.
How Chronicle helps
We’ve designed Chronicle to reduce the amount of context you have to restate
when you work with Codex. By using recent screen context to improve memory
building, Chronicle can help Codex understand what you’re referring to, identify
the right source to use, and pick up on the tools and workflows you rely on.
Use what’s on screen
With Chronicle Codex can understand what you are currently looking at, saving
you time and context switching.
With Chronicle Without
Fill in missing context
No need to carefully craft your context and start from zero. Chronicle lets
Codex fill in the gaps in your context.
Remember tools and workflows
No need to explain to Codex which tools to use to perform your work. Codex
learns as you work to save you time in the long run.
In these cases, Codex uses Chronicle to provide additional context. When another
source is better for the job, such as reading the specific file, Slack thread,
Google Doc, dashboard, or pull request, Codex uses Chronicle to identify the
source and then use that source directly.
Enable Chronicle
Open Settings in the Codex app.
Go to Personalization and make sure Memories is enabled.
Turn on Chronicle below the Memories setting.
Review the consent dialog and choose Continue .
Grant macOS Screen Recording and Accessibility permissions when prompted.
When setup completes, choose Try it out or start a new thread.
If macOS reports that Screen Recording or Accessibility permission is denied,
open System Settings > Privacy & Security > Screen Recording or
Accessibility and enable Codex. If a permission is restricted by macOS or your
organization, Chronicle will start after the restriction is removed and Codex
receives the required permission.
Pause or disable Chronicle at any time
You control when Chronicle generates memories using screen context. Use the
Codex menu bar icon to choose Pause Chronicle or Resume Chronicle . Pause
Chronicle before meetings or when viewing sensitive content that you do not want
Codex to use as context. To disable Chronicle, return to Settings >
Personalization > Memories and turn off Chronicle .
You can also control whether memories are used in a given thread. Learn
more .
Chronicle works by running sandboxed agents in the background to generate
memories from captured screen images. These agents currently consume rate limits
quickly.
Privacy and security
Chronicle uses screen captures, which can include sensitive information visible
on your screen. It does not have access to your microphone or system audio.
Don’t use Chronicle to record meetings or communications with others without
their consent. Pause Chronicle when viewing content you do not want remembered
in memories.
Where does Chronicle store my data?
Screen captures are ephemeral and will only be saved temporarily on your
computer. Temporary screen capture files may appear under
$TMPDIR/chronicle/screen_recording/ while Chronicle is running. Screen captures
that are older than 6 hours will be deleted while Chronicle is running.
The memories that Chronicle generates are just like other Codex memories:
unencrypted markdown files that you can read and modify if needed. You can also
ask Codex to search them. If you want to have Codex forget something you can
delete the respective file inside the folder or selectively edit the markdown
files to remove the information you’d like to remove. You should not manually
add new information. The generated Chronicle memories are stored locally on your
computer under $CODEX_HOME/memories_extensions/chronicle/ (typically
~/.codex/memories_extensions/chronicle ).
Both directories for your screen captures and memories might contain sensitive information. Make sure you do not share content with others, and be aware that other programs on your computer can also access these files.
What data gets shared with OpenAI?
Chronicle captures screen context locally, then periodically uses Codex to
summarize recent activity into memories. To generate those memories, Chronicle
starts an ephemeral Codex session with access to this screen context. That
session may process selected screenshot frames, OCR text extracted from
screenshots, timing information, and local file paths for the relevant time
window.
Screen captures used for memory generation are stored temporarily on your device. They are processed on our
servers to generate memories, which are then stored locally on device. We do not
store the screenshots on our servers after processing unless required by law,
and do not use them for training.
The generated memories are Markdown files stored locally under
$CODEX_HOME/memories_extensions/chronicle/ . When Codex uses memories in a
future session, relevant memory contents may be included as context for that
session, and may be used to improve our models if allowed in your ChatGPT
settings. Learn more .
Prompt injection risk
Using Chronicle increases risk to prompt injection attacks from screen content.
For instance, if you browse a site with malicious agent instructions, Codex may
follow those instructions.
How do I enable Chronicle?
If you do not see the Chronicle setting, make sure you are using a Codex app
build that includes Chronicle and that you have Memories enabled inside Settings
> Personalization.
Chronicle is currently only available for ChatGPT Pro subscribers on macOS.
If setup does not complete:
Confirm that Codex has Screen Recording and Accessibility permissions.
Quit and reopen the Codex app.
Open Settings > Personalization and check the Chronicle status.
Which model is used for generating the Chronicle memories?
Chronicle uses the same model as your other Memories . If you
did not configure a specific model it uses your default Codex model. To choose a
specific model, update the consolidation_model in your
configuration .
[ memories ] consolidation_model = "gpt-5.4-mini"
Ask AI
Loading docs agent...
