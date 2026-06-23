# Windows – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/windows
- Final URL: https://developers.openai.com/codex/windows
- Canonical URL: https://developers.openai.com/codex/windows
- Fetched at: 2026-06-23T14:13:03Z
- Content type: text/html; charset=utf-8

## Description

Tips for running Codex on Windows

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
Use Codex on Windows with the native Codex app , the
CLI , or the IDE extension .
The Codex app on Windows supports core workflows such as parallel agent threads,
worktrees, automations, Git functionality, the in-app browser, artifact previews,
plugins, and skills.
Use the Codex app on Windows
Work across projects, run parallel agent threads, and review results in one place with the native Windows app.
Depending on the surface and your setup, Codex can run on Windows in three
practical ways:
natively on Windows with the stronger elevated sandbox,
natively on Windows with the fallback unelevated sandbox,
or inside Windows Subsystem for Linux 2 (WSL2), which uses the Linux sandbox implementation.
Windows sandbox
When you run Codex natively on Windows, agent mode uses a Windows sandbox to
block filesystem writes outside the working folder and prevent network access
without your explicit approval.
Native Windows sandbox support includes two modes that you can configure in
config.toml :
[ windows ] sandbox = "elevated" # or "unelevated"
elevated is the preferred native Windows sandbox. It uses dedicated
lower-privilege sandbox users, filesystem permission boundaries, firewall
rules, and local policy changes needed for commands that run in the sandbox.
unelevated is the fallback native Windows sandbox. It runs commands with a
restricted Windows token derived from your current user, applies ACL-based
filesystem boundaries, and uses environment-level offline controls instead of
the dedicated offline-user firewall rule. It’s weaker than elevated , but it
is still useful when administrator-approved setup is blocked by local or
enterprise policy.
If both modes are available, use elevated . If the default native sandbox
doesn’t work in your environment, use unelevated as a fallback while you
troubleshoot the setup.
Enterprise administrators can constrain which native sandbox implementations
Codex can use through requirements.toml :
[ windows ] allowed_sandbox_implementations = [ "elevated" ]
This example requires the elevated sandbox and prevents users from falling
back to unelevated . To permit either implementation, include both values;
Codex prefers elevated when no mode is selected. See the
requirements.toml reference for
the supported values.
By default, both sandbox modes also use a private desktop for stronger UI
isolation. Set windows.sandbox_private_desktop = false only if you need the
older Winsta0\\Default behavior for compatibility.
Sandbox permissions
Running Codex in full access mode means Codex is not limited to your project
directory and might perform unintentional destructive actions that can lead to
data loss. For safer automation, keep sandbox boundaries in place and use
rules for specific exceptions, or set your approval policy to
never to have
Codex attempt to solve problems without asking for escalated permissions,
based on your approval and security setup .
Windows version matrix
Windows version Support level Notes Windows 11 Recommended Best baseline for Codex on Windows. Use this if you are standardizing an enterprise deployment. Recent, fully updated Windows 10 Best effort Can work, but is less reliable than Windows 11. For Windows 10, Codex depends on modern console support, including ConPTY. In practice, Windows 10 version 1809 or newer is required. Older Windows 10 builds Not recommended More likely to miss required console components such as ConPTY and more likely to fail in enterprise setups.
Additional environment assumptions:
winget should be available. If it’s missing, update Windows or install
the Windows Package Manager before setting up Codex.
The recommended native sandbox depends on administrator-approved setup.
Some enterprise-managed devices block the required setup steps even when the
OS version itself is acceptable.
Grant sandbox read access
When a command fails because the Windows sandbox can’t read a directory, use:
/sandbox-add-read-dir C:\absolute\directory\path
The path must be an existing absolute directory. After the command succeeds, later commands that run in the sandbox can read that directory during the current session.
Use the native Windows sandbox by default. The native Windows sandbox offers the best performance and highest speeds while keeping the same security. Choose WSL2 when you
need a Linux-native environment on Windows, when your workflow already lives in
WSL2, or when neither native Windows sandbox mode meets your needs.
Windows Subsystem for Linux
If you choose WSL2, Codex runs inside the Linux environment instead of using the
native Windows sandbox. This is useful if you need Linux-native tooling on
Windows, if your repositories and developer workflow already live in WSL2, or
if neither native Windows sandbox mode works for your environment.
WSL1 was supported through Codex 0.114 . Starting in Codex 0.115 , the Linux
sandbox moved to bubblewrap , so WSL1 is no longer supported.
Launch VS Code from inside WSL
For step-by-step instructions, see the official VS Code WSL tutorial .
Prerequisites
Windows with WSL installed. To install WSL, open PowerShell as an administrator, then run wsl --install (Ubuntu is a common choice).
VS Code with the WSL extension installed.
Open VS Code from a WSL terminal # From your WSL shell cd ~/code/your-project code .
This opens a WSL remote window, installs the VS Code Server if needed, and ensures integrated terminals run in Linux.
Confirm you’re connected to WSL
Look for the green status bar that shows WSL: <distro> .
Integrated terminals should display Linux paths (such as /home/... ) instead of C:\ .
You can verify with:
echo $WSL_DISTRO_NAME
This prints your distribution name.
If you don’t see “WSL: …” in the status bar, press Ctrl+Shift+P , pick
WSL: Reopen Folder in WSL , and keep your repository under /home/... (not
C:\ ) for best performance.
If the Windows app or project picker does not show your WSL repository, type
\wsl$ into the file picker or Explorer, then navigate to your
distro’s home directory.
Use Codex CLI with WSL
Run these commands from an elevated PowerShell or Windows Terminal:
# Install default Linux distribution (like Ubuntu) wsl -- install # Start a shell inside Windows Subsystem for Linux wsl
Then run these commands from your WSL shell:
# Install and run Codex in WSL curl -fsSL https://chatgpt.com/codex/install.sh | sh codex
Working on code inside WSL
Working in Windows-mounted paths like /mnt/c/… can be slower than working in Windows-native paths. Keep your repositories under your Linux home directory (like ~/code/my-app ) for faster I/O and fewer symlink and permission issues:
mkdir -p ~/code && cd ~/code git clone https://github.com/your/repo.git cd repo
If you need Windows access to files, they’re under \wsl$\Ubuntu\home<user> in Explorer.
Troubleshooting and FAQ
If you are troubleshooting a managed Windows machine, start with the native
sandbox mode, Windows version, and any policy error shown by Codex. Most native
Windows support issues come from sandbox setup, logon rights, or filesystem
permissions rather than from the editor itself.
My native sandbox setup failed
If Codex cannot complete the elevated sandbox setup, the most common causes
are:
the Windows UAC or administrator prompt was declined,
the machine does not allow local user or group creation,
the machine does not allow firewall rule changes,
the machine blocks the logon rights needed by the sandbox users,
or another enterprise policy blocks part of the setup flow.
What to try:
Try the elevated sandbox setup again and approve the administrator prompt
if your environment allows it.
If your company laptop blocks this, ask your IT team whether the machine
allows administrator-approved setup for local user/group creation, firewall
configuration, and the required sandbox-user logon rights.
If the default setup still fails, use the unelevated sandbox so you can
continue working while the issue is investigated.
Codex switched me to the unelevated sandbox
This means Codex could not finish the stronger elevated sandbox setup on your
machine.
Codex can still run in a sandboxed mode.
It still applies ACL-based filesystem boundaries, but it does not use the
separate sandbox-user boundary from elevated and has weaker network
isolation.
This is a useful fallback, but not the preferred long-term enterprise
configuration.
If you are on a managed enterprise laptop, the best long-term fix is usually to
get the elevated sandbox working with help from your IT team.
I see Windows error 1385
If sandboxed commands fail with error 1385 , Windows is denying the logon type
the sandbox user needs in order to start the command.
In practice, this usually means Codex created the sandbox users successfully,
but Windows policy is still preventing those users from launching sandboxed
commands.
What to do:
Ask your IT team whether the device policy grants the required logon rights
to the Codex-created sandbox users.
Compare group policy or OU differences if the issue affects only some
machines or teams.
If you need to keep working immediately, use the unelevated sandbox while
the policy issue is investigated.
Send CODEX_HOME/.sandbox/sandbox.log along with your Windows version and a
short description of the failure.
Codex warns that some folders are writable by Everyone
Codex may warn that some folders are writable by Everyone .
If you see this warning, Windows permissions on those folders are too broad for
the sandbox to fully protect them.
Review the folders Codex lists in the warning.
Remove Everyone write access from those folders if that is appropriate in
your environment.
Restart Codex or re-run the sandbox setup after those permissions are
corrected.
If you are not sure how to change those permissions, ask your IT team for help.
Sandboxed commands cannot reach the network
Some Codex tasks are intentionally run without outbound network access,
depending on the permissions mode in use.
If a task fails because it cannot reach the network:
Check whether the task was supposed to run with network disabled.
If you expected network access, restart Codex and try again.
If the issue keeps happening, collect the sandbox log so the team can check
whether the machine is in a partial or broken sandbox state.
Sandboxing worked before and then stopped
This can happen after:
moving a repo or workspace,
changing machine permissions,
changing Windows policies,
or other system configuration changes.
Restart Codex.
Try the elevated sandbox setup again.
If that does not fix it, use the unelevated sandbox as a temporary
fallback.
Collect the sandbox log for review.
I need to send diagnostics to OpenAI
If you still have problems, send:
CODEX_HOME/.sandbox/sandbox.log
It is also helpful to include:
a short description of what you were trying to do,
whether the elevated sandbox failed or the unelevated sandbox was used,
any error message shown in the app,
whether you saw 1385 or another Windows or PowerShell error,
and whether you are on Windows 11 or Windows 10.
Do not send:
the contents of CODEX_HOME/.sandbox-secrets/
The IDE extension is installed but unresponsive
Your system may be missing C++ development tools, which some native dependencies require:
Visual Studio Build Tools (C++ workload)
Microsoft Visual C++ Redistributable (x64)
With winget , run winget install --id Microsoft.VisualStudio.2022.BuildTools -e
Then fully restart VS Code after installation.
Large repositories feel slow in WSL
Make sure you’re not working under /mnt/c . Move the repository to WSL (for example, ~/code/… ).
Increase memory and CPU for WSL if needed; update WSL to the latest version:
wsl -- update wsl -- shutdown
VS Code in WSL cannot find codex
Verify the binary exists and is on PATH inside WSL:
which codex || echo "codex not found"
If the binary isn’t found, install it by following the instructions above.
Ask AI
Loading docs agent...
