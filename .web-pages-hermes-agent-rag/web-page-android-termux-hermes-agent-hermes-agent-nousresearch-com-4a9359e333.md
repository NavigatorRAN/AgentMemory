# Android / Termux | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/getting-started/termux
- Final URL: https://hermes-agent.nousresearch.com/docs/getting-started/termux
- Canonical URL: https://hermes-agent.nousresearch.com/docs/getting-started/termux
- Fetched at: 2026-06-23T14:14:49Z
- Content type: text/html; charset=utf-8

## Description

Run Hermes Agent directly on an Android phone with Termux

## Extracted Text

Skip to main content
On this page
This is the tested path for running Hermes Agent directly on an Android phone through Termux .
It gives you a working local CLI on the phone, plus the core extras that are currently known to install cleanly on Android.
What is supported in the tested path? ​
The tested Termux bundle installs:
the Hermes CLI
cron support
PTY/background terminal support
Telegram gateway support (manual / best-effort background runs)
MCP support
Honcho memory support
ACP support
Concretely, it maps to:
python -m pip install -e '.[termux]' -c constraints-termux.txt
What is not part of the tested path yet? ​
A few features still need desktop/server-style dependencies that are not published for Android, or have not been validated on phones yet:
.[all] is not supported on Android today
the voice extra is blocked by faster-whisper -> ctranslate2 , and ctranslate2 does not publish Android wheels
automatic browser / Playwright bootstrap is skipped in the Termux installer
Docker-based terminal isolation is not available inside Termux
Android may still suspend Termux background jobs, so gateway persistence is best-effort rather than a normal managed service
That does not stop Hermes from working well as a phone-native CLI agent — it just means the recommended mobile install is intentionally narrower than the desktop/server install.
Option 1: One-line installer ​
Hermes now ships a Termux-aware installer path:
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
On Termux, the installer automatically:
uses pkg for system packages
creates the venv with python -m venv
attempts the broad .[termux-all] extra first and falls back to the smaller .[termux] extra (then a base install) — the curl installer matches this order automatically
links hermes into $PREFIX/bin so it stays on your Termux PATH
skips the untested browser / WhatsApp bootstrap
If you want the explicit commands or need to debug a failed install, use the manual path below.
Option 2: Manual install (fully explicit) ​
1. Update Termux and install system packages ​
pkg update
pkg install -y git python clang rust make pkg-config libffi openssl nodejs ripgrep ffmpeg
Why these packages?
python — runtime + venv support
git — clone/update the repo
clang , rust , make , pkg-config , libffi , openssl — needed to build a few Python dependencies on Android
nodejs — optional Node runtime for experiments beyond the tested core path
ripgrep — fast file search
ffmpeg — media / TTS conversions
2. Clone Hermes ​
git clone https://github.com/NousResearch/hermes-agent.git
cd hermes-agent
3. Create a virtual environment ​
python -m venv venv
source venv/bin/activate
export ANDROID_API_LEVEL = " $( getprop ro.build.version.sdk ) "
python -m pip install --upgrade pip setuptools wheel
ANDROID_API_LEVEL is important for Rust / maturin-based packages such as jiter .
4. Install the tested Termux bundle ​
If you only want the minimal core agent, this also works:
python -m pip install -e '.' -c constraints-termux.txt
5. Put hermes on your Termux PATH ​
ln -sf " $PWD /venv/bin/hermes" " $PREFIX /bin/hermes"
$PREFIX/bin is already on PATH in Termux, so this makes the hermes command persist across new shells without re-activating the venv every time.
6. Verify the install ​
hermes version
hermes doctor
7. Start Hermes ​
hermes
Recommended follow-up setup ​
Configure a model ​
hermes model
Or set keys directly in ~/.hermes/.env .
Re-run the full interactive setup wizard later ​
hermes setup
Install optional Node dependencies manually ​
The tested Termux path skips Node/browser bootstrap on purpose. If you want to experiment with browser tooling later:
pkg install nodejs-lts
npm install
The browser tool automatically includes Termux directories ( /data/data/com.termux/files/usr/bin ) in its PATH search, so agent-browser and npx are discovered without any extra PATH configuration.
Treat browser / WhatsApp tooling on Android as experimental until documented otherwise.
Troubleshooting ​
No solution found when installing .[all] ​
Use the tested Termux bundle instead:
The blocker is currently the voice extra:
voice pulls faster-whisper
faster-whisper depends on ctranslate2
ctranslate2 does not publish Android wheels
uv pip install fails on Android ​
Use the Termux path with the stdlib venv + pip instead:
jiter / maturin complains about ANDROID_API_LEVEL ​
Set the API level explicitly before installing:
hermes doctor says ripgrep or Node is missing ​
Install them with Termux packages:
pkg install ripgrep nodejs
Build failures while installing Python packages ​
Make sure the build toolchain is installed:
pkg install clang rust make pkg-config libffi openssl
Then retry:
Known limitations on phones ​
Docker backend is unavailable
local voice transcription via faster-whisper is unavailable in the tested path
browser automation setup is intentionally skipped by the installer
some optional extras may work, but only .[termux] and .[termux-all] are currently documented as the tested Android bundles
If you hit a new Android-specific issue, please open a GitHub issue with:
your Android version
termux-info
python --version
the exact install command and full error output
What is supported in the tested path?
What is not part of the tested path yet?
Option 1: One-line installer
Option 2: Manual install (fully explicit)
1. Update Termux and install system packages
2. Clone Hermes
3. Create a virtual environment
4. Install the tested Termux bundle
5. Put hermes on your Termux PATH
6. Verify the install
7. Start Hermes
Recommended follow-up setup
Configure a model
Re-run the full interactive setup wizard later
Install optional Node dependencies manually
Troubleshooting
No solution found when installing .[all]
uv pip install fails on Android
jiter / maturin complains about ANDROID_API_LEVEL
hermes doctor says ripgrep or Node is missing
Build failures while installing Python packages
Known limitations on phones
