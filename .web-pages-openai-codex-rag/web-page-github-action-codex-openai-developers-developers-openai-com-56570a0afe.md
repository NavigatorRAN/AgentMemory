# GitHub Action – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/github-action
- Final URL: https://developers.openai.com/codex/github-action
- Canonical URL: https://developers.openai.com/codex/github-action
- Fetched at: 2026-06-23T14:12:22Z
- Content type: text/html; charset=utf-8

## Description

Trigger Codex actions from GitHub Events

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
Use the Codex GitHub Action ( openai/codex-action@v1 ) to run Codex in CI/CD jobs, apply patches, or post reviews from a GitHub Actions workflow.
The action installs the Codex CLI, starts the Responses API proxy when you provide an API key, and runs codex exec under the permissions you specify.
Reach for the action when you want to:
Automate Codex feedback on pull requests or releases without managing the CLI yourself.
Gate changes on Codex-driven quality checks as part of your CI pipeline.
Run repeatable Codex tasks (code review, release prep, migrations) from a workflow file.
For a CI example, see Non-interactive mode and explore the source in the openai/codex-action repository .
Prerequisites
Store your OpenAI key as a GitHub secret (for example OPENAI_API_KEY ) and reference it in the workflow.
Run the job on a Linux or macOS runner. For Windows, set safety-strategy: unsafe .
Check out your code before invoking the action so Codex can read the repository contents.
Decide which prompts you want to run. You can provide inline text via prompt or point to a file committed in the repo with prompt-file .
Example workflow
The sample workflow below reviews new pull requests, captures Codex’s response, and posts it back on the PR.
name : Codex pull request review on : pull_request : types : [ opened , synchronize , reopened ] jobs : codex : runs-on : ubuntu-latest permissions : contents : read outputs : final_message : ${{ steps.run_codex.outputs.final-message }} steps : - uses : actions/checkout@v5 with : ref : refs/pull/${{ github.event.pull_request.number }}/merge persist-credentials : false - name : Pre-fetch base and head refs env : PR_BASE_REF : ${{ github.event.pull_request.base.ref }} PR_NUMBER : ${{ github.event.pull_request.number }} run : | git fetch --no-tags origin \ "$PR_BASE_REF" \ "+refs/pull/$PR_NUMBER/head" - name : Run Codex id : run_codex uses : openai/codex-action@v1 with : openai-api-key : ${{ secrets.OPENAI_API_KEY }} prompt-file : .github/codex/prompts/review.md output-file : codex-output.md post_feedback : runs-on : ubuntu-latest needs : codex if : needs.codex.outputs.final_message != '' permissions : issues : write pull-requests : write steps : - name : Post Codex feedback uses : actions/github-script@v7 with : github-token : ${{ github.token }} script : | await github.rest.issues.createComment({ owner: context.repo.owner, repo: context.repo.repo, issue_number: context.payload.pull_request.number, body: process.env.CODEX_FINAL_MESSAGE, }); env : CODEX_FINAL_MESSAGE : ${{ needs.codex.outputs.final_message }}
Replace .github/codex/prompts/review.md with your own prompt file or use the prompt input for inline text. The example also writes the final Codex message to codex-output.md for later inspection or artifact upload.
Configure codex exec
Fine-tune how Codex runs by setting the action inputs that map to codex exec options:
prompt or prompt-file (choose one): Inline instructions or a repository path to Markdown or text with your task. Consider storing prompts in .github/codex/prompts/ .
codex-args : Extra CLI flags. Provide a JSON array (for example ["--ephemeral"] ) or a shell string ( --profile ci ) to configure sessions, profiles, or MCP settings.
model and effort : Pick the Codex agent configuration you want; leave empty for defaults.
sandbox : Match the sandbox mode ( workspace-write , read-only , danger-full-access ) to the permissions Codex needs during the run.
output-file : Save the final Codex message to disk so later steps can upload or diff it.
codex-version : Pin a specific CLI release. Leave blank to use the latest published version.
codex-home : Point to a shared Codex home directory if you want to reuse configuration files or MCP setups across steps.
Manage privileges
Codex has broad access on GitHub-hosted runners unless you restrict it. Use these inputs to control exposure:
safety-strategy (default drop-sudo ) removes sudo before running Codex. This is irreversible for the job and protects secrets in memory. On Windows you must set safety-strategy: unsafe .
unprivileged-user pairs safety-strategy: unprivileged-user with codex-user to run Codex as a specific account. Ensure the user can read and write the repository checkout (see the unprivileged-user example for an ownership fix).
read-only keeps Codex from changing files or using the network, but it still runs with elevated privileges. Don’t rely on read-only alone to protect secrets.
sandbox limits filesystem and network access within Codex itself. Choose the narrowest option that still lets the task complete.
allow-users and allow-bots restrict who can trigger the workflow. By default only users with write access can run the action; list extra trusted accounts explicitly or leave the field empty for the default behavior.
Capture outputs
The action emits the last Codex message through the final-message output. Map it to a job output (as shown above) or handle it directly in later steps. Combine output-file with the uploaded artifacts feature if you prefer to collect the full transcript from the runner. When you need structured data, pass --output-schema through codex-args to enforce a JSON shape.
Security checklist
Limit who can start the workflow. Prefer trusted events or explicit approvals instead of allowing everyone to run Codex against your repository.
Sanitize prompt inputs from pull requests, commit messages, or issue bodies to avoid prompt injection. Review HTML comments or hidden text before feeding it to Codex.
Protect your OPENAI_API_KEY by keeping safety-strategy on drop-sudo or moving Codex to an unprivileged user. Never leave the action in unsafe mode on multi-tenant runners.
Run Codex as the last step in a job so later steps don’t inherit any unexpected state changes.
Rotate keys immediately if you suspect the proxy logs or action output exposed secret material.
You set both prompt and prompt-file : Remove the duplicate input so you provide exactly one source.
responses-api-proxy didn’t write server info : Confirm the API key is present and valid; the proxy starts only when you provide openai-api-key .
Expected sudo removal, but sudo succeeded : Ensure no earlier step restored sudo and that the runner OS is Linux or macOS. Re-run with a fresh job.
Permission errors after drop-sudo : Grant write access before the action runs (for example with chmod -R g+rwX "$GITHUB_WORKSPACE" or by using the unprivileged-user pattern).
Unauthorized trigger blocked : Adjust allow-users or allow-bots inputs if you need to permit service accounts beyond the default write collaborators.
Ask AI
Loading docs agent...
