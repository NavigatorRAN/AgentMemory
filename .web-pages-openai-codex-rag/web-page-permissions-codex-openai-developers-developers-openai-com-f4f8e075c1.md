# Permissions – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/permissions
- Final URL: https://developers.openai.com/codex/permissions
- Canonical URL: https://developers.openai.com/codex/permissions
- Fetched at: 2026-06-23T14:12:44Z
- Content type: text/html; charset=utf-8

## Description

Configure beta Codex permission profiles for filesystem and network access

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
Beta. Permission profiles are under active development and may change.
Permission profiles do not compose with the older sandbox settings. Configure
either default_permissions and [permissions] , or sandbox_mode /
sandbox_workspace_write , but not both. If sandbox_mode appears in any
loaded config file, you pass --sandbox , or the selected config profile sets
sandbox_mode , Codex uses those older sandbox settings instead of
default_permissions .
Managed allowed_permission_profiles is the exception: it makes Codex use
permission profiles. Remove older settings such as
sandbox_mode and [sandbox_workspace_write] before deploying a managed
profile allowlist. For a mixed-version enterprise rollout, you can keep the
managed allowed_sandbox_modes requirement as a temporary compatibility
constraint until every client runs Codex 0.138.0 or later.
Permission profiles let you apply least-privilege boundaries to local commands
Codex runs on your behalf. A profile is a named policy that combines filesystem
rules, which define what commands can read or write, with network rules, which
define which destinations commands can reach.
Use profiles to give Codex enough access for the current task without granting
broad access to your machine or network. For example, a read-only profile can
let Codex inspect a project without editing it, while a write-capable profile
can limit edits to selected workspace roots.
Local permission profiles are supported on macOS, Linux, WSL, and native
Windows. See Scope and enforcement for platform-specific
details and caveats.
For Codex cloud network settings, see Internet Access .
Define and select a profile
Codex includes three built-in permission profiles:
:read-only keeps local command execution read-only.
:workspace allows writes inside the active workspace roots and system temp directories.
:danger-full-access removes local sandbox restrictions and should be used
only when that broad access is intentional.
Create a named profile under [permissions.<name>] , then set the top-level
default_permissions key to that profile name or to one of the built-ins above.
In this example, project-edit is a user-defined profile name, not a built-in
value.
Enterprise administrators can define profiles and restrict which profiles
users may select through managed requirements.toml . Once
allowed_permission_profiles is present, omitted profiles are denied,
including omitted built-ins and profiles added in future Codex versions. See
Control available permission profiles
for the recommended managed configuration.
Custom profiles use two related concepts:
[permissions.<name>.workspace_roots] adds concrete directories that should
count as workspace roots for that profile.
[permissions.<name>.filesystem.":workspace_roots"] defines the filesystem
rules Codex applies inside every effective workspace root: the current
session’s runtime workspace roots plus the profile-defined roots above.
Profiles also use the normal config-layer model. Higher-precedence layers can
add or replace entries under the same profile name without restating the whole
profile.
For example, an organization-level config and a user-level config can extend
the same profile independently:
# /etc/codex/config.toml [ permissions . server . workspace_roots ] "~/code/server" = true # ~/.codex/config.toml [ permissions . server . workspace_roots ] "~/code/mobile-app" = true
When server is active, both workspace roots participate in the effective
default_permissions = "project-edit" [ permissions . project-edit . workspace_roots ] "~/code/app" = true "~/code/shared-lib" = true [ permissions . project-edit . filesystem ] ":minimal" = "read" [ permissions . project-edit . filesystem . ":workspace_roots" ] "." = "write" ".devcontainer" = "read" "**/*.env" = "deny" [ permissions . project-edit . network ] enabled = true [ permissions . project-edit . network . domains ] "api.openai.com" = "allow" "objects.githubusercontent.com" = "allow" "*.github.com" = "allow" "tracking.example.com" = "deny"
This profile:
Reads the minimal runtime paths common developer tools need.
Applies the same workspace-root rules to the current session and the
profile-defined roots.
Keeps IDE-adjacent settings such as .devcontainer/ read-only under each
root.
Denies matching environment files with a glob rule.
Allows network access only through the configured domain policy.
Inside an active profile, narrower deny rules stay in force even when a broader
path is readable or writable. For example, a profile can make workspace roots
writable while still setting a matching .env path to deny .
Extend a profile
Use extends when a profile is mostly the same as a built-in or another named
profile. Prefer extending a built-in profile over starting from scratch so
baseline protections carry forward. Extending :workspace , for example, keeps
the workspace root’s .codex directory read-only unless you explicitly
override it. Set the parent once, then add or override only the rules that
differ.
default_permissions = "project-edit" [ permissions . project-edit ] description = "Project editing with OpenAI API access." extends = ":workspace" [ permissions . project-edit . filesystem . ":workspace_roots" ] "**/*.env" = "deny" [ permissions . project-edit . network ] enabled = true [ permissions . project-edit . network . domains ] "api.openai.com" = "allow"
This profile starts with :workspace , keeps matching .env files denied, and
allows requests to api.openai.com . A profile can extend :read-only ,
:workspace , or another named profile. It cannot extend
:danger-full-access ; Codex also rejects unknown parents and inheritance
cycles.
Configuration spec
Entry Type / values Default Details default_permissions String profile name None Names the permissions profile Codex applies by default. It must match a profile under [permissions] or a built-in such as :workspace . Set it explicitly for predictable behavior; managed requirements may omit it only when both :workspace and :read-only are explicitly allowed. Codex uses older sandbox settings unless managed allowed_permission_profiles tells it to use permission profiles in this setup. [permissions.<name>] Table None Defines a named profile. default_permissions selects one profile as the default; other permission-profile settings also use the profile name. permissions.<name>.description String None Provides a human-readable description for the profile. A profile does not inherit its parent’s description through extends . permissions.<name>.extends String profile name None Starts this profile from another named profile or the built-in :read-only or :workspace profile. Codex rejects :danger-full-access , unknown parents, and inheritance cycles. [permissions.<name>.workspace_roots] Table None Adds profile-defined workspace roots that receive :workspace_roots filesystem rules alongside the current session’s runtime workspace roots. permissions.<name>.workspace_roots."<path>" Boolean false Adds the path to the profile’s workspace root set when true . Entries set to false remain inactive. [permissions.<name>.filesystem] Table None Maps filesystem paths to access values or scoped subpath maps. Missing or empty filesystem tables keep filesystem access restricted and emit a startup warning. permissions.<name>.filesystem.glob_scan_max_depth Number None Limits deny-read glob expansion on Linux, WSL, and native Windows when Codex snapshots matches before sandbox startup. Larger values can increase startup scanning work. Use a value of at least 1 when an unbounded ** pattern needs bounded pre-expansion. [permissions.<name>.filesystem]."<path>" read , write , or deny None Grants direct access for a supported path. deny denies access and wins over equally specific write or read entries. Codex rejects direct write rules that the active runtime cannot enforce. [permissions.<name>.filesystem."<path>"]."<subpath>" read , write , or deny None Grants access to a descendant of <path> . Use . for the base path. Other subpaths must be relative descendants and cannot contain . or .. components. [permissions.<name>.network] Table None Configures the network sandbox proxy and the sandbox network policy for the profile. permissions.<name>.network.enabled Boolean false Enables network access for sandboxed commands in the profile. This changes the sandbox network policy; it does not start the network proxy by itself. [permissions.<name>.network.domains] Table None Maps host patterns to allow or deny . If there are no allow entries, domain requests are blocked. Deny entries override allow entries. permissions.<name>.network.domains."<pattern>" allow or deny None Supports exact hosts, *.example.com for subdomains, **.example.com for apex plus subdomains, and * as an allow-only global wildcard. Host patterns are normalized by trimming, lowercasing, stripping a trailing dot, and stripping simple ports or brackets. [permissions.<name>.network.unix_sockets] Table None Maps Unix socket allowlist overrides. Use only for local integrations such as Docker. permissions.<name>.network.unix_sockets."<path>" allow or deny None Adds an absolute Unix socket path to the effective allowlist with allow , or rejects it with deny . Denied entries are omitted from the effective allowlist. permissions.<name>.network.proxy_url URL string http://127.0.0.1:3128 HTTP proxy listener used for HTTP_PROXY , HTTPS_PROXY , websocket proxy variables, and related tool proxy environment variables. permissions.<name>.network.enable_socks5 Boolean true Enables the SOCKS5 listener used for ALL_PROXY and FTP proxy variables. permissions.<name>.network.socks_url URL string http://127.0.0.1:8081 SOCKS5 listener address. permissions.<name>.network.enable_socks5_udp Boolean true Enables SOCKS5 UDP support when the SOCKS5 listener is enabled. permissions.<name>.network.allow_upstream_proxy Boolean true Allows the network sandbox proxy to respect upstream HTTP(S)_PROXY and ALL_PROXY settings for outbound requests. permissions.<name>.network.allow_local_binding Boolean false Disables the local/private-network guard when true . When false , exact local literals such as localhost or 127.0.0.1 must be explicitly allowlisted, and hostnames that resolve to local or private IPs remain blocked. permissions.<name>.network.dangerously_allow_non_loopback_proxy Boolean false Allows proxy listeners to bind non-loopback addresses. Leave unset for ordinary local development. permissions.<name>.network.dangerously_allow_all_unix_sockets Boolean false Bypasses the Unix socket allowlist where Unix socket proxying is supported. This is a broad local escape hatch.
Filesystem permissions
Filesystem entries use read , write , or deny :
Access Meaning read Allows commands to read files and list directories under the path. Commands cannot create, modify, rename, or delete files there. write Allows commands to read and modify files under the path, including creating, renaming, and deleting files when the OS allows it. deny Denies both reads and writes under the path. Use it to carve out a denied subpath from a broader read or write grant.
More specific entries override broader entries. When two entries target the
same path, deny takes precedence over write , and write takes precedence
over read .
This precedence lets a profile describe a broad working area first, then carve
out files or directories that should stay unreadable:
[ permissions . project-edit . filesystem ] ":minimal" = "read" [ permissions . project-edit . filesystem . ":workspace_roots" ] "." = "write" ".devcontainer" = "read" "**/*.env" = "deny"
In this example, the workspace root stays writable, .devcontainer/ stays
readable without becoming writable, and matching environment files remain
unavailable to sandboxed commands.
A more specific path can also reopen a narrower subtree inside a broader deny:
[ permissions . project-edit . filesystem ] "~/Documents" = "deny" "~/Documents/codex" = "write"
Supported path forms:
Path Meaning Scoped subpaths :root The filesystem root . only :minimal Platform and runtime paths needed by common tools . only :workspace_roots The current session’s workspace roots plus any enabled profile-defined workspace roots Yes :tmpdir The $TMPDIR location, when one is available . only :slash_tmp The /tmp folder, if it exists . only /absolute/path A platform absolute path, such as /path on macOS/Linux/WSL or C:\path on native Windows Yes ~/path A path under the current user’s home directory Yes
On native Windows, home-relative paths can also use backslashes, such as
~\work .
Use :root only when a profile intentionally needs broad read coverage:
[ permissions . audit . filesystem ] ":root" = "read"
Use nested entries under :workspace_roots to scope access to workspace-root
relative subpaths:
[ permissions . project-edit . filesystem . ":workspace_roots" ] "." = "write" # each workspace root "docs" = "read" # each workspace-root docs directory "generated" = "deny" # each workspace-root generated directory
Nested subpaths must stay inside their workspace root. Parent traversal such as
../other-repo is rejected.
Deny reads with exact paths or globs
Use deny for files or subtrees that Codex should not read, even when a broader
profile rule grants access nearby. Exact paths work well for stable locations
such as ~/.ssh . Glob patterns work better when a profile needs to cover a
family of sensitive files whose exact locations vary across repositories.
When a glob sits under :workspace_roots , Codex interprets it relative to each
effective workspace root. For example:
[ permissions . project-edit . filesystem . ":workspace_roots" ] "**/*.env" = "deny"
This rule denies reads for matching .env files found beneath each runtime or
profile-defined workspace root. Use it when you want to preserve normal
workspace writes while keeping environment files, generated secrets, or similar
credential-bearing files unreadable.
deny glob patterns are supported as deny-read rules. read or write globs
are less portable on Linux, WSL, and native Windows sandboxing, so prefer exact
paths or subtree rules such as "docs/**" = "read" when possible.
On Linux, WSL, and native Windows, an unbounded ** deny-read pattern may need
bounded pre-expansion before the sandbox starts. Set glob_scan_max_depth when
you use an unbounded pattern such as "**/*.env" = "deny" :
[ permissions . project-edit . filesystem ] glob_scan_max_depth = 3 [ permissions . project-edit . filesystem . ":workspace_roots" ] "**/*.env" = "deny"
glob_scan_max_depth must be at least 1 . Higher values scan deeper before
sandbox startup, which can add startup work on Linux, WSL, and native Windows.
If you prefer not to use bounded expansion, enumerate explicit depths such as
*.env , */*.env , and */*/*.env .
Add reusable workspace roots to the profile when the same rules should apply to
more than the current session root:
[ permissions . project-edit . workspace_roots ] "~/code/app" = true "~/code/shared-lib" = true
When this profile is active, Codex applies the :workspace_roots rules to the
current session’s runtime workspace roots and to each enabled profile-defined
workspace root.
On native Windows, drive-letter paths such as D:\work and UNC paths such as
\\server\share are supported as absolute paths.
Network permissions
Set enabled = true to allow network access for the selected profile:
[ permissions . project-edit . network ] enabled = true
When network access is enabled, Codex uses full network behavior by default.
Most profiles should also define domain rules:
[ permissions . project-edit . network . domains ] "example.com" = "allow" # exact host "*.example.com" = "allow" # subdomains only "**.example.com" = "allow" # apex and subdomains "ads.example.com" = "deny" # deny wins over allow
The network sandbox proxy binds to local listeners by default:
[ permissions . project-edit . network ] enabled = true proxy_url = "http://127.0.0.1:3128" enable_socks5 = true socks_url = "http://127.0.0.1:8081" enable_socks5_udp = true
Leave these listener settings at their defaults unless you are integrating with
a specific runtime. The dangerously_* network keys are escape hatches for
specialized environments and should not be used for ordinary local development.
Local and private networks
Codex applies a local/private-network guard by default as a defense against DNS
rebinding and accidental access to local services. To intentionally allow a
literal local target, allowlist the exact host or IP literal:
[ permissions . project-edit . network . domains ] "localhost" = "allow" "127.0.0.1" = "allow"
Set allow_local_binding = true only when the profile must reach allowlisted
hostnames that resolve to local or private addresses:
[ permissions . project-edit . network ] enabled = true allow_local_binding = true [ permissions . project-edit . network . domains ] "localhost" = "allow"
Unix sockets
Unix socket proxying is a local escape hatch for tools such as Docker. Use it
sparingly:
[ permissions . project-edit . network . unix_sockets ] "/var/run/docker.sock" = "allow" "/tmp/old.sock" = "deny"
Use deny to reject a socket path, including an inherited allow entry. Denied
socket paths are omitted from the effective allowlist.
When Unix sockets are enabled, keep proxy listeners bound to loopback addresses.
Migrate from older sandbox settings
Permission profiles replace the older combination of sandbox_mode and
sandbox_workspace_write when you want one reusable profile to describe both
filesystem and network behavior. Use one system or the other for a session, not
both.
Suggested starting points:
For a read-only workflow, use the built-in :read-only profile or define a
custom profile with read access only where needed.
For workspace editing, use the built-in :workspace profile or define a
custom profile that writes through :workspace_roots and adds only the extra
temp or cache paths the workflow needs.
For unrestricted local execution, use :danger-full-access only when you
intentionally want the broadest local access model.
Profiles describe the local default posture for a session. Organization-managed
requirements can still add restrictions that user configuration should not
broaden. See Managed configuration
for admin-enforced filesystem and network constraints.
Scope and enforcement
Permission profiles define the boundaries for local sandboxed command
execution. Use them together with approval policies and the separate controls
for other Codex surfaces.
What profiles control
Local command execution: Permission profiles govern sandboxed commands
that run on your machine. App connectors, MCP servers, browser or
computer-use surfaces, Codex cloud environment settings, and approved
escalations use their own controls.
Filesystem writes: A write-capable profile can create persistent changes.
Treat writes to scripts, build steps, package manager hooks, shell startup
files, and shared directories as sensitive because later tools or users can
execute those files outside the original sandbox context.
Outbound destinations: Network domain rules constrain where sandboxed
command traffic can go through the network proxy. They do not determine
whether an allowed destination is trustworthy, and wildcard allow rules stay
broad.
Local services: Local and private network targets are blocked by default.
Allowlisting localhost , private IPs, Unix sockets, or setting
allow_local_binding = true explicitly opens access to local services.
How enforcement works
On macOS, Codex uses Seatbelt sandbox profiles. If the selected policy cannot
be enforced by the platform sandbox, Codex refuses to run the command instead
of silently running it unsandboxed.
On Linux and WSL, Codex uses bubblewrap
and seccomp ,
with Landlock available for compatibility fallback paths. The strongest
enforcement path depends on user namespaces and kernel support; restricted
container hosts can force compatibility paths, and unsupported split policies
are refused.
On native Windows, elevated sandboxing
is strongest because it can use dedicated lower-privilege sandbox users,
filesystem permission boundaries, and firewall rules. unelevated
sandboxing is a fallback with weaker network isolation and cannot enforce
every split read/write carveout, so unsupported policies are refused. Use WSL
when you need the Linux sandbox model.
Operational guidance
Choose the narrowest profile that still lets the task complete, especially when
you grant writes or outbound network access. Keep approval policy, secret
handling, and allow rules aligned with that access level.
Common profiles
Read-only with network allowlist
default_permissions = "readonly-net" [ permissions . readonly-net . filesystem ] ":minimal" = "read" [ permissions . readonly-net . filesystem . ":workspace_roots" ] "." = "read" [ permissions . readonly-net . network ] enabled = true [ permissions . readonly-net . network . domains ] "api.openai.com" = "allow"
File access limited to workspace
Here is an example of a permission profile that will make your workspace folders writable by Codex while denying reads to the rest of the filesystem (with limited exceptions, as determined by :minimal ).
default_permissions = "workspace-only" [ permissions . workspace-only ] # By extending the :workspace profile, you get Codex's safeguards to ensure # subfolders such as .codex/ and .git/ within a workspace root are read-only # while the rest of the folder is writable. extends = ":workspace" [ permissions . workspace-only . filesystem ] # By default, deny read access to all files on disk. ":root" = "deny" # Though in practice, a software agent needs to be able to read folders that # contain common tools, such as `/usr/bin`, to get work done, so grant access # to a "minimal" set of files and folders, as determined by Codex. ":minimal" = "read" # By extending the :workspace profile, :tmpdir and :slash_tmp are "write" by # default, though you can deny access to them altogether, if desired. ":tmpdir" = "deny" ":slash_tmp" = "deny"
Workspace write without network
default_permissions = "project-edit" [ permissions . project-edit . filesystem ] ":minimal" = "read" [ permissions . project-edit . filesystem . ":workspace_roots" ] "." = "write" [ permissions . project-edit . network ] enabled = false
Workspace write with public web access
default_permissions = "workspace-net" [ permissions . workspace-net . filesystem ] ":minimal" = "read" [ permissions . workspace-net . filesystem . ":workspace_roots" ] "." = "write" [ permissions . workspace-net . network ] enabled = true [ permissions . workspace-net . network . domains ] "*" = "allow"
Use the global "*" allow rule only when you intend to allow public network
access. Deny rules can narrow a broad allowlist.
Ask AI
Loading docs agent...
