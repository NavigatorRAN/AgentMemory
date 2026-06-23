# Rules – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/rules
- Final URL: https://developers.openai.com/codex/rules
- Canonical URL: https://developers.openai.com/codex/rules
- Fetched at: 2026-06-23T14:12:53Z
- Content type: text/html; charset=utf-8

## Description

Control which commands Codex can run outside the sandbox

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
Use rules to control which commands Codex can run outside the sandbox.
Rules are experimental and may change.
Create a rules file
Create a .rules file under a rules/ folder next to an active config layer (for example, ~/.codex/rules/default.rules ).
Add a rule. This example prompts before allowing gh pr view to run outside the sandbox.
# Prompt before running commands with the prefix `gh pr view` outside the sandbox. prefix_rule( # The prefix to match. pattern = [ "gh" , "pr" , "view" ], # The action to take when Codex requests to run a matching command. decision = "prompt" , # Optional rationale for why this rule exists. justification = "Viewing PRs is allowed with approval" , # `match` and `not_match` are optional "inline unit tests" where you can # provide examples of commands that should (or should not) match this rule. match = [ "gh pr view 7888" , "gh pr view --repo openai/codex" , "gh pr view 7888 --json title,body,comments" , ], not_match = [ # Does not match because the `pattern` must be an exact prefix. "gh pr --repo openai/codex view 7888" , ], )
Restart Codex.
Codex scans rules/ under every active config layer at startup, including Team Config locations and the user layer at ~/.codex/rules/ . Project-local rules under <repo>/.codex/rules/ load only when the project .codex/ layer is trusted.
When you add a command to the allow list in the TUI, Codex writes to the user layer at ~/.codex/rules/default.rules so future runs can skip the prompt.
When Smart approvals are enabled (the default), Codex may propose a
prefix_rule for you during escalation requests. Review the suggested prefix
carefully before accepting it.
Admins can also enforce restrictive prefix_rule entries from
requirements.toml .
Understand rule fields
prefix_rule() supports these fields:
pattern (required) : A non-empty list that defines the command prefix to match. Each element is either:
A literal string (for example, "pr" ).
A union of literals (for example, ["view", "list"] ) to match alternatives at that argument position.
decision (defaults to "allow" ) : The action to take when the rule matches. Codex applies the most restrictive decision when more than one rule matches ( forbidden > prompt > allow ).
allow : Run the command outside the sandbox without prompting.
prompt : Prompt before each matching invocation.
forbidden : Block the request without prompting.
justification (optional) : A non-empty, human-readable reason for the rule. Codex may surface it in approval prompts or rejection messages. When you use forbidden , include a recommended alternative in the justification when appropriate (for example, "Use \ rg` instead of `grep`.”`).
match and not_match (defaults to [] ) : Examples that Codex validates when it loads your rules. Use these to catch mistakes before a rule takes effect.
When Codex considers a command to run, it compares the command’s argument list to pattern . Internally, Codex treats the command as a list of arguments (like what execvp(3) receives).
Shell wrappers and compound commands
Some tools wrap several shell commands into a single invocation, for example:
["bash", "-lc", "git add . && rm -rf /"]
Because this kind of command can hide multiple actions inside one string, Codex treats bash -lc , bash -c , and their zsh / sh equivalents specially.
When Codex can safely split the script
If the shell script is a linear chain of commands made only of:
plain words (no variable expansion, no VAR=... , $FOO , * , etc.)
joined by safe operators ( && , || , ; , or | )
then Codex parses it (using tree-sitter) and splits it into individual commands before applying your rules.
The script above is treated as two separate commands:
["git", "add", "."]
["rm", "-rf", "/"]
Codex then evaluates each command against your rules, and the most restrictive result wins.
Even if you allow pattern=["git", "add"] , Codex won’t auto allow git add . && rm -rf / , because the rm -rf / portion is evaluated separately and prevents the whole invocation from being auto allowed.
This prevents dangerous commands from being smuggled in alongside safe ones.
When Codex does not split the script
If the script uses more advanced shell features, such as:
redirection ( > , >> , < )
substitutions ( $(...) , ... )
environment variables ( FOO=bar )
wildcard patterns ( * , ? )
control flow ( if , for , && with assignments, etc.)
then Codex doesn’t try to interpret or split it.
In those cases, the entire invocation is treated as:
["bash", "-lc", "<full script>"]
and your rules are applied to that single invocation.
With this handling, you get the security of per-command evaluation when it’s safe to do so, and conservative behavior when it isn’t.
Test a rule file
Use codex execpolicy check to test how your rules apply to a command:
codex execpolicy check --pretty \ --rules ~/.codex/rules/default.rules \ -- gh pr view 7888 --json title,body,comments
The command emits JSON showing the strictest decision and any matching rules, including any justification values from matched rules. Use more than one --rules flag to combine files, and add --pretty to format the output.
Understand the rules language
The .rules file format uses Starlark (see the language spec ). Its syntax is like Python, but it’s designed to be safe to run: the rules engine can run it without side effects (for example, touching the filesystem).
Ask AI
Loading docs agent...
