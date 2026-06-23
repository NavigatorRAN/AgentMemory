# Hermes Agent llms-full

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/assets/files/llms-full-9bb4c2e97684f6ff105c755c93f4c9f8.txt
- Final URL: https://hermes-agent.nousresearch.com/docs/assets/files/llms-full-9bb4c2e97684f6ff105c755c93f4c9f8.txt
- Fetched at: 2026-06-23T14:21:51Z
- Content type: text/plain; charset=utf-8

## Extracted Text

# Hermes Agent — Full Documentation
This file is the entire Hermes Agent documentation concatenated for LLM context ingestion. Section order reflects docs-site navigation: Getting Started, Using Hermes, Features, Messaging, Integrations, Guides, Developer Guide, Reference, then everything else.
Canonical site: https://hermes-agent.nousresearch.com/docs
Short index: https://hermes-agent.nousresearch.com/docs/llms.txt
---
# Installation
Get Hermes Agent up and running in under two minutes!
## Quick Install
### With the Hermes Desktop installer on macOS or Windows (recommended)
To easily install the command-line and desktop applications, [download the Hermes Desktop installer](https://hermes-agent.nousresearch.com/) from our website and run it.
### Without Hermes Desktop:
For a command-line only install without Hermes Desktop, run:
#### Linux / macOS / WSL2 / Android (Termux)
```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```
#### Windows (native)
Run in powershell:
```powershell
iex (irm https://hermes-agent.nousresearch.com/install.ps1)
If you want to install & run Hermes Desktop after a command-line only install, simply run
hermes desktop
### What the Installer Does
The installer handles everything automatically — all dependencies (Python, Node.js, ripgrep, ffmpeg), the repo clone, virtual environment, global `hermes` command setup, and LLM provider configuration. By the end, you're ready to chat.
#### Install Layout
Where the installer puts things depends on whether you're installing as a normal user or as root:
| Installer | Code lives at | `hermes` binary | Data directory |
|---|---|---|---|
| pip install | Python site-packages | `~/.local/bin/hermes` (console_scripts) | `~/.hermes/` |
| Per-user (git installer) | `~/.hermes/hermes-agent/` | `~/.local/bin/hermes` (symlink) | `~/.hermes/` |
| Root-mode (`sudo curl … \| sudo bash`) | `/usr/local/lib/hermes-agent/` | `/usr/local/bin/hermes` | `/root/.hermes/` (or `$HERMES_HOME`) |
The root-mode **FHS layout** (`/usr/local/lib/…`, `/usr/local/bin/hermes`) matches where other system-wide developer tools land on Linux. It's useful for shared-machine deployments where one system install should serve every user. Per-user config (auth, skills, sessions) still lives under each user's `~/.hermes/` or explicit `HERMES_HOME`.
### After Installation
Reload your shell and start chatting:
source ~/.bashrc # or: source ~/.zshrc
hermes # Start chatting!
To reconfigure individual settings later, use the dedicated commands:
hermes model # Choose your LLM provider and model
hermes tools # Configure which tools are enabled
hermes gateway setup # Set up messaging platforms
hermes config set # Set individual config values
hermes setup # Or run the full setup wizard to configure everything at once
:::tip Fastest path: Nous Portal
One subscription covers 300+ models plus the [Tool Gateway](/user-guide/features/tool-gateway) (web search, image generation, TTS, cloud browser). Skip the per-tool key juggling:
hermes setup --portal
That logs you in, sets Nous as your provider, and turns on the Tool Gateway in one command.
:::
## Prerequisites
**Installer:** On non-Windows platforms, the only prerequisite is **Git**. On Linux, also make sure `curl` and `xz-utils` are available (the installer downloads Node.js as a `.tar.xz` archive). The desktop app additionally requires `g++` (or `build-essential` on Debian/Ubuntu) to compile native modules. The installer automatically handles everything else:
- **uv** (fast Python package manager)
- **Python 3.11** (via uv, no sudo needed)
- **Node.js v22** (for browser automation and WhatsApp bridge)
- **ripgrep** (fast file search)
- **ffmpeg** (audio format conversion for TTS)
:::info
You do **not** need to install Python, Node.js, ripgrep, or ffmpeg manually. The installer detects what's missing and installs it for you. Just make sure `git` is available (`git --version`). On Linux, ensure `curl` and `xz-utils` are installed (`sudo apt install curl xz-utils` on Debian/Ubuntu). For the desktop app, also install `build-essential` (`sudo apt install build-essential`).
:::tip Nix users
If you use Nix (on NixOS, macOS, or Linux), there's a dedicated setup path with a Nix flake, declarative NixOS module, and optional container mode. See the **[Nix & NixOS Setup](./nix-setup.md)** guide.
## Manual / Developer Installation
If you want to clone the repo and install from source — for contributing, running from a specific branch, or having full control over the virtual environment — see the [Development Setup](../developer-guide/contributing.md#development-setup) section in the Contributing guide.
## Non-Sudo / System Service User Installs
Running Hermes as a dedicated unprivileged user (e.g. a `hermes` systemd service account, or any user without `sudo` access) is supported. The only thing on the install path that genuinely needs root is Playwright's `--with-deps` step, which `apt`-installs shared libraries (`libnss3`, `libxkbcommon`, etc.) used by Chromium. The installer detects whether sudo is available and gracefully degrades when it isn't — it will install the Chromium binary into the service user's own Playwright cache and print the exact command an administrator needs to run separately.
**Recommended split (Debian/Ubuntu):**
1. **One time, as an admin user with sudo**, install the system libraries Chromium needs:
sudo npx playwright install-deps chromium
(You can run this from anywhere — `npx` will fetch Playwright on the fly.)
2. **As the unprivileged service user**, run the regular installer. It will detect the missing sudo, skip `--with-deps`, and install Chromium into the user's local Playwright cache:
If you want to skip the Playwright step entirely — for example because you're running headless and don't need browser automation — pass `--skip-browser`:
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash -s -- --skip-browser
3. **Make `hermes` available to the service user's shells.** The installer writes the launcher to `~/.local/bin/hermes`. System service accounts often have a minimal PATH that doesn't include `~/.local/bin`. Either add it to the user's environment, or symlink the launcher into a system location:
# Option A — add to the service user's profile
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
# Option B — symlink system-wide (run as an admin)
sudo ln -s /home/hermes/.hermes/hermes-agent/venv/bin/hermes /usr/local/bin/hermes
4. **Verify:** `hermes doctor` should now run cleanly. If you get `ModuleNotFoundError: No module named 'dotenv'`, you're invoking the repo source `hermes` file (`~/.hermes/hermes-agent/hermes`) with system Python instead of the venv launcher (`~/.hermes/hermes-agent/venv/bin/hermes`) — fix step 3.
The same pattern works on Arch (the installer uses pacman with the same sudo-detection logic), Fedora/RHEL, and openSUSE — those distros don't support `--with-deps` at all, so an administrator always installs the system libraries separately. The relevant `dnf`/`zypper` commands are printed by the installer.
## Troubleshooting
| Problem | Solution |
|---------|----------|
| `hermes: command not found` | Reload your shell (`source ~/.bashrc`) or check PATH |
| `API key not set` | Run `hermes model` to configure your provider, or `hermes config set OPENROUTER_API_KEY your_key` |
| Missing config after update | Run `hermes config check` then `hermes config migrate` |
For more diagnostics, run `hermes doctor` — it will tell you exactly what's missing and how to fix it.
## Install method auto-detection
Hermes auto-detects whether it was installed via `pip`, the git installer, Homebrew, or NixOS, and `hermes update` prints the matching update command for that path. There's no env var to set — the detection is based on the install layout (Python site-packages, `~/.hermes/hermes-agent/`, Homebrew prefix, or Nix store path). `hermes doctor` also surfaces the detected method under its environment summary.
# Quickstart
This guide gets you from zero to a working Hermes setup that survives real use. Install, choose a provider, verify a working chat, and know exactly what to do when something breaks.
## Prefer to watch?
**Onchain AI Garage** put together a Masterclass walkthrough of installation, setup, and basic commands — a good companion to this page if you'd rather follow along on video. For more, see the full [Hermes Agent Tutorials & Use Cases](https://www.youtube.com/playlist?list=PLmpUb_PWAkDxewld5ZYyKifuHxgIbiq2d) playlist.
## Who this is for
- Brand new and want the shortest path to a working setup
- Switching providers and don't want to lose time to config mistakes
- Setting up Hermes for a team, bot, or always-on workflow
- Tired of "it installed, but it still does nothing"
## The fastest path
Pick the row that matches your goal:
| Goal | Do this first | Then do this |
|---|---|---|
| I just want Hermes working on my machine | `hermes setup` | Run a real chat and verify it responds |
| I already know my provider | `hermes model` | Save the config, then start chatting |
| I want a bot or always-on setup | `hermes gateway setup` after CLI works | Connect Telegram, Discord, Slack, or another platform |
| I want a local or self-hosted model | `hermes model` → custom endpoint | Verify the endpoint, model name, and context length |
| I want multi-provider fallback | `hermes model` first | Add routing and fallback only after the base chat works |
**Rule of thumb:** if Hermes cannot complete a normal chat, do not add more features yet. Get one clean conversation working first, then layer on gateway, cron, skills, voice, or routing.
## 1. Install Hermes Agent
:::tip Android / Termux
If you're installing on a phone, see the dedicated [Termux guide](./termux.md) for the tested manual path, supported extras, and current Android-specific limitations.
After it finishes, reload your shell:
source ~/.bashrc # or source ~/.zshrc
For detailed installation options, prerequisites, and troubleshooting, see the [Installation guide](./installation.md).
## 2. Choose a Provider
The single most important setup step. Use `hermes model` to walk through the choice interactively:
hermes model
:::tip Easiest path: Nous Portal
One subscription covers 300+ models plus the [Tool Gateway](../user-guide/features/tool-gateway.md) (web search, image generation, TTS, cloud browser). On a fresh install:
:::info Setup modes
On a fresh install, `hermes setup` offers three modes:
- **Quick Setup (Nous Portal)** — free OAuth login, no API keys; sets up a model plus the Tool Gateway tools. The recommended fast path.
- **Full Setup** — walk through every provider, tool, and option yourself (bring your own keys).
- **Blank Slate** — everything starts **off** except the bare minimum needed to run an agent: **provider & model, the File Operations toolset, and the Terminal toolset**. No web, browser, code execution, vision, memory, delegation, cron, skills, plugins, or MCP servers — and compression, checkpoints, smart routing, and memory capture are all disabled. After the minimal baseline is applied, you choose one of two paths: **start with everything disabled** (finish now with the minimal agent), or **walk through all configurations** (opt in to tools, skills, plugins, MCP, and messaging). Pick this when you want a minimal, fully-controlled agent and intend to enable only exactly what you need.
Blank Slate writes an explicit `platform_toolsets.cli` list plus `agent.disabled_toolsets`, so nothing you didn't choose ever loads — not even after `hermes update`. Re-enable anything later with `hermes tools`, seed skills with `hermes skills opt-in --sync`, or tune settings with `hermes setup agent`.
Good defaults:
| Provider | What it is | How to set up |
|----------|-----------|---------------|
| **Nous Portal** | Subscription-based, zero-config | OAuth login via `hermes model` |
| **OpenAI Codex** | ChatGPT OAuth, uses Codex models | Device code auth via `hermes model` |
| **Anthropic** | Claude models directly — Max plan + extra usage credits (OAuth), or API key for pay-per-token | `hermes model` → OAuth login (requires Max + extra credits), or an Anthropic API key |
| **OpenRouter** | Multi-provider routing across many models | Enter your API key |
| **Z.AI** | GLM / Zhipu-hosted models | Set `GLM_API_KEY` / `ZAI_API_KEY` (also accepts `Z_AI_API_KEY`) |
| **Kimi / Moonshot** | Moonshot-hosted coding and chat models | Set `KIMI_API_KEY` (or the Kimi-Coding-specific `KIMI_CODING_API_KEY`) |
| **Kimi / Moonshot China** | China-region Moonshot endpoint | Set `KIMI_CN_API_KEY` |
| **Arcee AI** | Trinity models | Set `ARCEEAI_API_KEY` |
| **GMI Cloud** | Multi-model direct API | Set `GMI_API_KEY` |
| **MiniMax (OAuth)** | MiniMax frontier model via browser OAuth — no API key needed (model name in `hermes_cli/models.py` may change between releases) | `hermes model` → MiniMax (OAuth) |
| **MiniMax** | International MiniMax endpoint | Set `MINIMAX_API_KEY` |
| **MiniMax China** | China-region MiniMax endpoint | Set `MINIMAX_CN_API_KEY` |
| **Alibaba Cloud** | Qwen models via DashScope | Set `DASHSCOPE_API_KEY` (Qwen Coding Plan also accepts `ALIBABA_CODING_PLAN_API_KEY`) |
| **Hugging Face** | 20+ open models via unified router (Qwen, DeepSeek, Kimi, etc.) | Set `HF_TOKEN` |
| **AWS Bedrock** | Claude, Nova, Llama, DeepSeek via native Converse API | IAM role or `aws configure` ([guide](../guides/aws-bedrock.md)) |
| **Azure Foundry** | Azure AI Foundry-hosted models | Set `AZURE_FOUNDRY_API_KEY` + `AZURE_FOUNDRY_BASE_URL` |
| **Google AI Studio** | Gemini models via direct API | Set `GOOGLE_API_KEY` / `GEMINI_API_KEY` |
| **xAI** | Grok models via direct API | Set `XAI_API_KEY` |
| **xAI Grok OAuth** | SuperGrok / Premium+ subscription, no API key needed | `hermes model` → xAI Grok OAuth |
| **NovitaAI** | Multi-model API gateway | Set `NOVITA_API_KEY` |
| **StepFun** | Step Plan models | Set `STEPFUN_API_KEY` |
| **Xiaomi MiMo** | Xiaomi-hosted models | Set `XIAOMI_API_KEY` |
| **Tencent TokenHub** | Tencent-hosted models | Set `TOKENHUB_API_KEY` |
| **Ollama Cloud** | Managed Ollama-hosted models | Set `OLLAMA_API_KEY` |
| **LM Studio** | Local desktop app exposing an OpenAI-compatible API | Set `LM_API_KEY` (and `LM_BASE_URL` if non-default) |
| **Qwen OAuth** | Qwen Portal browser OAuth — no API key needed | `hermes model` → Qwen OAuth |
| **Kilo Code** | KiloCode-hosted models | Set `KILOCODE_API_KEY` |
| **OpenCode Zen** | Pay-as-you-go access to curated models | Set `OPENCODE_ZEN_API_KEY` |
| **OpenCode Go** | $10/month subscription for open models | Set `OPENCODE_GO_API_KEY` |
| **DeepSeek** | Direct DeepSeek API access | Set `DEEPSEEK_API_KEY` |
| **NVIDIA NIM** | Nemotron models via build.nvidia.com or local NIM | Set `NVIDIA_API_KEY` (optional: `NVIDIA_BASE_URL`) |
| **GitHub Copilot** | GitHub Copilot subscription (GPT-5.x, Claude, Gemini, etc.) | OAuth via `hermes model`, or `COPILOT_GITHUB_TOKEN` / `GH_TOKEN` |
| **GitHub Copilot ACP** | Copilot ACP agent backend (spawns local `copilot` CLI) | `hermes model` (requires `copilot` CLI + `copilot login`) |
| **Custom Endpoint** | VLLM, SGLang, Ollama, or any OpenAI-compatible API | Set base URL + API key |
For most first-time users: choose a provider, accept the defaults unless you know why you're changing them. The full provider catalog with env vars and setup steps lives on the [Providers](../integrations/providers.md) page.
:::caution Minimum context: 64K tokens
Hermes Agent requires a model with at least **64,000 tokens** of context. Models with smaller windows cannot maintain enough working memory for multi-step tool-calling workflows and will be rejected at startup. Most hosted models (Claude, GPT, Gemini, Qwen, DeepSeek) meet this easily. If you're running a local model, set its context size to at least 64K (e.g. `--ctx-size 65536` for llama.cpp or `-c 65536` for Ollama).
:::tip
You can switch providers at any time with `hermes model` — no lock-in. For a full list of all supported providers and setup details, see [AI Providers](../integrations/providers.md).
### How settings are stored
Hermes separates secrets from normal config:
- **Secrets and tokens** → `~/.hermes/.env`
- **Non-secret settings** → `~/.hermes/config.yaml`
The easiest way to set values correctly is through the CLI:
hermes config set model anthropic/claude-opus-4.6
hermes config set terminal.backend docker
hermes config set OPENROUTER_API_KEY sk-or-...
The right value goes to the right file automatically.
## 3. Run Your First Chat
hermes # classic CLI
hermes --tui # modern TUI (recommended)
You'll see a welcome banner with your model, available tools, and skills. Use a prompt that's specific and easy to verify:
:::tip Pick your interface
Hermes ships with two terminal interfaces: the classic `prompt_toolkit` CLI and a newer [TUI](../user-guide/tui.md) with modal overlays, mouse selection, and non-blocking input. Both share the same sessions, slash commands, and config — try each with `hermes` vs `hermes --tui`.
Summarize this repo in 5 bullets and tell me what the main entrypoint is.
Check my current directory and tell me what looks like the main project file.
Help me set up a clean GitHub PR workflow for this codebase.
**What success looks like:**
- The banner shows your chosen model/provider
- Hermes replies without error
- It can use a tool if needed (terminal, file read, web search)
- The conversation continues normally for more than one turn
If that works, you're past the hardest part.
## 4. Verify Sessions Work
Before moving on, make sure resume works:
hermes --continue # Resume the most recent session
hermes -c # Short form
That should bring you back to the session you just had. If it doesn't, check whether you're in the same profile and whether the session actually saved. This matters later when you're juggling multiple setups or machines.
## 5. Try Key Features
### Use the terminal
❯ What's my disk usage? Show the top 5 largest directories.
The agent runs terminal commands on your behalf and shows results.
### Slash commands
Type `/` to see an autocomplete dropdown of all commands:
| Command | What it does |
|---------|-------------|
| `/help` | Show all available commands |
| `/tools` | List available tools |
| `/model` | Switch models interactively |
| `/personality pirate` | Try a fun personality |
| `/save` | Save the conversation |
### Multi-line input
Press `Alt+Enter`, `Ctrl+J`, or `Shift+Enter` to add a new line. `Shift+Enter` requires a terminal that sends it as a distinct sequence (Kitty / foot / WezTerm / Ghostty by default; iTerm2 / Alacritty / VS Code terminal once the Kitty keyboard protocol is enabled). `Alt+Enter` and `Ctrl+J` work in every terminal.
### Interrupt the agent
If the agent is taking too long, type a new message and press Enter — it interrupts the current task and switches to your new instructions. `Ctrl+C` also works.
## 6. Add the Next Layer
Only after the base chat works. Pick what you need:
### Bot or shared assistant
hermes gateway setup # Interactive platform configuration
Connect [Telegram](/user-guide/messaging/telegram), [Discord](/user-guide/messaging/discord), [Slack](/user-guide/messaging/slack), [WhatsApp](/user-guide/messaging/whatsapp), [Signal](/user-guide/messaging/signal), [Email](/user-guide/messaging/email), or [Home Assistant](/user-guide/messaging/homeassistant), or [Microsoft Teams](/user-guide/messaging/teams).
### Automation and tools
- `hermes tools` — tune tool access per platform
- `hermes skills` — browse and install reusable workflows
- Cron — only after your bot or CLI setup is stable
### Sandboxed terminal
For safety, run the agent in a Docker container or on a remote server:
hermes config set terminal.backend docker # Docker isolation
hermes config set terminal.backend ssh # Remote server
### Voice mode
# From the Hermes install directory (the curl installer placed it at
# ~/.hermes/hermes-agent on Linux/macOS or %LOCALAPPDATA%\hermes\hermes-agent on Windows):
cd ~/.hermes/hermes-agent
uv pip install -e ".[voice]"
# Includes faster-whisper for free local speech-to-text
Then in the CLI: `/voice on`. Press `Ctrl+B` to record. See [Voice Mode](../user-guide/features/voice-mode.md).
### Skills
Skills are on-demand instruction documents that teach Hermes how to do a specific task — deploy to Kubernetes, open a GitHub PR, fine-tune a model, search for GIFs. Each is a `SKILL.md` file with a name, a description, and a step-by-step procedure. The agent reads the short descriptions for free and only loads a skill's full content when a task actually calls for it, so adding skills doesn't bloat every request.
Hermes ships with a catalog of bundled skills already installed in `~/.hermes/skills/`. You can add more from the Skills Hub, or write your own.
**Browse and install from the hub:**
hermes skills browse # list everything available
hermes skills search kubernetes # find skills by keyword
hermes skills install openai/skills/k8s # install one (runs a security scan first)
The install argument is a `source/path` slug from the hub — `openai/skills/k8s` means the `k8s` skill from OpenAI's catalog. `hermes skills browse` shows the exact slugs to use.
**Use a skill** — every installed skill becomes a slash command automatically:
/k8s deploy the staging manifest # run the skill with a request
/k8s # load it and let Hermes ask what you need
This works in the CLI and in any connected messaging platform. You don't have to install everything up front — the agent picks the right bundled skill on its own during normal conversation when a task matches one.
See [Skills System](../user-guide/features/skills.md) for writing your own, external skill directories, and the full hub source list.
### MCP servers
```yaml
# Add to ~/.hermes/config.yaml
mcp_servers:
github:
command: npx
args: ["-y", "@modelcontextprotocol/server-github"]
env:
GITHUB_PERSONAL_ACCESS_TOKEN: "ghp_xxx"
### Editor integration (ACP)
ACP support ships with the standard `[all]` extras, so the curl installer already includes it. Just run:
hermes acp
(If you installed without `[all]`, run `cd ~/.hermes/hermes-agent && uv pip install -e ".[acp]"` first.)
See [ACP Editor Integration](../user-guide/features/acp.md).
## Common Failure Modes
These are the problems that waste the most time:
| Symptom | Likely cause | Fix |
| Hermes opens but gives empty or broken replies | Provider auth or model selection is wrong | Run `hermes model` again and confirm provider, model, and auth |
| Custom endpoint "works" but returns garbage | Wrong base URL, model name, or not actually OpenAI-compatible | Verify the endpoint in a separate client first |
| Gateway starts but nobody can message it | Bot token, allowlist, or platform setup is incomplete | Re-run `hermes gateway setup` and check `hermes gateway status` |
| `hermes --continue` can't find old session | Switched profiles or session never saved | Check `hermes sessions list` and confirm you're in the right profile |
| Model unavailable or odd fallback behavior | Provider routing or fallback settings are too aggressive | Keep routing off until the base provider is stable |
| `hermes doctor` flags config problems | Config values are missing or stale | Fix the config, retest a plain chat before adding features |
## Recovery Toolkit
When something feels off, use this order:
1. `hermes doctor`
2. `hermes model`
3. `hermes setup`
4. `hermes sessions list`
5. `hermes --continue`
6. `hermes gateway status`
That sequence gets you from "broken vibes" back to a known state fast.
## Quick Reference
| Command | Description |
| `hermes` | Start chatting |
| `hermes model` | Choose your LLM provider and model |
| `hermes tools` | Configure which tools are enabled per platform |
| `hermes setup` | Full setup wizard (configures everything at once) |
| `hermes doctor` | Diagnose issues |
| `hermes update` | Update to latest version |
| `hermes gateway` | Start the messaging gateway |
| `hermes --continue` | Resume last session |
## Next Steps
- **[CLI Guide](../user-guide/cli.md)** — Master the terminal interface
- **[Configuration](../user-guide/configuration.md)** — Customize your setup
- **[Messaging Gateway](../user-guide/messaging/index.md)** — Connect Telegram, Discord, Slack, WhatsApp, Signal, Email, Home Assistant, Teams, and more
- **[Tools & Toolsets](../user-guide/features/tools.md)** — Explore available capabilities
- **[AI Providers](../integrations/providers.md)** — Full provider list and setup details
- **[Skills System](../user-guide/features/skills.md)** — Reusable workflows and knowledge
- **[Tips & Best Practices](../guides/tips.md)** — Power user tips
# Learning Path
Hermes Agent can do a lot — CLI assistant, Telegram/Discord bot, task automation, RL training, and more. This page helps you figure out where to start and what to read based on your experience level and what you're trying to accomplish.
:::tip Start Here
If you haven't installed Hermes Agent yet, begin with the [Installation guide](/getting-started/installation) and then run through the [Quickstart](/getting-started/quickstart). Everything below assumes you have a working installation.
:::tip First-time provider setup
First-time users almost always want `hermes setup --portal` — one OAuth covers a model plus the four Tool Gateway tools (search/image/TTS/browser). See [Nous Portal](/integrations/nous-portal).
## How to Use This Page
- **Know your level?** Jump to the [experience-level table](#by-experience-level) and follow the reading order for your tier.
- **Have a specific goal?** Skip to [By Use Case](#by-use-case) and find the scenario that matches.
- **Just browsing?** Check the [Key Features](#key-features-at-a-glance) table for a quick overview of everything Hermes Agent can do.
## By Experience Level
| Level | Goal | Recommended Reading | Time Estimate |
| **Beginner** | Get up and running, have basic conversations, use built-in tools | [Installation](/getting-started/installation) → [Quickstart](/getting-started/quickstart) → [CLI Usage](/user-guide/cli) → [Configuration](/user-guide/configuration) | ~1 hour |
| **Intermediate** | Set up messaging bots, use advanced features like memory, cron jobs, and skills | [Sessions](/user-guide/sessions) → [Messaging](/user-guide/messaging) → [Tools](/user-guide/features/tools) → [Skills](/user-guide/features/skills) → [Memory](/user-guide/features/memory) → [Cron](/user-guide/features/cron) | ~2–3 hours |
| **Advanced** | Build custom tools, create skills, train models with RL, contribute to the project | [Architecture](/developer-guide/architecture) → [Adding Tools](/developer-guide/adding-tools) → [Creating Skills](/developer-guide/creating-skills) → [Contributing](/developer-guide/contributing) | ~4–6 hours |
## By Use Case
Pick the scenario that matches what you want to do. Each one links you to the relevant docs in the order you should read them.
### "I want a CLI coding assistant"
Use Hermes Agent as an interactive terminal assistant for writing, reviewing, and running code.
1. [Installation](/getting-started/installation)
2. [Quickstart](/getting-started/quickstart)
3. [CLI Usage](/user-guide/cli)
4. [Code Execution](/user-guide/features/code-execution)
5. [Context Files](/user-guide/features/context-files)
6. [Tips & Tricks](/guides/tips)
Pass files directly into your conversation with context files. Hermes Agent can read, edit, and run code in your projects.
### "I want a Telegram/Discord bot"
Deploy Hermes Agent as a bot on your favorite messaging platform.
2. [Configuration](/user-guide/configuration)
3. [Messaging Overview](/user-guide/messaging)
4. [Telegram Setup](/user-guide/messaging/telegram)
5. [Discord Setup](/user-guide/messaging/discord)
6. [Voice Mode](/user-guide/features/voice-mode)
7. [Use Voice Mode with Hermes](/guides/use-voice-mode-with-hermes)
8. [Security](/user-guide/security)
For full project examples, see:
- [Daily Briefing Bot](/guides/daily-briefing-bot)
- [Team Telegram Assistant](/guides/team-telegram-assistant)
### "I want to automate tasks"
Schedule recurring tasks, run batch jobs, or chain agent actions together.
1. [Quickstart](/getting-started/quickstart)
2. [Cron Scheduling](/user-guide/features/cron)
3. [Batch Processing](/user-guide/features/batch-processing)
4. [Delegation](/user-guide/features/delegation)
5. [Hooks](/user-guide/features/hooks)
Cron jobs let Hermes Agent run tasks on a schedule — daily summaries, periodic checks, automated reports — without you being present.
### "I want to build custom tools/skills"
Extend Hermes Agent with your own tools and reusable skill packages.
1. [Plugins](/user-guide/features/plugins)
2. [Build a Hermes Plugin](/guides/build-a-hermes-plugin)
3. [Tools Overview](/user-guide/features/tools)
4. [Skills Overview](/user-guide/features/skills)
5. [MCP (Model Context Protocol)](/user-guide/features/mcp)
6. [Architecture](/developer-guide/architecture)
7. [Adding Tools](/developer-guide/adding-tools)
8. [Creating Skills](/developer-guide/creating-skills)
For most custom tool creation, start with plugins. The [Adding Tools](/developer-guide/adding-tools)
page is for built-in Hermes core development, not the usual user/custom-tool path.
### "I want to train models"
Use reinforcement learning to fine-tune model behavior with Hermes Agent's RL training pipeline (powered by [Atropos](https://github.com/NousResearch/atropos)).
3. [Atropos RL Environments](https://github.com/NousResearch/atropos) (external)
4. [Provider Routing](/user-guide/features/provider-routing)
5. [Architecture](/developer-guide/architecture)
RL training works best when you already understand the basics of how Hermes Agent handles conversations and tool calls. Run through the Beginner path first if you're new.
### "I want to use it as a Python library"
Integrate Hermes Agent into your own Python applications programmatically.
3. [Python Library Guide](/guides/python-library)
4. [Architecture](/developer-guide/architecture)
5. [Tools](/user-guide/features/tools)
6. [Sessions](/user-guide/sessions)
## Key Features at a Glance
Not sure what's available? Here's a quick directory of major features:
| Feature | What It Does | Link |
| **Tools** | Built-in tools the agent can call (file I/O, search, shell, etc.) | [Tools](/user-guide/features/tools) |
| **Skills** | Installable plugin packages that add new capabilities | [Skills](/user-guide/features/skills) |
| **Memory** | Persistent memory across sessions | [Memory](/user-guide/features/memory) |
| **Context Files** | Feed files and directories into conversations | [Context Files](/user-guide/features/context-files) |
| **MCP** | Connect to external tool servers via Model Context Protocol | [MCP](/user-guide/features/mcp) |
| **Cron** | Schedule recurring agent tasks | [Cron](/user-guide/features/cron) |
| **Delegation** | Spawn sub-agents for parallel work | [Delegation](/user-guide/features/delegation) |
| **Code Execution** | Run Python scripts that call Hermes tools programmatically | [Code Execution](/user-guide/features/code-execution) |
| **Browser** | Web browsing and scraping | [Browser](/user-guide/features/browser) |
| **Hooks** | Event-driven callbacks and middleware | [Hooks](/user-guide/features/hooks) |
| **Batch Processing** | Process multiple inputs in bulk | [Batch Processing](/user-guide/features/batch-processing) |
| **Provider Routing** | Route requests across multiple LLM providers | [Provider Routing](/user-guide/features/provider-routing) |
## What to Read Next
Based on where you are right now:
- **Just finished installing?** → Head to the [Quickstart](/getting-started/quickstart) to run your first conversation.
- **Completed the Quickstart?** → Read [CLI Usage](/user-guide/cli) and [Configuration](/user-guide/configuration) to customize your setup.
- **Comfortable with the basics?** → Explore [Tools](/user-guide/features/tools), [Skills](/user-guide/features/skills), and [Memory](/user-guide/features/memory) to unlock the full power of the agent.
- **Setting up for a team?** → Read [Security](/user-guide/security) and [Sessions](/user-guide/sessions) to understand access control and conversation management.
- **Ready to build?** → Jump into the [Developer Guide](/developer-guide/architecture) to understand the internals and start contributing.
- **Want practical examples?** → Check out the [Guides](/guides/tips) section for real-world projects and tips.
You don't need to read everything. Pick the path that matches your goal, follow the links in order, and you'll be productive quickly. You can always come back to this page to find your next step.
# Updating & Uninstalling
## Updating
### Git installs
Update to the latest version with a single command:
hermes update
This pulls the latest code from `main`, updates dependencies, and prompts you to configure any new options that were added since your last update.
### pip installs
PyPI releases track **tagged versions** (major and minor releases), not every commit on `main`. Check for updates and upgrade with:
hermes update --check # see if a newer release is on PyPI
hermes update # runs pip install --upgrade hermes-agent
Or manually:
pip install --upgrade hermes-agent # or: uv pip install --upgrade hermes-agent
`hermes update` automatically detects new configuration options and prompts you to add them. If you skipped that prompt, you can manually run `hermes config check` to see missing options, then `hermes config migrate` to interactively add them.
### What happens during an update (git installs)
When you run `hermes update`, the following steps occur:
1. **Pairing-data snapshot** — a lightweight pre-update state snapshot is saved (covers `~/.hermes/pairing/`, Feishu comment rules, and other state files that get modified at runtime). Recoverable via the snapshot restore flow described under [Snapshots and rollback](../user-guide/checkpoints-and-rollback.md), or by extracting the most recent quick-snapshot zip Hermes wrote next to your `~/.hermes/` directory.
2. **Git pull** — pulls the latest code from the `main` branch and updates submodules
3. **Post-pull syntax validation + auto-rollback** — after the pull, Hermes compiles the eight critical files every `hermes` invocation imports at startup. If any fails to parse (e.g. an orphan merge-conflict marker, an accidentally truncated file), Hermes runs `git reset --hard ` to roll the install back so your shell stays bootable. Re-run `hermes update` once the upstream fix lands.
4. **Dependency install** — runs `uv pip install -e ".[all]"` to pick up new or changed dependencies
5. **Config migration** — detects new config options added since your version and prompts you to set them
6. **Gateway auto-restart** — running gateways are refreshed after the update completes so the new code takes effect immediately. Service-managed gateways (systemd on Linux, launchd on macOS) are restarted through the service manager. Manual gateways are relaunched automatically when Hermes can map the running PID back to a profile.
### Updating against a non-default branch: `--branch`
By default `hermes update` tracks `origin/main`. Pass `--branch ` to update against a different branch — useful for QA channels, feature branches, or release-candidate testing:
hermes update --branch release-candidate
hermes update --check --branch experimental # preview behindness only
If your local checkout is on a different branch, Hermes auto-stashes any uncommitted work, switches HEAD to the target branch, and then pulls. Branches that don't exist locally are auto-tracked from `origin/ ` (`git checkout -B origin/ `). Branches that don't exist anywhere fail cleanly — your stashed changes are restored before exit so you're never stranded in a weird state. The `main`-only fork-upstream sync logic is automatically skipped on non-`main` branches.
### Local changes on non-interactive updates
When you run `hermes update` in a terminal, Hermes stashes any uncommitted source-tree changes, pulls, then **asks** whether to restore them — exactly as it always has. Nothing changes for interactive updates.
When the update runs **without a terminal** — from the desktop/chat app's "Update" button or a gateway-triggered update — there's no prompt to answer. The `updates.non_interactive_local_changes` setting decides what happens to your stashed changes:
# ~/.hermes/config.yaml
updates:
non_interactive_local_changes: stash # default: keep + auto-restore
# non_interactive_local_changes: discard # throw local source edits away
- `stash` (default) — auto-stash, pull, then auto-restore your changes on top of the updated code. Nothing is lost; if a restore hits conflicts they're preserved in a git stash for manual recovery.
- `discard` — auto-stash and drop the stash after the pull, so the update always lands on a clean tree. Use this only on machines where you never intend to keep local edits to the Hermes source. It stash-drops (not `git reset --hard` + `git clean -fd`), so ignored paths like `node_modules`, `venv`, and build outputs are never touched.
In the desktop app this is **Settings → Advanced → In-App Update Local Changes**.
### Preview-only: `hermes update --check`
Want to know if an update is available before pulling? Run `hermes update --check` — for git installs it fetches and compares commits against `origin/main`; for pip installs it queries PyPI for the latest release. No files are modified, no gateway is restarted. Useful in scripts and cron jobs that gate on "is there an update".
### Full pre-update backup: `--backup`
For high-value profiles (production gateways, shared team installs) you can opt into a full pre-pull backup of `HERMES_HOME` (config, auth, sessions, skills, pairing):
hermes update --backup
Or make it the default for every run:
pre_update_backup: true
`--backup` was the always-on behavior in earlier builds, but it was adding minutes to every update on large homes, so it's now opt-in. The lightweight pairing-data snapshot above still runs unconditionally.
### Windows: another `hermes.exe` is running
On Windows, `hermes update` will refuse to run if it detects another `hermes.exe` process holding the venv's entry-point executable open — most commonly the Hermes Desktop app's spawned backend, an open `hermes` REPL in another terminal, or a running gateway:
$ hermes update
✗ Another hermes.exe is running:
PID 12345 hermes.exe
Updating now would fail to overwrite ...\venv\Scripts\hermes.exe because
Windows blocks REPLACE on a running executable.
Close Hermes Desktop, exit any open `hermes` REPLs, and
stop the gateway (`hermes gateway stop`) before retrying.
Override with `hermes update --force` if you've already
confirmed those processes will not write to the venv.
Close the listed processes and re-run. If you're sure the concurrent process won't interfere (rare — usually only useful when an antivirus shim is mis-attributed), pass `--force` to skip the check. In that case the updater will still retry the `.exe` rename with exponential backoff and, on stubborn locks, schedule the replacement for next reboot via `MoveFileEx(MOVEFILE_DELAY_UNTIL_REBOOT)` so the update can complete.
Expected output looks like:
Updating Hermes Agent...
📥 Pulling latest code...
Already up to date. (or: Updating abc1234..def5678)
📦 Updating dependencies...
✅ Dependencies updated
🔍 Checking for new config options...
✅ Config is up to date (or: Found 2 new options — running migration...)
🔄 Restarting gateways...
✅ Gateway restarted
✅ Hermes Agent updated successfully!
### Recommended Post-Update Validation
`hermes update` handles the main update path, but a quick validation confirms everything landed cleanly:
1. `git status --short` — if the tree is unexpectedly dirty, inspect before continuing
2. `hermes doctor` — checks config, dependencies, and service health
3. `hermes --version` — confirm the version bumped as expected
4. If you use the gateway: `hermes gateway status`
5. If `doctor` reports npm audit issues: run `npm audit fix` in the flagged directory
:::warning Dirty working tree after update
If `git status --short` shows unexpected changes after `hermes update`, stop and inspect them before continuing. This usually means local modifications were reapplied on top of the updated code, or a dependency step refreshed lockfiles.
### If your terminal disconnects mid-update
`hermes update` protects itself against accidental terminal loss:
- The update ignores `SIGHUP`, so closing your SSH session or terminal window no longer kills it mid-install. `pip` and `git` child processes inherit this protection, so the Python environment cannot be left half-installed by a dropped connection.
- All output is mirrored to `~/.hermes/logs/update.log` while the update runs. If your terminal disappears, reconnect and inspect the log to see whether the update finished and whether the gateway restart succeeded:
tail -f ~/.hermes/logs/update.log
- `Ctrl-C` (SIGINT) and system shutdown (SIGTERM) are still honored — those are deliberate cancellations, not accidents.
You no longer need to wrap `hermes update` in `screen` or `tmux` to survive a terminal drop.
### Checking your current version
hermes version
Compare against the latest release at the [GitHub releases page](https://github.com/NousResearch/hermes-agent/releases).
### Updating from Messaging Platforms
You can also update directly from Telegram, Discord, Slack, WhatsApp, or Teams by sending:
/update
This pulls the latest code, updates dependencies, and restarts running gateways. The bot will briefly go offline during the restart (typically 5–15 seconds) and then resume.
### Manual Update
If you installed manually (not via the quick installer):
cd /path/to/hermes-agent
export VIRTUAL_ENV="$(pwd)/venv"
# Pull latest code
git pull origin main
# Reinstall (picks up new dependencies)
uv pip install -e ".[all]"
# Check for new config options
hermes config check
hermes config migrate # Interactively add any missing options
### Rollback instructions
If an update introduces a problem, you can roll back to a previous version:
# List recent versions
git log --oneline -10
# Roll back to a specific commit
git checkout
# Restart the gateway if running
hermes gateway restart
To roll back to a specific release tag (substitute your previous tag — e.g. a recent release like `v2026.5.16`, or any earlier tag from `git tag --sort=-version:refname`):
git checkout vX.Y.Z
:::warning
Rolling back may cause config incompatibilities if new options were added. Run `hermes config check` after rolling back and remove any unrecognized options from `config.yaml` if you encounter errors.
### Note for Nix users
If you installed via Nix flake, updates are managed through the Nix package manager:
# Update the flake input
nix flake update hermes-agent
# Or rebuild with the latest
nix profile upgrade hermes-agent
Nix installations are immutable — rollback is handled by Nix's generation system:
nix profile rollback
See [Nix Setup](./nix-setup.md) for more details.
## Uninstalling
hermes uninstall
The uninstaller gives you the option to keep your configuration files (`~/.hermes/`) for a future reinstall.
pip uninstall hermes-agent
rm -rf ~/.hermes # Optional — keep if you plan to reinstall
### Manual Uninstall
rm -f ~/.local/bin/hermes
rm -rf /path/to/hermes-agent
If you installed the gateway as a system service, stop and disable it first:
hermes gateway stop
# Linux: systemctl --user disable hermes-gateway
# macOS: launchctl remove ai.hermes.gateway
# Android / Termux
# Hermes on Android with Termux
This is the tested path for running Hermes Agent directly on an Android phone through [Termux](https://termux.dev/).
It gives you a working local CLI on the phone, plus the core extras that are currently known to install cleanly on Android.
## What is supported in the tested path?
The tested Termux bundle installs:
- the Hermes CLI
- cron support
- PTY/background terminal support
- Telegram gateway support (manual / best-effort background runs)
- MCP support
- Honcho memory support
- ACP support
Concretely, it maps to:
python -m pip install -e '.[termux]' -c constraints-termux.txt
## What is not part of the tested path yet?
A few features still need desktop/server-style dependencies that are not published for Android, or have not been validated on phones yet:
- `.[all]` is not supported on Android today
- the `voice` extra is blocked by `faster-whisper -> ctranslate2`, and `ctranslate2` does not publish Android wheels
- automatic browser / Playwright bootstrap is skipped in the Termux installer
- Docker-based terminal isolation is not available inside Termux
- Android may still suspend Termux background jobs, so gateway persistence is best-effort rather than a normal managed service
That does not stop Hermes from working well as a phone-native CLI agent — it just means the recommended mobile install is intentionally narrower than the desktop/server install.
## Option 1: One-line installer
Hermes now ships a Termux-aware installer path:
On Termux, the installer automatically:
- uses `pkg` for system packages
- creates the venv with `python -m venv`
- attempts the broad `.[termux-all]` extra first and falls back to the smaller `.[termux]` extra (then a base install) — the curl installer matches this order automatically
- links `hermes` into `$PREFIX/bin` so it stays on your Termux PATH
- skips the untested browser / WhatsApp bootstrap
If you want the explicit commands or need to debug a failed install, use the manual path below.
## Option 2: Manual install (fully explicit)
### 1. Update Termux and install system packages
pkg update
pkg install -y git python clang rust make pkg-config libffi openssl nodejs ripgrep ffmpeg
Why these packages?
- `python` — runtime + venv support
- `git` — clone/update the repo
- `clang`, `rust`, `make`, `pkg-config`, `libffi`, `openssl` — needed to build a few Python dependencies on Android
- `nodejs` — optional Node runtime for experiments beyond the tested core path
- `ripgrep` — fast file search
- `ffmpeg` — media / TTS conversions
### 2. Clone Hermes
git clone https://github.com/NousResearch/hermes-agent.git
cd hermes-agent
### 3. Create a virtual environment
python -m venv venv
source venv/bin/activate
export ANDROID_API_LEVEL="$(getprop ro.build.version.sdk)"
python -m pip install --upgrade pip setuptools wheel
`ANDROID_API_LEVEL` is important for Rust / maturin-based packages such as `jiter`.
### 4. Install the tested Termux bundle
If you only want the minimal core agent, this also works:
python -m pip install -e '.' -c constraints-termux.txt
### 5. Put `hermes` on your Termux PATH
ln -sf "$PWD/venv/bin/hermes" "$PREFIX/bin/hermes"
`$PREFIX/bin` is already on PATH in Termux, so this makes the `hermes` command persist across new shells without re-activating the venv every time.
### 6. Verify the install
hermes doctor
### 7. Start Hermes
hermes
## Recommended follow-up setup
### Configure a model
Or set keys directly in `~/.hermes/.env`.
### Re-run the full interactive setup wizard later
hermes setup
### Install optional Node dependencies manually
The tested Termux path skips Node/browser bootstrap on purpose. If you want to experiment with browser tooling later:
pkg install nodejs-lts
npm install
The browser tool automatically includes Termux directories (`/data/data/com.termux/files/usr/bin`) in its PATH search, so `agent-browser` and `npx` are discovered without any extra PATH configuration.
Treat browser / WhatsApp tooling on Android as experimental until documented otherwise.
### `No solution found` when installing `.[all]`
Use the tested Termux bundle instead:
The blocker is currently the `voice` extra:
- `voice` pulls `faster-whisper`
- `faster-whisper` depends on `ctranslate2`
- `ctranslate2` does not publish Android wheels
### `uv pip install` fails on Android
Use the Termux path with the stdlib venv + `pip` instead:
### `jiter` / `maturin` complains about `ANDROID_API_LEVEL`
Set the API level explicitly before installing:
### `hermes doctor` says ripgrep or Node is missing
Install them with Termux packages:
pkg install ripgrep nodejs
### Build failures while installing Python packages
Make sure the build toolchain is installed:
pkg install clang rust make pkg-config libffi openssl
Then retry:
## Known limitations on phones
- Docker backend is unavailable
- local voice transcription via `faster-whisper` is unavailable in the tested path
- browser automation setup is intentionally skipped by the installer
- some optional extras may work, but only `.[termux]` and `.[termux-all]` are currently documented as the tested Android bundles
If you hit a new Android-specific issue, please open a GitHub issue with:
- your Android version
- `termux-info`
- `python --version`
- `hermes doctor`
- the exact install command and full error output
# Nix & NixOS Setup
Hermes Agent ships a Nix flake with three levels of integration:
| Level | Who it's for | What you get |
|-------|-------------|--------------|
| **`nix run` / `nix profile install`** | Any Nix user (macOS, Linux) | Pre-built binary with all deps — then use the standard CLI workflow |
| **NixOS module (native)** | NixOS server deployments | Declarative config, hardened systemd service, managed secrets |
| **NixOS module (container)** | Agents that need self-modification | Everything above, plus a persistent Ubuntu container where the agent can `apt`/`pip`/`npm install` |
:::info What's different from the standard install
The `curl | bash` installer manages Python, Node, and dependencies itself. The Nix flake replaces all of that — every Python dependency is a Nix derivation built by [uv2nix](https://github.com/pyproject-nix/uv2nix), and runtime tools (Node.js, git, ripgrep, ffmpeg) are wrapped into the binary's PATH. There is no runtime pip, no venv activation, no `npm install`.
**For non-NixOS users**, this only changes the install step. Everything after (`hermes setup`, `hermes gateway install`, config editing) works identically to the standard install.
**For NixOS module users**, the entire lifecycle is different: configuration lives in `configuration.nix`, secrets go through sops-nix/agenix, the service is a systemd unit, and CLI config commands are blocked. You manage hermes the same way you manage any other NixOS service.
- **Nix with flakes enabled** — [Determinate Nix](https://install.determinate.systems) recommended (enables flakes by default)
- **API keys** for the services you want to use (at minimum: an OpenRouter or Anthropic key)
## Quick Start (Any Nix User)
No clone needed. Nix fetches, builds, and runs everything:
# Run directly (builds on first use, cached after)
nix run github:NousResearch/hermes-agent -- setup
nix run github:NousResearch/hermes-agent -- chat
# Or install persistently
nix profile install github:NousResearch/hermes-agent
hermes chat
After `nix profile install`, `hermes`, `hermes-agent`, and `hermes-acp` are on your PATH. From here, the workflow is identical to the [standard installation](./installation.md) — `hermes setup` walks you through provider selection, `hermes gateway install` sets up a launchd (macOS) or systemd user service, and config lives in `~/.hermes/`.
:::warning Messaging platforms (Discord, Telegram, Slack)
The default package doesn't include messaging platform libraries — they were moved to on-demand installation, which can't work in Nix's read-only environment. If you plan to connect the agent to Discord, Telegram, or Slack, install the `messaging` variant:
nix profile install github:NousResearch/hermes-agent#messaging
For all optional extras (voice, all providers, all platforms):
nix profile install github:NousResearch/hermes-agent#full
The `full` variant adds ~700 MB to the closure. If you only need messaging platforms, `#messaging` adds just ~33 MB.
Building from a local clone
nix build
./result/bin/hermes setup
## NixOS Module
The flake exports `nixosModules.default` — a full NixOS service module that declaratively manages user creation, directories, config generation, secrets, documents, and service lifecycle.
:::note
This module requires NixOS. For non-NixOS systems (macOS, other Linux distros), use `nix profile install` and the standard CLI workflow above.
### Add the Flake Input
```nix
# /etc/nixos/flake.nix (or your system flake)
{
inputs = {
nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
hermes-agent.url = "github:NousResearch/hermes-agent";
};
outputs = { nixpkgs, hermes-agent, ... }: {
nixosConfigurations.your-host = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
hermes-agent.nixosModules.default
./configuration.nix
];
}
### Minimal Configuration
# configuration.nix
{ config, ... }: {
services.hermes-agent = {
enable = true;
settings.model.default = "anthropic/claude-sonnet-4";
environmentFiles = [ config.sops.secrets."hermes-env".path ];
addToSystemPackages = true;
That's it. `nixos-rebuild switch` creates the `hermes` user, generates `config.yaml`, wires up secrets, and starts the gateway — a long-running service that connects the agent to messaging platforms (Telegram, Discord, etc.) and listens for incoming messages.
:::warning Secrets are required
The `environmentFiles` line above assumes you have [sops-nix](https://github.com/Mic92/sops-nix) or [agenix](https://github.com/ryantm/agenix) configured. The file should contain at least one LLM provider key (e.g., `OPENROUTER_API_KEY=sk-or-...`). See [Secrets Management](#secrets-management) for full setup. If you don't have a secrets manager yet, you can use a plain file as a starting point — just ensure it's not world-readable:
echo "OPENROUTER_API_KEY=sk-or-your-key" | sudo install -m 0600 -o hermes /dev/stdin /var/lib/hermes/env
services.hermes-agent.environmentFiles = [ "/var/lib/hermes/env" ];
:::tip addToSystemPackages
Setting `addToSystemPackages = true` does two things: puts the `hermes` CLI on your system PATH **and** sets `HERMES_HOME` system-wide so the interactive CLI shares state (sessions, skills, cron) with the gateway service. Without it, running `hermes` in your shell creates a separate `~/.hermes/` directory.
### Container-aware CLI
When `container.enable = true` and `addToSystemPackages = true`, **every** `hermes` command on the host automatically routes into the managed container. This means your interactive CLI session runs inside the same environment as the gateway service — with access to all container-installed packages and tools.
- The routing is transparent: `hermes chat`, `hermes sessions list`, `hermes version`, etc. all exec into the container under the hood
- All CLI flags are forwarded as-is
- If the container isn't running, the CLI retries briefly (5s with a spinner for interactive use, 10s silently for scripts) then fails with a clear error — no silent fallback
- For developers working on the hermes codebase, set `HERMES_DEV=1` to bypass container routing and run the local checkout directly
Set `container.hostUsers` to create a `~/.hermes` symlink to the service state directory, so the host CLI and the container share sessions, config, and memories:
container.enable = true;
container.hostUsers = [ "your-username" ];
Users listed in `hostUsers` are automatically added to the `hermes` group for file permission access.
**Podman users:** The NixOS service runs the container as root. Docker users get access via the `docker` group socket, but Podman's rootful containers require sudo. Grant passwordless sudo for your container runtime:
security.sudo.extraRules = [{
users = [ "your-username" ];
commands = [{
command = "/run/current-system/sw/bin/podman";
options = [ "NOPASSWD" ];
}];
The CLI auto-detects when sudo is needed and uses it transparently. Without this, you'll need to run `sudo hermes chat` manually.
### Verify It Works
After `nixos-rebuild switch`, check that the service is running:
# Check service status
systemctl status hermes-agent
# Watch logs (Ctrl+C to stop)
journalctl -u hermes-agent -f
# If addToSystemPackages is true, test the CLI
hermes config # shows the generated config
### Choosing a Deployment Mode
The module supports two modes, controlled by `container.enable`:
| | **Native** (default) | **Container** |
| How it runs | Hardened systemd service on the host | Persistent Ubuntu container with `/nix/store` bind-mounted |
| Security | `NoNewPrivileges`, `ProtectSystem=strict`, `PrivateTmp` | Container isolation, runs as unprivileged user inside |
| Agent can self-install packages | No — only tools on the Nix-provided PATH | Yes — `apt`, `pip`, `npm` installs persist across restarts |
| Config surface | Same | Same |
| When to choose | Standard deployments, maximum security, reproducibility | Agent needs runtime package installation, mutable environment, experimental tools |
To enable container mode, add one line:
# ... rest of config is identical
Container mode auto-enables `virtualisation.docker.enable` via `mkDefault`. If you use Podman instead, set `container.backend = "podman"` and `virtualisation.docker.enable = false`.
## Configuration
### Declarative Settings
The `settings` option accepts an arbitrary attrset that is rendered as `config.yaml`. It supports deep merging across multiple module definitions (via `lib.recursiveUpdate`), so you can split config across files:
# base.nix
services.hermes-agent.settings = {
model.default = "anthropic/claude-sonnet-4";
toolsets = [ "all" ];
terminal = { backend = "local"; timeout = 180; };
# personality.nix
display = { compact = false; personality = "kawaii"; };
memory = { memory_enabled = true; user_profile_enabled = true; };
Both are deep-merged at evaluation time. Nix-declared keys always win over keys in an existing `config.yaml` on disk, but **user-added keys that Nix doesn't touch are preserved**. This means if the agent or a manual edit adds keys like `skills.disabled` or `streaming.enabled`, they survive `nixos-rebuild switch`.
:::note Model naming
`settings.model.default` uses the model identifier your provider expects. With [OpenRouter](https://openrouter.ai) (the default), these look like `"anthropic/claude-sonnet-4"` or `"google/gemini-3-flash"`. If you're using a provider directly (Anthropic, OpenAI), set `settings.model.base_url` to point at their API and use their native model IDs (e.g., `"claude-sonnet-4-20250514"`). When no `base_url` is set, Hermes defaults to OpenRouter.
:::tip Discovering available config keys
Run `nix build .#configKeys && cat result` to see every leaf config key extracted from Python's `DEFAULT_CONFIG`. You can paste your existing `config.yaml` into the `settings` attrset — the structure maps 1:1.
Full example: all commonly customized settings
# ── Model ──────────────────────────────────────────────────────────
settings = {
model = {
base_url = "https://openrouter.ai/api/v1";
default = "anthropic/claude-opus-4.6";
max_turns = 100;
terminal = { backend = "local"; cwd = "."; timeout = 180; };
compression = {
enabled = true;
threshold = 0.85;
summary_model = "google/gemini-3-flash-preview";
agent = { max_turns = 60; verbose = false; };
# ── Secrets ────────────────────────────────────────────────────────
# ── Documents ──────────────────────────────────────────────────────
documents = {
"USER.md" = ./documents/USER.md;
# ── MCP Servers ────────────────────────────────────────────────────
mcpServers.filesystem = {
command = "npx";
args = [ "-y" "@modelcontextprotocol/server-filesystem" "/data/workspace" ];
# ── Container options ──────────────────────────────────────────────
container = {
image = "ubuntu:24.04";
backend = "docker";
hostUsers = [ "your-username" ];
extraVolumes = [ "/home/user/projects:/projects:rw" ];
extraOptions = [ "--gpus" "all" ];
# ── Service tuning ─────────────────────────────────────────────────
extraArgs = [ "--verbose" ];
restart = "always";
restartSec = 5;
### Escape Hatch: Bring Your Own Config
If you'd rather manage `config.yaml` entirely outside Nix, use `configFile`:
services.hermes-agent.configFile = /etc/hermes/config.yaml;
This bypasses `settings` entirely — no merge, no generation. The file is copied as-is to `$HERMES_HOME/config.yaml` on each activation.
### Customization Cheatsheet
Quick reference for the most common things Nix users want to customize:
| I want to... | Option | Example |
| Change the LLM model | `settings.model.default` | `"anthropic/claude-sonnet-4"` |
| Use a different provider endpoint | `settings.model.base_url` | `"https://openrouter.ai/api/v1"` |
| Add API keys | `environmentFiles` | `[ config.sops.secrets."hermes-env".path ]` |
| Give the agent a personality | `${services.hermes-agent.stateDir}/.hermes/SOUL.md` | manage the file directly |
| Add MCP tool servers | `mcpServers. ` | See [MCP Servers](#mcp-servers) |
| Enable Discord/Telegram/Slack | `extraDependencyGroups` | `[ "messaging" ]` |
| Mount host directories into container | `container.extraVolumes` | `[ "/data:/data:rw" ]` |
| Pass GPU access to container | `container.extraOptions` | `[ "--gpus" "all" ]` |
| Use Podman instead of Docker | `container.backend` | `"podman"` |
| Share state between host CLI and container | `container.hostUsers` | `[ "sidbin" ]` |
| Make extra tools available to the agent | `extraPackages` | `[ pkgs.pandoc pkgs.imagemagick ]` |
| Use a custom base image | `container.image` | `"ubuntu:24.04"` |
| Override the hermes package | `package` | `inputs.hermes-agent.packages.${system}.default.override { ... }` |
| Change state directory | `stateDir` | `"/opt/hermes"` |
| Set the agent's working directory | `workingDirectory` | `"/home/user/projects"` |
## Secrets Management
:::danger Never put API keys in `settings` or `environment`
Values in Nix expressions end up in `/nix/store`, which is world-readable. Always use `environmentFiles` with a secrets manager.
Both `environment` (non-secret vars) and `environmentFiles` (secret files) are merged into `$HERMES_HOME/.env` at activation time (`nixos-rebuild switch`). Hermes reads this file on every startup, so changes take effect with a `systemctl restart hermes-agent` — no container recreation needed.
### sops-nix
sops = {
defaultSopsFile = ./secrets/hermes.yaml;
age.keyFile = "/home/user/.config/sops/age/keys.txt";
secrets."hermes-env" = { format = "yaml"; };
services.hermes-agent.environmentFiles = [
config.sops.secrets."hermes-env".path
The secrets file contains key-value pairs:
# secrets/hermes.yaml (encrypted with sops)
hermes-env: |
OPENROUTER_API_KEY=sk-or-...
TELEGRAM_BOT_TOKEN=123456:ABC...
ANTHROPIC_API_KEY=sk-ant-...
### agenix
age.secrets.hermes-env.file = ./secrets/hermes-env.age;
config.age.secrets.hermes-env.path
### OAuth / Auth Seeding
For platforms requiring OAuth (e.g., Discord), use `authFile` to seed credentials on first deploy:
authFile = config.sops.secrets."hermes/auth.json".path;
# authFileForceOverwrite = true; # overwrite on every activation
The file is only copied if `auth.json` doesn't already exist (unless `authFileForceOverwrite = true`). Runtime OAuth token refreshes are written to the state directory and preserved across rebuilds.
## Documents
The `documents` option installs files into the agent's working directory (the `workingDirectory`, which the agent reads as its workspace). Hermes looks for specific filenames by convention:
- **`USER.md`** — context about the user the agent is interacting with.
- Any other files you place here are visible to the agent as workspace files.
The agent identity file is separate: Hermes loads its primary `SOUL.md` from `$HERMES_HOME/SOUL.md`, which in the NixOS module is `${services.hermes-agent.stateDir}/.hermes/SOUL.md`. Putting `SOUL.md` in `documents` only creates a workspace file and will not replace the main persona file.
services.hermes-agent.documents = {
"USER.md" = ./documents/USER.md; # path reference, copied from Nix store
Values can be inline strings or path references. Files are installed on every `nixos-rebuild switch`.
## MCP Servers
The `mcpServers` option declaratively configures [MCP (Model Context Protocol)](https://modelcontextprotocol.io) servers. Each server uses either **stdio** (local command) or **HTTP** (remote URL) transport.
### Stdio Transport (Local Servers)
services.hermes-agent.mcpServers = {
filesystem = {
github = {
args = [ "-y" "@modelcontextprotocol/server-github" ];
env.GITHUB_PERSONAL_ACCESS_TOKEN = "\${GITHUB_TOKEN}"; # resolved from .env
Environment variables in `env` values are resolved from `$HERMES_HOME/.env` at runtime. Use `environmentFiles` to inject secrets — never put tokens directly in Nix config.
### HTTP Transport (Remote Servers)
services.hermes-agent.mcpServers.remote-api = {
url = "https://mcp.example.com/v1/mcp";
headers.Authorization = "Bearer \${MCP_REMOTE_API_KEY}";
timeout = 180;
### HTTP Transport with OAuth
Set `auth = "oauth"` for servers using OAuth 2.1. Hermes implements the full PKCE flow — metadata discovery, dynamic client registration, token exchange, and automatic refresh.
services.hermes-agent.mcpServers.my-oauth-server = {
url = "https://mcp.example.com/mcp";
auth = "oauth";
Tokens are stored in `$HERMES_HOME/mcp-tokens/ .json` and persist across restarts and rebuilds.
Initial OAuth authorization on headless servers
The first OAuth authorization requires a browser-based consent flow. In a headless deployment, Hermes prints the authorization URL to stdout/logs instead of opening a browser.
**Option A: Interactive bootstrap** — run the flow once via `docker exec` (container) or `sudo -u hermes` (native):
# Container mode
docker exec -it hermes-agent \
hermes mcp add my-oauth-server --url https://mcp.example.com/mcp --auth oauth
# Native mode
sudo -u hermes HERMES_HOME=/var/lib/hermes/.hermes \
The container uses `--network=host`, so the OAuth callback listener on `127.0.0.1` is reachable from the host browser.
**Option B: Pre-seed tokens** — complete the flow on a workstation, then copy tokens:
scp ~/.hermes/mcp-tokens/my-oauth-server{,.client}.json \
server:/var/lib/hermes/.hermes/mcp-tokens/
# Ensure: chown hermes:hermes, chmod 0600
### Sampling (Server-Initiated LLM Requests)
Some MCP servers can request LLM completions from the agent:
services.hermes-agent.mcpServers.analysis = {
args = [ "-y" "analysis-server" ];
sampling = {
model = "google/gemini-3-flash";
max_tokens_cap = 4096;
timeout = 30;
max_rpm = 10;
## Managed Mode
When hermes runs via the NixOS module, the following CLI commands are **blocked** with a descriptive error pointing you to `configuration.nix`:
| Blocked command | Why |
|---|---|
| `hermes setup` | Config is declarative — edit `settings` in your Nix config |
| `hermes config edit` | Config is generated from `settings` |
| `hermes config set ` | Config is generated from `settings` |
| `hermes gateway install` | The systemd service is managed by NixOS |
| `hermes gateway uninstall` | The systemd service is managed by NixOS |
This prevents drift between what Nix declares and what's on disk. Detection uses two signals:
1. **`HERMES_MANAGED=true`** environment variable — set by the systemd service, visible to the gateway process
2. **`.managed` marker file** in `HERMES_HOME` — set by the activation script, visible to interactive shells (e.g., `docker exec -it hermes-agent hermes config set ...` is also blocked)
To change configuration, edit your Nix config and run `sudo nixos-rebuild switch`.
## Container Architecture
This section is only relevant if you're using `container.enable = true`. Skip it for native mode deployments.
When container mode is enabled, hermes runs inside a persistent Ubuntu container with the Nix-built binary bind-mounted read-only from the host:
Host Container
──── ─────────
/nix/store/...-hermes-agent-0.1.0 ──► /nix/store/... (ro)
~/.hermes -> /var/lib/hermes/.hermes (symlink bridge, per hostUsers)
/var/lib/hermes/ ──► /data/ (rw)
├── current-package -> /nix/store/... (symlink, updated each rebuild)
├── .gc-root -> /nix/store/... (prevents nix-collect-garbage)
├── .container-identity (sha256 hash, triggers recreation)
├── .hermes/ (HERMES_HOME)
│ ├── .env (merged from environment + environmentFiles)
│ ├── config.yaml (Nix-generated, deep-merged by activation)
│ ├── .managed (marker file)
│ ├── .container-mode (routing metadata: backend, exec_user, etc.)
│ ├── state.db, sessions/, memories/ (runtime state)
│ └── mcp-tokens/ (OAuth tokens for MCP servers)
├── home/ ──► /home/hermes (rw)
└── workspace/ (agent working directory)
├── SOUL.md (from documents option)
└── (agent-created files)
Container writable layer (apt/pip/npm): /usr, /usr/local, /tmp
The Nix-built binary works inside the Ubuntu container because `/nix/store` is bind-mounted — it brings its own interpreter and all dependencies, so there's no reliance on the container's system libraries. The container entrypoint resolves through a `current-package` symlink: `/data/current-package/bin/hermes gateway run --replace`. On `nixos-rebuild switch`, only the symlink is updated — the container keeps running.
### What Persists Across What
| Event | Container recreated? | `/data` (state) | `/home/hermes` | Writable layer (`apt`/`pip`/`npm`) |
|---|---|---|---|---|
| `systemctl restart hermes-agent` | No | Persists | Persists | Persists |
| `nixos-rebuild switch` (code change) | No (symlink updated) | Persists | Persists | Persists |
| Host reboot | No | Persists | Persists | Persists |
| `nix-collect-garbage` | No (GC root) | Persists | Persists | Persists |
| Image change (`container.image`) | **Yes** | Persists | Persists | **Lost** |
| Volume/options change | **Yes** | Persists | Persists | **Lost** |
| `environment`/`environmentFiles` change | No | Persists | Persists | Persists |
The container is only recreated when its **identity hash** changes. The hash covers: schema version, image, `extraVolumes`, `extraOptions`, and the entrypoint script. Changes to environment variables, settings, documents, or the hermes package itself do **not** trigger recreation.
:::warning Writable layer loss
When the identity hash changes (image upgrade, new volumes, new container options), the container is destroyed and recreated from a fresh pull of `container.image`. Any `apt install`, `pip install`, or `npm install` packages in the writable layer are lost. State in `/data` and `/home/hermes` is preserved (these are bind mounts).
If the agent relies on specific packages, consider baking them into a custom image (`container.image = "my-registry/hermes-base:latest"`) or scripting their installation in the agent's SOUL.md.
### GC Root Protection
The `preStart` script creates a GC root at `${stateDir}/.gc-root` pointing to the current hermes package. This prevents `nix-collect-garbage` from removing the running binary. If the GC root somehow breaks, restarting the service recreates it.
## Plugins
The NixOS module supports declarative plugin installation — no imperative `hermes plugins install` needed.
### Directory Plugins (`extraPlugins`)
For plugins that are just a source tree with `plugin.yaml` + `__init__.py` (e.g., [hermes-lcm](https://github.com/stephenschoettler/hermes-lcm)):
services.hermes-agent.extraPlugins = [
(pkgs.fetchFromGitHub {
owner = "stephenschoettler";
repo = "hermes-lcm";
rev = "v0.7.0";
hash = "sha256-...";
})
Plugins are symlinked into `$HERMES_HOME/plugins/` at activation time. Hermes discovers them via its normal directory scan. Removing a plugin from the list and running `nixos-rebuild switch` removes the symlink.
### Entry-Point Plugins (`extraPythonPackages`)
For pip-packaged plugins that register via `[project.entry-points."hermes_agent.plugins"]` (e.g., [rtk-hermes](https://github.com/ogallotti/rtk-hermes)):
services.hermes-agent.extraPythonPackages = [
(pkgs.python312Packages.buildPythonPackage {
pname = "rtk-hermes";
version = "1.0.0";
src = pkgs.fetchFromGitHub {
owner = "ogallotti";
repo = "rtk-hermes";
rev = "v1.0.0";
format = "pyproject";
build-system = [ pkgs.python312Packages.setuptools ];
The package's `site-packages` is added to PYTHONPATH in the hermes wrapper. `importlib.metadata` discovers the entry point at session start.
### Optional Dependency Groups (`extraDependencyGroups`)
For optional extras declared in hermes-agent's `pyproject.toml`, use `extraDependencyGroups` to include them in the sealed venv at build time. This is required for any extra not in the default `[all]` set — on Nix, runtime installation into the read-only store is not possible.
# Enable Discord, Telegram, Slack
services.hermes-agent.extraDependencyGroups = [ "messaging" ];
# Enable a memory provider
extraDependencyGroups = [ "hindsight" ];
settings.memory.provider = "hindsight";
This is resolved by uv alongside core dependencies — no PYTHONPATH patching, no collision risk. Available groups:
| Group | What it enables |
|-------|-----------------|
| `messaging` | Discord, Telegram, Slack |
| `matrix` | Matrix/Element (mautrix with encryption; Linux only) |
| `dingtalk` | DingTalk |
| `feishu` | Feishu/Lark |
| `voice` | Local speech-to-text (faster-whisper) |
| `edge-tts` | Edge TTS provider |
| `tts-premium` | ElevenLabs TTS |
| `anthropic` | Native Anthropic SDK (not needed via OpenRouter) |
| `bedrock` | AWS Bedrock (boto3) |
| `azure-identity` | Azure Entra ID auth |
| `honcho` | Honcho memory provider |
| `hindsight` | Hindsight memory provider |
| `modal` | Modal terminal backend |
| `daytona` | Daytona terminal backend |
| `exa` | Exa web search |
| `firecrawl` | Firecrawl web search |
| `fal` | FAL image generation |
Or use the pre-built `#messaging` or `#full` flake packages instead of per-extra configuration (see [Quick Start](#quick-start-any-nix-user)).
**When to use which:**
| Need | Option |
|------|--------|
| Enable a pyproject.toml optional extra | `extraDependencyGroups` |
| Add an external Python plugin not in pyproject.toml | `extraPythonPackages` |
| Add a system binary (pandoc, jq, etc.) | `extraPackages` |
| Add a directory-based plugin source tree | `extraPlugins` |
### Combining Both
A directory plugin with third-party Python dependencies needs both options:
extraPlugins = [ my-plugin-src ]; # plugin source
extraPythonPackages = [ pkgs.python312Packages.redis ]; # its Python dep
extraPackages = [ pkgs.redis ]; # system binary it needs
### Using the Overlay
External flakes can override the package directly:
inputs.hermes-agent.url = "github:NousResearch/hermes-agent";
outputs = { hermes-agent, nixpkgs, ... }: {
nixpkgs.overlays = [ hermes-agent.overlays.default ];
# Then:
# pkgs.hermes-agent.override { extraPythonPackages = [...]; }
# pkgs.hermes-agent.override { extraDependencyGroups = [ "hindsight" ]; }
### Plugin Configuration
Plugins still need to be enabled in `config.yaml`. Add them via the declarative settings:
services.hermes-agent.settings.plugins.enabled = [
"hermes-lcm"
"rtk-rewrite"
A build-time collision check prevents plugin packages from shadowing core hermes dependencies. If a plugin provides a package already in the sealed venv, `nixos-rebuild` fails with a clear error.
## Development
### Dev Shell
The flake provides a development shell with Python 3.12, uv, Node.js, and all runtime tools:
nix develop
# Shell provides:
# - Python 3.12 + uv (deps installed into .venv on first entry)
# - Node.js 22, ripgrep, git, openssh, ffmpeg on PATH
# - Stamp-file optimization: re-entry is near-instant if deps haven't changed
### direnv (Recommended)
The included `.envrc` activates the dev shell automatically:
direnv allow # one-time
# Subsequent entries are near-instant (stamp file skips dep install)
### Flake Checks
The flake includes build-time verification that runs in CI and locally:
# Run all checks
nix flake check
# Individual checks
nix build .#checks.x86_64-linux.package-contents # binaries exist + version
nix build .#checks.x86_64-linux.entry-points-sync # pyproject.toml ↔ Nix package sync
nix build .#checks.x86_64-linux.cli-commands # gateway/config subcommands
nix build .#checks.x86_64-linux.managed-guard # HERMES_MANAGED blocks mutation
nix build .#checks.x86_64-linux.bundled-skills # skills present in package
nix build .#checks.x86_64-linux.config-roundtrip # merge script preserves user keys
What each check verifies
| Check | What it tests |
| `package-contents` | `hermes` and `hermes-agent` binaries exist and `hermes version` runs |
| `entry-points-sync` | Every `[project.scripts]` entry in `pyproject.toml` has a wrapped binary in the Nix package |
| `cli-commands` | `hermes --help` exposes `gateway` and `config` subcommands |
| `managed-guard` | `HERMES_MANAGED=true hermes config set ...` prints the NixOS error |
| `bundled-skills` | Skills directory exists, contains SKILL.md files, `HERMES_BUNDLED_SKILLS` is set in wrapper |
| `config-roundtrip` | 7 merge scenarios: fresh install, Nix override, user key preservation, mixed merge, MCP additive merge, nested deep merge, idempotency |
## Options Reference
### Core
| Option | Type | Default | Description |
| `enable` | `bool` | `false` | Enable the hermes-agent service |
| `package` | `package` | `hermes-agent` | The hermes-agent package to use |
| `user` | `str` | `"hermes"` | System user |
| `group` | `str` | `"hermes"` | System group |
| `createUser` | `bool` | `true` | Auto-create user/group |
| `stateDir` | `str` | `"/var/lib/hermes"` | State directory (`HERMES_HOME` parent) |
| `workingDirectory` | `str` | `"${stateDir}/workspace"` | Agent working directory |
| `addToSystemPackages` | `bool` | `false` | Add `hermes` CLI to system PATH and set `HERMES_HOME` system-wide |
### Configuration
| `settings` | `attrs` (deep-merged) | `{}` | Declarative config rendered as `config.yaml`. Supports arbitrary nesting; multiple definitions are merged via `lib.recursiveUpdate` |
| `configFile` | `null` or `path` | `null` | Path to an existing `config.yaml`. Overrides `settings` entirely if set |
### Secrets & Environment
| `environmentFiles` | `listOf str` | `[]` | Paths to env files with secrets. Merged into `$HERMES_HOME/.env` at activation time |
| `environment` | `attrsOf str` | `{}` | Non-secret env vars. **Visible in Nix store** — do not put secrets here |
| `authFile` | `null` or `path` | `null` | OAuth credentials seed. Only copied on first deploy |
| `authFileForceOverwrite` | `bool` | `false` | Always overwrite `auth.json` from `authFile` on activation |
### Documents
| `documents` | `attrsOf (either str path)` | `{}` | Workspace files. Keys are filenames, values are inline strings or paths. Installed into `workingDirectory` on activation |
### MCP Servers
| `mcpServers` | `attrsOf submodule` | `{}` | MCP server definitions, merged into `settings.mcp_servers` |
| `mcpServers. .command` | `null` or `str` | `null` | Server command (stdio transport) |
| `mcpServers. .args` | `listOf str` | `[]` | Command arguments |
| `mcpServers. .env` | `attrsOf str` | `{}` | Environment variables for the server process |
| `mcpServers. .url` | `null` or `str` | `null` | Server endpoint URL (HTTP/StreamableHTTP transport) |
| `mcpServers. .headers` | `attrsOf str` | `{}` | HTTP headers, e.g. `Authorization` |
| `mcpServers. .auth` | `null` or `"oauth"` | `null` | Authentication method. `"oauth"` enables OAuth 2.1 PKCE |
| `mcpServers. .enabled` | `bool` | `true` | Enable or disable this server |
| `mcpServers. .timeout` | `null` or `int` | `null` | Tool call timeout in seconds (default: 120) |
| `mcpServers. .connect_timeout` | `null` or `int` | `null` | Connection timeout in seconds (default: 60) |
| `mcpServers. .tools` | `null` or `submodule` | `null` | Tool filtering (`include`/`exclude` lists) |
| `mcpServers. .sampling` | `null` or `submodule` | `null` | Sampling config for server-initiated LLM requests |
### Service Behavior
| `extraArgs` | `listOf str` | `[]` | Extra args for `hermes gateway` |
| `extraPackages` | `listOf package` | `[]` | Extra packages available to the agent. Added to the hermes user's per-user profile so terminal commands, skills, and cron jobs all see them |
| `extraPlugins` | `listOf package` | `[]` | Directory plugin packages to symlink into `$HERMES_HOME/plugins/`. Each must contain `plugin.yaml` |
| `extraPythonPackages` | `listOf package` | `[]` | Python packages added to PYTHONPATH for entry-point plugin discovery. Build with `python312Packages` |
| `extraDependencyGroups` | `listOf str` | `[]` | pyproject.toml optional extras to include in the sealed venv (e.g. `["hindsight"]`). Resolved by uv — no collisions |
| `restart` | `str` | `"always"` | systemd `Restart=` policy |
| `restartSec` | `int` | `5` | systemd `RestartSec=` value |
### Container
| `container.enable` | `bool` | `false` | Enable OCI container mode |
| `container.backend` | `enum ["docker" "podman"]` | `"docker"` | Container runtime |
| `container.image` | `str` | `"ubuntu:24.04"` | Base image (pulled at runtime) |
| `container.extraVolumes` | `listOf str` | `[]` | Extra volume mounts (`host:container:mode`) |
| `container.extraOptions` | `listOf str` | `[]` | Extra args passed to `docker create` |
| `container.hostUsers` | `listOf str` | `[]` | Interactive users who get a `~/.hermes` symlink to the service stateDir and are auto-added to the `hermes` group |
## Directory Layout
### Native Mode
/var/lib/hermes/ # stateDir (owned by hermes:hermes, 0750)
├── .hermes/ # HERMES_HOME
│ ├── config.yaml # Nix-generated (deep-merged each rebuild)
│ ├── .managed # Marker: CLI config mutation blocked
│ ├── .env # Merged from environment + environmentFiles
│ ├── auth.json # OAuth credentials (seeded, then self-managed)
│ ├── gateway.pid
│ ├── state.db
│ ├── mcp-tokens/ # OAuth tokens for MCP servers
│ ├── sessions/
│ ├── memories/
│ ├── skills/
│ ├── cron/
│ └── logs/
├── home/ # Agent HOME
└── workspace/ # Agent working directory
├── SOUL.md # From documents option
### Container Mode
Same layout, mounted into the container:
| Container path | Host path | Mode | Notes |
| `/nix/store` | `/nix/store` | `ro` | Hermes binary + all Nix deps |
| `/data` | `/var/lib/hermes` | `rw` | All state, config, workspace |
| `/home/hermes` | `${stateDir}/home` | `rw` | Persistent agent home — `pip install --user`, tool caches |
| `/usr`, `/usr/local`, `/tmp` | (writable layer) | `rw` | `apt`/`pip`/`npm` installs — persists across restarts, lost on recreation |
# Update the flake input (run from the directory containing flake.nix)
cd /etc/nixos && nix flake update hermes-agent
# Rebuild
sudo nixos-rebuild switch
In container mode, the `current-package` symlink is updated and the agent picks up the new binary on restart. No container recreation, no loss of installed packages.
:::tip Podman users
All `docker` commands below work the same with `podman`. Substitute accordingly if you set `container.backend = "podman"`.
### Service Logs
# Both modes use the same systemd unit
# Container mode: also available directly
docker logs -f hermes-agent
### Container Inspection
docker ps -a --filter name=hermes-agent
docker inspect hermes-agent --format='{{.State.Status}}'
docker exec -it hermes-agent bash
docker exec hermes-agent readlink /data/current-package
docker exec hermes-agent cat /data/.container-identity
### Force Container Recreation
If you need to reset the writable layer (fresh Ubuntu):
sudo systemctl stop hermes-agent
docker rm -f hermes-agent
sudo rm /var/lib/hermes/.container-identity
sudo systemctl start hermes-agent
### Verify Secrets Are Loaded
If the agent starts but can't authenticate with the LLM provider, check that the `.env` file was merged correctly:
sudo -u hermes cat /var/lib/hermes/.hermes/.env
docker exec hermes-agent cat /data/.hermes/.env
### GC Root Verification
nix-store --query --roots $(docker exec hermes-agent readlink /data/current-package)
### Common Issues
| Symptom | Cause | Fix |
| `Cannot save configuration: managed by NixOS` | CLI guards active | Edit `configuration.nix` and `nixos-rebuild switch` |
| `No adapter available for discord` (or telegram/slack) | Messaging deps missing from the sealed Nix venv | Install `#messaging` variant: `nix profile install ...#messaging`. For NixOS module: `extraDependencyGroups = [ "messaging" ]`. Check `journalctl -u hermes-agent` for `FeatureUnavailable` or `requirements not met` for the underlying error. |
| Container recreated unexpectedly | `extraVolumes`, `extraOptions`, or `image` changed | Expected — writable layer resets. Reinstall packages or use a custom image |
| `hermes version` shows old version | Container not restarted | `systemctl restart hermes-agent` |
| Permission denied on `/var/lib/hermes` | State dir is `0750 hermes:hermes` | Use `docker exec` or `sudo -u hermes` |
| `nix-collect-garbage` removed hermes | GC root missing | Restart the service (preStart recreates the GC root) |
| `no container with name or ID "hermes-agent"` (Podman) | Podman rootful container not visible to regular user | Add passwordless sudo for podman (see [Container Mode](#container-mode) section) |
| `unable to find user hermes` | Container still starting (entrypoint hasn't created user yet) | Wait a few seconds and retry — the CLI retries automatically |
| Tool added via `extraPackages` not found in terminal | Requires `nixos-rebuild switch` to update the per-user profile | Rebuild and restart: `nixos-rebuild switch && systemctl restart hermes-agent` |
# CLI Interface
Hermes Agent's CLI is a full terminal user interface (TUI) — not a web UI. It features multiline editing, slash-command autocomplete, conversation history, interrupt-and-redirect, and streaming tool output. Built for people who live in the terminal.
:::tip First-time setup
One command — `hermes setup --portal` — and you're ready to `hermes chat`. See [Nous Portal](/integrations/nous-portal).
Hermes also ships a modern TUI with modal overlays, mouse selection, and non-blocking input. Launch it with `hermes --tui` — see the [TUI](tui.md) guide.
## Running the CLI
# Start an interactive session (default)
# Single query mode (non-interactive)
hermes chat -q "Hello"
# With a specific model
hermes chat --model "anthropic/claude-sonnet-4"
# With a specific provider
hermes chat --provider nous # Use Nous Portal
hermes chat --provider openrouter # Force OpenRouter
# With specific toolsets
hermes chat --toolsets "web,terminal,skills"
# Start with one or more skills preloaded
hermes -s hermes-agent-dev,github-auth
hermes chat -s github-pr-workflow -q "open a draft PR"
# Resume previous sessions
hermes --continue # Resume the most recent CLI session (-c)
hermes --resume # Resume a specific session by ID (-r)
# Verbose mode (debug output)
hermes chat --verbose
# Isolated git worktree (for running multiple agents in parallel)
hermes -w # Interactive mode in worktree
hermes -w -z "Fix issue #123" # Single query in worktree
## Interface Layout
The Hermes CLI banner, conversation stream, and fixed input prompt rendered as a stable docs figure instead of fragile text art.
The welcome banner shows your model, terminal backend, working directory, available tools, and installed skills at a glance.
### Status Bar
A persistent status bar sits above the input area, updating in real time:
⚕ claude-sonnet-4-20250514 │ 12.4K/200K │ [██████░░░░] 6% │ $0.06 │ 15m
| Element | Description |
| Model name | Current model (truncated if longer than 26 chars) |
| Token count | Context tokens used / max context window |
| Context bar | Visual fill indicator with color-coded thresholds |
| Cost | Estimated session cost (or `n/a` for unknown/zero-priced models) |
| 🗜️ N | **Context compression count** — how many times the running session has been auto-compressed. Appears once the first compression fires. |
| ▶ N | **Active background tasks** — how many `/background` prompts are still running in the current session. Appears whenever at least one task is in flight. |
| Duration | Elapsed session time |
| ⚠ YOLO | **YOLO mode warning** — shown whenever `HERMES_YOLO_MODE` is on (either `hermes --yolo` at launch or `/yolo` toggled mid-session). Mirrors the banner-line warning so you can't forget you're in auto-approve mode. |
The bar adapts to terminal width — full layout at ≥ 76 columns, compact at 52–75, minimal (model + duration, plus the YOLO badge when active) below 52.
**Context color coding:**
| Color | Threshold | Meaning |
|-------|-----------|---------|
| Green | < 50% | Plenty of room |
| Yellow | 50–80% | Getting full |
| Orange | 80–95% | Approaching limit |
| Red | ≥ 95% | Near overflow — consider `/compress` |
Use `/usage` for a detailed breakdown including per-category costs (input vs output tokens).
### Session Resume Display
When resuming a previous session (`hermes -c` or `hermes --resume `), a "Previous Conversation" panel appears between the banner and the input prompt, showing a compact recap of the conversation history. See [Sessions — Conversation Recap on Resume](sessions.md#conversation-recap-on-resume) for details and configuration.
## Keybindings
| Key | Action |
|-----|--------|
| `Enter` | Send message |
| `Alt+Enter`, `Ctrl+J`, or `Shift+Enter` | New line (multi-line input). `Shift+Enter` requires a terminal that distinguishes it from `Enter` — see below. On Windows Terminal, `Alt+Enter` is captured by the terminal (fullscreen toggle); use `Ctrl+Enter` or `Ctrl+J` instead. |
| `Alt+V` | Paste an image from the clipboard when supported by the terminal |
| `Ctrl+V` | Paste text and opportunistically attach clipboard images |
| `Ctrl+B` | Start/stop voice recording when voice mode is enabled (`voice.record_key`, default: `ctrl+b`) |
| `Ctrl+G` | Open the current input buffer in `$EDITOR` (vim/nvim/nano/VS Code/etc.). Save and quit to send the edited text as the next prompt — ideal for long, multi-paragraph prompts. |
| `Ctrl+X Ctrl+E` | Emacs-style alternate binding for the external editor (same behavior as `Ctrl+G`). |
| `Ctrl+C` | Interrupt agent (double-press within 2s to force exit) |
| `Ctrl+D` | Exit |
| `Ctrl+Z` | Suspend Hermes to background (Unix only). Run `fg` in the shell to resume. |
| `Tab` | Accept auto-suggestion (ghost text) or autocomplete slash commands |
**Multiline paste preview.** When you paste a multi-line block, the CLI echoes a compact single-line preview (`[pasted: 47 lines, 1,842 chars — press Enter to send]`) instead of dumping the whole payload into the scrollback. The full content is still what gets sent; this is just display polish.
**Markdown stripping in final responses.** The CLI strips the most verbose markdown fences and `**bold**` / `*italic*` wrappers from *final* agent replies so they render as readable terminal prose rather than raw source. Code blocks and lists are preserved. This does not affect gateway platforms or tool results — they keep their markdown for native rendering.
## Slash Commands
Type `/` to see the autocomplete dropdown. Hermes supports a large set of CLI slash commands, dynamic skill commands, and user-defined quick commands.
Common examples:
| `/help` | Show command help |
| `/model` | Show or change the current model |
| `/tools` | List currently available tools |
| `/skills browse` | Browse the skills hub and official optional skills |
| `/background ` | Run a prompt in a separate background session |
| `/skin` | Show or switch the active CLI skin |
| `/voice on` | Enable CLI voice mode (press `Ctrl+B` to record) |
| `/voice tts` | Toggle spoken playback for Hermes replies |
| `/reasoning high` | Increase reasoning effort |
| `/title My Session` | Name the current session |
| `/status` | Show session info — model/profile/tokens/duration — followed by a local **Session recap** block (recent turn counts, top tools used, files touched, latest user prompt + assistant reply). Pure local compute; no LLM call. |
| `/sessions` | Open an interactive session picker right inside the classic CLI (same surface the TUI uses). Type to filter, arrow keys to navigate, Enter to resume. |
For the full built-in CLI and messaging lists, see [Slash Commands Reference](../reference/slash-commands.md).
For setup, providers, silence tuning, and messaging/Discord voice usage, see [Voice Mode](features/voice-mode.md).
Commands are case-insensitive — `/HELP` works the same as `/help`. Installed skills also become slash commands automatically.
## Quick Commands
You can define custom commands that run shell commands instantly without invoking the LLM. These work in both the CLI and messaging platforms (Telegram, Discord, etc.).
quick_commands:
status:
type: exec
command: systemctl status hermes-agent
gpu:
command: nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader
restart:
type: alias
target: /gateway restart
Then type `/status`, `/gpu`, or `/restart` in any chat. See the [Configuration guide](/user-guide/configuration#quick-commands) for more examples.
## Preloading Skills at Launch
If you already know which skills you want active for the session, pass them at launch time:
hermes chat -s github-pr-workflow -s github-auth
Hermes loads each named skill into the session prompt before the first turn. The same flag works in interactive mode and single-query mode.
## Skill Slash Commands
Every installed skill in `~/.hermes/skills/` is automatically registered as a slash command. The skill name becomes the command:
/gif-search funny cats
/axolotl help me fine-tune Llama 3 on my dataset
/github-pr-workflow create a PR for the auth refactor
# Just the skill name loads it and lets the agent ask what you need:
/excalidraw
## Personalities
Set a predefined personality to change the agent's tone:
/personality pirate
/personality kawaii
/personality concise
Built-in personalities include: `helpful`, `concise`, `technical`, `creative`, `teacher`, `kawaii`, `catgirl`, `pirate`, `shakespeare`, `surfer`, `noir`, `uwu`, `philosopher`, `hype`.
You can also define custom personalities in `~/.hermes/config.yaml`:
personalities:
helpful: "You are a helpful, friendly AI assistant."
kawaii: "You are a kawaii assistant! Use cute expressions..."
pirate: "Arrr! Ye be talkin' to Captain Hermes..."
# Add your own!
## Multi-line Input
There are two ways to enter multi-line messages:
1. **`Alt+Enter`, `Ctrl+J`, or `Shift+Enter`** — inserts a new line
2. **Backslash continuation** — end a line with `\` to continue:
❯ Write a function that:\
1. Takes a list of numbers\
2. Returns the sum
Pasting multi-line text is supported — use any of the newline keys above, or simply paste content directly.
### Shift+Enter compatibility
Most terminals send the same byte sequence for `Enter` and `Shift+Enter` by default, so applications cannot distinguish them. Hermes recognises `Shift+Enter` only when the terminal sends a distinct sequence via the [Kitty keyboard protocol](https://sw.kovidgoyal.net/kitty/keyboard-protocol/) or xterm's `modifyOtherKeys` mode.
| Terminal | Status |
| Kitty, foot, WezTerm, Ghostty | Distinct `Shift+Enter` enabled by default |
| iTerm2 (recent), Alacritty, VS Code terminal, Warp | Supported once the Kitty protocol is enabled in settings |
| Windows Terminal Preview 1.25+ | Supported once the Kitty protocol is enabled in settings |
| macOS Terminal.app, stock Windows Terminal (stable) | Not supported — `Shift+Enter` is indistinguishable from `Enter` |
Where the terminal cannot distinguish them, `Alt+Enter` and `Ctrl+J` continue to work everywhere. **On Windows Terminal specifically, `Alt+Enter` is captured by the terminal (toggles fullscreen) and never reaches Hermes — use `Ctrl+Enter` (delivered as `Ctrl+J`) or `Ctrl+J` directly for a newline.**
## Interrupting the Agent
You can interrupt the agent at any point:
- **Type a new message + Enter** while the agent is working — it interrupts and processes your new instructions
- **`Ctrl+C`** — interrupt the current operation (press twice within 2s to force exit)
- In-progress terminal commands are killed immediately (SIGTERM, then SIGKILL after 1s)
- Multiple messages typed during interrupt are combined into one prompt
### Busy Input Mode
The `display.busy_input_mode` config key controls what happens when you press Enter while the agent is working:
| Mode | Behavior |
|------|----------|
| `"interrupt"` (default) | Your message interrupts the current operation and is processed immediately |
| `"queue"` | Your message is silently queued and sent as the next turn after the agent finishes |
| `"steer"` | Your message is injected into the current run via `/steer`, arriving at the agent after the next tool call — no interrupt, no new turn |
display:
busy_input_mode: "steer" # or "queue" or "interrupt" (default)
`"queue"` mode is useful when you want to prepare follow-up messages without accidentally canceling in-flight work. `"steer"` mode is useful when you want to redirect the agent mid-task without interrupting — e.g. "actually, also check the tests" while it's still editing code. Unknown values fall back to `"interrupt"`.
`"steer"` has two automatic fallbacks: if the agent hasn't started yet, or if images are attached, the message falls back to `"queue"` behavior so nothing is lost.
You can also change it inside the CLI:
```text
/busy queue
/busy steer
/busy interrupt
/busy status
:::tip First-touch hint
The very first time you press Enter while Hermes is working, Hermes prints a one-line reminder explaining the `/busy` knob (`"(tip) Your message interrupted the current run…"`). It only fires once per install — a flag in `config.yaml` under `onboarding.seen.busy_input_prompt` latches it. Delete that key to see the tip again.
### Suspending to Background
On Unix systems, press **`Ctrl+Z`** to suspend Hermes to the background — just like any terminal process. The shell prints a confirmation:
Hermes Agent has been suspended. Run `fg` to bring Hermes Agent back.
Type `fg` in your shell to resume the session exactly where you left off. This is not supported on Windows.
## Tool Progress Display
The CLI shows animated feedback as the agent works:
**Thinking animation** (during API calls):
◜ (｡•́︿•̀｡) pondering... (1.2s)
◠ (⊙_⊙) contemplating... (2.4s)
✧٩(ˊᗜˋ*)و✧ got it! (3.1s)
**Tool execution feed:**
┊ 💻 terminal `ls -la` (0.3s)
┊ 🔍 web_search (1.2s)
┊ 📄 web_extract (2.1s)
Cycle through display modes with `/verbose`: `off → new → all → verbose`. This command can also be enabled for messaging platforms — see [configuration](/user-guide/configuration#display-settings).
### Tool Preview Length
The `display.tool_preview_length` config key controls the maximum number of characters shown in tool call preview lines (e.g. file paths, terminal commands). The default is `0`, which means no limit — full paths and commands are shown.
tool_preview_length: 80 # Truncate tool previews to 80 chars (0 = no limit)
This is useful on narrow terminals or when tool arguments contain very long file paths.
## Session Management
### Resuming Sessions
When you exit a CLI session, a resume command is printed:
Resume this session with:
hermes --resume 20260225_143052_a1b2c3
Session: 20260225_143052_a1b2c3
Duration: 12m 34s
Messages: 28 (5 user, 18 tool calls)
Resume options:
hermes --continue # Resume the most recent CLI session
hermes -c "my project" # Resume a named session (latest in lineage)
hermes --resume 20260225_143052_a1b2c3 # Resume a specific session by ID
hermes --resume "refactoring auth" # Resume by title
hermes -r 20260225_143052_a1b2c3 # Short form
Resuming restores the full conversation history from SQLite. The agent sees all previous messages, tool calls, and responses — just as if you never left.
Use `/title My Session Name` inside a chat to name the current session, or `hermes sessions rename `.
Open it with any of these:
- `Ctrl+X` from the TUI.
- `/sessions` or `/switch`.
- `/sessions new` to create a fresh live session immediately.
- Click the `N live sessions` count in the status line.
Inside the switcher:
- `↑` / `↓` move the selection; mouse clicks select rows too.
- `Enter` switches to the selected live session.
- `Ctrl+D` closes the selected live session.
- `Ctrl+N` starts a blank live session.
- `Ctrl+R` refreshes the live-session list.
- `Esc` closes the switcher.
- Select `+new`, type a prompt, and press `Enter` to dispatch a new live session. Press `Tab` first if you want to choose a model just for that new session.
## LaTeX math rendering
The TUI's markdown pipeline renders LaTeX math inline: `$E = mc^2$` and `$$\frac{a}{b}$$` render as Unicode-formatted math instead of the raw TeX source. Works for inline and block math; unsupported syntax falls back to showing the literal TeX wrapped in a code span so it remains copyable.
This is always-on — nothing to configure. Classic CLI keeps the raw TeX.
## Light-terminal detection
The TUI auto-detects light terminals and swaps to the light theme accordingly. Detection works in three layers:
1. `HERMES_TUI_THEME` env var — highest priority. Values: `light`, `dark`, or a raw 6-char background hex (e.g. `ffffff`, `1a1a2e`).
2. `COLORFGBG` env var — the classic "what's my background color?" hint used by xterm-derived terminals.
3. Terminal background probe via OSC 11 — works on modern terminals (Ghostty, Warp, iTerm2, WezTerm, Kitty) that don't set `COLORFGBG`.
If you want the light theme permanently regardless of terminal:
export HERMES_TUI_THEME=light
## Busy indicator styles
The status-bar busy indicator is pluggable — the default rotates Hermes' kawaii face palette every 2.5 seconds during agent work. Pick a different style via config or the `/indicator` slash command:
tui_status_indicator: kaomoji # kaomoji | emoji | unicode | ascii
Or in-session: `/indicator emoji` (etc.). Styles ship with matched glyph widths so the rest of the status bar doesn't jitter on rotation.
## Auto-resume
By default, `hermes --tui` starts a fresh session each launch. To re-attach to the most recent TUI session automatically (useful when your terminal or SSH connection drops unexpectedly), opt in:
export HERMES_TUI_RESUME=1 # most-recent TUI session
# or:
export HERMES_TUI_RESUME= # specific session
Unset the variable or pass `--resume ` explicitly to override on a per-launch basis.
## Status line
The TUI's status line tracks agent state in real time:
| Status | Meaning |
|--------|---------|
| `starting agent…` | Session ID is live; tools and skills still coming online. You can type — messages queue and send when ready. |
| `ready` | Agent is idle, accepting input. |
| `thinking…` / `running…` | Agent is reasoning or running a tool. |
| `interrupted` | Current turn was cancelled; press Enter to send again. |
| `forging session…` / `resuming…` | Initial connect or `--resume` handshake. |
The per-skin status-bar colors and thresholds are shared with the classic CLI — see [Skins](features/skins.md) for customization.
The status line also shows:
- **Working directory with git branch** — `~/projects/hermes-agent (docs/two-week-gap-sweep)`. The branch suffix updates when you `git checkout` in a side terminal (mtime-cached) so the TUI reflects your actual active branch, not whatever it was at launch.
- **Per-prompt elapsed time** — `⏱ 12s/3m 45s` while the turn is running (live), frozen to `⏲ 32s / 3m 45s` after the turn completes. First number is time since last user message; second is total session duration. Resets on every new prompt.
- **`🗜️ N`** — number of times the running session has been auto-compressed. Appears once the first compression fires.
- **`▶ N`** — number of `/background` tasks currently running in this session. Appears whenever at least one task is in flight.
- **`⚠ YOLO`** — visible warning whenever YOLO mode is on (`hermes --yolo`, `/yolo`, or `HERMES_YOLO_MODE=1`). The same badge also appears in the startup banner so you cannot launch an auto-approving session without noticing.
The TUI respects all standard Hermes config: `~/.hermes/config.yaml`, profiles, personalities, skins, quick commands, credential pools, memory providers, tool/skill enablement. No TUI-specific config file exists.
A handful of keys tune the TUI surface specifically:
skin: default # any built-in or custom skin
personality: helpful
details_mode: collapsed # hidden | collapsed | expanded — global accordion default
sections: # optional: per-section overrides (any subset)
thinking: expanded # always open
tools: expanded # always open
activity: collapsed # opt back IN to the activity panel (hidden by default)
mouse_tracking: all # off | wheel | buttons | all (or true/false for back-compat).
# wheel — 1000+1006 (scroll + click; no drag, no hover —
# recommended inside tmux to silence the prompt-row
# "No image in clipboard" spam from hover events)
# buttons — adds 1002 for terminal-side drag selection
# all — adds 1003 for hover (scrollbar paginate-on-hover,
# link mouseenter, etc.)
Runtime toggles:
- `/details [hidden|collapsed|expanded|cycle]` — set the global mode
- `/details
[hidden|collapsed|expanded|reset]` — override one section
(sections: `thinking`, `tools`, `subagents`, `activity`)
**Default visibility**
The TUI ships with opinionated per-section defaults that stream the turn as
a live transcript instead of a wall of chevrons:
- `thinking` — **expanded**. Reasoning streams inline as the model emits it.
- `tools` — **expanded**. Tool calls and their results render open.
- `subagents` — falls through to the global `details_mode` (collapsed under
chevron by default — stays quiet until a delegation actually happens).
- `activity` — **hidden**. Ambient meta (gateway hints, terminal-parity
nudges, background notifications) is noise for most day-to-day use. Tool
failures still render inline on the failing tool row; ambient
errors/warnings surface via a floating-alert backstop when every panel
is hidden.
Per-section overrides take precedence over both the section default and the
global `details_mode`. To reshape the layout:
- `display.sections.thinking: collapsed` — put thinking back under a chevron
- `display.sections.tools: collapsed` — put tool calls back under a chevron
- `display.sections.activity: collapsed` — opt the activity panel back in
` at runtime
Anything set explicitly in `display.sections` wins over the defaults, so
existing configs keep working unchanged.
## Sessions
Sessions are shared between the TUI and the classic CLI — both write to the same `~/.hermes/state.db`. You can start a session in one, resume in the other. The session picker surfaces sessions from both sources, with a source tag.
See [Sessions](sessions.md) for lifecycle, search, compression, and export.
## How the TUI talks to its gateway
By default the TUI spawns its own in-process gateway, so each TUI instance is self-contained — there's nothing to configure.
You may see a `HERMES_TUI_GATEWAY_URL` env var referenced in the codebase or logs. This is an **internal wiring detail of the web dashboard**, not a user-facing remote-attach knob. When you open the dashboard's "Chat" tab (`hermes dashboard` → `/chat`), the dashboard's web server spawns an embedded TUI child process and injects `HERMES_TUI_GATEWAY_URL` so that child attaches to the dashboard's own in-process `tui_gateway` over a loopback WebSocket (`/api/ws`). The `/api/ws` endpoint exists only inside the dashboard server (`hermes_cli/web_server.py`) and is bound to that process's lifetime and auth.
There is no general "point any TUI at any standalone gateway port" mode. In particular, the OpenAI-compatible API server (`hermes gateway` / the `api_server` platform) does **not** serve `/api/ws` — it's the model-backend surface (`/v1/chat/completions`, `/v1/models`, …) and deliberately does not expose the TUI's JSON-RPC control channel. Setting `HERMES_TUI_GATEWAY_URL` to that port will 404.
If you want multiple surfaces to share one set of sessions, use the shared `~/.hermes/state.db` (see [Sessions](sessions.md)) or the web dashboard's embedded chat (see [Web Dashboard](features/web-dashboard.md#chat)) — not a hand-set gateway URL.
## Reverting to the classic CLI
Launching `hermes` (without `--tui`) stays on the classic CLI by default. To make a machine prefer the TUI, set `display.interface: tui` in `~/.hermes/config.yaml` (persistent) or `HERMES_TUI=1` in your shell profile (per-shell). To go back, set `interface: cli` / unset the env var, or pass `hermes --cli` for a one-off.
If the TUI fails to launch (no Node, missing bundle, TTY issue), Hermes prints a diagnostic and falls back — rather than leaving you stuck.
## See also
- [CLI Interface](cli.md) — full slash command and keybinding reference (shared)
- [Sessions](sessions.md) — resume, branch, and history
- [Skins & Themes](features/skins.md) — theme the banner, status bar, and overlays
- [Voice Mode](features/voice-mode.md) — works in both interfaces
- [Configuration](configuration.md) — all config keys
# Configuration
All settings are stored in the `~/.hermes/` directory for easy access.
:::tip Easiest path to a working `config.yaml`
Run `hermes setup --portal` — one OAuth gets you a model provider and all four Tool Gateway tools without hand-editing YAML. Portal subscribers also get 10% off token-billed providers. See [Nous Portal](/integrations/nous-portal).
## Directory Structure
~/.hermes/
├── config.yaml # Settings (model, terminal, TTS, compression, etc.)
├── .env # API keys and secrets
├── auth.json # OAuth provider credentials (Nous Portal, etc.)
├── SOUL.md # Primary agent identity (slot #1 in system prompt)
├── memories/ # Persistent memory (MEMORY.md, USER.md)
├── skills/ # Agent-created skills (managed via skill_manage tool)
├── cron/ # Scheduled jobs
├── sessions/ # Gateway sessions
└── logs/ # Logs (errors.log, gateway.log — secrets auto-redacted)
## Managing Configuration
hermes config # View current configuration
hermes config edit # Open config.yaml in your editor
hermes config set KEY VAL # Set a specific value
hermes config check # Check for missing options (after updates)
hermes config migrate # Interactively add missing options
# Examples:
hermes config set model anthropic/claude-opus-4
hermes config set OPENROUTER_API_KEY sk-or-... # Saves to .env
The `hermes config set` command automatically routes values to the right file — API keys are saved to `.env`, everything else to `config.yaml`.
## Configuration Precedence
Settings are resolved in this order (highest priority first):
1. **CLI arguments** — e.g., `hermes chat --model anthropic/claude-sonnet-4` (per-invocation override)
2. **`~/.hermes/config.yaml`** — the primary config file for all non-secret settings
3. **`~/.hermes/.env`** — fallback for env vars; **required** for secrets (API keys, tokens, passwords)
4. **Built-in defaults** — hardcoded safe defaults when nothing else is set
:::info Rule of Thumb
Secrets (API keys, bot tokens, passwords) go in `.env`. Everything else (model, terminal backend, compression settings, memory limits, toolsets) goes in `config.yaml`. When both are set, `config.yaml` wins for non-secret settings.
:::tip Org deployments
An administrator can pin specific config and secret values that a standard user
cannot override, via a system-level managed directory. See
[Managed Scope](/user-guide/managed-scope).
## Environment Variable Substitution
You can reference environment variables in `config.yaml` using `${VAR_NAME}` syntax:
auxiliary:
vision:
api_key: ${GOOGLE_API_KEY}
base_url: ${CUSTOM_VISION_URL}
delegation:
api_key: ${DELEGATION_KEY}
Multiple references in a single value work: `url: "${HOST}:${PORT}"`. If a referenced variable is not set, the placeholder is kept verbatim (`${UNDEFINED_VAR}` stays as-is). Only the `${VAR}` syntax is supported — bare `$VAR` is not expanded.
For AI provider setup (OpenRouter, Anthropic, Copilot, custom endpoints, self-hosted LLMs, fallback models, etc.), see [AI Providers](/integrations/providers).
### Provider Timeouts
You can set `providers. .request_timeout_seconds` for a provider-wide request timeout, plus `providers. .models. .timeout_seconds` for a model-specific override. Applies to the primary turn client on every transport (OpenAI-wire, native Anthropic, Anthropic-compatible), the fallback chain, rebuilds after credential rotation, and (for OpenAI-wire) the per-request timeout kwarg — so the configured value wins over the legacy `HERMES_API_TIMEOUT` env var.
You can also set `providers. .stale_timeout_seconds` for the non-streaming stale-call detector, plus `providers. .models. .stale_timeout_seconds` for a model-specific override. This wins over the legacy `HERMES_API_CALL_STALE_TIMEOUT` env var.
Leaving these unset keeps the legacy defaults (`HERMES_API_TIMEOUT=1800`s, `HERMES_API_CALL_STALE_TIMEOUT=90`s, native Anthropic 900s). The non-streaming stale detector is auto-disabled for local endpoints when left implicit and can scale upward for very large contexts. Not currently wired for AWS Bedrock (both `bedrock_converse` and AnthropicBedrock SDK paths use boto3 with its own timeout configuration). See the commented example in [`cli-config.yaml.example`](https://github.com/NousResearch/hermes-agent/blob/main/cli-config.yaml.example).
## Update Behavior
`hermes update` settings live under `updates` in `config.yaml`:
pre_update_backup: false # Create a full HERMES_HOME zip before every update
backup_keep: 5 # Keep this many pre-update backup zips
non_interactive_local_changes: stash # stash | discard
For git installs, Hermes auto-stashes dirty tracked files and untracked files before checking out the update branch or pulling. Interactive terminal updates prompt before restoring that stash. Non-interactive updates (desktop/chat app, gateway, or `--yes`) use `updates.non_interactive_local_changes`: `stash` restores local source edits after a successful pull, while `discard` drops the update-created stash after a successful pull. Use `discard` only on managed installs where local source edits are never meant to persist.
Before that stash step, Hermes also restores tracked `package-lock.json` diffs left by npm install/build churn. Commit or manually stash intentional lockfile edits before updating.
## Terminal Backend Configuration
Hermes supports six terminal backends. Each determines where the agent's shell commands actually execute — your local machine, a Docker container, a remote server via SSH, a Modal cloud sandbox (direct or via the Nous-managed gateway), a Daytona workspace, or a Singularity/Apptainer container.
terminal:
backend: local # local | docker | ssh | modal | daytona | singularity
cwd: "." # Gateway/cron working directory (CLI always uses launch dir)
timeout: 180 # Per-command timeout in seconds
home_mode: auto # auto | real | profile — subprocess HOME policy
env_passthrough: [] # Env var names to forward to sandboxed execution (terminal + execute_code)
singularity_image: "docker://nikolaik/python-nodejs:python3.11-nodejs20" # Container image for Singularity backend
modal_image: "nikolaik/python-nodejs:python3.11-nodejs20" # Container image for Modal backend
daytona_image: "nikolaik/python-nodejs:python3.11-nodejs20" # Container image for Daytona backend
For cloud sandboxes such as Modal and Daytona, `container_persistent: true` means Hermes will try to preserve filesystem state across sandbox recreation. It does not promise that the same live sandbox, PID space, or background processes will still be running later.
### Backend Overview
| Backend | Where commands run | Isolation | Best for |
|---------|-------------------|-----------|----------|
| **local** | Your machine directly | None | Development, personal use |
| **docker** | Single persistent Docker container (shared across session, `/new`, subagents) | Full (namespaces, cap-drop) | Safe sandboxing, CI/CD |
| **ssh** | Remote server via SSH | Network boundary | Remote dev, powerful hardware |
| **modal** | Modal cloud sandbox | Full (cloud VM) | Ephemeral cloud compute, evals |
| **daytona** | Daytona workspace | Full (cloud container) | Managed cloud dev environments |
| **singularity** | Singularity/Apptainer container | Namespaces (--containall) | HPC clusters, shared machines |
### Local Backend
The default. Commands run directly on your machine with no isolation. No special setup required.
backend: local
By default, local tool subprocesses keep your real OS-user `HOME`. This lets
external CLIs such as `git`, `ssh`, `gh`, `az`, `npm`, Claude Code, and Codex
find the credentials and config they already use in your normal shell. Hermes
state is still profile-scoped through `HERMES_HOME`; `HOME` is not how profiles
select config, memory, sessions, or skills.
Hermes does **not** change your system-wide `HOME`, your shell startup files, or
the operating system account home. This setting only controls the environment
passed to subprocesses that Hermes launches through tools such as `terminal`,
background terminal processes, `execute_code`, and ACP helper processes.
#### `terminal.home_mode`
| Mode | Host installs | Containers | Tradeoff |
| `auto` | Keep the real OS-user `HOME` | Use `{HERMES_HOME}/home` | Recommended default. Host CLIs keep working; container state persists. |
| `real` | Force the real OS-user `HOME` | Force the real OS-user `HOME` if visible | Useful if a parent process accidentally started with `HOME` pointed at a profile home. |
| `profile` | Use `{HERMES_HOME}/home` when it exists | Use `{HERMES_HOME}/home` when it exists | Strict per-profile CLI config isolation, but normal `~/.ssh`, `~/.gitconfig`, `~/.azure`, `~/.config/gh`, Claude/Codex auth, npm state, etc. will not be visible unless you initialize or link them inside the profile home. |
The downside of the default is that host profiles share the same normal
user-level CLI credentials/config under `~`. If you need a profile with a
separate git identity, SSH keys, GitHub CLI login, npm config, or cloud CLI
login, use `home_mode: profile` and initialize those tools inside that profile
home deliberately.
If you intentionally want strict per-profile tool-config isolation, set:
home_mode: profile
In that mode tool subprocesses use `{HERMES_HOME}/home` as `HOME`. Hermes also
sets `HERMES_REAL_HOME` so scripts can still locate the actual user home when
they need it. Container backends keep using `{HERMES_HOME}/home` in `auto` mode
because that directory lives on the persistent Hermes data volume.
Scripts that need to distinguish profile state from the real user home should
prefer `HERMES_HOME` for Hermes data and `HERMES_REAL_HOME` for the account home:
```python
from pathlib import Path
import os
hermes_home = Path(os.environ["HERMES_HOME"])
real_home = Path(os.environ.get("HERMES_REAL_HOME", os.environ["HOME"]))
The agent has the same filesystem access as your user account. Use `hermes tools` to disable tools you don't want, or switch to Docker for sandboxing.
### Docker Backend
Runs commands inside a Docker container with security hardening (all capabilities dropped, no privilege escalation, PID limits).
**Single persistent container, shared across Hermes processes.** Hermes starts ONE long-lived container on first use and routes every terminal, file, and `execute_code` call through `docker exec` into that same container — across sessions, `/new`, `/reset`, and `delegate_task` subagents. Working-directory changes, installed packages, files in `/workspace`, and **background processes** all carry over from one tool call to the next, and from one Hermes process to the next. When you close a TUI session, run `/quit`, or start a new `hermes` invocation, the container keeps running and the next Hermes process reuses it via a labeled lookup. See **Container lifecycle** below for the exact teardown rules.
backend: docker
docker_image: "nikolaik/python-nodejs:python3.11-nodejs20"
docker_mount_cwd_to_workspace: false # Mount launch dir into /workspace
docker_run_as_host_user: false # See "Running container as host user" below
docker_forward_env: # Host env vars to forward into container
- "GITHUB_TOKEN"
docker_env: # Literal env vars to inject (KEY=value)
DEBUG: "1"
PYTHONUNBUFFERED: "1"
docker_volumes: # Host directory mounts
- "/home/user/projects:/workspace/projects"
- "/home/user/data:/data:ro" # :ro for read-only
docker_extra_args: # Extra flags appended verbatim to `docker run`
- "--gpus=all"
- "--network=host"
# Resource limits
container_cpu: 1 # CPU cores (0 = unlimited)
container_memory: 5120 # MB (0 = unlimited)
container_disk: 51200 # MB (requires overlay2 on XFS+pquota)
container_persistent: true # Persist /workspace and /root bind-mount dirs
# Cross-process container reuse (defaults match the "one long-lived
# container shared across sessions" contract — see Container lifecycle).
docker_persist_across_processes: true # Reuse container across Hermes restarts
docker_orphan_reaper: true # Sweep abandoned Exited containers at startup
# Cross-backend lifecycle settings (apply to docker as well)
lifetime_seconds: 300 # Idle-reaper window; also feeds 2× orphan-reaper threshold
**`docker_env`** vs **`docker_forward_env`**: the former injects literal `KEY=value` pairs you specify in the config (the values live in your `config.yaml` or are passed as a JSON dict via `TERMINAL_DOCKER_ENV='{"DEBUG":"1"}'`). The latter forwards values from your shell or `~/.hermes/.env`, so the actual secret never appears in the config file. Use `docker_forward_env` for tokens and `docker_env` for static knobs the container needs.
**`terminal.docker_extra_args`** (also overridable via `TERMINAL_DOCKER_EXTRA_ARGS='["--gpus=all"]'`) lets you pass arbitrary `docker run` flags that Hermes doesn't surface as first-class keys — `--gpus`, `--network`, `--add-host`, alternative `--security-opt` overrides, etc. Each entry must be a string; the list is appended last to the assembled `docker run` invocation so it can override Hermes' defaults if needed. Use sparingly — flags that conflict with the sandbox hardening (capability drops, `--user`, the workspace bind mount) will silently weaken isolation.
**Requirements:** Docker Desktop or Docker Engine installed and running. Hermes probes `$PATH` plus common macOS install locations (`/usr/local/bin/docker`, `/opt/homebrew/bin/docker`, Docker Desktop app bundle). Podman is supported out of the box: set `HERMES_DOCKER_BINARY=podman` (or the full path) to force it when both are installed.
#### Container lifecycle
Every Hermes-managed container is tagged with three labels so subsequent processes (and the orphan reaper) can identify it:
- `hermes-agent=1` — marks it as Hermes-managed
- `hermes-task-id= ` — keys the per-task reuse probe
- `hermes-profile= ` — scopes reuse and reaping to the active Hermes profile
On startup, Hermes runs `docker ps --filter label=hermes-task-id= --filter label=hermes-profile= ` and **attaches to the existing container** when it finds one. If the container is `exited` (e.g. after a Docker daemon restart), it's `docker start`'d and reused — filesystem state and any installed packages survive, but in-container background processes do not.
When a Hermes process exits — `/quit`, closing a TUI session, gateway shutdown, even SIGKILL — the cleanup path is a **no-op for the container in default mode**. The container keeps running. The next Hermes process attaches to it in milliseconds via the label probe. This is the behavior the "one long-lived container shared across sessions" contract requires: it's the only way background processes (npm watchers, dev servers, long-running pytest) survive across sessions.
**The container is only torn down (stopped and `docker rm -f`'d) in these cases:**
| Trigger | When it fires |
| `docker_persist_across_processes: false` | Explicit per-process isolation. Every `cleanup()` does `stop` + `rm -f`. Matches pre-issue-#20561 behavior. |
| Idle reaper (`lifetime_seconds`, default 300s) | Only when the env is `persist_across_processes=false`. Persist-mode envs are no-op'd; container survives the idle sweep. |
| Orphan reaper at next startup | Sweeps **Exited** hermes-labeled containers older than `2 × lifetime_seconds` (default 600s = 10 min), scoped to the current profile. **Running containers are never touched** — sibling-process safety. Set `docker_orphan_reaper: false` to disable. |
| Direct user action | `docker rm -f`, `docker system prune`, Docker Desktop restart. We don't set `--restart=always`, so a host reboot leaves the container `Exited` (its CoW layer survives and gets reused on next startup, but bg processes are gone). |
Edge cases worth knowing:
- **OOM kill of in-container PID 1** transitions the container to `Exited`. Next reuse will `docker start` it; filesystem state survives, bg processes do not.
- **Switching profiles** isolates containers from each other — a container labeled `hermes-profile=work` is invisible to a Hermes process running under `hermes-profile=research`. The orphan reaper is profile-scoped too, so cross-profile containers don't get reaped accidentally, but they also won't get cleaned up automatically until you start Hermes again under their original profile.
Parallel subagents spawned via `delegate_task(tasks=[...])` share this one container — concurrent `cd`, env mutations, and writes to the same path will collide. If a subagent needs an isolated sandbox, it must register a per-task image override via `register_task_env_overrides()`, which RL and benchmark environments (TerminalBench2, HermesSweEnv, etc.) do automatically for their per-task Docker images.
**Security hardening:**
- `--cap-drop ALL` with only `DAC_OVERRIDE`, `CHOWN`, `FOWNER` added back
- `--security-opt no-new-privileges`
- `--pids-limit 256`
- Size-limited tmpfs for `/tmp` (512MB), `/var/tmp` (256MB), `/run` (64MB)
**Credential forwarding:** Env vars listed in `docker_forward_env` are resolved from your shell environment first, then `~/.hermes/.env`. Skills can also declare `required_environment_variables` which are merged automatically.
#### Environment variable overrides
Every key under `terminal:` has an env-var override of the form `TERMINAL_ `. The most useful ones for the Docker backend:
| Env var | Maps to | Notes |
| `TERMINAL_DOCKER_IMAGE` | `docker_image` | Base image |
| `TERMINAL_DOCKER_FORWARD_ENV` | `docker_forward_env` | JSON array: `'["GITHUB_TOKEN","OPENAI_API_KEY"]'` |
| `TERMINAL_DOCKER_ENV` | `docker_env` | JSON dict: `'{"DEBUG":"1"}'` |
| `TERMINAL_DOCKER_VOLUMES` | `docker_volumes` | JSON array of `"host:container[:ro]"` strings |
| `TERMINAL_DOCKER_EXTRA_ARGS` | `docker_extra_args` | JSON array |
| `TERMINAL_DOCKER_MOUNT_CWD_TO_WORKSPACE` | `docker_mount_cwd_to_workspace` | `true` / `false` |
| `TERMINAL_DOCKER_RUN_AS_HOST_USER` | `docker_run_as_host_user` | `true` / `false` |
| `TERMINAL_DOCKER_PERSIST_ACROSS_PROCESSES` | `docker_persist_across_processes` | `true` / `false` — default `true` |
| `TERMINAL_DOCKER_ORPHAN_REAPER` | `docker_orphan_reaper` | `true` / `false` — default `true` |
| `TERMINAL_CONTAINER_CPU` | `container_cpu` | CPU cores |
| `TERMINAL_CONTAINER_MEMORY` | `container_memory` | MB |
| `TERMINAL_CONTAINER_DISK` | `container_disk` | MB |
| `TERMINAL_CONTAINER_PERSISTENT` | `container_persistent` | `true` / `false` — controls the bind-mount workspace dirs, distinct from `docker_persist_across_processes` |
| `TERMINAL_LIFETIME_SECONDS` | `lifetime_seconds` | Idle reaper window |
| `TERMINAL_TIMEOUT` | `timeout` | Per-command timeout |
| `HERMES_DOCKER_BINARY` | _none_ | Force a specific docker/podman binary path |
### SSH Backend
Runs commands on a remote server over SSH. Uses ControlMaster for connection reuse (5-minute idle keepalive). Persistent shell is enabled by default — state (cwd, env vars) survives across commands.
backend: ssh
persistent_shell: true # Keep a long-lived bash session (default: true)
**Required environment variables:**
TERMINAL_SSH_HOST=my-server.example.com
TERMINAL_SSH_USER=ubuntu
**Optional:**
| Variable | Default | Description |
|----------|---------|-------------|
| `TERMINAL_SSH_PORT` | `22` | SSH port |
| `TERMINAL_SSH_KEY` | (system default) | Path to SSH private key |
| `TERMINAL_SSH_PERSISTENT` | `true` | Enable persistent shell |
**How it works:** Connects at init time with `BatchMode=yes` and `StrictHostKeyChecking=accept-new`. Persistent shell keeps a single `bash -l` process alive on the remote host, communicating via temporary files. Commands that need `stdin_data` or `sudo` automatically fall back to one-shot mode.
### Modal Backend
Runs commands in a [Modal](https://modal.com) cloud sandbox. Each task gets an isolated VM with configurable CPU, memory, and disk. Filesystem can be snapshot/restored across sessions.
backend: modal
container_cpu: 1 # CPU cores
container_memory: 5120 # MB (5GB)
container_disk: 51200 # MB (50GB)
container_persistent: true # Snapshot/restore filesystem
**Required:** Either `MODAL_TOKEN_ID` + `MODAL_TOKEN_SECRET` environment variables, or a `~/.modal.toml` config file.
**Persistence:** When enabled, the sandbox filesystem is snapshotted on cleanup and restored on next session. Snapshots are tracked in `~/.hermes/modal_snapshots.json`. This preserves filesystem state, not live processes, PID space, or background jobs.
**Credential files:** Automatically mounted from `~/.hermes/` (OAuth tokens, etc.) and synced before each command.
### Daytona Backend
Runs commands in a [Daytona](https://daytona.io) managed workspace. Supports stop/resume for persistence.
backend: daytona
container_memory: 5120 # MB → converted to GiB
container_disk: 10240 # MB → converted to GiB (max 10 GiB)
container_persistent: true # Stop/resume instead of delete
**Required:** `DAYTONA_API_KEY` environment variable.
**Persistence:** When enabled, sandboxes are stopped (not deleted) on cleanup and resumed on next session. Sandbox names follow the pattern `hermes-{task_id}`.
**Disk limit:** Daytona enforces a 10 GiB maximum. Requests above this are capped with a warning.
### Singularity/Apptainer Backend
Runs commands in a [Singularity/Apptainer](https://apptainer.org) container. Designed for HPC clusters and shared machines where Docker isn't available.
backend: singularity
singularity_image: "docker://nikolaik/python-nodejs:python3.11-nodejs20"
container_memory: 5120 # MB
container_persistent: true # Writable overlay persists across sessions
**Requirements:** `apptainer` or `singularity` binary in `$PATH`.
**Image handling:** Docker URLs (`docker://...`) are automatically converted to SIF files and cached. Existing `.sif` files are used directly.
**Scratch directory:** Resolved in order: `TERMINAL_SCRATCH_DIR` → `TERMINAL_SANDBOX_DIR/singularity` → `/scratch/$USER/hermes-agent` (HPC convention) → `~/.hermes/sandboxes/singularity`.
**Isolation:** Uses `--containall --no-home` for full namespace isolation without mounting the host home directory.
### Common Terminal Backend Issues
If terminal commands fail immediately or the terminal tool is reported as disabled:
- **Local** — No special requirements. The safest default when getting started.
- **Docker** — Run `docker version` to verify Docker is working. If it fails, fix Docker or `hermes config set terminal.backend local`.
- **SSH** — Both `TERMINAL_SSH_HOST` and `TERMINAL_SSH_USER` must be set. Hermes logs a clear error if either is missing.
- **Modal** — Needs `MODAL_TOKEN_ID` env var or `~/.modal.toml`. Run `hermes doctor` to check.
- **Daytona** — Needs `DAYTONA_API_KEY`. The Daytona SDK handles server URL configuration.
- **Singularity** — Needs `apptainer` or `singularity` in `$PATH`. Common on HPC clusters.
When in doubt, set `terminal.backend` back to `local` and verify that commands run there first.
### Remote-to-Host File Sync on Teardown
For the **SSH**, **Modal**, and **Daytona** backends (anywhere the agent's working tree lives on a different machine than the host running Hermes), Hermes tracks files the agent touched inside the remote sandbox and, on session teardown / sandbox cleanup, **syncs the modified files back to the host** under `~/.hermes/cache/remote-syncs/ /`.
- Triggers on: session close, `/new`, `/reset`, gateway message timeout, `delegate_task` subagent completion when the child used a remote backend.
- Covers the whole tree the agent modified, not just files it explicitly opened. Additions, edits, and deletions are all captured.
- The remote sandbox may have been torn down by the time you go looking; the local `~/.hermes/cache/remote-syncs/…` copy is the authoritative record of what the agent changed.
- Large binary outputs (model checkpoints, raw datasets) are capped by size — the sync skips files over `file_sync_max_mb` (default `100`). Bump that if you expect bigger artifacts to come back.
file_sync_max_mb: 100 # default — sync files up to 100 MB each
file_sync_enabled: true # default — set false to skip the sync entirely
This is how you recover results from ephemeral cloud sandboxes that get destroyed after the session ends, without having to tell the agent to explicitly `scp` or `modal volume put` every artifact.
### Docker Volume Mounts
When using the Docker backend, `docker_volumes` lets you share host directories with the container. Each entry uses standard Docker `-v` syntax: `host_path:container_path[:options]`.
docker_volumes:
- "/home/user/projects:/workspace/projects" # Read-write (default)
- "/home/user/datasets:/data:ro" # Read-only
- "/home/user/.hermes/cache/documents:/output" # Gateway-visible exports
This is useful for:
- **Providing files** to the agent (datasets, configs, reference code)
- **Receiving files** from the agent (generated code, reports, exports)
- **Shared workspaces** where both you and the agent access the same files
If you use a messaging gateway and want the agent to send generated files via
`MEDIA:/...`, prefer a dedicated host-visible export mount such as
`/home/user/.hermes/cache/documents:/output`.
- Write files inside Docker to `/output/...`
- Emit the **host path** in `MEDIA:`, for example:
`MEDIA:/home/user/.hermes/cache/documents/report.txt`
- Do **not** emit `/workspace/...` or `/output/...` unless that exact path also
exists for the gateway process on the host
YAML duplicate keys silently override earlier ones. If you already have a
`docker_volumes:` block, merge new mounts into the same list instead of adding
another `docker_volumes:` key later in the file.
Can also be set via environment variable: `TERMINAL_DOCKER_VOLUMES='["/host:/container"]'` (JSON array).
### Docker Credential Forwarding
By default, Docker terminal sessions do not inherit arbitrary host credentials. If you need a specific token inside the container, add it to `terminal.docker_forward_env`.
docker_forward_env:
- "NPM_TOKEN"
Hermes resolves each listed variable from your current shell first, then falls back to `~/.hermes/.env` if it was saved with `hermes config set`.
Anything listed in `docker_forward_env` becomes visible to commands run inside the container. Only forward credentials you are comfortable exposing to the terminal session.
### Running the Container as Your Host User
By default Docker containers run as `root` (UID 0). Files created inside `/workspace` or other bind-mounts end up owned by root on the host, so after a session you have to `sudo chown` them before you can edit them from your host editor. The `terminal.docker_run_as_host_user` flag fixes this:
docker_run_as_host_user: true # default: false
When enabled, Hermes appends `--user $(id -u):$(id -g)` to the `docker run` command so files written into bind-mounted directories (`/workspace`, `/root`, anything in `docker_volumes`) are owned by your host user, not root. The trade-off: the container can no longer `apt install` or write to root-owned paths like `/root/.npm` — use a base image whose `HOME` is owned by a non-root user (or add your required tooling at image build time) if you need both.
Leave this `false` (the default) for backwards-compatible behavior. Turn it on when your workflow is mostly "edit mounted host files" and you're tired of `sudo chown -R`.
### Optional: Mount the Launch Directory into `/workspace`
Docker sandboxes stay isolated by default. Hermes does **not** pass your current host working directory into the container unless you explicitly opt in.
Enable it in `config.yaml`:
docker_mount_cwd_to_workspace: true
When enabled:
- if you launch Hermes from `~/projects/my-app`, that host directory is bind-mounted to `/workspace`
- the Docker backend starts in `/workspace`
- file tools and terminal commands both see the same mounted project
When disabled, `/workspace` stays sandbox-owned unless you explicitly mount something via `docker_volumes`.
Security tradeoff:
- `false` preserves the sandbox boundary
- `true` gives the sandbox direct access to the directory you launched Hermes from
Use the opt-in only when you intentionally want the container to work on live host files.
### Persistent Shell
By default, each terminal command runs in its own subprocess — working directory, environment variables, and shell variables reset between commands. When **persistent shell** is enabled, a single long-lived bash process is kept alive across `execute()` calls so that state survives between commands.
This is most useful for the **SSH backend**, where it also eliminates per-command connection overhead. Persistent shell is **enabled by default for SSH** and disabled for the local backend.
persistent_shell: true # default — enables persistent shell for SSH
To disable:
hermes config set terminal.persistent_shell false
**What persists across commands:**
- Working directory (`cd /tmp` sticks for the next command)
- Exported environment variables (`export FOO=bar`)
- Shell variables (`MY_VAR=hello`)
**Precedence:**
| Level | Variable | Default |
|-------|----------|---------|
| Config | `terminal.persistent_shell` | `true` |
| SSH override | `TERMINAL_SSH_PERSISTENT` | follows config |
| Local override | `TERMINAL_LOCAL_PERSISTENT` | `false` |
Per-backend environment variables take highest precedence. If you want persistent shell on the local backend too:
export TERMINAL_LOCAL_PERSISTENT=true
Commands that require `stdin_data` or sudo automatically fall back to one-shot mode, since the persistent shell's stdin is already occupied by the IPC protocol.
See [Code Execution](features/code-execution.md) and the [Terminal section of the README](features/tools.md) for details on each backend.
## Skill Settings
Skills can declare their own configuration settings via their SKILL.md frontmatter. These are non-secret values (paths, preferences, domain settings) stored under the `skills.config` namespace in `config.yaml`.
skills:
config:
myplugin:
path: ~/myplugin-data # Example — each skill defines its own keys
**How skill settings work:**
- `hermes config migrate` scans all enabled skills, finds unconfigured settings, and offers to prompt you
- `hermes config show` displays all skill settings under "Skill Settings" with the skill they belong to
- When a skill loads, its resolved config values are injected into the skill context automatically
**Setting values manually:**
hermes config set skills.config.myplugin.path ~/myplugin-data
For details on declaring config settings in your own skills, see [Creating Skills — Config Settings](/developer-guide/creating-skills#config-settings-configyaml).
### Guard on agent-created skill writes
When the agent uses `skill_manage` to create, edit, patch, or delete a skill, Hermes can optionally scan the new/updated content for dangerous keyword patterns (credential harvesting, obvious prompt injection, exfil instructions). The scanner is **off by default** — real agent workflows that legitimately touch `~/.ssh/` or mention `$OPENAI_API_KEY` were tripping the heuristic too often. Turn it back on if you want the scanner to prompt you before the agent's skill writes land:
guard_agent_created: true # default: false
When on, any flagged `skill_manage` write surfaces as an approval prompt with the scanner's rationale. Accepted writes land; denied writes return an explanatory error to the agent.
### Write approval for skill writes
Independent of the content scanner above, `skills.write_approval` gates **every** agent skill write (create / edit / patch / delete / supporting files) behind your explicit approval — the same approve/deny mechanism as dangerous commands:
write_approval: false # false = write freely (default) | true = stage ever
...
