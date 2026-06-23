# Computer Use – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/computer-use
- Final URL: https://developers.openai.com/codex/app/computer-use
- Canonical URL: https://developers.openai.com/codex/app/computer-use
- Fetched at: 2026-06-23T14:11:45Z
- Content type: text/html; charset=utf-8

## Description

Let Codex use desktop apps while it works

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
In supported regions, computer use in the Codex app is available on macOS and
Windows. Install the Computer Use plugin. On macOS, grant Screen Recording and
Accessibility permissions when prompted.
With computer use, Codex can see and operate graphical user interfaces on macOS
or Windows. Use it for tasks where command-line tools or structured integrations
aren’t enough, such as checking a desktop app, using a browser, changing app
settings, working with a data source that isn’t available as a plugin, or
reproducing a bug that only happens in a graphical user interface.
Because computer use can affect app and system state outside your project
workspace, use it for scoped tasks and review permission prompts before
continuing.
Set up computer use
In Codex settings, open Computer Use and click Install to install the
Computer Use plugin before you ask Codex to operate desktop apps. On Windows,
keep the target app visible on the active desktop while the task runs. On
macOS, grant Screen Recording and Accessibility permissions when prompted so
Codex can see and interact with the target app.
On macOS, grant:
Screen Recording permission so Codex can see the target app.
Accessibility permission so Codex can click, type, and navigate.
When to use computer use
Choose computer use when the task depends on a graphical user interface that’s
hard to verify through files or command output alone.
Good fits include:
Testing a macOS app, Windows app, iOS simulator flow, or another desktop app
that Codex is building.
Performing a task that requires your web browser.
Reproducing a bug that only appears in a graphical interface.
Changing app settings that require clicking through a UI.
Inspecting information in an app or data source that isn’t available through a
plugin.
On macOS, running a scoped task in the background while you keep working
elsewhere.
Executing a workflow that spans more than one app.
For web apps you are building locally, use the
in-app browser first.
Windows foreground use
On Windows, computer use runs on the active desktop. It can’t operate in the
background while you keep using the same Windows session, so expect Codex to
move the pointer, type, and take over the foreground while the task runs.
For Windows tasks that should continue while you step away, keep the Windows
device unlocked and connected to the internet. Use
remote control from your phone to check progress
or send follow-up instructions, or run the Codex app inside a Windows virtual
machine so computer use takes over the VM instead of your main desktop.
Start a computer use task
Mention @Computer or @AppName in your prompt, or ask Codex to use
computer use. Describe the exact app, window, or flow Codex should operate.
Open the app with computer use, reproduce the onboarding bug, and fix the smallest code path that causes it. After each change, run the same UI flow again. Open @Chrome and verify the checkout page still works after the latest changes.
If the target app exposes a dedicated plugin or MCP server, prefer that
structured integration for data access and repeatable operations. Choose
computer use when Codex needs to inspect or operate the app visually.
Permissions and approvals
System permissions for computer use are separate from app approvals in Codex.
On macOS, Screen Recording and Accessibility permissions let Codex see and
operate apps. App approvals determine which apps you allow Codex to use. File
reads, file edits, and shell commands still follow the sandbox and approval
settings for the thread.
With computer use, Codex can see and take action only in the apps you allow.
During a task, Codex asks for your permission before it can use an app on your
computer. You can choose Always allow so Codex can use that app in the future
without asking again. You can remove apps from the Always allow list in the
Computer Use section of Codex settings.
Codex may also ask for permission before taking sensitive or disruptive actions.
If Codex can’t see or control an app, open System Settings > Privacy &
Security and check Screen Recording and Accessibility for the Codex
app on macOS. On Windows, make sure the target app is visible in the active
desktop session.
Configure Windows app policy
On Windows, Computer Use stores persistent app decisions in
$CODEX_HOME/computer-use/config.toml . List apps that Computer Use can open
without prompting and apps that it must decline:
[ apps ] allowed = [ "mspaint.exe" ] denied = [ "calc.exe" ]
Use the app identifier that Windows Computer Use reports, such as an executable
name for a desktop app or an app user model ID for a packaged app. Denied apps
take precedence over allowed apps. Codex prompts for apps that don’t appear in
either list.
This file stores local Computer Use decisions. It’s separate from the
admin-enforced requirements.toml , where administrators can disable Computer
Use with [features].computer_use = false .
Locked use
Locked use is for macOS. On Windows, computer use works in the foreground.
Locked computer use lets Codex use Computer Use after your Mac locks, but only
after you enable it. Use it when a Codex task needs to use desktop apps from a
connected device after the Mac locks.
When you enable locked computer use, Codex installs an Apple
authorization plug-in
that participates in the macOS unlock flow.
Locked use is intentionally narrow. It’s not a general-purpose remote-unlock
path for your Mac, and it doesn’t let other apps or local processes unlock the
computer.
To use locked computer use:
Open Codex settings > Computer Use .
Enable locked computer use.
Start a task that uses computer use from a connected device after your Mac’s
screen has locked.
When a Codex task accesses an app via Computer Use after your Mac locks, Codex
temporarily unlocks the Mac while blocking local use and preserving the locked
screen protections. Before unlocking, Codex checks whether the unlock attempt is
for an active, trusted computer use turn. Outside that short-lived window, Codex
denies the unlock and asks you to unlock manually if needed.
Locked use includes safeguards:
The authorization window is short-lived and scoped to the current unlock
attempt.
Automatic unlock is available only to Codex during active computer use turns.
Codex covers every display while the desktop is temporarily unlocked.
If Codex detects local keyboard or pointer input, it relocks the Mac and
pauses automatic unlock until you unlock it manually.
Safety guidance
With computer use, Codex can view screen content, take screenshots, and interact
with windows, menus, keyboard input, and clipboard state in the target app.
Treat visible app content, browser pages, screenshots, and files opened in the
target app as context Codex may process while the task runs.
Keep tasks narrow and stay present for sensitive flows:
Give Codex one clear target app or flow at a time.
You can stop the task or take over your computer at any time.
Keep sensitive apps closed unless they’re required for the task.
On Windows, expect Codex to take over foreground input while it works; use a
secondary device, a VM, or stop the task before using that desktop yourself.
Avoid tasks that require secrets unless you’re present and can approve each
step.
Review app permission prompts before allowing Codex to use an app.
Use Always allow only for apps you trust Codex to use automatically in
future tasks.
Stay present for account, security, privacy, network, payment, or
credential-related settings.
Cancel the task if Codex starts interacting with the wrong window.
If Codex uses your browser, it can interact with pages where you’re already
signed in. Review website actions as if you were taking them yourself: web pages
can contain malicious or misleading content, and sites may treat approved clicks,
form submissions, and signed-in actions as coming from your account. To keep
using your browser while Codex works, ask Codex to use a different browser.
The feature can’t automate terminal apps or Codex itself, since automating them
could bypass Codex security policies. It also can’t authenticate as an
administrator or approve security and privacy permission prompts on your
File edits and shell commands still follow Codex approval and sandbox settings
where applicable. Changes made through desktop apps may not appear in the review
pane until they’re saved to disk and tracked by the project. Your ChatGPT data
controls apply to content processed through Codex, including screenshots taken
by computer use.
Ask AI
Loading docs agent...
