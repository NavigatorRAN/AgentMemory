# Device model database - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/reference/device-models
- Final URL: https://docs.openclaw.ai/reference/device-models
- Canonical URL: https://docs.openclaw.ai/reference/device-models
- Fetched at: 2026-06-23T14:56:27Z
- Content type: text/html; charset=utf-8

## Description

How OpenClaw vendors Apple device model identifiers for friendly names in the macOS app.

## Extracted Text

Close
Reference RPC and API
The macOS companion app shows friendly Apple device model names in the Instances UI by mapping Apple model identifiers (e.g. iPad16,6 , Mac16,6 ) to human-readable names.
The mapping is vendored as JSON under:
apps/macos/Sources/OpenClaw/Resources/DeviceModels/
Data source
We currently vendor the mapping from the MIT-licensed repository:
kyle-seongwoo-jun/apple-device-identifiers
To keep builds deterministic, the JSON files are pinned to specific upstream commits (recorded in apps/macos/Sources/OpenClaw/Resources/DeviceModels/NOTICE.md ).
Updating the database
Pick the upstream commits you want to pin to (one for iOS, one for macOS).
Update the commit hashes in apps/macos/Sources/OpenClaw/Resources/DeviceModels/NOTICE.md .
Re-download the JSON files, pinned to those commits:
bash Copy code IOS_COMMIT= "<commit sha for ios-device-identifiers.json>" MAC_COMMIT= "<commit sha for mac-device-identifiers.json>" curl -fsSL "https://raw.githubusercontent.com/kyle-seongwoo-jun/apple-device-identifiers/ ${IOS_COMMIT} /ios-device-identifiers.json" \ -o apps/macos/Sources/OpenClaw/Resources/DeviceModels/ios-device-identifiers.json curl -fsSL "https://raw.githubusercontent.com/kyle-seongwoo-jun/apple-device-identifiers/ ${MAC_COMMIT} /mac-device-identifiers.json" \ -o apps/macos/Sources/OpenClaw/Resources/DeviceModels/mac-device-identifiers.json
Ensure apps/macos/Sources/OpenClaw/Resources/DeviceModels/LICENSE.apple-device-identifiers.txt still matches upstream (replace it if the upstream license changes).
Verify the macOS app builds cleanly (no warnings):
bash Copy code swift build --package-path apps/macos
Related
Nodes
Node troubleshooting
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
