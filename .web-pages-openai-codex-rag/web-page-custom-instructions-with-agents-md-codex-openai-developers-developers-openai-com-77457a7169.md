# Custom instructions with AGENTS.md – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/guides/agents-md
- Final URL: https://developers.openai.com/codex/guides/agents-md
- Canonical URL: https://developers.openai.com/codex/guides/agents-md
- Fetched at: 2026-06-23T14:12:24Z
- Content type: text/html; charset=utf-8

## Description

Give Codex extra instructions and context for your project

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
Codex reads AGENTS.md files before doing any work. By layering global guidance with project-specific overrides, you can start each task with consistent expectations, no matter which repository you open.
How Codex discovers guidance
Codex builds an instruction chain when it starts (once per run; in the TUI this usually means once per launched session). Discovery follows this precedence order:
Global scope: In your Codex home directory (defaults to ~/.codex , unless you set CODEX_HOME ), Codex reads AGENTS.override.md if it exists. Otherwise, Codex reads AGENTS.md . Codex uses only the first non-empty file at this level.
Project scope: Starting at the project root (typically the Git root), Codex walks down to your current working directory. If Codex cannot find a project root, it only checks the current directory. In each directory along the path, it checks for AGENTS.override.md , then AGENTS.md , then any fallback names in project_doc_fallback_filenames . Codex includes at most one file per directory.
Merge order: Codex concatenates files from the root down, joining them with blank lines. Files closer to your current directory override earlier guidance because they appear later in the combined prompt.
Codex skips empty files and stops adding files once the combined size reaches the limit defined by project_doc_max_bytes (32 KiB by default). For details on these knobs, see Project instructions discovery . Raise the limit or split instructions across nested directories when you hit the cap.
Create global guidance
Create persistent defaults in your Codex home directory so every repository inherits your working agreements.
Ensure the directory exists:
mkdir -p ~/.codex
Create ~/.codex/AGENTS.md with reusable preferences:
# ~/.codex/AGENTS.md ## Working agreements - Always run `npm test` after modifying JavaScript files. - Prefer `pnpm` when installing dependencies. - Ask for confirmation before adding new production dependencies.
Run Codex anywhere to confirm it loads the file:
codex --ask-for-approval never "Summarize the current instructions."
Expected: Codex quotes the items from ~/.codex/AGENTS.md before proposing work.
Use ~/.codex/AGENTS.override.md when you need a temporary global override without deleting the base file. Remove the override to restore the shared guidance.
Layer project instructions
Repository-level files keep Codex aware of project norms while still inheriting your global defaults.
In your repository root, add an AGENTS.md that covers basic setup:
# AGENTS.md ## Repository expectations - Run `npm run lint` before opening a pull request. - Document public utilities in `docs/` when you change behavior.
Add overrides in nested directories when specific teams need different rules. For example, inside services/payments/ create AGENTS.override.md :
# services/payments/AGENTS.override.md ## Payments service rules - Use `make test-payments` instead of `npm test` . - Never rotate API keys without notifying the security channel.
Start Codex from the payments directory:
codex --cd services/payments --ask-for-approval never "List the instruction sources you loaded."
Expected: Codex reports the global file first, the repository root AGENTS.md second, and the payments override last.
Codex stops searching once it reaches your current directory, so place overrides as close to specialized work as possible.
Here is a sample repository after you add a global file and a payments-specific override:
AGENTS.md Repository expectations
services/
payments/
AGENTS.md Ignored because an override exists
AGENTS.override.md Payments service rules
README.md
search/
…
Customize fallback filenames
If your repository already uses a different filename (for example TEAM_GUIDE.md ), add it to the fallback list so Codex treats it like an instructions file.
Edit your Codex configuration:
# ~/.codex/config.toml project_doc_fallback_filenames = [ "TEAM_GUIDE.md" , ".agents.md" ] project_doc_max_bytes = 65536
Restart Codex or run a new command so the updated configuration loads.
Now Codex checks each directory in this order: AGENTS.override.md , AGENTS.md , TEAM_GUIDE.md , .agents.md . Filenames not on this list are ignored for instruction discovery. The larger byte limit allows more combined guidance before truncation.
With the fallback list in place, Codex treats the alternate files as instructions:
TEAM_GUIDE.md Detected via fallback list
.agents.md Fallback file in root
support/
AGENTS.override.md Overrides fallback guidance
playbooks/
Set the CODEX_HOME environment variable when you want a different profile, such as a project-specific automation user:
CODEX_HOME = $( pwd ) /.codex codex exec "List active instruction sources"
Expected: The output lists files relative to the custom .codex directory.
Verify your setup
Run codex --ask-for-approval never "Summarize the current instructions." from a repository root. Codex should echo guidance from global and project files in precedence order.
Use codex --cd subdir --ask-for-approval never "Show which instruction files are active." to confirm nested overrides replace broader rules.
To audit which instruction files Codex loaded, opt into a plaintext TUI log with codex -c log_dir=./.codex-log and check ./.codex-log/codex-tui.log , or inspect the most recent session-*.jsonl file if you enabled session logging.
If instructions look stale, restart Codex in the target directory. Codex rebuilds the instruction chain on every run (and at the start of each TUI session), so there is no cache to clear manually.
Troubleshoot discovery issues
Nothing loads: Verify you are in the intended repository and that codex status reports the workspace root you expect. Ensure instruction files contain content; Codex ignores empty files.
Wrong guidance appears: Look for an AGENTS.override.md higher in the directory tree or under your Codex home. Rename or remove the override to fall back to the regular file.
Codex ignores fallback names: Confirm you listed the names in project_doc_fallback_filenames without typos, then restart Codex so the updated configuration takes effect.
Instructions truncated: Raise project_doc_max_bytes or split large files across nested directories to keep critical guidance intact.
Profile confusion: Run echo $CODEX_HOME before launching Codex. A non-default value points Codex at a different home directory than the one you edited.
Next steps
Visit the official AGENTS.md website for more information.
Review Prompting Codex for conversational patterns that pair well with persistent guidance.
Ask AI
Loading docs agent...
