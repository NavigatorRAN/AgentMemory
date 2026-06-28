---
slug: lan-machines
title: LAN Machines And Services
summary: "Canonical LAN inventory for agents: machine roles, Proxmox VM map, service locations, SSH login strings, documentation pointers, and update rules."
tags:
  - agentmemory-wiki
  - lan-inventory
  - homelab
  - machines
  - ssh
  - services
rag_collections: []
source_urls: []
updated_at: 2026-06-28T02:06:23Z
---

# LAN Machines And Services

This page is the shared agent-facing source of truth for known LAN machines, what they do, how to log in, where services live, and where supporting documentation can be found.

Last audit: 2026-06-28T01:49:05Z from Matthew's MacBook Pro. Discovery used ping, ARP, TCP probes, HTTP fingerprints, Proxmox VM inventory, key-based SSH, Docker/systemd/listening-port checks, and Memory MCP history.

Use this page first when asked to fix or integrate local tools. Then verify the specific service live before making changes, and check recent Memory MCP events for the relevant entity.

## Update Rules For Agents

- When you change a service, host config, deployment path, port, DNS/reverse proxy, SSH access, or documentation location, update this page in the same turn if you can reach the wiki host.
- Also write a concise Memory MCP `record_event` with `agent: CODEX` and the entities involved.
- Do not store passwords, API keys, private keys, tokens, or service environment secrets here. SSH credentials mean login strings such as `matt@192.168.1.26` plus expected identity files.
- Mark unverified facts as memory-derived. Do not turn old memory into current truth without a live check.
- If two sources disagree, keep both facts and add a dated note explaining what was verified.

## Canonical Wiki Location

- Native wiki directory: `/mnt/aishareddrive/family-agents/memory/wiki/` on `webserver`.
- This page filename: `/mnt/aishareddrive/family-agents/memory/wiki/lan-machines.md`.
- Local source copy: `/Users/matthewwarren/Documents/Memory MCP/docs/lan-machines-wiki.md`.
- Memory MCP endpoint: `http://192.168.1.26:8006/mcp`.
- Preferred retrieval: `get_wiki_page(slug: "lan-machines")`, then `recall_for_entity` for recent host-specific events.

## SSH And Key Status

| Target | Login String | Key Status | Notes |
| --- | --- | --- | --- |
| Proxmox homeserver | `root@192.168.1.168` | `~/.ssh/id_rsa_hermes` works after 2026-06-28 audit | Added public key `hermes-agent`; existing `openclaw` public key also present. |
| Ubuntu VM Server / Pi-hole | `matt@192.168.1.181` | `~/.ssh/id_rsa_hermes` works | Proxmox VM 100. |
| WebServer / Pi-hole2 | `matt@192.168.1.26` | `~/.ssh/id_rsa_hermes` works | Proxmox VM 101; also hosts Memory MCP. |
| VWHomeServer | `veronika@192.168.1.107` | `~/.ssh/id_rsa_hermes` works | Proxmox VM 102. |
| DGX Spark | `matt@192.168.1.11` | `~/.ssh/id_rsa_hermes` works | ARM/NVIDIA DGX Spark host. |
| Mac mini | `Mac@192.168.1.31` from supplied laydown | SSH password/key not verified | SMB NetBIOS name is `MINI`; supplied SSH login did not accept password during audit. |
| Matthew's MacBook Pro | `matthewwarren@192.168.1.180` from supplied laydown | SSH password/key not verified for `.180` | Current Codex host is Matthew's MacBook Pro on `192.168.1.249` Wi-Fi and `192.168.1.204` wired. |

## Proxmox VM Map

| VMID | Name | IP | Role | Resources / Storage | Verified Notes |
| --- | --- | --- | --- | --- | --- |
| 100 | `ubuntu-server` | `192.168.1.181` | Ubuntu VM Server and Pi-hole/vaultwarden Docker host | 4 cores, 4048 MB RAM, 50 GB boot disk on NAS-backed storage | Running. MAC `BC:24:11:EB:58:E7`. Snapshot `PiHoleSetup`. |
| 101 | `WebServer` | `192.168.1.26` | WebServer, Pi-hole2, Memory MCP, Caddy reverse proxy, LiteLLM host | 2 cores, 4048 MB RAM, 40 GB boot disk on local-lvm | Running. MAC `BC:24:11:32:C5:3B`. Root filesystem 93 percent used during audit. |
| 102 | `VWHomeServer` | `192.168.1.107` | Docker app host, RAG host, model library host, Nextcloud host | 8 cores, 32000 MB RAM, 350 GB boot disk on local-lvm | Running. MAC `BC:24:11:6F:59:4E`. Prior stale GPU passthrough issue is no longer present in active config. |
| 103 | `Home-Assistant` | `192.168.1.6` | Home Assistant OS VM | 4 cores, 4048 MB RAM, 32 GB disk, OVMF/q35 | Running and set `onboot: 1`. MAC `BC:24:11:51:23:3D`. |

Proxmox host storage: `local`, `local-lvm`, and NFS storage `nas` mounted from `192.168.1.174:/volume/.../.unifi-drive/Server/.data` at `/mnt/pve/nas`.

## Core Machines

| Machine | Address / Login | What It Does | Programs / Services | Docs And Memory Pointers | Audit Status |
| --- | --- | --- | --- | --- | --- |
| Proxmox homeserver | `root@192.168.1.168` | VM host for primary homelab services | Proxmox VE web UI `https://192.168.1.168:8006`; SSH `:22`; SPICE proxy `:3128`; postfix local-only; NFS-backed `nas` storage | Memory MCP entities `proxmox`, `proxmox-homeserver`; imported Proxmox VE docs in RAG collection `product-documentation-proxmox-ve` | Verified 2026-06-28 by SSH and `qm list`; `hermes-agent` SSH key installed for root. |
| Ubuntu VM Server / Pi-hole | `matt@192.168.1.181` | DNS/ad-blocking and password vault Docker host | Docker containers: `pihole`, `vaultwarden`, `caddy`; Pi-hole UI `http://192.168.1.181/admin/`; HTTPS via Caddy on `:8443`; Tailscale `100.81.158.127`; Docker networks | Memory MCP entities `pi-hole`, `product-documentation-pihole`, `vaultwarden`; local compose path `/home/matt/docker/pihole/docker-compose.yml` | Verified 2026-06-28 by SSH, Docker, HTTP, and ports `22,53,80,443,8443`. |
| WebServer / Pi-hole2 / web-01 | `matt@192.168.1.26` | Shared agent infrastructure host, reverse proxy, Memory MCP host, second Pi-hole | Native services: Caddy, Pi-hole FTL, Memory MCP `:8006/mcp`, RSS Articles Node server, VWMedia API, Tailscale `100.105.90.40`; Docker: LiteLLM `:4000`, LiteLLM Postgres, `seo-intake-site` on `127.0.0.1:8788`; CIFS `/mnt/aishareddrive` | Native wiki page `memory-mcp`; Memory MCP entities `web-01`, `memory-mcp`, `litellm`; service source `/opt/memory-mcp`; Caddyfile `/etc/caddy/Caddyfile`; wiki vault `/mnt/aishareddrive/family-agents/memory` | Verified 2026-06-28 by SSH, Docker, systemd, Caddyfile, HTTP. Root disk was 93 percent used. |
| VWHomeServer | `veronika@192.168.1.107` | Docker app host, RAG retrieval/ingest host, model library host, Nextcloud and Samba host | Docker: `llm-model-library` `:8088`, `openwebui` `:3000`, `rag-qdrant` `:6333/:6334`; systemd: RAG retrieval `:8005`, RAG ingest worker, RAG UI `:8501`, nginx reverse proxy, Samba, Nextcloud snap, Tailscale `100.125.105.92`; nginx also listens on `:11434` and `:1234`; CIFS `/mnt/AISharedDrive` | Memory MCP entities `vwhomeserver`, `llm-model-library`, `rag-mcp`, `nas-model-library`; compose paths `/opt/rag/compose/docker-compose.yml`, `/home/veronika/llm-model-library/docker-compose.yml`, `/opt/openwebui/docker-compose.yml` | Verified 2026-06-28 by SSH, Docker, Compose, HTTP. LLM Model Library health ok. Qdrant collections endpoint returned `documents` and `smoke_test`. |
| DGX Spark | `matt@192.168.1.11` | Local AI workstation / GPU-ish RAG helper host / Pi-hole node | ARM Ubuntu/NVIDIA kernel; Ollama `:11434`; Pi-hole FTL on `:53/:80/:443`; RAG reranker `:8003`; RAG sparse embeddings `:8004`; Playwright MCP `:8931`; Paperclip AI user service `:3100`; DGX dashboard local `127.0.0.1:11000`; Tailscale `100.93.39.70`; CUPS/Avahi | Memory MCP entities `spark`, `ollama`, `openclaw`; imported product docs include OpenClaw and LiteLLM | Verified 2026-06-28 by SSH, systemd, HTTP. Ollama version endpoint works and lists local GGUF models including `qwen3.6-32k`, `gemma4:e4b`, and `qwen3-vl:32b`. |
| Home Assistant | `192.168.1.6` | Home Assistant OS VM | Home Assistant UI/API at `http://192.168.1.6:8123` | Memory MCP entities `home-assistant`, `proxmox`, `homeserver` | Verified 2026-06-28 by Proxmox VM map and HTTP title `Home Assistant`. |
| Mac mini | `Mac@192.168.1.31` from supplied laydown | Apple host, likely Immich-related DNS target and local LM Studio host | SSH `:22`; SMB `:445`; AirPlay/AirTunes `:5000/:7000`; Screen Sharing/VNC `:5900`; LM Studio/OpenAI-compatible server `:1234`; reverse DNS `immich.home.arpa`; SMB NetBIOS name `MINI` | Memory MCP entities `immich-server`, `mac-mini`, `lm-studio` | Ping/ports/HTTP/SMB verified 2026-06-28. SSH login not verified; supplied login rejected password over SSH. LM Studio model list exposed `google/gemma-4-26b-a4b-qat`, `google/gemma-4-e2b`, `google/gemma-4-e4b`, `nvidia/nemotron-3-nano`, `qwen/qwen3-coder-next`, and `text-embedding-nomic-embed-text-v1.5`. |
| Matthew's MacBook Pro | Current host: `192.168.1.249` Wi-Fi, `192.168.1.204` wired. Supplied laydown also lists `matthewwarren@192.168.1.180` | User workstation and local Codex/AgentMemory development machine | On `.204` and `.249`: SSH `:22`, SMB `:445`, AirPlay/AirTunes `:5000/:7000`, VNC `:5900`, LM Studio `:1234`. On `.180`: SSH `:22`, AirPlay/AirTunes `:5000/:7000` only in this audit | Memory MCP entities `mac-laptop`, `lm-studio`; local repos under `/Users/matthewwarren/Documents/` | Verified current host identity locally: `Matthew’s MacBook Pro`, local host `Matthews-MacBook-Pro.local`, `en0=192.168.1.249`, `en7=192.168.1.204`. SSH to `.180` was not verified. |
| Network NAS / AISharedDrive | `192.168.1.174` | Shared storage for agents, model artifacts, wiki vault, RAG files, and Proxmox NFS storage | HTTP `:80` redirects; HTTPS `:443` title `UniFi OS`; SMB `:445`; NetBIOS status timed out from audit Mac; NFS used by Proxmox; CIFS mounts observed on WebServer and VWHomeServer | Memory MCP entities `aishareddrive`, `nas-model-library`; model artifacts path `/mnt/AISharedDrive/LLM-Models`; Memory wiki vault path `/mnt/aishareddrive/family-agents/memory` | Verified 2026-06-28 by ports, Proxmox NFS mount, and CIFS mounts. Keep SQLite databases off CIFS; use local volumes for DBs. |
| WD Cloud Mirror | `192.168.1.67` | Legacy NAS/media device | FTP `:21`; SSH `:22`; HTTP/HTTPS Apache; SMB/NetBIOS `:139/:445`; AFP `:548`; Twonky media server `:9000`; Plex `:32400`; Apache `:8080` forbidden | Memory MCP entity candidate `wd-cloud-mirror` | Verified 2026-06-28 by TCP/HTTP and NetBIOS name `WDMYCLOUDMIRROR`. |
| UniFi gateway | `192.168.1.1` | Network gateway / UniFi OS controller | DNS `:53`; HTTP `:80`; HTTPS `:443` title `UniFi OS`; `:8080`; `:8443` | Memory MCP entity `udm-pro-max` | Verified 2026-06-28 by TCP/HTTP. |

## Local Website Endpoints From Caddy

These are from live Caddy configs checked on 2026-06-28T02:06:23Z. WebServer's `/etc/caddy/Caddyfile` validates successfully. The Vaultwarden route lives in the Caddy container on the Ubuntu VM Server, not in WebServer's Caddyfile.

| Site / Route | Caddy Source | Backend / Root | Purpose | Health Check |
| --- | --- | --- | --- | --- |
| `https://control.home.arpa` | WebServer `/etc/caddy/Caddyfile` | `/home/matt/web-01/runtime/control-center/public` | Control center static app | `/health` returned 200. |
| `https://control.home.arpa/control-center/*` | WebServer | `/home/matt/web-01/runtime/control-center/public` | Explicit control-center static route | Covered by control route. |
| `https://control.home.arpa/clawcontroller/*` | WebServer | `127.0.0.1:5001` | Claw controller backend | Backend route captured; health not separately checked. |
| `https://control.home.arpa/agent-chat/*` | WebServer | `127.0.0.1:8789` | Agent chat backend | Dashboard had a password query string; wiki keeps the secret-free route only. |
| `https://control.home.arpa/messages*` | WebServer | `127.0.0.1:8789` | Agent chat/messages backend | Backend route captured. |
| `https://control.home.arpa/rss-articles/*` | WebServer | `127.0.0.1:3001` | RSS Articles Node server | Backend route captured. |
| `https://control.home.arpa/exam-tool/*` | WebServer | `127.0.0.1:3002` | Exam tool route | Backend route captured. |
| `https://sandbox.home.arpa` | WebServer | `127.0.0.1:8788` | SEO intake/sandbox site | `/health` returned 200. |
| `http://192.168.1.26/` | WebServer `:80` site | Responds `web-01 is alive`; also serves selected control-center routes and `/sandbox/*` static files | Bare HTTP fallback and local route shim | `/health` returned 200. |
| `http://192.168.1.26/sandbox/*` | WebServer `:80` site | `/home/matt/web-01/sites/veronika-sandbox` | HTTP sandbox static path | Route captured from Caddyfile. |
| `https://paperclip.home.arpa` | WebServer | `192.168.1.11:3100` | Paperclip AI on Spark | `/health` returned 200. |
| `https://vwmedia.home.arpa` | WebServer | Static root `/mnt/aishareddrive/family-agents/shared/projects/vwmedia-site`; `/api/*` to `localhost:3003` | VWMedia site and API | `/health` returned HTTP 200 with static HTML fallback. |
| `https://spark.home.arpa` | WebServer | Health/respond route plus `/openclaw/*` to `192.168.1.11:18789` | Spark landing and OpenClaw proxy route | `/health` returned 200. |
| `https://spark.home.arpa/openclaw/*` | WebServer | `192.168.1.11:18789` | OpenClaw on Spark | Backend route captured; health not separately checked. |
| `https://hermes.home.arpa` | WebServer | `192.168.1.107:3004` | Hermes workspace service on VWHomeServer | `/health` returned 200. |
| `https://playwright.home.arpa` | WebServer | `192.168.1.11:8931` | Playwright MCP on Spark | `/health` returned 200. |
| `https://home.arpa` | WebServer | `/mnt/aishareddrive/family-agents/shared/projects/Home-dashboard` | Home Dashboard launchpad | `/health` returned 200. |
| `https://openwebui.home.arpa` | WebServer | `100.125.105.92:3000` | OpenWebUI on VWHomeServer via Tailscale address | `/health` returned 200. |
| `https://litellm.home.arpa` | WebServer | `localhost:4000` | LiteLLM UI/API proxy | `/health` returned 200. |
| `https://immich.home.arpa` | WebServer | `192.168.1.31:2283` | Immich Photos on Mac mini per Caddy comment | Configured, but `https://immich.home.arpa/health` failed to connect during 2026-06-28 check. |
| `https://vaultwarden.home.arpa:8443` | Ubuntu VM Server Docker Caddy | `vaultwarden:80` inside Docker network | Vaultwarden password vault | Root returned 200 from `vaultwarden.home.arpa:8443`. |

## Home Dashboard Launch Cards

These are from the live `https://home.arpa` dashboard as checked on 2026-06-28. The dashboard source is `/mnt/aishareddrive/family-agents/shared/projects/Home-dashboard/index.html` on WebServer.

| Dashboard Label | Link / Route | Backing Service Or Host | Capture Notes |
| --- | --- | --- | --- |
| Control Center | `https://control.home.arpa` | WebServer Caddy route to control center static app and related local handlers | Captured in reverse proxy routes. |
| Hermes | `https://hermes.home.arpa` | VWHomeServer `192.168.1.107:3004` | Captured in reverse proxy routes. |
| Agent Chat | `https://control.home.arpa/agent-chat/` | WebServer Caddy route to local agent chat backend | Dashboard currently includes a password-bearing query string; do not copy that secret into wiki/memory. Prefer a secret-free route plus proper auth. |
| Open WebUI | `https://openwebui.home.arpa` | VWHomeServer OpenWebUI container via Tailscale address `100.125.105.92:3000` | Captured in reverse proxy routes and Service Map. |
| Vaultwarden | `https://vaultwarden.home.arpa:8443` | Ubuntu VM Server / Pi-hole Docker host at `192.168.1.181`, Caddy/Vaultwarden stack | Dashboard provides the public route; exact Caddy config for this route still needs confirmation. |
| Paperclip | `https://paperclip.home.arpa` | DGX Spark `192.168.1.11:3100` | Captured in reverse proxy routes. |
| LiteLLM Models | `https://litellm.home.arpa/ui/?page=models` | WebServer LiteLLM Docker container on `:4000` | Auth-gated. |
| Immich Photos | `https://immich.home.arpa` | Mac mini / Immich-related host at `192.168.1.31` via DNS | Captured as Mac mini / Immich route; SSH not verified. |
| RAG Server Homepage | `http://192.168.1.107:8501` | VWHomeServer `rag-ui.service` Streamlit app | Add to Service Map; separate from RAG MCP on `:8005`. |
| Proxmox | `https://192.168.1.168:8006` | Proxmox homeserver | Captured in VM map and Service Map. |
| VWMedia | `https://vwmedia.home.arpa` | WebServer Caddy static site rooted in AISharedDrive, API to `localhost:3003` | Captured in reverse proxy routes. |
| PiHole Login | `http://192.168.1.181/admin/login` | Ubuntu VM Server / Pi-hole primary | Captured as Pi-hole primary. |
| Codex Analytics | `https://chatgpt.com/codex/cloud/settings/analytics` | External ChatGPT/Codex web app | External link, not a LAN service. |

## Service Map

| Service | Endpoint | Host | Notes |
| --- | --- | --- | --- |
| Memory MCP | `http://192.168.1.26:8006/mcp` | WebServer | Shared event/entity/wiki/graph backend. Plain HTTP without MCP stream headers returns expected `406`. |
| Native wiki files | `/mnt/aishareddrive/family-agents/memory/wiki/` | WebServer | Stores pages such as `memory-mcp.md` and `lan-machines.md`. |
| Pi-hole primary | `http://192.168.1.181/admin/` | Ubuntu VM Server | Docker Pi-hole. |
| Pi-hole2 | `http://192.168.1.26/admin/` | WebServer | Native `pihole-FTL.service`. |
| Pi-hole on Spark | `http://192.168.1.11/admin/` | DGX Spark | Native `pihole-FTL.service`; title `Pi-hole spark-f46c`. |
| LiteLLM | `http://192.168.1.26:4000`; `http://litellm.home.arpa:4000` | WebServer | Docker container `litellm`; API is auth-gated. |
| LLM Model Library | `http://192.168.1.107:8088` | VWHomeServer | Docker container; health checked 2026-06-28; library root `/models`, SQLite `/app-data/catalog.sqlite3`. |
| OpenWebUI | `http://192.168.1.107:3000`; `https://openwebui.home.arpa` | VWHomeServer | Docker container `openwebui`. |
| RAG MCP / retrieval | `http://192.168.1.107:8005/mcp/` | VWHomeServer | Systemd `rag-retrieval.service`; Qdrant on `:6333/:6334`; ingest worker on same host. |
| RAG UI | `http://192.168.1.107:8501` | VWHomeServer | Systemd `rag-ui.service`, Streamlit knowledge-base interface linked from `https://home.arpa`. |
| RAG helper services | `http://192.168.1.11:8003`, `http://192.168.1.11:8004` | DGX Spark | Reranker and sparse embedding services. |
| Spark Ollama | `http://192.168.1.11:11434` | DGX Spark | Public LAN Ollama service. |
| VWHomeServer model proxy ports | `http://192.168.1.107:11434`, `http://192.168.1.107:1234` | VWHomeServer | nginx listens, but `/api/tags` and `/v1/models` timed out during audit; verify before use. |
| LM Studio on Mac mini | `http://192.168.1.31:1234/v1/models` | Mac mini | OpenAI-compatible model list verified. Same model list also appeared at `192.168.1.10:1234`. |
| LM Studio on current MacBook | `http://192.168.1.204:1234/v1/models`; `http://192.168.1.249:1234/v1/models` | Matthew's MacBook Pro | OpenAI-compatible model list verified. |
| Home Assistant | `http://192.168.1.6:8123` | Home Assistant VM | HTTP title `Home Assistant`. |
| Nextcloud | `http://192.168.1.107/` | VWHomeServer | Snap Nextcloud Apache service; HTTP title `Nextcloud`. |
| Vaultwarden | Internal Docker behind Caddy on `192.168.1.181` | Ubuntu VM Server | Container `vaultwarden` healthy. Exact public route not confirmed in this audit. |
| WD Cloud Mirror media | `http://192.168.1.67:9000`, `http://192.168.1.67:32400` | WD Cloud Mirror | Twonky server and Plex unauthorized endpoint. |
| Hue bridge | `192.168.1.16` | Hue bridge | HTTP/HTTPS title `hue personal wireless lighting`. |

## Whole-LAN Discovery Snapshot

Pingable addresses on 2026-06-28:

`192.168.1.1`, `.6`, `.10`, `.11`, `.16`, `.21`, `.22`, `.26`, `.31`, `.58`, `.66`, `.67`, `.81`, `.95`, `.103`, `.105`, `.107`, `.112`, `.168`, `.169`, `.174`, `.180`, `.181`, `.185`, `.193`, `.204`, `.233`, `.249`.

| IP | Fingerprint | Current Interpretation |
| --- | --- | --- |
| `192.168.1.1` | `53,80,443,8080,8443`; HTTPS title `UniFi OS` | UniFi gateway/controller. |
| `192.168.1.6` | `8123`; title `Home Assistant` | Home Assistant VM 103. |
| `192.168.1.10` | `22,445,5000,5900,7000,1234`; AirTunes and same LM Studio model list as `.31` | Likely Mac mini alternate interface or related Mac host; verify identity before using. |
| `192.168.1.11` | `22,53,80,443,11434`; plus `3100,8003,8004,8931` | DGX Spark. |
| `192.168.1.16` | `80,443,8080`; Hue title | Philips Hue bridge. |
| `192.168.1.21` | `5000,7000`; AirTunes | Apple/AirPlay device, unknown identity. |
| `192.168.1.22` | `53,5000,7000`; AirTunes | Apple/AirPlay plus DNS responder, unknown identity. |
| `192.168.1.26` | `22,53,80,443,8006,4000`; reverse DNS `control.home.arpa` | WebServer / Pi-hole2 / Memory MCP. |
| `192.168.1.31` | `22,445,5000,5900,7000,1234`; reverse DNS `immich.home.arpa`; NetBIOS `MINI` | Mac mini. |
| `192.168.1.58` | Ping only in scanned ports | Unknown. |
| `192.168.1.66` | `80,8080`; HTTP 404/timeouts | Unknown web device. |
| `192.168.1.67` | `21,22,80,139,443,445,548,8080,9000,32400`; NetBIOS `WDMYCLOUDMIRROR` | WD Cloud Mirror. |
| `192.168.1.81` | `8080`; server `WebServer`, title `404 - Not Found` | Unknown web device. |
| `192.168.1.95` | Ping only in scanned ports | Unknown. |
| `192.168.1.103` | `21,80,443`; server `debut/1.20` redirects | Unknown device. |
| `192.168.1.105` | Ping only in scanned ports | Unknown. |
| `192.168.1.107` | `22,80,139,445,3000,3004,6333,6334,8005,8088,11434,1234` | VWHomeServer. |
| `192.168.1.112` | `80,443`; blank title | Unknown web device. |
| `192.168.1.168` | `22,8006` | Proxmox homeserver. |
| `192.168.1.169` | Ping only in scanned ports | Unknown. |
| `192.168.1.174` | `80,139,443,445,5357`; HTTPS title `UniFi OS`; Proxmox NFS storage source | Network NAS / AISharedDrive host. |
| `192.168.1.180` | `22,5000,7000`; AirTunes | Supplied as Matthew's MacBook Pro, but current MacBook is `.204/.249`; verify whether `.180` is stale or a third interface. |
| `192.168.1.181` | `22,53,80,443,8443`; reverse DNS `pi.hole` | Ubuntu VM Server / Pi-hole. |
| `192.168.1.185` | `53,5000,7000`; AirTunes | Apple/AirPlay plus DNS responder, unknown identity. |
| `192.168.1.193` | `80,443`; blank title | Unknown web device. |
| `192.168.1.204` | `22,445,5000,5900,7000,1234` | Matthew's MacBook Pro wired interface. |
| `192.168.1.233` | Ping only in scanned ports | Unknown. |
| `192.168.1.249` | `22,445,5000,5900,7000,1234` | Matthew's MacBook Pro Wi-Fi interface. |

## Documentation Index

- Memory MCP wiki integration: local repo `/Users/matthewwarren/Documents/Memory MCP/docs/memory-mcp-wiki-integration.md`.
- Memory MCP native page: `get_wiki_page("memory-mcp")`.
- Product documentation imported into RAG and Memory MCP: Pi-hole, Proxmox VE, Vaultwarden, LiteLLM, OpenClaw, Hermes Agent, Paperclip, and OpenAI Codex.
- LLM Model Library implementation history: Memory MCP entity `llm-model-library`.
- RAG operational gotchas: Memory MCP entities `rag-mcp`, `product-documentation-import`.

## Open Inventory Gaps

- Confirm identities for unknown pingable addresses: `.21`, `.22`, `.58`, `.66`, `.81`, `.95`, `.103`, `.105`, `.112`, `.169`, `.185`, `.193`, `.233`.
- Confirm whether `.10` is a second interface for the Mac mini and whether `.180` is stale or another MacBook interface.
- Fix or confirm SSH access for Mac mini and Matthew's MacBook Pro using the intended short usernames; supplied password did not work over SSH during the 2026-06-28 audit.
- Confirm exact external route for Vaultwarden on the `.181` Docker/Caddy host.
- Add owners/restart commands for every service that is expected to be agent-maintained.
- Decide whether Spark should be documented as a third Pi-hole resolver alongside `.181` and `.26`.
