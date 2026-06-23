# Workflows – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/workflows
- Final URL: https://developers.openai.com/codex/workflows
- Canonical URL: https://developers.openai.com/codex/workflows
- Fetched at: 2026-06-23T14:13:04Z
- Content type: text/html; charset=utf-8

## Description

Development usage patterns with Codex

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
Codex works best when you treat it like a teammate with explicit context and a clear definition of “done.”
This page gives end-to-end workflow examples for the Codex IDE extension, the Codex CLI, and Codex cloud.
If you are new to Codex, read Prompting first, then come back here for concrete recipes.
How to read these examples
Each workflow includes:
When to use it and which Codex surface fits best (IDE, CLI, or cloud).
Steps with example user prompts.
Context notes : what Codex automatically sees vs what you should attach.
Verification : how to check the output.
Note: The IDE extension automatically includes your open files as context. In the CLI, you usually need to mention paths explicitly (or attach files with /mention and @ path autocomplete).
Explain a codebase
Use this when you are onboarding, inheriting a service, or trying to reason about a protocol, data model, or request flow.
IDE extension workflow (fastest for local exploration)
Open the most relevant files.
Select the code you care about (optional but recommended).
Prompt Codex:
Explain how the request flows through the selected code. Include: - a short summary of the responsibilities of each module involved - what data is validated and where - one or two "gotchas" to watch for when changing this
Verification:
Ask for a diagram or checklist you can validate quickly:
Summarize the request flow as a numbered list of steps. Then list the files involved.
CLI workflow (good when you want a transcript + shell commands)
Start an interactive session:
codex
Attach the files (optional) and prompt:
I need to understand the protocol used by this service. Read @foo.ts @schema.ts and explain the schema and request/response flow. Focus on required vs optional fields and backward compatibility rules.
Context notes:
You can use @ in the composer to insert file paths from the workspace, or /mention to attach a specific file.
Fix a bug
Use this when you have a failing behavior you can reproduce locally.
CLI workflow (tight loop with reproduction and verification)
Start Codex at the repo root:
Give Codex a reproduction recipe, plus the file(s) you suspect:
Bug: Clicking "Save" on the settings screen sometimes shows "Saved" but doesn't persist the change. Repro: 1) Start the app: npm run dev 2) Go to /settings 3) Toggle "Enable alerts" 4) Click Save 5) Refresh the page: the toggle resets Constraints: - Do not change the API shape. - Keep the fix minimal and add a regression test if feasible. Start by reproducing the bug locally, then propose a patch and run checks.
Supplied by you: the repro steps and constraints (these matter more than a high-level description).
Supplied by Codex: command output, discovered call sites, and any stack traces it triggers.
Codex should re-run the repro steps after the fix.
If you have a standard check pipeline, ask it to run it:
After the fix, run lint + the smallest relevant test suite. Report the commands and results.
IDE extension workflow
Open the file where you think the bug lives, plus its nearest caller.
Find the bug causing "Saved" to show without persisting changes. After proposing the fix, tell me how to verify it in the UI.
Write a test
Use this when you want to be very explicit about the scope you want tested.
IDE extension workflow (selection-based)
Open the file with the function.
Select the lines that define the function. Choose “Add to Codex Thread” from command palette to add these lines to the context.
Write a unit test for this function. Follow conventions used in other tests.
Supplied by “Add to Codex Thread” command: the selected lines (this is the “line number” scope), plus open files.
CLI workflow (path + line range described in prompt)
Start Codex:
Prompt with a function name:
Add a test for the invert_list function in @transform.ts. Cover the happy path plus edge cases.
Prototype from a screenshot
Use this when you have a design mock, screenshot, or UI reference and you want a working prototype quickly.
CLI workflow (image + prompt)
Save your screenshot locally (for example ./specs/ui.png ).
Run Codex:
Drag the image file into the terminal to attach it to the prompt.
Follow up with constraints and structure:
Create a new dashboard based on this image. Constraints: - Use react, vite, and tailwind. Write the code in typescript. - Match spacing, typography, and layout as closely as possible. Deliverables: - A new route/page that renders the UI - Any small components needed - README.md with instructions to run it locally
The image provides visual requirements, but you still need to specify the implementation constraints (framework, routing, component style).
For best results, include any non-obvious behavior in text (hover states, validation rules, keyboard interactions).
Ask Codex to run the dev server (if allowed) and tell you exactly where to look:
Start the dev server and tell me the local URL/route to view the prototype.
IDE extension workflow (image + existing files)
Attach the image in the Codex chat (drag-and-drop or paste).
Create a new settings page. Use the attached screenshot as the target UI. Follow design and visual patterns from other files in this project.
Iterate on UI with live updates
Use this when you want a tight “design → tweak → refresh → tweak” loop while Codex edits code.
CLI workflow (run Vite, then iterate with small prompts)
Start the dev server in a separate terminal window:
npm run dev
Prompt Codex to make changes:
Propose 2-3 styling improvements for the landing page.
Pick a direction and iterate with small, specific prompts:
Go with option 2. Change only the header: - make the typography more editorial - increase whitespace - ensure it still looks good on mobile
Repeat with focused requests:
Next iteration: reduce visual noise. Keep the layout, but simplify colors and remove any redundant borders.
Review changes in the browser “live” as the code is updated.
Commit changes that you like and revert those that you don’t.
If you revert or modify a change, tell Codex so it doesn’t overwrite the change when it works on the next prompt.
Delegate refactor to the cloud
Use this when you want to design carefully (local context, quick inspection), then outsource the long implementation to a cloud task that can run in parallel.
Local planning (IDE)
Make sure your current work is committed or at least stashed so you can compare changes cleanly.
Ask Codex to produce a refactor plan. If you have the $plan skill available, invoke it explicitly:
$plan We need to refactor the auth subsystem to: - split responsibilities (token parsing vs session loading vs permissions) - reduce circular imports - improve testability Constraints: - No user-visible behavior changes - Keep public APIs stable - Include a step-by-step migration plan
Review the plan and negotiate changes:
Revise the plan to: - specify exactly which files move in each milestone - include a rollback strategy
Planning works best when Codex can scan the current code locally (entrypoints, module boundaries, dependency graph hints).
Cloud delegation (IDE → Cloud)
If you haven’t already done so, set up a Codex cloud environment .
Click on the cloud icon beneath the prompt composer and select your cloud environment.
When you enter the next prompt, Codex creates a new thread in the cloud that carries over the existing thread context (including the plan and any local source changes).
Implement Milestone 1 from the plan.
Review the cloud diff, iterate if needed.
Create a PR directly from the cloud or pull changes locally to test and finish up.
Iterate on additional milestones of the plan.
Do a local code review
Use this when you want a second set of eyes before committing or creating a PR.
CLI workflow (review your working tree)
Run the review command:
/review
Optional: provide custom focus instructions:
/review Focus on edge cases and security issues
Apply fixes based on review feedback, then rerun /review to confirm issues are resolved.
Review a GitHub pull request
Use this when you want review feedback without pulling the branch locally.
Before you can use this, enable Codex Code review on your repository. See Code review .
GitHub workflow (comment-driven)
Open the pull request on GitHub.
Leave a comment that tags Codex with explicit focus areas:
@codex review
Optional: Provide more explicit instructions.
@codex review for security vulnerabilities and security concerns
Update documentation
Use this when you need a doc change that is accurate and clear.
IDE or CLI workflow (local edits + local validation)
Identify the doc file(s) to change and open them (IDE) or @ mention them (IDE or CLI).
Prompt Codex with scope and validation requirements:
Update the "advanced features" documentation to provide authentication troubleshooting guidance. Verify that all links are valid.
After Codex drafts the changes, review the documentation and iterate as needed.
Read the rendered page.
Ask AI
Loading docs agent...
