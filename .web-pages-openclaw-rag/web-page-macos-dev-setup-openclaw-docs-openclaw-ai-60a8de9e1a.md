# macOS dev setup - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/platforms/mac/dev-setup
- Final URL: https://docs.openclaw.ai/platforms/mac/dev-setup
- Canonical URL: https://docs.openclaw.ai/platforms/mac/dev-setup
- Fetched at: 2026-06-23T14:49:32Z
- Content type: text/html; charset=utf-8

## Description

Setup guide for developers working on the OpenClaw macOS app

## Extracted Text

Close
Platforms macOS companion app
macOS developer setup
Build and run the OpenClaw macOS application from source.
Prerequisites
Before building the app, ensure you have the following installed:
Xcode 26.2+ : Required for Swift development.
Node.js 24 & pnpm : Recommended for the gateway, CLI, and packaging scripts. Node 22 LTS, currently 22.19+ , remains supported for compatibility.
1. Install Dependencies
Install the project-wide dependencies:
bash Copy code pnpm install
2. Build and Package the App
To build the macOS app and package it into dist/OpenClaw.app , run:
bash Copy code ./scripts/package-mac-app.sh
If you don't have an Apple Developer ID certificate, the script will automatically use ad-hoc signing ( - ).
For dev run modes, signing flags, and Team ID troubleshooting, see the macOS app README:
https://github.com/openclaw/openclaw/blob/main/apps/macos/README.md
Note : Ad-hoc signed apps may trigger security prompts. If the app crashes immediately with "Abort trap 6", see the Troubleshooting section.
3. Install the CLI
The macOS app expects a global openclaw CLI install to manage background tasks.
To install it (recommended):
Open the OpenClaw app.
Go to the General settings tab.
Click "Install CLI" .
Alternatively, install it manually:
bash Copy code npm install -g openclaw@<version>
pnpm add -g openclaw@<version> and bun add -g openclaw@<version> also work.
For the Gateway runtime, Node remains the recommended path.
Troubleshooting
Build fails: toolchain or SDK mismatch
The macOS app build expects the latest macOS SDK and Swift 6.2 toolchain.
System dependencies (required):
Latest macOS version available in Software Update (required by Xcode 26.2 SDKs)
Xcode 26.2 (Swift 6.2 toolchain)
Checks:
bash Copy code xcodebuild -version xcrun swift --version
If versions don't match, update macOS/Xcode and re-run the build.
App crashes on permission grant
If the app crashes when you try to allow Speech Recognition or Microphone access, it may be due to a corrupted TCC cache or signature mismatch.
Fix:
Reset the TCC permissions:
bash Copy code tccutil reset All ai.openclaw.mac.debug
If that fails, change the BUNDLE_ID temporarily in scripts/package-mac-app.sh to force a "clean slate" from macOS.
Gateway "Starting..." indefinitely
If the gateway status stays on "Starting...", check if a zombie process is holding the port:
bash Copy code openclaw gateway status openclaw gateway stop # If you're not using a LaunchAgent (dev mode / manual runs), find the listener: lsof -nP -iTCP:18789 -sTCP:LISTEN
If a manual run is holding the port, stop that process (Ctrl+C). As a last resort, kill the PID you found above.
Related
macOS app
Install overview
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
