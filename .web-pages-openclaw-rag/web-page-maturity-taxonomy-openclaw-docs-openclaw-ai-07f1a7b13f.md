# Maturity taxonomy - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/maturity/taxonomy
- Final URL: https://docs.openclaw.ai/maturity/taxonomy
- Canonical URL: https://docs.openclaw.ai/maturity/taxonomy
- Fetched at: 2026-06-23T14:47:02Z
- Content type: text/html; charset=utf-8

## Description

Detailed reference for the product areas and checks behind the OpenClaw maturity scorecard.

## Extracted Text

Close
Reference Release and CI
Maturity taxonomy
the model behind the scorecard
Surfaces > categories > capabilities > evidence.
50 surfaces grouped into 4 families, with every category tied back to canonical docs and QA coverage IDs.
Browse product areas / Open detailed taxonomy / View scores
How to read this page
A surface is a product area such as Gateway runtime, Discord, or the macOS app. Each surface contains categories, and each category contains the capability-level checks that QA scenarios cover. Use the scorecard for release-level judgment; use this page to inspect the model underneath it.
Maturity levels
M0 Planned Direction is known, but no supported user path exists. Promotion: Design issue, owner, and target surface exist.
M1 Experimental Implemented behind caveats, flags, source builds, or maintainer-only flows. Promotion: Maintainer can run the scenario from current main.
M2 Alpha Real users can try it, but breaking changes and incomplete UX are expected. Promotion: Documented setup, basic tests, known caveats, and at least one real-environment proof.
M3 Beta Public path exists and the main workflow is usable with bounded caveats. Promotion: Install/update docs, regression tests, support runbook, and successful scenario proof across the expected environment.
M4 Stable Recommended path for normal users. Failures are treated as regressions. Promotion: Release gate, doctor/troubleshooting path, broad docs, and repeated real-world proof.
M5 Clawesome Polished, delightful, well-instrumented, and competitive with the best comparable workflow. Promotion: Stable plus user scorecard pass across representative users.
Product areas
Core
CLI M4 Stable 7 areas - 90% complete Gateway runtime M4 Stable 13 areas - 89% complete Agent Runtime M3 Beta 9 areas - 79% complete Session, memory, and context engine M3 Beta 9 areas - 79% complete Channel framework M3 Beta 8 areas - 79% complete Observability M3 Beta 5 areas - 79% complete Gateway Web App M3 Beta 6 areas - 79% complete Plugins M3 Beta 9 areas - 79% complete Security, auth, pairing, and secrets M3 Beta 6 areas - 79% complete Automation: cron, hooks, tasks, polling M3 Beta 6 areas - 79% complete Media understanding and media generation M2 Alpha 6 areas - 68% complete Voice and realtime talk M2 Alpha 6 areas - 68% complete TUI M2 Alpha 5 areas - 66% complete ClawHub M2 Alpha 4 areas - 62% complete OpenClaw App SDK M2 Alpha 6 areas - 53% complete
Platform
Linux Gateway host M4 Stable 5 areas - 89% complete macOS Gateway host M4 Stable 7 areas - 88% complete Docker and Podman hosting M3 Beta 4 areas - 79% complete Windows via WSL2 M3 Beta 6 areas - 79% complete Raspberry Pi and small Linux devices M3 Beta 4 areas - 79% complete macOS companion app M3 Beta 8 areas - 78% complete Android app M2 Alpha 7 areas - 66% complete Native Windows M2 Alpha 4 areas - 66% complete Kubernetes hosting M2 Alpha 4 areas - 61% complete iOS app M1 Experimental 8 areas - 44% complete Nix install path M1 Experimental 5 areas - 44% complete watchOS companion surfaces M1 Experimental 5 areas - 44% complete Linux companion app M0 Planned 5 areas - 21% complete Native Windows companion app M0 Planned 5 areas - 21% complete
Channel
Discord M4 Stable 6 areas - 87% complete Telegram M3 Beta 5 areas - 78% complete Slack M3 Beta 5 areas - 78% complete iMessage and BlueBubbles M3 Beta 5 areas - 78% complete WhatsApp M3 Beta 5 areas - 78% complete Matrix M2 Alpha 6 areas - 67% complete Google Chat M2 Alpha 5 areas - 66% complete Microsoft Teams M2 Alpha 5 areas - 66% complete Signal M2 Alpha 5 areas - 66% complete Feishu, QQ Bot, WeChat, Yuanbao, Zalo, Zalo Personal, regional channels M2 Alpha 4 areas - 58% complete Mattermost, LINE, IRC, Nextcloud Talk, Nostr, Twitch, Tlon, Synology Chat M2 Alpha 4 areas - 54% complete Voice Call channel M1 Experimental 5 areas - 44% complete
Provider and tool
Browser automation, exec, and sandbox tools M3 Beta 3 areas - 79% complete OpenAI and Codex provider path M3 Beta 5 areas - 79% complete Web search tools M3 Beta 4 areas - 79% complete Anthropic provider path M3 Beta 5 areas - 78% complete Google provider path M3 Beta 5 areas - 78% complete OpenRouter provider path M3 Beta 4 areas - 78% complete Image, video, and music generation tools M2 Alpha 5 areas - 68% complete Local model providers: Ollama, vLLM, SGLang, LM Studio M2 Alpha 5 areas - 68% complete Long-tail hosted providers M2 Alpha 3 areas - 68% complete
Details
CLI - M4 Stable - 7 areas
Normal setup and repair paths are documented across install, CLI, and gateway docs. Platform-specific Windows paths are tracked in the Windows via WSL2 and Native Windows rows.
Coverage Experimental - 2% Quality Stable - 83% Completeness Stable - 90% Partial - 6
Area Coverage Quality Completeness Docs
CLI Setup 6 capabilities / LTS-supported
Experimental 2%
Stable 89%
Stable 90%
Index , Installer , Node , Updating
Onboarding and Auth Setup 5 capabilities / LTS-supported
Beta 75%
Onboard , Configure , Onboarding Overview
Plugin and Channel Setup 5 capabilities
Onboard , Plugins , Channels
Gateway Service Management 5 capabilities / LTS-supported
Stable 87%
Gateway , Updating , Troubleshooting
CLI Observability 5 capabilities / LTS-supported
Status , Health , Logs , Diagnostics
Doctor 10 capabilities / LTS-supported
Doctor , Doctor , Secrets , Troubleshooting
Updates and Upgrades 5 capabilities / LTS-supported
Updating , Update , Troubleshooting
Gateway runtime - M4 Stable - 13 areas
Core architecture, auth, pairing, protocol docs, daemon docs, and CLI runbooks are broad and current.
Coverage Experimental - 3% Quality Stable - 81% Completeness Stable - 89% Partial - 12
Approvals and Remote Execution 6 capabilities / LTS-supported
Experimental 3%
Protocol , Index
HTTP APIs 4 capabilities / LTS-supported
Index , Openai Http Api , Openresponses Http Api , Tools Invoke Http Api , Hooks , Index
Hosted Web Surface 4 capabilities / LTS-supported
Index , Architecture , Control Ui , Webchat , Canvas
Gateway RPC APIs and Events 20 capabilities / LTS-supported
Protocol , Index , Architecture
Device Auth and Pairing 10 capabilities / LTS-supported
Protocol , Pairing , Index
Network Access and Discovery 6 capabilities / LTS-supported
Index , Discovery , Protocol
Nodes and Remote Capabilities 8 capabilities
Protocol , Architecture , Index
Health, Diagnostics, and Repair 7 capabilities / LTS-supported
Index , Diagnostics , Doctor
Protocol Compatibility 7 capabilities / LTS-supported
Protocol , Architecture , Typebox , Bridge Protocol
Roles and Permissions 5 capabilities / LTS-supported
Gateway Lifecycle 7 capabilities / LTS-supported
Index , Architecture
Security Controls 6 capabilities / LTS-supported
Index , Protocol , Discovery
WebSocket Connection 8 capabilities / LTS-supported
Protocol , Architecture
Agent Runtime - M3 Beta - 9 areas
Main loop, models, provider routing, and tool streaming are first-class, but provider behavior shifts weekly and needs scenario proof per release.
Coverage Experimental - 2% Quality Beta - 78% Completeness Beta - 79% Partial - 6
Agent Turn Execution 3 capabilities / LTS-supported
Beta 79%
Agent Loop , Agent , Agent Runtimes
External Runtimes and Subagents 4 capabilities
Agent Runtimes , Anthropic , Google , Subagents
Hosted Provider Execution 5 capabilities / LTS-supported
Openai , Anthropic , Google , Models
Local and Self-hosted Providers 5 capabilities
Alpha 68%
Ollama , Models , Agent
Model and Runtime Selection 4 capabilities / LTS-supported
Models , Models , Openai , Agent Runtimes
Provider Auth 10 capabilities / LTS-supported
Models , Agent , Models , Openai , Anthropic , Google , Subagents
Streaming and Progress 2 capabilities
Streaming , Agent Loop
Tool Calls and Response Handling 3 capabilities / LTS-supported
Agent Loop , Ollama
Tool Execution Controls 6 capabilities / LTS-supported
Sandbox Vs Tool Policy Vs Elevated , Agent Loop , Subagents
Session, memory, and context engine - M3 Beta - 9 areas
Strong docs and active implementation. Maturity depends on transcript durability, compaction quality, and cross-client parity.
Coverage Experimental - 0% Quality Beta - 77% Completeness Beta - 79% Partial - 6
CLI Session and Transcript Management 2 capabilities / LTS-supported
Experimental 0%
Session , Session Management Compaction , Sessions
Token Management 3 capabilities / LTS-supported
Compaction , Context , Session Management Compaction
Context Engine 2 capabilities / LTS-supported
Context , Context Engine , Codex Context Engine Harness
Cross-client History and Session Parity 2 capabilities
Webchat , Android , Channel Routing
Diagnostics, Maintenance, and Recovery 3 capabilities
Diagnostics , Session Management Compaction , Flags
Core Prompts and Context 2 capabilities / LTS-supported
Context , Transcript Hygiene , Discord
Memory 5 capabilities
Memory Config , Memory Qmd , Memory , Discord
Session Routing 2 capabilities / LTS-supported
Session , Channel Routing , Discord
Transcript Persistence 2 capabilities / LTS-supported
Session Management Compaction , Transcript Hygiene
Channel framework - M3 Beta - 8 areas
Many channels share Gateway delivery and routing contracts, but channel behavior varies by upstream API and account-policy constraints.
Coverage Experimental - 0% Quality Beta - 76% Completeness Beta - 79% Partial - 5
Channel Actions Commands and Approvals 5 capabilities
Groups , Discord , Googlechat , Signal , Matrix
Channel Setup 5 capabilities / LTS-supported
Index , Pairing , Troubleshooting , Sdk Channel Plugins
Group Thread and Ambient Room Behavior 5 capabilities
Groups , Group Messages , Ambient Room Events , Broadcast Groups , Discord
Inbound Access and Identity Gates 5 capabilities / LTS-supported
Access Groups , Groups , Discord , Line
Media Attachments and Rich Channel Data 4 capabilities
Line , Signal , Googlechat , Matrix , Discord
Outbound Delivery and Reply Pipeline 4 capabilities / LTS-supported
Groups , Ambient Room Events , Discord , Matrix , Config Channels
Conversation Routing and Delivery 10 capabilities / LTS-supported
Channel Routing , Groups , Discord , Matrix , Troubleshooting , Configuration Reference
Status Health and Operator Controls 4 capabilities / LTS-supported
Health , Configuration Reference , Troubleshooting , Discord
Observability - M3 Beta - 5 areas
OTel, Prometheus, logging, and diagnostics docs exist. Needs a public "what operators should look at first" maturity pass.
Coverage Experimental - 6% Quality Beta - 75% Completeness Beta - 79% Partial - 3
Health and Repair 12 capabilities / LTS-supported
Experimental 6%
Health , Telegram , Doctor , Doctor , Sdk Subpaths , Health , Protocol
Logging 5 capabilities / LTS-supported
Logging , Logging , Logs
Diagnostic Collection 8 capabilities
Diagnostics , Health , Codex Harness , Protocol
Telemetry Export 13 capabilities
Hooks , Opentelemetry , Logging , Sdk Subpaths , Diagnostics Otel , Prometheus , Diagnostics Prometheus
Session Diagnostics 4 capabilities / LTS-supported
Opentelemetry , Prometheus , Diagnostics , Protocol
Gateway Web App - M3 Beta - 6 areas
Web UI is documented with pairing, chat, PWA, Talk, push, and remote Gateway flows. Promote after cross-browser and mobile-PWA scorecards.
Coverage Experimental - 0% Quality Beta - 74% Completeness Beta - 79% None
Browser Realtime Talk 5 capabilities
Control Ui , Protocol , Talk
Browser Access and Trust 5 capabilities
Control Ui , Dashboard , Tailscale , Remote
Configuration 5 capabilities
Control Ui , Configuration
Browser UI 10 capabilities
Control Ui , Index , Dashboard , Protocol
WebChat Conversations 15 capabilities
Control Ui , Webchat , Getting Started , Channel Routing , Secure File Operations
Operator Console 10 capabilities
Control Ui , Health , Protocol , Dashboard
Plugins - M3 Beta - 9 areas
Broad docs and strong internal runtime evidence exist across manifests, discovery, loading, provider/tool architecture, and approval boundaries. Keep the row at beta until public SDK API/subpaths and external distribution proof are stronger.
Coverage Experimental - 2% Quality Beta - 72% Completeness Beta - 79% Partial - 7
Authoring and Packaging plugins 8 capabilities / LTS-supported
Building Plugins , Sdk Overview , Sdk Entrypoints , Sdk Subpaths , Manifest , Reference
Bundled plugins 5 capabilities / LTS-supported
Plugin Inventory , Plugins , Architecture Internals
Canvas plugin 6 capabilities
Canvas , Canvas , Configuration Reference
Installing and running plugins 6 capabilities / LTS-supported
Architecture , Architecture Internals , Plugins
Channel plugins 5 capabilities / LTS-supported
Sdk Channel Plugins , Sdk Channel Inbound , Sdk Channel Outbound
Provider and tool plugins 6 capabilities / LTS-supported
Sdk Provider Plugins , Tool Plugins , Adding Capabilities
Plugin approvals 6 capabilities / LTS-supported
Plugin Permission Requests , Exec Approvals , Sdk Channel Plugins
Publishing plugins 6 capabilities / LTS-supported
Plugins , Compatibility , Publishing
Testing plugins 6 capabilities
Sdk Testing , Sdk Setup , Codex Harness
Security, auth, pairing, and secrets - M3 Beta - 6 areas
Good docs and hardening surfaces exist. Promote after regular upgrade/security scenario runs prove no setup regressions.
Coverage Experimental - 0% Quality Beta - 72% Completeness Beta - 79% Partial - 5
Approval Policy and Tool Safeguards 2 capabilities / LTS-supported
Exec Approvals , Approvals , Plugin Permission Requests , Audit Checks
Gateway Auth and Remote Access 9 capabilities / LTS-supported
Index , Exposure Runbook , Trusted Proxy Auth , Tailscale , Remote , Configuration Reference , Gateway , Doctor , Control Ui , Browser Control , Audit Checks
Channel Access Control 3 capabilities / LTS-supported
Pairing , Telegram , Access Groups , Audit Checks
Device and Node Pairing 11 capabilities / LTS-supported
Protocol , Devices , Pairing , Pairing , Operator Scopes , Control Ui , Webchat , Approvals
Plugin Trust 2 capabilities
Manifest , Plugin Permission Requests , Manage Plugins , Audit Checks
Credential and Secret Hygiene 5 capabilities / LTS-supported
Authentication , Models , Openai , Oauth , Secrets , Secrets , Secretref Credential Surface , Audit Checks
Automation: cron, hooks, tasks, polling - M3 Beta - 6 areas
Documented and usable, but scenario proof should cover unattended delivery, retries, and failure visibility.
Coverage Experimental - 0% Quality Beta - 72% Completeness Beta - 79% None
Cron Jobs 15 capabilities
Cron Jobs , Cron , Protocol , Tasks , Discord
Event Ingress 15 capabilities
Telegram , Zalo , Troubleshooting , Imessage From Bluebubbles , Gmail Pubsub Integration , Gmail Pubsub , Webhooks , Webhooks , Webhook
Automation Hooks 11 capabilities
Hooks , Hooks , Hooks , Plugin Permission Requests , Sdk Subpaths
Background Tasks and Flows 10 capabilities
Tasks , Index , Tasks , Taskflow , Sdk Runtime
Heartbeat 5 capabilities
Index , Heartbeat , Commitments
Polling Controls 10 capabilities
Poll , Message , Telegram , Msteams , Background Process
Media understanding and media generation - M2 Alpha - 6 areas
Broad capability surface exists, but provider variance, file limits, and node/app parity make this not stable yet.
Coverage Experimental - 1% Quality Alpha - 64% Completeness Alpha - 68% None
Media Intake and Access 8 capabilities
Experimental 1%
Alpha 61%
Media Overview , Media Understanding , Secure File Operations , Pdf , Image Generation , Qr , Line , Whatsapp
Channel Media Handling 5 capabilities
Images , Media Overview , Discord
Media Configuration 1 capabilities
Media Overview , Image Generation , Manifest , Codex Harness
Text-to-Speech Delivery 2 capabilities
Tts , Media Overview , Discord
Media Understanding 12 capabilities
Alpha 69%
Audio , Media Understanding , Media Overview , Whatsapp , Images , Infer , Pdf
Media Generation 17 capabilities
Image Generation , Media Overview , Skills , Music Generation , Video Generation
Voice and realtime talk - M2 Alpha - 6 areas
Multiple implementations exist across Control UI, apps, and providers. Needs latency, failure-mode, and setup scorecards before beta.
Coverage Experimental - 0% Quality Alpha - 61% Completeness Alpha - 68% None
Talk Providers 7 capabilities
Openai , Google , Sdk Provider Plugins , Talk , Control Ui
Realtime Talk Sessions 11 capabilities
Talk , Control Ui
Speech and Transcription 5 capabilities
Talk , Openai , Google
Native App Talk 4 capabilities
Talk , Voicewake
Voice Wake and Routing 4 capabilities
Voicewake , Voicewake , Voice Overlay
Talk Observability 5 capabilities
Control Ui , Voice Overlay , Talk
TUI - M2 Alpha - 5 areas
Present in docs and source, but less visible as a primary user workflow. Needs explicit scenario definition.
Coverage Experimental - 0% Quality Alpha - 59% Completeness Alpha - 66% None
Runtime Modes 14 capabilities
Alpha 59%
Alpha 66%
Tui , Tui , Index
Input and Commands 8 capabilities
Tui
Session Management 3 capabilities
Tui , Sessions
Local Shell Execution 4 capabilities
Tui , Tui
Rendering and Output Safety 4 capabilities
Tui , Qr , Logs , Completion
ClawHub - M2 Alpha - 4 areas
Public docs and ecosystem concept exist. Needs install, trust, update, rollback, and compatibility scorecards.
Coverage Experimental - 0% Quality Alpha - 58% Completeness Alpha - 62% None
Publishing 7 capabilities
Alpha 54%
Alpha 55%
Publishing , Creating Skills , Community
Catalog Discovery 5 capabilities
Plugin , Plugins , Skills , Skills , Community
Compatibility and Trust 12 capabilities
Alpha 56%
Plugin , Plugins , Compatibility , Plugin Inventory , Publishing , Skills , Skills Config
Plugin Lifecycle and Health 26 capabilities
Plugin , Plugins , Skills , Skills , Protocol , Bundles , Dependency Resolution
OpenClaw App SDK - M2 Alpha - 6 areas
OpenClaw App SDK is a distinct external app contract separate from Gateway runtime and Plugin SDK. Current scoring shows a real @openclaw/sdk path with gaps around public packaging, auto-discovery, approvals, helpers, and compatibility.
Coverage Experimental - 0% Quality Alpha - 54% Completeness Alpha - 53% None
Client API 4 capabilities
Alpha 51%
Alpha 50%
Openclaw Sdk , Openclaw Sdk Api Design
Gateway Access 5 capabilities
Alpha 53%
Openclaw Sdk , Openclaw Sdk Api Design , Protocol , Index
Agent Conversations 6 capabilities
Alpha 52%
Openclaw Sdk , Openclaw Sdk Api Design , Protocol
Events and Approvals 5 capabilities
Resource Helpers 5 capabilities
Alpha 62%
Compatibility 5 capabilities
Openclaw Sdk Api Design , Typebox , Protocol
Linux Gateway host - M4 Stable - 5 areas
Node runtime is recommended, systemd user service is documented, and VPS/container guidance is broad.
Coverage Experimental - 0% Quality Beta - 75% Completeness Stable - 89% Partial - 4
Host Setup and Updates 4 capabilities / LTS-supported
Index , Updating , Linux , Index
Gateway Runtime and Service Control 6 capabilities / LTS-supported
Index , Gateway , Linux , Vps
Remote Access and Security 6 capabilities / LTS-supported
Remote , Tailscale , Exposure Runbook , Authentication , Secrets
Diagnostics and Repair 4 capabilities / LTS-supported
Status , Logs , Doctor , Diagnostics , Index
Deployment Targets 3 capabilities
Vps , Docker , Hetzner , Digitalocean , Kubernetes , Podman
macOS Gateway host - M4 Stable - 7 areas
LaunchAgent service path, local/remote Gateway modes, CLI install, and app integration are documented.
Coverage Experimental - 0% Quality Beta - 74% Completeness Stable - 88% None
CLI Setup 4 capabilities
Beta 74%
Stable 88%
Macos , Bundled Gateway , Installer , Node
Local Gateway Integration 9 capabilities
Macos , Bundled Gateway , Remote , Index , Gateway , Bonjour
Remote Gateway Mode 5 capabilities
Remote , Remote , Tailscale
Gateway Service Lifecycle 10 capabilities
Macos , Bundled Gateway , Gateway , Index , Update , Updating , Uninstall , Troubleshooting
Diagnostics and Observability 4 capabilities
Bundled Gateway , Macos , Gateway , Doctor , Troubleshooting
Permissions and Native Capabilities 4 capabilities
Macos , Remote
Profiles and Isolation 5 capabilities
Multiple Gateways , Index , Gateway
Docker and Podman hosting - M3 Beta - 4 areas
Install docs exist and are common deployment paths. Promote after recurring release smoke captures upgrade and volume behavior.
Coverage Experimental - 5% Quality Beta - 71% Completeness Beta - 79% None
Container Setup 6 capabilities
Experimental 5%
Docker , Podman
Container Operations 11 capabilities
Podman , Docker Vm Runtime , Docker , Hetzner , Hostinger
Image Release and Validation 5 capabilities
Docker , Docker Vm Runtime , Full Release Validation
Agent Sandbox and Tooling 3 capabilities
Docker , Docker Vm Runtime
Windows via WSL2 - M3 Beta - 6 areas
Recommended Windows path with systemd/user-service guidance and boot-chain docs. Promote after repeated install/update scorecards.
Coverage Experimental - 3% Quality Alpha - 69% Completeness Beta - 79% Partial - 5
WSL Setup 6 capabilities / LTS-supported
Alpha 67%
Windows , Getting Started
CLI 8 capabilities / LTS-supported
Windows , Getting Started , Updating , Onboard , Doctor , Status , Logs
Gateway Service Lifecycle 10 capabilities / LTS-supported
Windows , Index , Doctor
Gateway Access and Exposure 11 capabilities / LTS-supported
Authentication , Secrets , Remote , Exposure Runbook , Windows
Diagnostics and Repair 6 capabilities / LTS-supported
Windows , Status , Logs , Doctor , Doctor
Browser and Control UI 6 capabilities
Browser Wsl2 Windows Remote Cdp Troubleshooting , Browser , Control Ui
Raspberry Pi and small Linux devices - M3 Beta - 4 areas
Platform docs exist and Gateway path is Linux-based. Needs hardware-specific release smoke proof to move higher.
Coverage Experimental - 0% Quality Alpha - 67% Completeness Beta - 79% None
Setup and Compatibility 12 capabilities
Raspberry Pi , Index , Faq First Run , Faq , Linux , Installer
Remote Access and Auth 9 capabilities
Raspberry Pi , Authentication , Secrets , Pairing , Devices , Remote , Tailscale
Gateway Runtime 10 capabilities
Index , Gateway , Raspberry Pi , Linux , Vps
Performance and Diagnostics 5 capabilities
Raspberry Pi , Linux , Health , Diagnostics
macOS companion app - M3 Beta - 8 areas
Rich menu bar app, permissions, node mode, Canvas, voice wake, WebChat, and remote mode exist. Still fast-moving enough to avoid Stable.
Coverage Experimental - 0% Quality Alpha - 66% Completeness Beta - 78% None
Canvas 4 capabilities
Beta 78%
Canvas , Macos , Webchat
Local Setup 7 capabilities
Bundled Gateway , Macos , Child Process , Dev Setup
Status and Settings 5 capabilities
Menu Bar , Icon , Macos , Health , Logging , Remote
Native Capabilities 5 capabilities
Macos , Xpc , Permissions , Signing , Peekaboo
Remote Connections 3 capabilities
Remote , Macos , Remote
Voice and Talk 3 capabilities
Voicewake , Voice Overlay , Talk , Macos
WebChat 3 capabilities
Webchat , Macos , Webchat
Remote WebChat 5 capabilities
Webchat , Remote , Remote
Android app - M2 Alpha - 7 areas
Public Google Play path exists, but app docs still describe the rebuild as extremely alpha and call out release hardening work.
Media Capture 1 capabilities
Android , Camera
Mobile Chat 1 capabilities
Android
Connection Setup 1 capabilities
Android , Bonjour , Pairing
Distribution 3 capabilities
Settings 1 capabilities
Voice 1 capabilities
Android , Talk
Device Runtime 2 capabilities
Android , Troubleshooting , Protocol
Native Windows - M2 Alpha - 4 areas
Core CLI/Gateway flows work, but docs still recommend WSL2 for the full experience and list native caveats.
Coverage Experimental - 0% Quality Alpha - 58% Completeness Alpha - 66% Partial - 1
CLI 9 capabilities / LTS-supported
Alpha 64%
Index , Installer , Windows , Getting Started , Onboard
Gateway Management 11 capabilities
Windows , Index , Gateway , Doctor
Networking 4 capabilities
Windows , Index , Gateway
Updates 4 capabilities
Updating , Ci
Kubernetes hosting - M2 Alpha - 4 areas
Kubernetes hosting is a distinct Kustomize-based cluster deployment path. Current scoring shows a real minimal deployment path with gaps around Kubernetes-specific CI, ingress/TLS/NetworkPolicy packaging, backup/restore, and production exposure hardening.
Coverage Experimental - 0% Quality Alpha - 55% Completeness Alpha - 61% None
Deployment Setup 5 capabilities
Kubernetes , Index
Configuration and Secrets 5 capabilities
Kubernetes , Secrets , Environment
Access and Exposure 5 capabilities
Kubernetes , Authentication , Remote , Exposure Runbook
Cluster Lifecycle 5 capabilities
iOS app - M1 Experimental - 8 areas
Internal preview / super-alpha. TestFlight and relay-backed push flows exist, but no public distribution yet.
Coverage Experimental - 0% Quality Experimental - 41% Completeness Experimental - 44% None
Media and Sharing 1 capabilities
Experimental 41%
Experimental 44%
Ios , Camera
Canvas and Screen 1 capabilities
Ios , Canvas
Chat and Sessions 1 capabilities
Ios , Webchat , Protocol
Gateway Setup and Diagnostics 7 capabilities
Ios , Pairing
Distribution 1 capabilities
Ios
Device Commands 2 capabilities
Ios , Protocol
Notifications and Background 1 capabilities
Ios , Configuration
Ios , Talk
Nix install path - M1 Experimental - 5 areas
Optional install flow. Needs clearer support promise before alpha/beta promotion.
Install Handoff 4 capabilities
Nix , Index , Docs Directory
Plugin Lifecycle 4 capabilities
Manage Plugins , Plugin , Nix
Activation and App UX 7 capabilities
Nix
Config and State 7 capabilities
Nix , Setup , Environment
Service Runtime and Guards 8 capabilities
Nix , Setup , Doctor , Update
watchOS companion surfaces - M1 Experimental - 5 areas
Source has Watch app/extension surfaces; public docs do not yet present this as a user feature.
Delivery and Recovery 7 capabilities
Exec Approvals 3 capabilities
Exec Approvals , Ios
Distribution and Support 6 capabilities
Notifications and Replies 7 capabilities
Watch App UI 3 capabilities
Linux companion app - M0 Planned - 5 areas
Docs say native Linux companion apps are planned; Gateway is the supported Linux path today.
Coverage Experimental - 0% Quality Experimental - 19% Completeness Experimental - 21% None
App Distribution 3 capabilities
Experimental 19%
Experimental 21%
Linux , Index , Index
Gateway Connectivity 4 capabilities
Linux , Index , Pairing , Remote
Chat and Sessions 3 capabilities
Linux , Protocol , Webchat
Desktop Capabilities 9 capabilities
Linux , Exec Approvals , Secrets , Index , Exec , Talk , Camera
Status and Diagnostics 7 capabilities
Linux , Openclaw , Doctor
Native Windows companion app - M0 Planned - 5 areas
Planned only.
Installation and Updates 4 capabilities
Windows , Index
Gateway Connection 3 capabilities
Windows , Index , Pairing , Remote
Chat Sessions 2 capabilities
Windows , Protocol
Status and Repair 5 capabilities
Windows , Doctor , Index
Desktop Tools and Permissions 10 capabilities
Windows , Index , Exec , Exec Approvals , Index
Discord - M4 Stable - 6 areas
Deep docs and broad feature coverage. Voice/delegation paths should stay separately scored as beta/alpha.
Coverage Experimental - 0% Quality Beta - 73% Completeness Stable - 87% Partial - 4
Channel Setup and Operations 10 capabilities / LTS-supported
Beta 73%
Discord , Discord , Fly , Slash Commands , Health , Channels , Config Channels
Access and Identity 6 capabilities / LTS-supported
Discord , Pairing , Access Groups , Groups
Conversation Routing and Delivery 12 capabilities / LTS-supported
Discord , Channel Routing , Groups , Access Groups , Acp Agents , Subagents
Media and Rich Content 1 capabilities / LTS-supported
Discord
Native Controls and Approvals 5 capabilities
Discord , Slash Commands
Realtime Voice and Calls 5 capabilities
Discord , Openai , Elevenlabs , Qa E2e Automation , Config Channels
Telegram - M3 Beta - 5 areas
Core channel is mature enough for regular use, but high-variance UX and media edge cases need recurring scenario proof.
Coverage Experimental - 0% Quality Alpha - 68% Completeness Beta - 78% Full - 5
Telegram , Config Channels , Channels
Access and Identity 10 capabilities / LTS-supported
Telegram , Pairing , Access Groups , Groups , Multi Agent
Conversation Routing and Delivery 1 capabilities / LTS-supported
Telegram , Groups , Multi Agent
Telegram , Location
Native Controls and Approvals 9 capabilities / LTS-supported
Beta 77%
Telegram , Exec Approvals , Reactions
Slack - M3 Beta - 5 areas
First-class channel docs and routing surface. Needs workspace install/admin scenario scorecards.
Coverage Experimental - 0% Quality Alpha - 66% Completeness Beta - 78% Full - 5
Slack , Slack , Secrets , Qa E2e Automation , Troubleshooting
Access and Identity 1 capabilities / LTS-supported
Slack , Pairing
Conversation Routing and Delivery 5 capabilities / LTS-supported
Slack , Bot Loop Protection , Pairing
Slack , Qa E2e Automation
Native Controls and Approvals 8 capabilities / LTS-supported
Slack , Slash Commands , Exec Approvals
iMessage and BlueBubbles - M3 Beta - 5 areas
Supported iMessage runs through imsg on a signed-in macOS Messages host; legacy BlueBubbles configs require migration. Keep macOS permissions, SSH wrapper, SIP/private API, and migration caveats visible.
Channel Setup and Operations 11 capabilities
Bluebubbles Imessage , Imessage From Bluebubbles , Config Channels , Imessage
Access and Identity 6 capabilities
Imessage , Imessage From Bluebubbles , Config Channels
Conversation Routing and Delivery 4 capabilities
Imessage
Media and Rich Content 7 capabilities
Native Controls and Approvals 3 capabilities
WhatsApp - M3 Beta - 5 areas
Core path is important and documented; upstream Baileys/session volatility keeps it below Stable.
Channel Setup and Operations 5 capabilities
Whatsapp , Config Channels , Whatsapp , Qa E2e Automation , Doctor
Access and Identity 7 capabilities
Whatsapp , Config Channels , Qa E2e Automation , Pairing
Whatsapp , Group Messages
Media and Rich Content 2 capabilities
Whatsapp
Native Controls and Approvals 2 capabilities
Matrix - M2 Alpha - 6 areas
Supported via bundled plugin. Needs bridge, auth, and room lifecycle scorecards.
Coverage Experimental - 0% Quality Alpha - 60% Completeness Alpha - 67% None
Alpha 60%
Matrix , Matrix Migration
Matrix , Groups , Bot Loop Protection
Conversation Routing and Delivery 1 capabilities
Matrix
Media and Rich Content 1 capabilities
Native Controls and Approvals 6 capabilities
Encryption and Verification 3 capabilities
Google Chat - M2 Alpha - 5 areas
Documented channel, but enterprise/admin setup raises maturity risk.
Channel Setup and Operations 16 capabilities
Googlechat , Googlechat , Config Channels , Wizard Cli Reference , Secrets , Secretref Credential Surface , Health , Plugin Inventory , Index
Access and Identity 11 capabilities
Googlechat , Pairing , Access Groups , Config Channels , Bot Loop Protection , Channel Routing
Googlechat , Bot Loop Protection , Access Groups , Channel Routing
Googlechat , Message , Media Understanding , Secretref Credential Surface
Native Controls and Approvals 16 capabilities
Googlechat , Message , Media Understanding , Secretref Credential Surface , Reactions , Slash Commands , Config Agents , Message Lifecycle Refactor
Microsoft Teams - M2 Alpha - 5 areas
Enterprise auth/admin flows need explicit scenario proof.
Channel Setup and Operations 9 capabilities
Msteams , Msteams , Config Channels , Health
Access and Identity 9 capabilities
Msteams , Pairing , Access Groups
Conversation Routing and Delivery 5 capabilities
Msteams , Groups , Channel Routing
Media and Rich Content 5 capabilities
Msteams
Msteams , Exec Approvals Advanced
Signal - M2 Alpha - 5 areas
Supported channel docs exist; needs stronger install and reconnect proof.
Channel Setup and Operations 7 capabilities
Signal , Signal
Signal
Feishu, QQ Bot, WeChat, Yuanbao, Zalo, Zalo Personal, regional channels - M2 Alpha - 4 areas
Important regional coverage, but public support level should be calibrated per account type, upstream approval, and maintainer proof.
Coverage Experimental - 0% Quality Alpha - 55% Completeness Alpha - 58% None
Channel Setup and Operations 6 capabilities
Index , Pairing , Feishu , Architecture Internals
Access and Identity 1 capabilities
No linked docs
Mattermost, LINE, IRC, Nextcloud Talk, Nostr, Twitch, Tlon, Synology Chat - M2 Alpha - 4 areas
Supported surfaces exist, but maturity likely varies by upstream and maintainer coverage. Score individually later.
Coverage Experimental - 0% Quality Alpha - 53% Completeness Alpha - 54% None
Channel Setup and Operations 1 capabilities
Voice Call channel - M1 Experimental - 5 areas
Optional/plugin path with complex realtime behavior. Needs scenario scorecard before public beta.
Channel Setup and Operations 2 capabilities
Voicecall , Voice Call , Protocol
Voice Call , Voicecall
Voice Call
Voice Call , Plugin Inventory
Realtime Voice and Calls 2 capabilities
Browser automation, exec, and sandbox tools - M3 Beta - 3 areas
Core tools are documented, but host security and permission UX should stay under active scorecard review.
Coverage Experimental - 15% Quality Beta - 75% Completeness Beta - 79% Partial - 2
Browser Automation 8 capabilities
Experimental 15%
Browser Control , Testing , Browser , Index , Audit Checks
Tool Invocation and Execution 6 capabilities / LTS-supported
Exec , Background Process , Tools Invoke Http Api , Operator Scopes , Protocol , Exec Approvals , Exec Approvals Advanced , Elevated
Sandbox and Tool Policy 6 capabilities / LTS-supported
Sandboxing , Sandbox Vs Tool Policy Vs Elevated , Multi Agent Sandbox Tools , Codex Harness Reference , Config Tools
OpenAI and Codex provider path - M3 Beta - 5 areas
Deep docs, OAuth/subscription path, realtime voice, image, and compatibility behavior. Provider churn keeps this from Stable without release-scorecard proof.
Coverage Experimental - 8% Quality Beta - 74% Completeness Beta - 79% Partial - 3
Model and Auth 6 capabilities / LTS-supported
Experimental 8%
Openai , Codex Harness , Models , Oauth , Codex Harness Reference , Auth Monitoring
Responses and Tool Compatibility 4 capabilities / LTS-supported
Openai , Openresponses Http Api , Openai Http Api , Codex Native Plugins
Native Codex Harness 2 capabilities / LTS-supported
Codex Harness , Codex Harness Runtime , Codex Harness Reference , Codex Native Plugins
Image and Multimodal Input 2 capabilities
Openai , Image Generation , Images
Voice and Realtime Audio 2 capabilities
Openai , Discord , Voice Call
Web search tools - M3 Beta - 4 areas
Multiple providers and docs exist. Needs quota/error/SSRF proof per provider family.
Coverage Experimental - 7% Quality Beta - 74% Completeness Beta - 79% None
Search Providers 19 capabilities
Experimental 7%
Web , Brave Search , Tavily , Exa Search , Firecrawl , Perplexity Search , Duckduckgo Search , Searxng Search , Gemini Search , Grok Search , Kimi Search , Minimax Search , Ollama Search , Sdk Subpaths , Sdk Overview , Manifest
Setup and Diagnostics 9 capabilities
Web , Web Fetch , Faq , Api Usage Costs , Brave Search , Perplexity Search , Tavily , Firecrawl
Network Safety 4 capabilities
Web , Web Fetch , Firecrawl , Searxng Search
Tool Availability and Fetch 11 capabilities
Config Tools , Web Fetch , Web , Faq
Anthropic provider path - M3 Beta - 5 areas
First-class model provider. Needs recurring auth/catalog/tool-call scenario proof.
Coverage Experimental - 0% Quality Beta - 71% Completeness Beta - 78% None
Provider Auth and Recovery 9 capabilities
Anthropic , Doctor , Configuration Examples , Troubleshooting , Prompt Caching
Model and Runtime Selection 10 capabilities
Anthropic , Config Agents , Models , Cli Backends
Request Transport and Turn Semantics 10 capabilities
Anthropic , Prompt Caching , Troubleshooting , Cli Backends , Model Providers
Prompt Cache and Context 5 capabilities
Anthropic , Prompt Caching , Troubleshooting , Heartbeat
Media Inputs 4 capabilities
Anthropic , Config Agents
Google provider path - M3 Beta - 5 areas
First-class provider with model and realtime surfaces. Needs separate Live/Talk scoring.
Provider Setup and Credentials 10 capabilities
Google , Model Providers
Model Routing and Endpoints 10 capabilities
Google , Model Providers , Google , Gemini Search
Direct Gemini Runtime 9 capabilities
Google , Model Providers , Faq Models , Testing Live
Media, Search, and Realtime 10 capabilities
Google , Google
Prompt Caching 5 capabilities
Prompt Caching , Google , Model Providers , Token Use
OpenRouter provider path - M3 Beta - 4 areas
Unified provider path is documented and valuable, but model-specific behavior varies.
Provider Setup and Auth 14 capabilities
Openrouter , Model Providers , Configure , Authentication , Environment , Models , Models
Chat Runtime and Normalization 15 capabilities
Openrouter , Model Providers , Prompt Caching
Provider Recovery and Diagnostics 5 capabilities
Model Failover , Openrouter , Models
Media Generation and Speech 7 capabilities
Openrouter , Image Generation , Music Generation , Media Overview , Video Generation , Tts
Image, video, and music generation tools - M2 Alpha - 5 areas
Capability exists across providers, but quality, latency, and parameter compatibility vary too much for beta without per-provider proof.
Media Routing and Discovery 4 capabilities
Config Agents , Image Generation , Video Generation , Music Generation
Task Lifecycle and Delivery 12 capabilities
Media Overview , Image Generation , Video Generation , Music Generation
Image Generation 9 capabilities
Image Generation , Infer , Media Overview
Video Generation 11 capabilities
Video Generation , Runway , Pixverse , Fal , Openrouter
Music Generation 6 capabilities
Music Generation
Local model providers: Ollama, vLLM, SGLang, LM Studio - M2 Alpha - 5 areas
Useful and documented, but environment variance is high.
Provider Setup, Lifecycle, and Diagnostics 12 capabilities
Local Models , Lmstudio , Ollama , Vllm , Local Model Services , Config Agents , Troubleshooting , Doctor
Native Provider Plugins 10 capabilities
Ollama , Lmstudio
OpenAI-Compatible Runtime Compatibility 8 capabilities
Vllm , Sglang , Local Models , Lmstudio
Local Memory and Embeddings 5 capabilities
Memory , Doctor
Network Safety and Prompt Controls 2 capabilities
Index , Config Tools , Local Models
Long-tail hosted providers - M2 Alpha - 3 areas
Many docs/reference pages exist; score should be generated from provider metadata plus live smoke coverage.
Hosted LLM Providers 12 capabilities
Index , Model Providers , Testing Live , Onboard
Hosted Media Providers 8 capabilities
Manifest , Testing Live , Index
Provider Operations 12 capabilities
Index , Model Providers , Manifest , Testing Live , Models
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
