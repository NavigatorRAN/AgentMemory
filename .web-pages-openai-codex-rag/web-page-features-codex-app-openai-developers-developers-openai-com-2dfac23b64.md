# Features – Codex app | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/app/features
- Final URL: https://developers.openai.com/codex/app/features
- Canonical URL: https://developers.openai.com/codex/app/features
- Fetched at: 2026-06-23T14:11:46Z
- Content type: text/html; charset=utf-8

## Description

What you can do with the Codex app

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
The Codex app is a focused desktop experience for working on Codex threads in parallel,
with built-in worktree support, automations, and Git functionality.
Most Codex app features are available on both macOS and Windows.
The sections below note platform-specific exceptions.
Multitask across projects
Use one Codex app window to run tasks across projects. Add a project for each
codebase and switch between them as needed.
When available in your Codex desktop app, you can ask Codex to manage threads
in your local projects or worktrees. For example, ask it to find a related
thread, continue an existing thread, or pin or archive a thread. To create a
separate background thread, make that request explicit: Create a separate background thread in a worktree for this project to update the tests.
If you’ve used the Codex CLI , a project is like starting a
session in a specific directory.
If you work in a single repository with two or more apps or packages, split
distinct projects into separate app projects so the sandbox
only includes the files for that project.
Skills support
The Codex app supports the same agent skills as the CLI and
IDE Extension. You can also view and explore new skills that your team has
created across your different projects by clicking Skills in the sidebar.
You can also combine skills with automations to perform routine tasks
such as evaluating errors in your telemetry and submitting fixes or creating reports on recent
codebase changes. For ongoing work that should stay in one thread, use a
thread automation .
Modes
Each thread runs in a selected mode. When starting a thread, you can choose:
Local : work directly in your current project directory.
Worktree : isolate changes in a Git worktree. Learn more .
Cloud : run remotely in a configured cloud environment.
Both Local and Worktree threads will run on your computer.
For the full glossary and concepts, explore the concepts section .
Built-in Git tools
The Codex app provides common Git features directly within the app.
The diff pane shows a Git diff of your changes in your local project or worktree checkout. You
can also add inline comments for Codex to address and stage or revert specific chunks or entire files.
You can also commit, push, and create pull requests for local and worktree tasks directly from
within the Codex app.
For more advanced Git tasks, use the integrated terminal .
Worktree support
When you create a new thread, choose Local or Worktree . Local works
directly within your project. Worktree creates a new Git worktree so changes stay isolated from your regular project.
Use Worktree when you want to try a new idea without touching your current
work, or when you want Codex to run independent tasks side by side in the same
project.
Automations run in dedicated background worktrees for Git repositories, and directly in the project directory for non-version-controlled projects.
Learn more about using worktrees in the Codex app.
Integrated terminal
Each thread includes a built-in terminal scoped to the current project or
worktree. Toggle it using the terminal icon in the top right of the app or by
pressing Cmd + J .
Use the terminal to validate changes, run scripts, and perform Git operations
without leaving the app. Codex can also read the current terminal output, so
it can check the status of a running development server or refer back to a
failed build while it works with you.
Common tasks include:
git status
git pull --rebase
pnpm test or npm test
pnpm run lint or similar project commands
If you run a task regularly, you can define an action inside your local environment to add a shortcut button to the top of your Codex app window.
Note that Cmd + K opens the command palette in the Codex
app. It doesn’t clear the terminal. To clear the terminal use Ctrl + L .
Native Windows sandbox
On Windows, Codex can run natively in PowerShell with a native Windows sandbox
instead of requiring WSL or a virtual machine. This lets you stay in
Windows-native workflows while keeping bounded permissions in place.
Learn more about Windows setup and sandboxing .
Voice dictation
Use your voice to prompt Codex. Hold Ctrl + M while the composer is visible and start talking. Your voice will be transcribed. Edit the transcribed prompt or hit send to have Codex start work.
Floating pop-out window
Pop out an active conversation thread into a separate window and move it to where
you are actively working. This is ideal for front-end work, where you can keep
the thread near your browser, editor, or design preview while iterating quickly.
You can also toggle the pop-out window to stay on top when you want it to remain
visible across your workflow.
Use the in-app browser to preview, review, and comment on
local development servers, file-backed previews, and public pages that don’t
require sign-in while you iterate on a web app.
The in-app browser doesn’t support authentication flows, signed-in pages, your
regular browser profile, cookies, extensions, or existing tabs.
Use browser comments to mark specific elements or areas on a page, then ask
Codex to address that feedback.
When you want Codex to operate the page directly, use
browser use for local development servers and
file-backed pages. You can manage the Browser plugin, allowed websites, and
blocked websites from settings.
Computer use helps Codex operate a macOS or Windows
app by seeing, clicking, and typing. This is useful for testing desktop apps,
checking browser or simulator flows, working with data sources that aren’t
available as plugins, changing app settings, and reproducing GUI-only bugs.
Because computer use can affect app and system state outside your project
workspace, keep tasks narrow and review permission prompts before continuing.
Work with non-code artifacts
When a task produces non-code artifacts, the sidebar can preview PDF files,
spreadsheets, documents, and presentations. Give Codex the source data, expected
file type, structure, and review criteria you care about.
For spreadsheets and presentations, describe the sheets, columns, charts, slide
sections, and checks that matter. Ask Codex to explain where it saved the output
and how it checked the result.
Use the task sidebar to follow what Codex is doing while a thread runs. It can
surface the agent’s plan, sources, generated artifacts, and task summary so you
can steer the work, inspect generated files, and decide what needs another pass.
Sync with the IDE extension
If you have the Codex IDE Extension installed in your editor,
your Codex app and IDE Extension automatically sync when both are in the same
When they sync, you see an IDE context option in the Codex app composer. With “Auto context”
enabled, the Codex app tracks the files you’re viewing, so you can reference them indirectly (for
example, “What’s this file about?”). You can also see threads running in the Codex app inside the
IDE Extension, and vice versa.
If you’re unsure whether the app includes context, toggle it off and ask the
same question again to compare results.
Thread automations
Automations can also attach to a single thread. These thread automations are
recurring wake-up calls that preserve the thread’s context so Codex can check
on long-running work, poll a source for new information, or continue a follow-up
loop. Use them for heartbeat-style automations that should keep returning to the
same conversation on a schedule.
Use a thread automation when the next run depends on the current conversation.
Use a standalone or project automation when you want
Codex to start a fresh recurring task for one or more projects.
Approvals and sandboxing
Your approval and sandbox settings constrain Codex actions.
Approvals determine when Codex pauses for permission before running a command.
The sandbox controls which directories and network access Codex can use.
When you see prompts like “approve once” or “approve for this session,” you are
granting different scopes of permission for tool execution. If you are unsure,
approve the narrowest option and continue iterating.
By default, Codex scopes work to the current project. In most cases, that’s the
right constraint.
If your task requires work across more than one repository or directory, prefer
opening separate projects or using worktrees rather than asking Codex to roam
outside the project root.
If automatic review
is available in your workspace, you can choose it from the permissions selector.
It keeps the same sandbox boundary but routes eligible approval requests through
the configured review policy instead of waiting for you.
For a high-level overview, see sandboxing . For
configuration details, see the
agent approvals & security documentation .
MCP support
The Codex app, CLI, and IDE Extension share Model Context Protocol (MCP) settings.
If you’ve already configured MCP servers in one, they’re automatically adopted by the others. To
configure new servers, open the MCP section in the app’s settings and either enable a recommended
server or add a new server to your configuration.
Codex ships with a first-party web search tool. For local tasks in the Codex app, Codex
enables web search by default and serves results from a web search cache. If you configure your
sandbox for full access , web search defaults to live results. See
Config basics to disable web search or switch to live results that fetch the
most recent data.
Ask Codex to generate or edit images directly in a thread. This is useful for UI assets, banners, backgrounds, illustrations, sprite sheets, and placeholders you want to create alongside code. Add a reference image when you want Codex to transform or extend an existing asset.
You can ask in natural language or explicitly invoke the image generation skill by including $imagegen in your prompt.
Built-in image generation uses gpt-image-2 , counts toward your general Codex usage limits, and uses included limits 3-5x faster on average than similar turns without image generation, depending on image quality and size. For details, see Pricing . For prompting tips and model details, see the image generation guide .
For larger batches of image generation, set OPENAI_API_KEY in your environment variables and ask Codex to generate images through the API so API pricing applies instead.
Image input
You can drag and drop images into the prompt composer to include them as context. Hold down Shift
while dropping an image to add the image to the context.
You can also ask Codex to view images on your system. By giving Codex tools to take screenshots of
the app you are working on, Codex can verify the work it’s doing.
Chats
Chats are threads you can start when the task doesn’t need a specific project
folder or Git repository. Use them for research, triage, planning,
plugin-heavy workflows, and other conversations where Codex should use connected
tools instead of editing a codebase.
Chats use a Codex-managed threads directory under your Codex home as their
working location. By default, that location is ~/.codex/threads .
Memories , where available, let Codex carry useful context
from past tasks into future threads. They’re most useful for stable preferences,
project conventions, recurring work patterns, and known pitfalls that would
otherwise need to repeat.
Notifications
By default, the Codex app sends notifications when a task completes or needs approval while the app
is in the background.
In the Codex app settings, you can choose to never send notifications or always send them, even
when the app is in focus.
Keep your computer awake
Since your tasks might take a while to complete, you can have the Codex app prevent your computer
from going to sleep by enabling the “Prevent sleep while running” toggle in the app’s settings.
See also
Review pane
Local environments
Ask AI
Loading docs agent...
