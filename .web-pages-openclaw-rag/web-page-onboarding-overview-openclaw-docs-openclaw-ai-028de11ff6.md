# Onboarding overview - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/start/onboarding-overview
- Final URL: https://docs.openclaw.ai/start/onboarding-overview
- Canonical URL: https://docs.openclaw.ai/start/onboarding-overview
- Fetched at: 2026-06-23T14:57:10Z
- Content type: text/html; charset=utf-8

## Description

Overview of OpenClaw onboarding options and flows

## Extracted Text

Close
Get started First steps
OpenClaw has two onboarding paths. Both configure auth, the Gateway, and
optional chat channels — they just differ in how you interact with the setup.
Which path should I use?
CLI onboarding macOS app onboarding Platforms macOS, Linux, Windows (native or WSL2) macOS only Interface Terminal wizard Guided UI in the app Best for Servers, headless, full control Desktop Mac, visual setup Automation --non-interactive for scripts Manual only Command openclaw onboard Launch the app
Most users should start with CLI onboarding — it works everywhere and gives
you the most control.
What onboarding configures
Regardless of which path you choose, onboarding sets up:
Model provider and auth — API key, OAuth, or setup token for your chosen provider
Workspace — directory for agent files, bootstrap templates, and memory
Gateway — port, bind address, auth mode
Channels (optional) — built-in and bundled chat channels such as
iMessage, Discord, Feishu, Google Chat, Mattermost, Microsoft Teams,
Telegram, WhatsApp, and more
Daemon (optional) — background service so the Gateway starts automatically
CLI onboarding
Run in any terminal:
bash Copy code openclaw onboard
Add --install-daemon to also install the background service in one step.
Full reference: Onboarding (CLI)
CLI command docs: openclaw onboard
macOS app onboarding
Open the OpenClaw app. The first-run wizard walks you through the same steps
with a visual interface.
Full reference: Onboarding (macOS App)
Custom or unlisted providers
If your provider is not listed in onboarding, choose Custom Provider and
enter:
API compatibility mode (OpenAI-compatible, Anthropic-compatible, or auto-detect)
Base URL and API key
Model ID and optional alias
Multiple custom endpoints can coexist — each gets its own endpoint ID.
Related
Getting started
CLI setup reference
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
