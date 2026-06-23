# Authentication – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/auth
- Final URL: https://developers.openai.com/codex/auth
- Canonical URL: https://developers.openai.com/codex/auth
- Fetched at: 2026-06-23T14:11:55Z
- Content type: text/html; charset=utf-8

## Description

Sign-in methods for Codex

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
OpenAI authentication
Codex supports two ways to sign in when using OpenAI models:
Sign in with ChatGPT for subscription access
Sign in with an API key for usage-based access
Codex cloud requires signing in with ChatGPT. The Codex CLI and IDE extension support both sign-in methods.
Your sign-in method also determines which admin controls and data-handling policies apply.
With sign in with ChatGPT, Codex usage follows your ChatGPT workspace permissions, RBAC, and ChatGPT Enterprise retention and residency settings
With an API key, usage follows your API organization’s retention and data-sharing settings instead
For the CLI, Sign in with ChatGPT is the default authentication path when no valid session is available.
Sign in with ChatGPT
When you sign in with ChatGPT from the Codex app, CLI, or IDE Extension, Codex opens a browser window for you to complete the login flow. After you sign in, the browser returns an access token to the CLI or IDE extension.
If your environment already provides a ChatGPT access token, the CLI can read
it from stdin:
printenv CODEX_ACCESS_TOKEN | codex login --with-access-token
Sign in with an API key
You can also sign in to the Codex app, CLI, or IDE Extension with an API key. Get your API key from the OpenAI dashboard .
OpenAI bills API key usage through your OpenAI Platform account at standard API rates. See the API pricing page .
API key authentication supports local Codex workflows, but some features that
rely on ChatGPT workspace access or cloud services are limited or unavailable.
Compare support by plan in
Feature availability .
When you sign in with an API key, Codex uses standard API pricing instead of
included ChatGPT plan credits.
We recommend API key authentication for programmatic Codex CLI workflows, such
as CI/CD jobs. Don’t expose Codex execution in untrusted or public environments.
Use Codex access tokens for enterprise automation
In ChatGPT Enterprise workspaces, admins can grant the access token
permission so permitted members can create Codex access tokens for trusted,
non-interactive Codex local workflows. Use an access token when automation
needs ChatGPT workspace access, ChatGPT-managed Codex entitlements, or
enterprise workspace controls without a browser sign-in.
Access tokens are intended for trusted scripts, schedulers, and private CI
runners. For general OpenAI API calls, continue to use Platform API keys.
For setup steps, permissions, rotation, and revocation guidance, see
Access tokens .
Secure your Codex cloud account
Codex cloud interacts directly with your codebase, so it needs stronger security than many other ChatGPT features. Enable multi-factor authentication (MFA).
If you use a social login provider (Google, Microsoft, Apple), you aren’t required to enable MFA on your ChatGPT account, but you can set it up with your social login provider.
For setup instructions, see:
Google
Microsoft
Apple
If you access ChatGPT through single sign-on (SSO), your organization’s SSO administrator should enforce MFA for all users.
If you log in using an email and password, you must set up MFA on your account before accessing Codex cloud.
If your account supports more than one login method and one of them is email and password, you must set up MFA before accessing Codex, even if you sign in another way.
Login caching
When you sign in to the Codex app, CLI, or IDE Extension using either ChatGPT or an API key, Codex caches your login details and reuses them the next time you start the CLI or extension. The CLI and extension share the same cached login details. If you log out from either one, you’ll need to sign in again the next time you start the CLI or extension.
Codex caches login details locally in a plaintext file at ~/.codex/auth.json or in your OS-specific credential store.
For sign in with ChatGPT sessions, Codex refreshes tokens automatically during use before they expire, so active sessions usually continue without requiring another browser login.
Credential storage
Use cli_auth_credentials_store to control where the Codex CLI stores cached credentials:
# file | keyring | auto cli_auth_credentials_store = "keyring"
file stores credentials in auth.json under CODEX_HOME (defaults to ~/.codex ).
keyring stores credentials in your operating system credential store.
auto uses the OS credential store when available, otherwise falls back to auth.json .
If you use file-based storage, treat ~/.codex/auth.json like a password: it
contains access tokens. Don’t commit it, paste it into tickets, or share it in
chat.
Enforce a login method or workspace
In managed environments, admins may restrict how users are allowed to authenticate:
# Only allow ChatGPT login or only allow API key login. forced_login_method = "chatgpt" # or "api" # When using ChatGPT login, restrict users to a specific workspace. forced_chatgpt_workspace_id = "00000000-0000-0000-0000-000000000000"
If the active credentials don’t match the configured restrictions, Codex logs the user out and exits.
These settings are commonly applied via managed configuration rather than per-user setup. See Managed configuration .
Login diagnostics
Direct codex login runs write a dedicated codex-login.log file under
your configured log directory. Use it when you need to debug browser-login or
device-code failures, or when support asks for login-specific logs.
Custom CA bundles
If your network uses a corporate TLS proxy or private root CA, set
CODEX_CA_CERTIFICATE to a PEM bundle before logging in. When
CODEX_CA_CERTIFICATE is unset, Codex falls back to SSL_CERT_FILE . The same
custom CA settings apply to login, normal HTTPS requests, and secure WebSocket
connections.
export CODEX_CA_CERTIFICATE = /path/to/corporate-root-ca.pem codex login
Login on headless devices
If you are signing in to ChatGPT with the Codex CLI, there are some situations where the browser-based login UI may not work:
You’re running the CLI in a remote or headless environment.
Your local networking configuration blocks the localhost callback Codex uses to return the OAuth token to the CLI after you sign in.
In these situations, prefer device code authentication (beta). In the interactive login UI, choose Sign in with Device Code , or run codex login --device-auth directly. If device code authentication doesn’t work in your environment, use one of the fallback methods.
Preferred: Device code authentication (beta)
Enable device code login in your ChatGPT security settings (personal account) or ChatGPT workspace permissions (workspace admin).
In the terminal where you’re running Codex, choose one of these options:
In the interactive login UI, select Sign in with Device Code .
Run codex login --device-auth .
Open the link in your browser, sign in, then enter the one-time code.
If device code login isn’t enabled by the server, Codex falls back to the standard browser-based login flow.
Fallback: Authenticate locally and copy your auth cache
If you can complete the login flow on a machine with a browser, you can copy your cached credentials to the headless machine.
On a machine where you can use the browser-based login flow, run codex login .
Confirm the login cache exists at ~/.codex/auth.json .
Copy ~/.codex/auth.json to ~/.codex/auth.json on the headless machine.
Treat ~/.codex/auth.json like a password: it contains access tokens. Don’t commit it, paste it into tickets, or share it in chat.
If your OS stores credentials in a credential store instead of ~/.codex/auth.json , this method may not apply. See
Credential storage for how to configure file-based storage.
Copy to a remote machine over SSH:
ssh user@remote 'mkdir -p ~/.codex' scp ~/.codex/auth.json user@remote:~/.codex/auth.json
Or use a one-liner that avoids scp :
ssh user@remote 'mkdir -p ~/.codex && cat > ~/.codex/auth.json' < ~/.codex/auth.json
Copy into a Docker container:
# Replace MY_CONTAINER with the name or ID of your container. CONTAINER_HOME = $( docker exec MY_CONTAINER printenv HOME ) docker exec MY_CONTAINER mkdir -p " $CONTAINER_HOME /.codex" docker cp ~/.codex/auth.json MY_CONTAINER:" $CONTAINER_HOME /.codex/auth.json"
For a more advanced version of this same pattern on trusted CI/CD runners, see
Maintain Codex account auth in CI/CD (advanced) .
That guide explains how to let Codex refresh auth.json during normal runs and
then keep the updated file for the next job. API keys are still the recommended
default for automation.
Fallback: Forward the localhost callback over SSH
If you can forward ports between your local machine and the remote host, you can use the standard browser-based flow by tunneling Codex’s local callback server (default localhost:1455 ).
From your local machine, start port forwarding:
ssh -L 1455:localhost:1455 user@remote
In that SSH session, run codex login and follow the printed address on your local machine.
Alternative model providers
When you define a custom model provider in your configuration file, you can choose one of these authentication methods:
OpenAI authentication : Set requires_openai_auth = true to use OpenAI authentication. You can then sign in with ChatGPT or an API key. This is useful when you access OpenAI models through an LLM proxy server. When requires_openai_auth = true , Codex ignores env_key .
Environment variable authentication : Set env_key = "<ENV_VARIABLE_NAME>" to use a provider-specific API key from the local environment variable named <ENV_VARIABLE_NAME> .
No authentication : If you don’t set requires_openai_auth (or set it to false ) and you don’t set env_key , Codex assumes the provider doesn’t require authentication. This is useful for local models.
Ask AI
Loading docs agent...
