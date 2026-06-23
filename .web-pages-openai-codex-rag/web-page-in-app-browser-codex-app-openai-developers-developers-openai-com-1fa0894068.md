# In-app browser – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/browser
- Final URL: https://developers.openai.com/codex/app/browser
- Canonical URL: https://developers.openai.com/codex/app/browser
- Fetched at: 2026-06-23T14:11:42Z
- Content type: text/html; charset=utf-8

## Description

Preview and comment on web apps from Codex

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
The in-app browser gives you and Codex a shared view of rendered web pages
inside a thread. Use it when you’re building or debugging a web app and want to
preview pages and attach visual comments.
Use it for local development servers, file-backed previews, and public pages
that don’t require sign-in. For anything that depends on login state or browser
extensions, use your regular browser or the
Codex Chrome extension .
Open the in-app browser from the toolbar, by clicking a URL, by navigating
manually in the browser, or by pressing Cmd + Shift + B
( Ctrl + Shift + B on Windows).
The in-app browser does not support authentication flows, signed-in pages,
your regular browser profile, cookies, extensions, or existing tabs. Use it
for pages Codex can open without logging in.
Treat page content as untrusted context. Don’t paste secrets into browser flows.
Browser use
Browser use lets Codex operate the in-app browser directly. Use it for local
development servers and file-backed previews when Codex needs to click, type,
inspect rendered state, take screenshots, download page assets, run read-only
page inspection JavaScript, or verify a fix in the page.
To use it, install and enable the Browser plugin. Then ask Codex to use the
browser in your task, or reference it directly with @Browser . The app keeps
browser use inside the in-app browser and lets you manage allowed and blocked
websites from settings.
Example:
Use the browser to open http://localhost:3000/settings, reproduce the layout bug, and fix only the overflowing controls.
Codex asks before using a website unless you’ve allowed it. Removing a site from
the allowed list means Codex asks again before using it; removing a site from the
blocked list means Codex can ask again instead of treating it as blocked.
For signed-in websites in Chrome, see
Preview a page
Start your app’s development server in the integrated terminal or with a local environment action .
Open an unauthenticated local route, file-backed page, or public page by
clicking a URL or navigating manually in the browser.
Review the rendered state alongside the code diff.
Leave browser comments on the elements or areas that need changes.
Ask Codex to address the comments and keep the scope narrow.
Example feedback:
I left comments on the pricing page in the in-app browser. Address the mobile layout issues and keep the card structure unchanged.
Comment on the page
When a bug is visible only in the rendered page, use browser comments to give
Codex precise feedback on the page.
Turn on Annotation mode, select an element or area, and submit a comment.
In Annotation mode, hold Shift and click to select an area.
Hold Cmd while clicking to send a comment immediately.
After you leave comments, send a message in the thread asking Codex to address
them. Comments are most useful when Codex needs to make a precise visual change.
Good feedback is specific:
This button overflows on mobile. Keep the label on one line if it fits, otherwise wrap it without changing the card height. This tooltip covers the data point under the cursor. Reposition the tooltip so it stays inside the chart bounds.
Styling feedback
When you add an annotation to a section on the page, press the config icon next
to the text input to give Codex more granular style feedback. You can change
values like font, text, spacing, and color, preview the result directly on the
page, and then send the annotation so Codex has a clearer target for the change.
Keep browser tasks scoped
The in-app browser is for review and iteration. Keep each browser task small
enough to review in one pass.
Name the page, route, or local URL.
Name the visual state you care about, such as loading, empty, error, or
success.
Leave comments on the exact elements or areas that need changes.
Review the updated route after Codex changes the code.
Ask Codex to start or check the dev server before it uses the browser.
For repository changes, use the review pane to inspect the
changes and leave comments.
Developer mode works with Browser use in Chrome and the Codex in-app browser.
It gives Codex controlled access to the Chrome DevTools Protocol (CDP). Use it
when you want Codex to profile JavaScript, inspect console output and network
traffic, examine page state such as the DOM and applied styles, or diagnose an
issue directly in the live browser.
To enable it, open Settings > Browser and,
under Developer mode , turn on Enable full CDP access . If your
organization has disabled this setting, you can’t enable it locally. Admins can
set browser_use_full_cdp_access = false under [features] in
requirements.toml .
Full CDP access lets Codex inspect and control sensitive browser internals that
may put your data at risk. Codex asks for explicit approval before it uses full
CDP to inspect a website. Review the site, task, and requested access before you
approve it.
Use @Browser for the in-app browser. To use Developer mode in Chrome,
set up the Codex Chrome extension and invoke
@Chrome .
For example:
This app is slow. Use @Browser to capture a performance trace and inspect network traffic, then identify the bottleneck.
Ask AI
Loading docs agent...
