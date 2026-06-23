# Installer internals - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/installer
- Final URL: https://docs.openclaw.ai/install/installer
- Canonical URL: https://docs.openclaw.ai/install/installer
- Fetched at: 2026-06-23T14:44:47Z
- Content type: text/html; charset=utf-8

## Description

How the installer scripts work (install.sh, install-cli.sh, install.ps1), flags, and automation

## Extracted Text

Close
Install Install overview
OpenClaw ships three installer scripts, served from openclaw.ai .
Script Platform What it does install.sh macOS / Linux / WSL Installs Node if needed, installs OpenClaw via npm (default) or git, and can run onboarding. install-cli.sh macOS / Linux / WSL Installs Node + OpenClaw into a local prefix ( ~/.openclaw ) with npm or git checkout modes. No root required. install.ps1 Windows (PowerShell) Installs Node if needed, installs OpenClaw via npm (default) or git, and can run onboarding.
Quick commands
install.sh
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- -- help
install-cli.sh
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- -- help
install.ps1
powershell Copy code iwr -useb https://openclaw.ai/install.ps1 | iex powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -Tag beta -NoOnboard -DryRun
Note
If install succeeds but openclaw is not found in a new terminal, see Node.js troubleshooting .
Tip
Recommended for most interactive installs on macOS/Linux/WSL.
Flow (install.sh)
Detect OS
Supports macOS and Linux (including WSL).
Ensure Node.js 24 by default
Checks Node version and installs Node 24 if needed (Homebrew on macOS, NodeSource setup scripts on Linux apt/dnf/yum). On macOS, Homebrew is installed only when the installer needs it for Node or Git. OpenClaw still supports Node 22 LTS, currently 22.19+ , for compatibility.
On Alpine/musl Linux, the installer uses apk packages instead of NodeSource; the configured Alpine repositories must provide Node 22.19+ (Alpine 3.21 or newer at the time of writing).
Ensure Git
Installs Git if missing using the detected package manager, including Homebrew on macOS and apk on Alpine.
Install OpenClaw
npm method (default): global npm install
git method: clone/update repo, install deps with pnpm, build, then install wrapper at ~/.local/bin/openclaw
Post-install tasks
Refreshes a loaded gateway service best-effort ( openclaw gateway install --force , then restart)
Runs openclaw doctor --non-interactive on upgrades and git installs (best effort)
Attempts onboarding when appropriate (TTY available, onboarding not disabled, and bootstrap/config checks pass)
Source checkout detection
If run inside an OpenClaw checkout ( package.json + pnpm-workspace.yaml ), the script offers:
use checkout ( git ), or
use global install ( npm )
If no TTY is available and no install method is set, it defaults to npm and warns.
The script exits with code 2 for invalid method selection or invalid --install-method values.
Examples (install.sh)
Default
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
Skip onboarding
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --no-onboard
Git install
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --install-method git
GitHub main checkout
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --install-method git --version main
Dry run
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --dry-run
Flags reference
Flag Description --install-method npm|git Choose install method (default: npm ). Alias: --method --npm Shortcut for npm method --git Shortcut for git method. Alias: --github --version <version|dist-tag|spec> npm version, dist-tag, or package spec (default: latest ) --beta Use beta dist-tag if available, else fallback to latest --git-dir <path> Checkout directory (default: ~/openclaw ). Alias: --dir --no-git-update Skip git pull for existing checkout --no-prompt Disable prompts --no-onboard Skip onboarding --onboard Enable onboarding --dry-run Print actions without applying changes --verbose Enable debug output ( set -x , npm notice-level logs) --help Show usage ( -h )
Environment variables reference
Variable Description OPENCLAW_INSTALL_METHOD=git|npm Install method OPENCLAW_VERSION=latest|next|<semver>|<spec> npm version, dist-tag, or package spec OPENCLAW_BETA=0|1 Use beta if available OPENCLAW_HOME=<path> Base directory for OpenClaw state and default git/onboarding paths OPENCLAW_GIT_DIR=<path> Checkout directory OPENCLAW_GIT_UPDATE=0|1 Toggle git updates OPENCLAW_NO_PROMPT=1 Disable prompts OPENCLAW_NO_ONBOARD=1 Skip onboarding OPENCLAW_DRY_RUN=1 Dry run mode OPENCLAW_VERBOSE=1 Debug mode OPENCLAW_NPM_LOGLEVEL=error|warn|notice npm log level
Info
Designed for environments where you want everything under a local prefix
(default ~/.openclaw ) and no system Node dependency. Supports npm installs
by default, plus git-checkout installs under the same prefix flow.
Flow (install-cli.sh)
Install local Node runtime
Downloads a pinned supported Node LTS tarball (the version is embedded in the script and updated independently) to <prefix>/tools/node-v<version> and verifies SHA-256.
On Alpine/musl Linux, where Node does not publish compatible tarballs for the pinned runtime, installs nodejs and npm with apk and links that runtime into the prefix wrapper path. The Alpine repositories must provide Node 22.19+ ; use Alpine 3.21 or newer if older repositories only provide Node 20 or 21.
If Git is missing, attempts install via apt/dnf/yum/apk on Linux or Homebrew on macOS.
Install OpenClaw under prefix
npm method (default): installs under the prefix with npm, then writes wrapper to <prefix>/bin/openclaw
git method: clones/updates a checkout (default ~/openclaw ) and still writes the wrapper to <prefix>/bin/openclaw
Refresh loaded gateway service
If a gateway service is already loaded from that same prefix, the script runs
openclaw gateway install --force , then openclaw gateway restart , and
probes gateway health best-effort.
Examples (install-cli.sh)
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash
Custom prefix + version
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --prefix /opt/openclaw --version latest
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --install-method git --git-dir ~/openclaw
Automation JSON output
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --json --prefix /opt/openclaw
Run onboarding
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --onboard
Flag Description --prefix <path> Install prefix (default: ~/.openclaw ) --install-method npm|git Choose install method (default: npm ). Alias: --method --npm Shortcut for npm method --git , --github Shortcut for git method --git-dir <path> Git checkout directory (default: ~/openclaw ). Alias: --dir --version <ver> OpenClaw version or dist-tag (default: latest ) --node-version <ver> Node version (default: 22.22.0 ) --json Emit NDJSON events --onboard Run openclaw onboard after install --no-onboard Skip onboarding (default) --set-npm-prefix On Linux, force npm prefix to ~/.npm-global if current prefix is not writable --help Show usage ( -h )
Variable Description OPENCLAW_PREFIX=<path> Install prefix OPENCLAW_INSTALL_METHOD=git|npm Install method OPENCLAW_VERSION=<ver> OpenClaw version or dist-tag OPENCLAW_NODE_VERSION=<ver> Node version OPENCLAW_HOME=<path> Base directory for OpenClaw state and default git/onboarding paths OPENCLAW_GIT_DIR=<path> Git checkout directory for git installs OPENCLAW_GIT_UPDATE=0|1 Toggle git updates for existing checkouts OPENCLAW_NO_ONBOARD=1 Skip onboarding OPENCLAW_NPM_LOGLEVEL=error|warn|notice npm log level
Flow (install.ps1)
Ensure PowerShell + Windows environment
Requires PowerShell 5+.
If missing, attempts install via winget, then Chocolatey, then Scoop. If no package manager is available, the script downloads the official Node.js Windows zip into %LOCALAPPDATA%\OpenClaw\deps\portable-node and adds it to the current process and user PATH. Node 22 LTS, currently 22.19+ , remains supported for compatibility.
npm method (default): global npm install using selected -Tag , launched from a writable installer temp directory so shells opened in protected folders such as C:\ still work
git method: clone/update repo, install/build with pnpm, and install wrapper at %USERPROFILE%\.local\bin\openclaw.cmd . If Git is missing, the script bootstraps user-local MinGit under %LOCALAPPDATA%\OpenClaw\deps\portable-git and adds it to the current process and user PATH.
Adds needed bin directory to user PATH when possible
Handle failures
iwr ... | iex and scriptblock installs report a terminating error without closing the current PowerShell session. Direct powershell -File / pwsh -File installs still exit non-zero for automation.
Examples (install.ps1)
powershell Copy code iwr -useb https://openclaw.ai/install.ps1 | iex
powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -InstallMethod git
powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -InstallMethod git -Tag main
Custom git directory
powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -InstallMethod git -GitDir "C:\openclaw"
powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -DryRun
Debug trace
powershell Copy code # install.ps1 has no dedicated -Verbose flag yet. Set-PSDebug -Trace 1 & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard Set-PSDebug -Trace 0
Flag Description -InstallMethod npm|git Install method (default: npm ) -Tag <tag|version|spec> npm dist-tag, version, or package spec (default: latest ) -GitDir <path> Checkout directory (default: %USERPROFILE%\openclaw ) -NoOnboard Skip onboarding -NoGitUpdate Skip git pull -DryRun Print actions only
Variable Description OPENCLAW_INSTALL_METHOD=git|npm Install method OPENCLAW_GIT_DIR=<path> Checkout directory OPENCLAW_NO_ONBOARD=1 Skip onboarding OPENCLAW_GIT_UPDATE=0 Disable git pull OPENCLAW_DRY_RUN=1 Dry run mode
If -InstallMethod git is used and Git is missing, the script tries a user-local MinGit bootstrap before printing the Git for Windows link.
CI and automation
Use non-interactive flags/env vars for predictable runs.
install.sh (non-interactive npm)
bash Copy code curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --no-prompt --no-onboard
install.sh (non-interactive git)
bash Copy code OPENCLAW_INSTALL_METHOD=git OPENCLAW_NO_PROMPT=1 \ curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
install-cli.sh (JSON)
install.ps1 (skip onboarding)
powershell Copy code & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
Troubleshooting
Why is Git required?
Git is required for git install method. For npm installs, Git is still checked/installed to avoid spawn git ENOENT failures when dependencies use git URLs.
Why does npm hit EACCES on Linux?
Some Linux setups point npm global prefix to root-owned paths. install.sh can switch prefix to ~/.npm-global and append PATH exports to shell rc files (when those files exist).
Windows: "npm error spawn git / ENOENT"
Rerun the installer so it can bootstrap user-local MinGit, or install Git for Windows and reopen PowerShell.
Windows: "openclaw is not recognized"
Run npm config get prefix and add that directory to your user PATH (no \bin suffix needed on Windows), then reopen PowerShell.
Windows: how to get verbose installer output
install.ps1 does not currently expose a -Verbose switch.
Use PowerShell tracing for script-level diagnostics:
powershell Copy code Set-PSDebug -Trace 1 & ([ scriptblock ]::Create(( iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard Set-PSDebug -Trace 0 openclaw not found after install
Usually a PATH issue. See Node.js troubleshooting .
Related
Install overview
Updating
Uninstall
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
