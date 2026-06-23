# Deployment Overview | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/deploy/overview
- Final URL: https://docs.paperclip.ing/reference/deploy/overview/
- Canonical URL: https://docs.paperclip.ing/reference/deploy/overview
- Fetched at: 2026-06-23T13:40:04Z
- Content type: text/html; charset=utf-8

## Description

Paperclip supports three deployment configurations, from zero-friction local use to login-protected private and public deployments.

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Deployment Overview
Paperclip supports three deployment configurations, from zero-friction local use to login-protected private and public deployments.
Use this section when you need to choose a mode, understand the storage and secrets defaults, or move from local development into a more durable setup.
Deployment Modes
Mode Auth Best For local_trusted No login required Single-operator local machine authenticated + private Login required Private network (Tailscale, VPN, LAN) authenticated + public Login required Internet-facing cloud deployment
Quick Comparison
Local Trusted
Loopback-only host binding ( localhost )
No human login flow
Fastest local startup
Best for solo development and experimentation
Authenticated + Private
Login required via Better Auth
Binds to all interfaces for network access
Auto base URL mode for lower-friction private access
Best for team access over Tailscale or a local network
Authenticated + Public
Login required
Explicit public URL required
Stricter security checks
Best for cloud hosting and internet-facing deployment
Choosing A Mode
Just trying Paperclip: use local_trusted first.
Sharing with a team on a private network: use authenticated + private .
Deploying to the cloud: use authenticated + public .
Start from onboarding:
pnpm paperclipai onboard
Or change the mode later:
pnpm paperclipai configure --section server
Start Here
If you want the shortest path to a working instance, read Local Development first.
If you are deciding how to expose the instance, read Deployment Modes next.
If you already know the shape and only need the operational details, jump to:
Database
Storage
Secrets
Environment Variables
Docker
Tailscale Private Access
Tip: Keep the deployment pages grouped together in the docs nav. They are easiest to understand when read as one flow.
