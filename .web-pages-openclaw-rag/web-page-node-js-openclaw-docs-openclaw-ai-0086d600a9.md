# Node.js - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/node
- Final URL: https://docs.openclaw.ai/install/node
- Canonical URL: https://docs.openclaw.ai/install/node
- Fetched at: 2026-06-23T14:44:55Z
- Content type: text/html; charset=utf-8

## Description

Install and configure Node.js for OpenClaw - version requirements, install options, and PATH troubleshooting

## Extracted Text

Close
Install Install overview
OpenClaw requires Node 22.19 or newer . Node 24 is the default and recommended runtime for installs, CI, and release workflows. Node 22 remains supported via the active LTS line. The installer script will detect and install Node automatically - this page is for when you want to set up Node yourself and make sure everything is wired up correctly (versions, PATH, global installs).
Check your version
bash Copy code node -v
If this prints v24.x.x or higher, you're on the recommended default. If it prints v22.19.x or higher, you're on the supported Node 22 LTS path, but we still recommend upgrading to Node 24 when convenient. If Node isn't installed or the version is too old, pick an install method below.
Install Node
macOS
Homebrew (recommended):
bash Copy code brew install node
Or download the macOS installer from nodejs.org .
Linux
Ubuntu / Debian:
bash Copy code curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash - sudo apt-get install -y nodejs
Fedora / RHEL:
bash Copy code sudo dnf install nodejs
Or use a version manager (see below).
Windows
winget (recommended):
powershell Copy code winget install OpenJS.NodeJS.LTS
Chocolatey:
powershell Copy code choco install nodejs -lts
Or download the Windows installer from nodejs.org .
Using a version manager (nvm, fnm, mise, asdf)
Version managers let you switch between Node versions easily. Popular options:
fnm - fast, cross-platform
nvm - widely used on macOS/Linux
mise - polyglot (Node, Python, Ruby, etc.)
Example with fnm:
bash Copy code fnm install 24 fnm use 24 Warning
Make sure your version manager is initialized in your shell startup file ( ~/.zshrc or ~/.bashrc ). If it isn't, openclaw may not be found in new terminal sessions because the PATH won't include Node's bin directory.
Troubleshooting
openclaw: command not found
This almost always means npm's global bin directory isn't on your PATH.
Find your global npm prefix
bash Copy code npm prefix -g
Check if it's on your PATH
bash Copy code echo " $PATH "
Look for <npm-prefix>/bin (macOS/Linux) or <npm-prefix> (Windows) in the output.
Add it to your shell startup file
macOS / Linux
Add to ~/.zshrc or ~/.bashrc :
bash Copy code export PATH= " $(npm prefix -g) /bin: $PATH "
Then open a new terminal (or run rehash in zsh / hash -r in bash).
Add the output of npm prefix -g to your system PATH via Settings → System → Environment Variables.
Permission errors on npm install -g (Linux)
If you see EACCES errors, switch npm's global prefix to a user-writable directory:
bash Copy code mkdir -p " $HOME /.npm-global" npm config set prefix " $HOME /.npm-global" export PATH= " $HOME /.npm-global/bin: $PATH "
Add the export PATH=... line to your ~/.bashrc or ~/.zshrc to make it permanent.
Related
Install Overview - all installation methods
Updating - keeping OpenClaw up to date
Getting Started - first steps after install
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
