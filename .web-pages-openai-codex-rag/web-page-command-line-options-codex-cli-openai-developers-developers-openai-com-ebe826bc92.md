# Command line options – Codex CLI | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/cli/reference
- Final URL: https://developers.openai.com/codex/cli/reference
- Canonical URL: https://developers.openai.com/codex/cli/reference
- Fetched at: 2026-06-23T14:12:01Z
- Content type: text/html; charset=utf-8

## Description

Options and flags for the Codex terminal client

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
How to read this reference
This page catalogs every documented Codex CLI command and flag. Use the interactive tables to search by key or description. Each section indicates whether the option is stable or experimental and calls out risky combinations.
The CLI inherits most defaults from ~/.codex/config.toml . Any
-c key=value overrides you pass at the command line take
precedence for that invocation. See Config
basics for more information.
Global flags
Key Type / Values Details --add-dir path
Grant additional directories write access alongside the main workspace. Repeat for multiple paths.
--ask-for-approval, -a untrusted | on-request | never
Control when Codex pauses for human approval before running a command. on-failure is deprecated; prefer on-request for interactive runs or never for non-interactive runs.
--cd, -C path
Set the working directory for the agent before it starts processing your request.
--config, -c key=value
Override configuration values. Values parse as TOML if possible; otherwise the literal string is used.
--dangerously-bypass-approvals-and-sandbox, --yolo boolean
Run every command without approvals or sandboxing. Only use inside an externally hardened environment.
--dangerously-bypass-hook-trust boolean
Run enabled hooks without requiring persisted hook trust for this invocation. Intended only for automation that already vets hook sources.
--disable feature
Force-disable a feature flag (translates to -c features.<name>=false ). Repeatable.
--enable feature
Force-enable a feature flag (translates to -c features.<name>=true ). Repeatable.
--image, -i path[,path...]
Attach one or more image files to the initial prompt. Separate multiple paths with commas or repeat the flag.
--model, -m string
Override the model set in configuration (for example gpt-5.4 ).
--no-alt-screen boolean
Disable alternate screen mode for the TUI (overrides tui.alternate_screen for this run).
--oss boolean
Use the local open source model provider (equivalent to -c model_provider="oss" ). Validates that Ollama is running.
--profile, -p string
Layer $CODEX_HOME/profile-name.config.toml on top of the base user config.
--remote ws://host:port | wss://host:port | unix:// | unix://PATH
Connect to a remote app-server endpoint over WebSocket or a Unix socket. Supported for codex , codex resume , codex fork , codex archive , codex delete , and codex unarchive ; other subcommands reject remote mode.
--remote-auth-token-env ENV_VAR
Read a bearer token from this environment variable and send it when connecting with --remote . Requires --remote ; tokens are only sent over wss:// URLs or local-only ws:// URLs.
--sandbox, -s read-only | workspace-write | danger-full-access
Select the sandbox policy for model-generated shell commands.
--search boolean
Enable live web search (sets web_search = "live" instead of the default "cached" ).
--strict-config boolean
Error when config.toml contains fields this Codex version does not recognize. Supported by runtime commands such as codex , exec , review , resume , fork , app-server , mcp-server , and exec-server .
PROMPT string
Optional text instruction to start the session. Omit to launch the TUI without a pre-filled message.
Key
--add-dir
Type / Values
path
Details
--ask-for-approval, -a
untrusted | on-request | never
--cd, -C
--config, -c
key=value
--dangerously-bypass-approvals-and-sandbox, --yolo
boolean
--dangerously-bypass-hook-trust
--disable
feature
--enable
--image, -i
path[,path...]
--model, -m
string
--no-alt-screen
--oss
--profile, -p
--remote
ws://host:port | wss://host:port | unix:// | unix://PATH
--remote-auth-token-env
ENV_VAR
--sandbox, -s
read-only | workspace-write | danger-full-access
--search
--strict-config
PROMPT
Expand to view all
These options apply to the base codex command. Most propagate to commands;
see the notes above or the relevant command help for exceptions. For propagated
flags, follow the relevant command help. For example, codex exec --oss ...
applies --oss to exec .
Command overview
The Maturity column uses feature maturity labels such as Experimental, Beta,
and Stable. See Feature Maturity for how to
interpret these labels.
Key Maturity Details codex Stable
Launch the terminal UI. Accepts the global flags above plus an optional prompt or image attachments.
codex app Stable
Launch the Codex desktop app on macOS or Windows. On macOS, Codex can open a workspace path; on Windows, Codex prints the path to open.
codex app-server Experimental
Launch the Codex app server for local development or debugging over stdio, WebSocket, or a Unix socket.
codex apply Stable
Apply the latest diff generated by a Codex Cloud task to your local working tree. Alias: codex a .
codex archive Stable
Archive a saved interactive session by session ID or session name.
codex cloud Experimental
Browse or execute Codex Cloud tasks from the terminal without opening the TUI. Alias: codex cloud-tasks .
codex completion Stable
Generate shell completion scripts for Bash, Zsh, Fish, or PowerShell.
codex debug app-server send-message-v2 Experimental
Debug app-server by sending a single V2 message through the built-in test client.
codex debug models Experimental
Print the raw model catalog Codex sees, including an option to inspect only the bundled catalog.
codex delete Stable
Permanently delete a saved interactive session by session ID or session name.
codex doctor Stable
Generate a diagnostic report for local installation, config, auth, runtime, Git, terminal, app-server, and thread inventory issues.
codex exec Stable
Run Codex non-interactively. Alias: codex e . Stream results to stdout or JSONL and optionally resume previous sessions.
codex execpolicy Experimental
Evaluate execpolicy rule files and see whether a command would be allowed, prompted, or blocked.
codex features Stable
List feature flags and persistently enable or disable them in config.toml .
codex fork Stable
Fork a previous interactive session into a new thread, preserving the original transcript.
codex login Stable
Authenticate Codex using ChatGPT OAuth, device auth, an API key, or an access token piped over stdin.
codex logout Stable
Remove stored authentication credentials.
codex mcp Experimental
Manage Model Context Protocol servers (list, add, remove, authenticate).
codex mcp-server Experimental
Run Codex itself as an MCP server over stdio. Useful when another agent consumes Codex.
codex plugin Experimental
Install, list, and remove plugins from configured marketplace sources.
codex plugin marketplace Experimental
Add, list, upgrade, or remove plugin marketplaces from Git or local sources.
codex remote-control Experimental
Ensure the local app-server daemon is running with remote-control support enabled.
codex resume Stable
Continue a previous interactive session by ID or resume the most recent conversation.
codex sandbox Experimental
Run arbitrary commands inside Codex-provided macOS, Linux, or Windows sandboxes.
codex unarchive Stable
Restore an archived interactive session by session ID or session name.
codex update Stable
Check for and apply a Codex CLI update when the installed release supports self-update.
codex
Maturity
Stable
codex app
codex app-server
Experimental
codex apply
codex archive
codex cloud
codex completion
codex debug app-server send-message-v2
codex debug models
codex delete
codex doctor
codex exec
codex execpolicy
codex features
codex fork
codex login
codex logout
codex mcp
codex mcp-server
codex plugin
codex plugin marketplace
codex remote-control
codex resume
codex sandbox
codex unarchive
codex update
Command details
codex (interactive)
Running codex with no subcommand launches the interactive terminal UI (TUI). The agent accepts the global flags above plus image attachments. Web search defaults to cached mode; use --search to switch to live browsing. For low-friction local work, use --sandbox workspace-write --ask-for-approval on-request .
Use --remote ws://host:port or --remote wss://host:port to connect the TUI to an app server started with codex app-server --listen ws://IP:PORT . For a local Unix socket, use --remote unix:// for the default socket or --remote unix://PATH for an explicit path. Add --remote-auth-token-env <ENV_VAR> when the server requires a bearer token for WebSocket authentication.
Launch the Codex app server locally. This is primarily for development and debugging and may change without notice.
Key Type / Values Details --analytics-default-enabled boolean
Defaults analytics to enabled for first-party app-server clients unless the user opts out in config.
--listen stdio:// | ws://IP:PORT | unix:// | unix://PATH | off
Transport listener URL. Use stdio:// for JSONL, ws://IP:PORT for a TCP WebSocket endpoint, unix:// for the default Unix socket, unix://PATH for a custom Unix socket, or off to disable the local transport.
--stdio boolean
Use stdio transport. Equivalent to --listen stdio:// and mutually exclusive with --listen .
--ws-audience string
Expected aud claim for signed bearer tokens. Requires --ws-auth signed-bearer-token .
--ws-auth capability-token | signed-bearer-token
Authentication mode for app-server WebSocket clients. If omitted, WebSocket auth is disabled; non-local listeners warn during startup.
--ws-issuer string
Expected iss claim for signed bearer tokens. Requires --ws-auth signed-bearer-token .
--ws-max-clock-skew-seconds number
Clock skew allowance when validating signed bearer token exp and nbf claims. Requires --ws-auth signed-bearer-token .
--ws-shared-secret-file absolute path
File containing the HMAC shared secret used to validate signed JWT bearer tokens. Required with --ws-auth signed-bearer-token .
--ws-token-file absolute path
File containing the shared capability token. Use with --ws-auth capability-token unless you provide --ws-token-sha256 instead.
--ws-token-sha256 hexadecimal SHA-256 digest
Expected SHA-256 digest for capability-token authentication. Use instead of --ws-token-file when the client token comes from another source.
--analytics-default-enabled
--listen
stdio:// | ws://IP:PORT | unix:// | unix://PATH | off
--stdio
--ws-audience
--ws-auth
capability-token | signed-bearer-token
--ws-issuer
--ws-max-clock-skew-seconds
number
--ws-shared-secret-file
absolute path
--ws-token-file
--ws-token-sha256
hexadecimal SHA-256 digest
codex app-server --listen stdio:// keeps the default JSONL-over-stdio behavior, and codex app-server --stdio is an alias for that transport. --listen ws://IP:PORT enables WebSocket transport for app-server clients. The server accepts ws:// listen URLs; use TLS termination or a secure proxy when clients connect with wss:// . Use --listen unix:// to accept WebSocket handshakes on Codex’s default Unix socket, or --listen unix:///absolute/path.sock to choose a socket path. If you generate schemas for client bindings, add --experimental to include gated fields and methods.
Ensure the app-server daemon is running with remote-control support enabled.
Managed remote-control clients and SSH remote workflows use this command; it’s
not a replacement for codex app-server --listen when you are building a local
protocol client.
Launch Codex Desktop from the terminal on macOS or Windows. On macOS, Codex can open a specific workspace path; on Windows, Codex prints the path to open.
Key Type / Values Details --download-url url
Advanced override for the Codex desktop installer URL used during install.
PATH path
Workspace path for Codex Desktop. On macOS, Codex opens this path; on Windows, Codex prints the path.
--download-url
url
PATH
codex app opens an installed Codex Desktop app, or starts the installer when
the app is missing. On macOS, Codex opens the provided workspace path; on
Windows, it prints the path to open after installation.
Send one message through app-server’s V2 thread/turn flow using the built-in app-server test client.
Key Type / Values Details USER_MESSAGE string
Message text sent to app-server through the built-in V2 test-client flow.
USER_MESSAGE
This debug flow initializes with experimentalApi: true , starts a thread, sends a turn, and streams server notifications. Use it to reproduce and inspect app-server protocol behavior locally.
Print the raw model catalog Codex sees as JSON.
Key Type / Values Details --bundled boolean
Skip refresh and print only the model catalog bundled with the current Codex binary.
--bundled
Use --bundled when you want to inspect only the catalog bundled with the current binary, without refreshing from the remote models endpoint.
Apply the most recent diff from a Codex cloud task to your local repository. You must authenticate and have access to the task.
Key Type / Values Details TASK_ID string
Identifier of the Codex Cloud task whose diff should be applied.
TASK_ID
Codex prints the patched files and exits non-zero if git apply fails (for example, due to conflicts).
codex archive and codex unarchive
Archive or restore a saved interactive session by session ID or session name.
Use these commands when you want to clean up the session picker without deleting
the transcript. Session IDs take precedence over session names.
codex archive < SESSIO N > codex unarchive < SESSIO N >
Key Type / Values Details --remote ws://host:port | wss://host:port | unix:// | unix://PATH
Connect to a remote app-server endpoint before changing archive state.
Read a bearer token from this environment variable when --remote requires authentication.
SESSION session ID | session name
Saved session to archive or restore. Session IDs take precedence over session names.
SESSION
session ID | session name
Use this only when you want to remove the transcript instead of hiding it from
active session lists.
codex delete < SESSIO N > codex delete < SESSION_UUI D > --force
Key Type / Values Details --force boolean
Delete without prompting. The session argument must be a UUID; names still require interactive confirmation.
Connect to a remote app-server endpoint before deleting the session.
Saved session to delete. Session IDs take precedence over session names.
--force
Use --force only with a session UUID. Named sessions still require
confirmation so Codex doesn’t delete a repeated or ambiguous name without a prompt.
Interact with Codex cloud tasks from the terminal. The default command opens an interactive picker; codex cloud exec submits a task directly, and codex cloud list returns recent tasks for scripting or quick inspection.
Key Type / Values Details --attempts 1-4
Number of assistant attempts (best-of-N) Codex Cloud should run.
--env ENV_ID
Target Codex Cloud environment identifier (required). Use codex cloud to list options.
QUERY string
Task prompt. If omitted, Codex prompts interactively for details.
--attempts
1-4
--env
ENV_ID
QUERY
Authentication follows the same credentials as the main CLI. Codex exits non-zero if the task submission fails.
codex cloud list
List recent cloud tasks with optional filtering and pagination.
Key Type / Values Details --cursor string
Pagination cursor returned by a previous request.
Filter tasks by environment identifier.
--json boolean
Emit machine-readable JSON instead of plain text.
--limit 1-20
Maximum number of tasks to return.
--cursor
--json
--limit
1-20
Plain-text output prints a task URL followed by status details. Use --json for automation. The JSON payload contains a tasks array plus an optional cursor value. Each task includes id , url , title , status , updated_at , environment_id , environment_label , summary , is_review , and attempt_total .
Generate shell completion scripts and redirect the output to the appropriate location, for example codex completion zsh > "${fpath[1]}/_codex" .
Key Type / Values Details SHELL bash | zsh | fish | power-shell | elvish
Shell to generate completions for. Output prints to stdout.
SHELL
bash | zsh | fish | power-shell | elvish
Generate a local diagnostic report before filing a support issue or
while investigating a broken Codex installation. The report checks installation,
configuration, authentication, runtime, Git, terminal, app-server, and thread
inventory health.
Key Type / Values Details --all boolean
Expand long lists in the detailed human-readable report.
--ascii boolean
Use ASCII status labels and separators in human-readable output.
Emit a redacted machine-readable support report.
--no-color boolean
Disable ANSI color in human-readable output.
--summary boolean
Show grouped check rows and the final count summary only.
--all
--ascii
--no-color
--summary
Manage feature flags stored in $CODEX_HOME/config.toml . The enable and
disable commands persist changes so they apply to future sessions. The
features subcommand doesn’t accept --profile .
Key Type / Values Details Disable subcommand codex features disable <feature>
Persistently disable a feature flag in $CODEX_HOME/config.toml .
Enable subcommand codex features enable <feature>
Persistently enable a feature flag in $CODEX_HOME/config.toml .
List subcommand codex features list
Show known feature flags, their maturity stage, and their effective state.
Disable subcommand
codex features disable <feature>
Enable subcommand
codex features enable <feature>
List subcommand
codex features list
Use codex exec (or the short form codex e ) for scripted or CI-style runs that should finish without human interaction.
Key Type / Values Details --cd, -C path
Set the workspace root before executing the task.
--color always | never | auto
Control ANSI color in stdout.
Bypass approval prompts and sandboxing. Dangerous—only use inside an isolated runner.
--ephemeral boolean
Run without persisting session rollout files to disk.
--full-auto boolean
Deprecated compatibility flag. Prefer --sandbox workspace-write ; Codex prints a warning when this flag is used.
--ignore-rules boolean
Do not load user or project execpolicy .rules files for this run.
--ignore-user-config boolean
Do not load $CODEX_HOME/config.toml . Authentication still uses CODEX_HOME .
Attach images to the first message. Repeatable; supports comma-separated lists.
--json, --experimental-json boolean
Print newline-delimited JSON events instead of formatted text.
Override the configured model for this run.
Use the local open source provider (requires a running Ollama instance).
--output-last-message, -o path
Write the assistant’s final message to a file. Useful for downstream scripting.
--output-schema path
JSON Schema file describing the expected final response shape. Codex validates tool output against it.
Sandbox policy for model-generated commands. Defaults to configuration.
--skip-git-repo-check boolean
Allow running outside a Git repository (useful for one-off directories).
-c, --config key=value
Inline configuration override for the non-interactive run (repeatable).
PROMPT string | - (read stdin)
Initial instruction for the task. Use - to pipe the prompt from stdin.
Resume subcommand codex exec resume [SESSION_ID]
Resume an exec session by ID or add --last to continue the most recent session from the current working directory. Add --all to consider sessions from any directory. Accepts an optional follow-up prompt.
--color
always | never | auto
--ephemeral
--full-auto
--ignore-rules
--ignore-user-config
--json, --experimental-json
--output-last-message, -o
--output-schema
--skip-git-repo-check
-c, --config
string | - (read stdin)
Resume subcommand
codex exec resume [SESSION_ID]
Codex writes formatted output by default. Add --json to receive newline-delimited JSON events (one per state change). The optional resume subcommand lets you continue non-interactive tasks. Use --last to pick the most recent session from the current working directory, or add --all to search across all sessions:
Include sessions outside the current working directory when selecting the most recent session.
Attach one or more images to the follow-up prompt. Separate multiple paths with commas or repeat the flag.
--last boolean
Resume the most recent conversation from the current working directory.
Optional follow-up instruction sent immediately after resuming.
SESSION_ID uuid
Resume the specified session. Omit and use --last to continue the most recent session.
--last
SESSION_ID
uuid
Check execpolicy rule files before you save them. codex execpolicy check accepts one or more --rules flags (for example, files under ~/.codex/rules ) and emits JSON showing the strictest decision and any matching rules. Add --pretty to format the output. The execpolicy command is currently in preview.
Key Type / Values Details --pretty boolean
Pretty-print the JSON result.
--rules, -r path (repeatable)
Path to an execpolicy rule file to evaluate. Provide multiple flags to combine rules across files.
COMMAND... var-args
Command to be checked against the specified policies.
--pretty
--rules, -r
path (repeatable)
COMMAND...
var-args
Authenticate the CLI with a ChatGPT account, API key, or access token. With no flags, Codex opens a browser for the ChatGPT OAuth flow.
Key Type / Values Details --device-auth boolean
Use OAuth device code flow instead of launching a browser window.
--with-access-token boolean
Read an access token from stdin (for example printenv CODEX_ACCESS_TOKEN | codex login --with-access-token ).
--with-api-key boolean
Read an API key from stdin (for example printenv OPENAI_API_KEY | codex login --with-api-key ).
status subcommand codex login status
Print the active authentication mode and exit with 0 when logged in.
--device-auth
--with-access-token
--with-api-key
status subcommand
codex login status
codex login status exits with 0 when credentials are present, which is helpful in automation scripts.
Remove saved credentials for both API key and ChatGPT authentication. This command has no flags.
Manage Model Context Protocol server entries stored in ~/.codex/config.toml .
Key Type / Values Details add <name> -- <command...> | --url <value>
Register a server using a stdio launcher command or a streamable HTTP URL. Supports --env KEY=VALUE for stdio transports.
get <name> --json
Show a specific server configuration. --json prints the raw config entry.
list --json
List configured MCP servers. Add --json for machine-readable output.
login <name> --scopes scope1,scope2
Start an OAuth login for a streamable HTTP server (servers that support OAuth only).
logout <name>
Remove stored OAuth credentials for a streamable HTTP server.
remove <name>
Delete a stored MCP server definition.
add <name>
-- <command...> | --url <value>
get <name>
list
login <name>
--scopes scope1,scope2
The add subcommand supports both stdio and streamable HTTP transports:
Key Type / Values Details --bearer-token-env-var ENV_VAR
Environment variable whose value is sent as a bearer token when connecting to a streamable HTTP server.
--env KEY=VALUE repeatable
Environment variable assignments applied when launching a stdio server.
--oauth-client-id CLIENT_ID
OAuth client identifier for a streamable HTTP MCP server. Requires --url .
--oauth-resource RESOURCE
OAuth resource parameter to include during login for a streamable HTTP MCP server. Requires --url .
--url https://…
Register a streamable HTTP server instead of stdio. Mutually exclusive with COMMAND... .
COMMAND... stdio transport
Executable plus arguments to launch the MCP server. Provide after -- .
--bearer-token-env-var
--env KEY=VALUE
repeatable
--oauth-client-id
CLIENT_ID
--oauth-resource
RESOURCE
--url
https://…
stdio transport
OAuth actions ( login , logout ) only work with streamable HTTP servers (and only when the server supports OAuth).
Install, list, and remove plugins from configured marketplaces.
Key Type / Values Details add <plugin[@marketplace]> [--marketplace, -m NAME] [--json]
Install a plugin from a configured marketplace. Use --marketplace or -m when the plugin argument omits @marketplace .
list [--marketplace, -m NAME] [--available --json] [--json]
List installed plugins. With --json , output has installed and available arrays; --available includes uninstalled marketplace plugins and requires --json .
marketplace
Manage configured marketplace sources. See codex plugin marketplace below.
remove <plugin[@marketplace]> [--marketplace, -m NAME] [--json]
Remove an installed plugin from local config and cache. Use --json for automation-friendly output.
add <plugin[@marketplace]>
[--marketplace, -m NAME] [--json]
[--marketplace, -m NAME] [--available --json] [--json]
remove <plugin[@marketplace]>
codex plugin add --json prints pluginId , name , marketplaceName ,
version , installedPath , and authPolicy . codex plugin list --json prints
installed and available arrays. Entries include pluginId , name ,
marketplaceName , version , installed , enabled , source , installPolicy ,
authPolicy , and, when available, marketplaceSource with the configured
marketplace source type and value. codex plugin remove --json prints
pluginId , name , and marketplaceName .
Manage plugin marketplace sources that Codex can browse and install from.
Key Type / Values Details add <source> [--ref REF] [--sparse PATH] [--json]
Install a plugin marketplace from GitHub shorthand, a Git URL, an SSH URL, or a local marketplace root directory. --sparse is supported only for Git sources and can be repeated.
list [--json]
Show plugin marketplaces Codex is currently considering and the root path for each marketplace.
remove <marketplace-name> [--json]
Remove a configured plugin marketplace.
upgrade [marketplace-name] [--json]
Refresh one configured Git marketplace, or all configured Git marketplaces when no name is provided.
add <source>
[--ref REF] [--sparse PATH] [--json]
[--json]
remove <marketplace-name>
upgrade [marketplace-name]
codex plugin marketplace add accepts GitHub shorthand such as owner/repo or
owner/repo@ref , HTTP or HTTPS Git URLs, SSH Git URLs, and local marketplace
root directories. Use --ref to pin a Git ref, and repeat --sparse PATH to
use a sparse checkout for Git-backed marketplace repositories.
codex plugin marketplace list prints in-scope marketplace names and roots,
including implicitly discovered default marketplaces and configured marketplace
snapshots.
Add --json to marketplace add, list, upgrade, or remove commands for
automation-friendly output. Marketplace add JSON includes marketplaceName ,
installedRoot , and alreadyAdded ; list JSON includes a marketplaces array
with name , root , and optional marketplaceSource ; upgrade JSON includes
selectedMarketplaces , upgradedRoots , and errors ; remove JSON includes
marketplaceName and installedRoot .
Run Codex as an MCP server over stdio so that other tools can connect. This command inherits global configuration overrides and exits when the downstream client closes the connection.
Continue an interactive session by ID or resume the most recent conversation. codex resume scopes --last to the current working directory unless you pass --all . It accepts the same global flags as codex , including model and sandbox overrides.
Skip the picker and resume the most recent conversation from the current working directory.
Fork a previous interactive session into a new thread. By default, codex fork opens the session picker; add --last to fork your most recent session instead.
Show sessions beyond the current working directory in the picker.
Skip the picker and fork the most recent conversation automatically.
Fork the specified session. Omit and use --last to fork the most recent session.
Use the sandbox helper to run a command under the same policies Codex uses internally.
macOS seatbelt
Key Type / Values Details --allow-unix-socket path
Allow the sandboxed command to bind or connect Unix sockets rooted at this path. Repeat to allow multiple paths.
--cd, -C DIR
Working directory used for profile resolution and command execution. Requires --permissions-profile .
Pass configuration overrides into the sandboxed run (repeatable).
--include-managed-config boolean
Include managed requirements while resolving an explicit permissions profile. Requires --permissions-profile .
--log-denials boolean
Capture macOS sandbox denials with log stream while the command runs and print them after exit.
--permissions-profile, -P NAME
Apply a named permissions profile from the active configuration stack.
--profile, -p NAME
Layer $CODEX_HOME/NAME.config.toml on top of the base user config.
Shell command to execute under macOS Seatbelt. Everything after -- is forwarded.
--allow-unix-socket
DIR
--include-managed-config
--log-denials
--permissions-profile, -P
NAME
Linux Landlock
Key Type / Values Details --cd, -C DIR
Configuration overrides applied before launching the sandbox (repeatable).
Command to execute under Landlock + seccomp. Provide the executable after -- .
Command to execute under the native Windows sandbox. Provide the executable after -- .
Check for and apply a Codex CLI update when the installed release supports self-update. Debug builds print a message telling you to install a release build instead.
Flag combinations and safety tips
Use --sandbox workspace-write for unattended local work that can stay inside the workspace, and avoid --dangerously-bypass-approvals-and-sandbox unless you are inside a dedicated sandbox VM.
When you need to grant Codex write access to more directories, prefer --add-dir rather than forcing --sandbox danger-full-access .
Pair --json with --output-last-message in CI to capture machine-readable progress and a final natural-language summary.
Related resources
Codex CLI overview : installation, upgrades, and quick tips.
Config basics : persist defaults like the model and provider.
Advanced Config : profiles, providers, sandbox tuning, and integrations.
AGENTS.md : conceptual overview of Codex agent capabilities and best practices.
Ask AI
Loading docs agent...
