# IDE extension – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/ide
- Final URL: https://developers.openai.com/codex/ide
- Canonical URL: https://developers.openai.com/codex/ide
- Fetched at: 2026-06-23T14:12:28Z
- Content type: text/html; charset=utf-8

## Description

Pair with Codex in your IDE

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
Codex is OpenAI’s coding agent that can read, edit, and run code. It helps you build faster, squash bugs, and understand unfamiliar code. With the Codex VS Code extension, you can use Codex side by side in your IDE or delegate tasks to Codex Cloud.
ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about what’s included .
Extension setup
The Codex IDE extension works with VS Code forks like Cursor and Windsurf.
You can get the Codex extension from the Visual Studio Code Marketplace , or download it for your IDE:
Download for Visual Studio Code
Download for Cursor
Download for Windsurf
Download for Visual Studio Code Insiders
Download for JetBrains IDEs
Codex IDE integrations for VS Code-compatible editors and JetBrains IDEs are
available on macOS, Windows, and Linux. On Windows, run Codex natively with
the Windows sandbox, or use WSL2 when you need a Linux-native environment. For
setup details, see the Windows setup guide .
After you install it, you’ll find Codex in your editor sidebar.
In VS Code, Codex opens in the right sidebar by default.
If you’re using VS Code, restart the editor if you don’t see Codex right away.
If you’re using Cursor, the activity bar displays horizontally by default. Collapsed items can hide Codex, so you can pin it and reorganize the order of the extensions.
JetBrains IDE integration
If you want to use Codex in JetBrains IDEs like Rider, IntelliJ, PyCharm, or WebStorm, install the JetBrains IDE integration. It supports signing in with ChatGPT, an API key, or a JetBrains AI subscription.
Install Codex for JetBrains IDEs
Move Codex to the right sidebar
In VS Code, Codex appears in the right sidebar automatically.
If you prefer it in the primary (left) sidebar, drag the Codex icon back to the left activity bar.
In VS Code forks like Cursor, you may need to move Codex to the right sidebar manually.
To do that, you may need to temporarily change the activity bar orientation first:
Open your editor settings and search for activity bar (in Workbench settings).
Change the orientation to vertical .
Restart your editor.
Now drag the Codex icon to the right sidebar (for example, next to your Cursor chat). Codex appears as another tab in the sidebar.
After you move it, reset the activity bar orientation to horizontal to restore the default behavior.
If you change your mind later, you can drag Codex back to the primary (left) sidebar at any time.
Sign in
After you install the extension, it prompts you to sign in with your ChatGPT account or API key. Your ChatGPT plan includes usage credits, so you can use Codex without extra setup. Learn more on the pricing page .
Update the extension
The extension updates automatically, but you can also open the extension page in your IDE to check for updates.
Set up keyboard shortcuts
Codex includes commands you can bind as keyboard shortcuts in your IDE settings (for example, toggle the Codex chat or add items to the Codex context).
To see all available commands and bind them as keyboard shortcuts, select the settings icon in the Codex chat and select Keyboard shortcuts .
You can also refer to the Codex IDE extension commands page.
For a list of supported slash commands, see Codex IDE extension slash commands .
If you’re new to Codex, read the best practices guide .
Work with the Codex IDE extension
Prompt with editor context
Use open files, selections, and @file references to get more relevant results with shorter prompts.
Switch models
Use the default model or switch to other models to leverage their respective strengths.
Adjust reasoning effort
Choose low , medium , or high to trade off speed and depth based on the task.
Generate or edit images without leaving your editor, and use reference assets when you need iteration.
Choose an approval mode
Switch between Chat , Agent , and Agent (Full Access) depending on how much autonomy you want Codex to have.
Delegate to the cloud
Offload longer jobs to a cloud environment, then monitor progress and review results without leaving your IDE.
Follow up on cloud work
Preview cloud changes, ask for follow-ups, and apply the resulting diffs locally to test and finish.
IDE extension commands
Browse the full list of commands you can run from the command palette and bind to keyboard shortcuts.
Use slash commands to control how Codex behaves and quickly change common settings from chat.
Extension settings
Tune Codex to your workflow with editor settings for models, approvals, and other defaults.
Ask AI
Loading docs agent...
